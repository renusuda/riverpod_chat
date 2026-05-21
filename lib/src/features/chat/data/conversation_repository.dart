import 'package:riverpod_chat/src/features/chat/data/remote/conversation_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';

class ConversationRepository {
  const ConversationRepository({
    required ConversationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ConversationRemoteDataSource _remoteDataSource;

  Future<List<ConversationMetadata>> fetchConversations({
    required String currentUserId,
  }) {
    return _remoteDataSource.fetchConversations(currentUserId: currentUserId);
  }

  Future<ConversationMetadata> fetchConversation({
    required String id,
    required String currentUserId,
  }) {
    return _remoteDataSource.fetchConversation(
      id: id,
      currentUserId: currentUserId,
    );
  }

  Stream<List<Message>> watchMessages({
    required String conversationId,
    required String currentUserId,
  }) {
    return _remoteDataSource.watchMessages(
      conversationId: conversationId,
      currentUserId: currentUserId,
    );
  }
}
