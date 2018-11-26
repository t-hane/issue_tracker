# README

このアプリケーションは、「初心者向け Ruby on Rails 勉強会 in 門前仲町」の学習用に作成したものです。

## アプリケーションの内容
イシュートラッカーです。

* プロジェクト登録
* プロジェクト一覧
* プロジェクト進捗表示(解決したイシュー ÷ 全イシュー)
* イシュー登録
* イシューステータス管理（未解決・解決済のみ）
* ユーザー登録

## 動かしてみる

### インストール
Rubyが動く環境であれば、以下の手順でインストールできます。
```bash
$ git clone https://github.com/t-hane/issue_tracker
$ cd issue_tracker
$ bundle install
$ bundle exec rails db:create db:migrate
```

### サンプルデータの作成
サンプルデータがないと厳しいです。
```bash
$ bundle exec rails sample:build
```

### 起動とテスト
```bash
$ bundle exec rails server
```

ブラウザで、
http://localhost:3000/
にアクセスしてください。
ユーザー名 yamada パスワード test でログインできます。

## テスト
テストフレームワークに RSpec を使用しています。
```bash
$ bundle exec rspec
```
今のところ、モデルのテストを一部、記載しています。

## バージョンなど
* Ruby on Rails 5.1
* Ruby は、 Windows の RubyInstaller 2.4.x で動作確認済み
* 最新の Ruby を推奨していますが、Windows 版の Sqlite3 が、11/20 現在、2.4.xまでの対応となっています。
* データベースは、Sqlite3 を使っています。

## アンインストール
ソースコードそのままで使用していれば、データベースは Sqlite3 を使っていますので、ディレクトリごと削除すれば大丈夫です。

## 注意書き
* 今後も Ruby on Rails の新しい機能を紹介する場合には、このアプリケーションを利用する場合があります。
* このアプリケーションは、GPL v3 で配布する予定です。
