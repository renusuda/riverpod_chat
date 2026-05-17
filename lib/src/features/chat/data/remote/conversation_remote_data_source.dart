import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';

// ignore: one_member_abstracts, Kept as interface for testability via mocking
abstract interface class ConversationRemoteDataSource {
  Future<List<Conversation>> fetchConversations();
}
