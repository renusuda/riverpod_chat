sealed class AppException implements Exception {
  AppException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => message;
}

class AuthInvalidCredentialsException extends AppException {
  AuthInvalidCredentialsException()
    : super('auth/invalid-credentials', 'メールアドレスまたはパスワードが正しくありません');
}

class ProfileNotFoundException extends AppException {
  ProfileNotFoundException() : super('profile/not-found', 'プロフィールが見つかりません');
}
