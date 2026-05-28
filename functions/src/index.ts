import {initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";
import {getMessaging} from "firebase-admin/messaging";
import {logger} from "firebase-functions";
import {onDocumentCreated} from "firebase-functions/v2/firestore";

initializeApp();

type ChatMessageData = {
  senderId?: unknown;
  text?: unknown;
};

type ConversationData = {
  memberIds?: unknown;
};

type UserData = {
  displayName?: unknown;
  fcmToken?: unknown;
};

export const logCreatedChatMessage = onDocumentCreated(
  {
    document: "conversations/{conversationId}/messages/{messageId}",
    region: "asia-northeast1",
  },
  async (event) => {
    if (!event.data) {
      logger.warn("イベントにメッセージデータがありません", {
        conversationId: event.params.conversationId,
        messageId: event.params.messageId,
      });
      return;
    }

    const conversationId = event.params.conversationId;
    const messageId = event.params.messageId;
    const messageData = event.data.data() as ChatMessageData;

    logger.info("チャットメッセージが作成されました", {
      conversationId: conversationId,
      messageId: messageId,
      senderId: messageData.senderId,
      text: messageData.text,
    });

    if (typeof messageData.senderId !== "string" ||
      typeof messageData.text !== "string") {
      logger.warn("メッセージデータの形式が不正です", {
        conversationId: conversationId,
        messageId: messageId,
      });
      return;
    }

    await sendChatMessageNotification({
      conversationId: conversationId,
      messageId: messageId,
      senderId: messageData.senderId,
      text: messageData.text,
    });
  },
);

async function sendChatMessageNotification({
  conversationId,
  messageId,
  senderId,
  text,
}: {
  conversationId: string;
  messageId: string;
  senderId: string;
  text: string;
}) {
  const firestore = getFirestore();
  const conversationSnapshot = await firestore
    .collection("conversations")
    .doc(conversationId)
    .get();
  const conversationData = conversationSnapshot.data() as
    ConversationData | undefined;
  const memberIds = conversationData?.memberIds;

  if (!Array.isArray(memberIds)) {
    logger.warn("会話データにメンバー情報がありません", {
      conversationId: conversationId,
      messageId: messageId,
    });
    return;
  }

  const recipientIds = memberIds.filter(
    (memberId): memberId is string =>
      typeof memberId === "string" && memberId !== senderId,
  );

  if (recipientIds.length === 0) {
    logger.warn("通知対象のユーザーがいません", {
      conversationId: conversationId,
      messageId: messageId,
      senderId: senderId,
    });
    return;
  }

  const [senderSnapshot, recipientSnapshots] = await Promise.all([
    firestore.collection("users").doc(senderId).get(),
    firestore.getAll(
      ...recipientIds.map((recipientId) =>
        firestore.collection("users").doc(recipientId),
      ),
    ),
  ]);
  const senderData = senderSnapshot.data() as UserData | undefined;
  const title = typeof senderData?.displayName === "string" ?
    senderData.displayName :
    "新しいメッセージ";

  const tokens = recipientSnapshots
    .map((snapshot) => snapshot.data() as UserData | undefined)
    .map((userData) => userData?.fcmToken)
    .filter((token): token is string => typeof token === "string");

  if (tokens.length === 0) {
    logger.warn("通知対象ユーザーのFCMトークンがありません", {
      conversationId: conversationId,
      messageId: messageId,
      recipientIds: recipientIds,
    });
    return;
  }

  const response = await getMessaging().sendEachForMulticast({
    tokens: tokens,
    notification: {
      title: title,
      body: text,
    },
    data: {
      conversationId: conversationId,
      messageId: messageId,
      senderId: senderId,
    },
  });

  logger.info("チャットメッセージ通知を送信しました", {
    conversationId: conversationId,
    messageId: messageId,
    successCount: response.successCount,
    failureCount: response.failureCount,
  });

  response.responses.forEach((sendResponse, index) => {
    if (sendResponse.success) return;

    logger.warn("チャットメッセージ通知の送信に失敗しました", {
      conversationId: conversationId,
      messageId: messageId,
      token: tokens[index],
      error: sendResponse.error?.message,
    });
  });
}
