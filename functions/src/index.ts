import {initializeApp} from "firebase-admin/app";
import {logger} from "firebase-functions";
import {onDocumentCreated} from "firebase-functions/v2/firestore";

initializeApp();

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

    const messageData = event.data.data();

    logger.info("チャットメッセージが作成されました", {
      conversationId: event.params.conversationId,
      messageId: event.params.messageId,
      senderId: messageData?.senderId,
      text: messageData?.text,
    });
  },
);
