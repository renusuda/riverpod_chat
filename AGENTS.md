# 重要ルール

## コード構成

- 少数の大きなファイルより、多数の小さなファイルを優先する
- レイヤーごとに整理する: presentation、use_case、domain、data
- ファイルは200行未満に保つ（最大400行）

## コードスタイル

- コード、コメント、ドキュメントに絵文字を使用しない

## テスト

- ユニットテストは `test/` に配置する
- ユニットテストの実行: `fvm flutter test`

## セキュリティ

- シークレットをハードコードしない

# コード生成

生成ファイル（`*.g.dart`、`*.freezed.dart`）は手動で編集しないでください。

# 利用可能なコマンド

```bash
# 依存関係を取得
fvm flutter pub get

# パッケージを依存関係に追加
fvm flutter pub add <package>

# パッケージを開発用の依存関係に追加
fvm flutter pub add dev:<package>

# アプリを起動
fvm flutter run

# ユニットテストの実施
fvm flutter test

# コードを静的解析
fvm flutter analyze

# コード生成の実行
fvm dart run build_runner build --delete-conflicting-outputs

# コードの変更があるたびに、コード生成の実行
fvm dart run build_runner watch -d
```
