import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';

abstract interface class ConversationRemoteDataSource {
  Future<List<ConversationMetadata>> fetchConversations({
    required String currentUserId,
  });

  Future<ConversationMetadata> fetchConversation({
    required String id,
    required String currentUserId,
  });
}
