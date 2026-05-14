import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';

extension FirebaseUserMapper on User {
  AppUser toDomain() {
    return AppUser(
      uid: uid,
      email: email ?? '',
    );
  }
}
