-- m_user テーブル作成
CREATE TABLE `m_user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

-- テストデータを挿入
INSERT INTO `m_user` (`name`)
VALUES
('大沼'),
('大石'),
('藤田'),
('岡本'),
('シコースキー'),
('小野寺'),
('長田'),
('マイケル中村');

-- 権限付与
GRANT ALL PRIVILEGES ON `lamp_database`.* TO 'tamayan'@'%';
