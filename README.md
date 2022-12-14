# <football_scoring_app>

## サイト概要
### サイトテーマ
試合ごとにサッカー選手の採点を行ったり、それに対してコメントを残せるコミュニティサイトです。

### テーマを選んだ理由
サッカーは世界で最も愛されているスポーツの一つです。私もサッカーを愛する一人です。
2022年は11月よりカタールワールドカップが開催されます。楽しみにされている人は多いでしょう。  
サッカーは選手を評価するのに絶対的な指標はありません。それもあってか、サッカーの試合が行われた際は
メディアが選手等の採点を行い記事にしております。採点する時は主観が占める割合が大きく、採点を行った記者に
異論を抱くことがあるでしょう。  
だからこそ、より多くの人が簡単に採点を行い記録・閲覧することができるサイトを作ることに決めました。

### ターゲットユーザ
__サッカーを愛する全ての人__

### 主な利用シーン
試合が行われた際に選手への評価を記録したい時。また、他人がどのような評価を下したのか知りたい時。

## 設計書
[ER図](https://app.diagrams.net/#G11c1uU1wjP_N9FEjXXoIikCct6mTtVYnD)
[テーブル定義書](https://docs.google.com/spreadsheets/d/14_TuiNWcTsFQgJm99jSy14YvAvPxU_nh/edit#gid=1349999531)
[詳細設計](https://docs.google.com/spreadsheets/d/1yzTVeJCv5tAq-_m333HiZgg19Na5EJLwe7vitQwLJiY/edit#gid=549108681)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 実装機能
[会員側実装機能]
- 会員登録、ログイン・ログアウト、退会ができる。
- ログインはメールアドレスとパスワードで行う。
- ゲストログイン可能。
- Topページを除き、閲覧にはログインが必要。
- 会員ごとに１試合毎に一度採点を行える。
- 採点に対して、いいね・悪いね・コメントができる。
- 採点一覧は新しい順・古い順・いいね順で並べ替えが可能。
- 会員詳細画面より自分がいいねした採点一覧ページへ移動可能。
- 会員は気に入った会員をフォローできる。
- ログイン後に検索機能を使用可能。(会員・チーム・大会・試合)

[管理者側実装機能]
- 管理者用メールアドレスとパスワードでログインができる。
- 会員情報の閲覧、編集、退会処理。
- 選手登録・編集。
- チーム登録・編集。
- 所属選手登録・編集・削除。
- 大会登録・編集。
- 大会出場チームの登録・編集・削除。
- 試合の登録・削除。
- 出場選手の登録・編集・削除。
- 会員が投稿した採点を閲覧・削除ができる。
- 採点一覧は新しい順・古い順・いいね順・悪いね順で並べ替えが可能。
- 採点に対するコメントを削除可能。
- ログイン後に検索機能を使用可能。(選手・チーム・大会・試合・会員)