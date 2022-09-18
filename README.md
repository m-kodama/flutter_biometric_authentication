# flutter_biometric_authentication

Flutterアプリに生体認証を組み込むサンプルサプリ

## Getting Started

- パッケージのインストール
  - `flutter pub get`
- 起動
  - `flutter run`

## Summary

- [local_auth](https://pub.dev/packages/local_auth) パッケージを追加
- ネイティブ側の設定
  - Android
    - MainActivity.kt
      - `FlutterActivity` を `FlutterFragmentActivity` に変更
    - AndroidManifest.xml
      - 指紋認証のpermissionを追加
  - iOS
    - info.plist
      - Face IDを使う理由を追記
- Flutter側の実装
  - 利用可能な生体認証の一覧取得
    - `local_auth`パッケージの`getAvailableBiometrics`メソッド
  - 生体認証の実行
    - `local_auth`パッケージの`authenticate`メソッド