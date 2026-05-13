import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_chat/src/features/auth/domain/email_address.dart';

void main() {
  test('null の場合は必須入力メッセージを返す', () {
    expect(EmailAddress.validate(null), 'メールアドレスを入力してください');
  });

  test('空白のみの場合は必須入力メッセージを返す', () {
    expect(EmailAddress.validate('   '), 'メールアドレスを入力してください');
  });

  test('不正な形式の場合は形式エラーメッセージを返す', () {
    expect(EmailAddress.validate('user@example'), '正しいメールアドレスを入力してください');
  });

  test('ローカル部に空白がある場合は形式エラーメッセージを返す', () {
    expect(
      EmailAddress.validate('user name@example.com'),
      '正しいメールアドレスを入力してください',
    );
  });

  test('正しい形式の場合は null を返す', () {
    expect(EmailAddress.validate('user@example.com'), isNull);
  });

  test('前後の空白を除去して正しい形式なら null を返す', () {
    expect(EmailAddress.validate(' user@example.com '), isNull);
  });
}
