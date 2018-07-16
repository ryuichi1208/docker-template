#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    -- DB作成 
    CREATE DATABASE postgres_database;

    -- DB切り替え
    \c postgres_database

    -- テーブル作成
    CREATE TABLE m_user (
        id SERIAL,
        name VARCHAR(30) NOT NULL,
        PRIMARY KEY (id)
    );
    
    -- データ挿入
    INSERT INTO m_user (name)
    VALUES
    ('ユーザー1'),
    ('ユーザー2'),
    ('ユーザー3'),
    ('ユーザー4'),
    ('ユーザー5');

    -- ロール作成
    CREATE ROLE tamayan LOGIN PASSWORD '_Password123';
    
    -- postgres_database への接続権限を付与
    GRANT CONNECT ON DATABASE postgres_database TO tamayan;

    -- postgres_database の全テーブルへの権限を付与
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tamayan;
EOSQL
