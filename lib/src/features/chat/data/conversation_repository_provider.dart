import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/conversation_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/fake_conversation_remote_data_source.dart';

part 'conversation_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ConversationRemoteDataSource conversationRemoteDataSource(Ref ref) {
  return FakeConversationRemoteDataSource();
}

@Riverpod(keepAlive: true)
ConversationRepository conversationRepository(Ref ref) {
  return ConversationRepository(
    remoteDataSource: ref.watch(conversationRemoteDataSourceProvider),
  );
}
