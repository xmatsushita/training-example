## 環境構築
```
git clone https://github.com/xmatsushita/training-example.git
docker-compose run app guard
```

## ファイル構成
ファイルを増減することは自由です

```
├── src
|    └── create_daily_bar_service.rb
└── spec
     └── create_daily_bar_service_spec.rb
```

## 環境
- Ruby: 2.7.2
- Rspec: 3.10.0

## お題
日中株価のリストを与えて日足オブジェクトを生成するサービスクラスを作成して下さい。

日足クラスの仕様
```
属性値と仕様
- code(銘柄コード): String
- date(日付): Date
- open(始値): Integer - 日中株価の一番最初の株価
- high(高値): Integer - 日中株価の中で一番高い株価
- low(安値): Integer - 日中株価の中で一番低い株価
- close(終値): Integer - 日中株価の一番最後の株価

日足クラスのメソッド
- white_bar? : Boolean 始値よりも終値の方が高ければ真を返す（陽線）
```
