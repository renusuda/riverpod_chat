import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';

// ignore: one_member_abstracts, Kept as interface for testability via mocking
abstract interface class ConversationRemoteDataSource {
  Future<List<ConversationMetadata>> fetchConversations({
    required String currentUserId,
  });
}
