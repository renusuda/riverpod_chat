import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';

abstract interface class ConversationRemoteDataSource {
  Future<List<ConversationMetadata>> fetchConversations({
    required String currentUserId,
  });

  Future<ConversationMetadata> fetchConversation({
    required String id,
    required String currentUserId,
  });

  Stream<List<Message>> watchMessages({
    required String conversationId,
    required String currentUserId,
  });

  Future<void> sendMessage({
    required String conversationId,
    required String senderId,
    required String text,
  });
}
