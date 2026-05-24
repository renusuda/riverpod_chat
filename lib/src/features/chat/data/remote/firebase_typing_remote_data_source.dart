import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/typing_remote_data_source.dart';

class FirebaseTypingRemoteDataSource implements TypingRemoteDataSource {
  FirebaseTypingRemoteDataSource({required FirebaseDatabase database})
    : _database = database;

  final FirebaseDatabase _database;

  @override
  Future<void> updateTypingStatus({
    required String conversationId,
    required String userId,
    required bool isTyping,
  }) async {
    final ref = _database.ref('typing/$conversationId/$userId');
    if (isTyping) {
      await ref.set(true);
    } else {
      await ref.remove();
    }
  }

  @override
  Stream<bool> watchPartnerTypingStatus({
    required String conversationId,
    required String partnerId,
  }) {
    return _database
        .ref('typing/$conversationId/$partnerId')
        .onValue
        .map(
          (event) => event.snapshot.value == true,
        );
  }
}
