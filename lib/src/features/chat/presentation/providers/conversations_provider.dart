import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';

part 'conversations_provider.g.dart';

@riverpod
Future<List<Conversation>> conversations(Ref ref) {
  return ref.watch(conversationRepositoryProvider).fetchConversations();
}
