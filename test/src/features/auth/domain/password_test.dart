import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_chat/src/features/auth/domain/password.dart';

void main() {
  test('null の場合は必須入力メッセージを返す', () {
    expect(Password.validate(null), 'パスワードを入力してください');
  });

  test('空白のみの場合は必須入力メッセージを返す', () {
    expect(Password.validate('   '), 'パスワードを入力してください');
  });

  test('8文字未満の場合は文字数エラーメッセージを返す', () {
    expect(Password.validate('pass123'), 'パスワードは8文字以上で入力してください');
  });

  test('8文字の場合は null を返す', () {
    expect(Password.validate('pass1234'), isNull);
  });

  test('8文字より長い場合は null を返す', () {
    expect(Password.validate('password123'), isNull);
  });
}
