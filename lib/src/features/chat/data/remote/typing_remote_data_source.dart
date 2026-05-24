abstract interface class TypingRemoteDataSource {
  Future<void> updateTypingStatus({
    required String conversationId,
    required String userId,
    required bool isTyping,
  });

  Stream<bool> watchPartnerTypingStatus({
    required String conversationId,
    required String partnerId,
  });
}
