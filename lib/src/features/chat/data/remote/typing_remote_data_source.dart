// ignore: one_member_abstracts, 読み取り側の実装追加を見越してインターフェースを維持する
abstract interface class TypingRemoteDataSource {
  Future<void> updateTypingStatus({
    required String conversationId,
    required String userId,
    required bool isTyping,
  });
}
