import 'package:riverpod_chat/src/features/chat/data/remote/typing_remote_data_source.dart';

class TypingRepository {
  const TypingRepository({required TypingRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final TypingRemoteDataSource _remoteDataSource;

  Future<void> updateTypingStatus({
    required String conversationId,
    required String userId,
    required bool isTyping,
  }) => _remoteDataSource.updateTypingStatus(
    conversationId: conversationId,
    userId: userId,
    isTyping: isTyping,
  );

  Stream<bool> watchPartnerTypingStatus({
    required String conversationId,
    required String partnerId,
  }) => _remoteDataSource.watchPartnerTypingStatus(
    conversationId: conversationId,
    partnerId: partnerId,
  );
}
