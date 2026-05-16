import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository_provider.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

part 'my_profile_provider.g.dart';

@riverpod
Future<UserProfile> myProfile(Ref ref) async {
  final uid = ref.watch(authRepositoryProvider).currentUser!.uid;
  return ref.watch(profileRepositoryProvider).fetchProfile(uid: uid);
}
