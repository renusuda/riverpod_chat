import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';
import 'package:riverpod_chat/src/features/profile/data/remote/firestore_profile_remote_data_source.dart';
import 'package:riverpod_chat/src/features/profile/data/remote/profile_remote_data_source.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_firestore_provider.dart';

part 'profile_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  return FirestoreProfileRemoteDataSource(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
  );
}
