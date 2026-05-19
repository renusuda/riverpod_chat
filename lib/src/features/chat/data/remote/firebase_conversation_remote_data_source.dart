import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/conversation_dto.dart';
import 'package:riverpod_chat/src/features/chat/data/remote/conversation_remote_data_source.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';

class FirebaseConversationRemoteDataSource
    implements ConversationRemoteDataSource {
  FirebaseConversationRemoteDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<List<ConversationMetadata>> fetchConversations({
    required String currentUserId,
  }) async {
    final snapshot = await _firestore
        .collection('conversations')
        .where('memberIds', arrayContains: currentUserId)
        .orderBy('updatedAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ConversationDto.fromJson(doc.data()))
        .map((dto) => dto.toDomain(currentUserId: currentUserId))
        .toList();
  }
}
