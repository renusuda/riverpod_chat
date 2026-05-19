import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';
import 'package:riverpod_chat/src/features/chat/use_case/fetch_conversations_use_case_provider.dart';

part 'conversations_provider.g.dart';

@riverpod
Future<List<Conversation>> conversations(Ref ref) {
  return ref.watch(fetchConversationsUseCaseProvider).execute();
}
