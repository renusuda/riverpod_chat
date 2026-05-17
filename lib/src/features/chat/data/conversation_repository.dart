import 'package:riverpod_chat/src/features/chat/data/remote/conversation_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation.dart';

class ConversationRepository {
  const ConversationRepository({
    required ConversationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ConversationRemoteDataSource _remoteDataSource;

  Future<List<Conversation>> fetchConversations() {
    return _remoteDataSource.fetchConversations();
  }
}
