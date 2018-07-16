# docker-compose for Ruby on Rails

## Image

- postgresql
- ruby:2.3.3

## Project

```tree
rails
├── README.md
├── db
│   └── conf
│       └── postgresql.conf
├── docker-compose.yml
└── web
    ├── Dockerfile
    └── myapp
        ├── Gemfile
        └── Gemfile.lock
```

## Usage

コンテナ作成

```bash
// rails に移動
$ cd rails

// rails にプロジェクトを新規作成
$ docker-compose run web rails new . ./web/myapp/ --force --database=postgresql --skip-bundle

// コンテナを作成
$ docker-compose build
```

データベースの設定ファイルを変更

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5
  database: test_database # 作成したいDB名

development:
  <<: *default

test:
  <<: *default
```

コンテナを起動し、DBを作成します。

```bash
// コンテナを起動
$ docker-compose up -d

// rails のコンテナに入る
$ docker exec -it rails_web bash

// DB作成
# rake db:create
```

あとはブラウザで確認してください。
