-- m_user テーブル作成
CREATE TABLE `m_user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

-- テストデータを挿入
INSERT INTO `m_user` (`name`)
VALUES
('ユーザー1'),
('ユーザー2'),
('ユーザー3'),
('ユーザー4'),
('ユーザー5');

-- 権限付与
GRANT ALL PRIVILEGES ON `test_database`.* TO 'tamayan'@'%';
