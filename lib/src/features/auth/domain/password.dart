final class Password {
  const Password._();

  static const int minLength = 8;

  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'パスワードを入力してください';
    }

    if (value.length < minLength) {
      return 'パスワードは8文字以上で入力してください';
    }
    return null;
  }
}
