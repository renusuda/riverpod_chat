import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_chat/src/exceptions/app_exception.dart';
import 'package:riverpod_chat/src/features/profile/data/remote/profile_remote_data_source.dart';
import 'package:riverpod_chat/src/features/profile/data/remote/user_profile_dto.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

class FirestoreProfileRemoteDataSource implements ProfileRemoteDataSource {
  FirestoreProfileRemoteDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<UserProfile> fetchProfile({required String uid}) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    final data = snapshot.data();
    if (data == null) throw ProfileNotFoundException();
    final dto = UserProfileDto.fromJson(data);
    return dto.toDomain();
  }
}
