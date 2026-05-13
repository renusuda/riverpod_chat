final class EmailAddress {
  const EmailAddress._();

  static final RegExp _pattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'メールアドレスを入力してください';
    }

    if (!_pattern.hasMatch(value.trim())) {
      return '正しいメールアドレスを入力してください';
    }
    return null;
  }
}
