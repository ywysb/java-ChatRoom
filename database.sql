-- 1. 如果存在旧的库就删掉，重新建立一个干净的 'chat_room_db'
DROP DATABASE IF EXISTS chat_room_db;
CREATE DATABASE chat_room_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 切换到这个数据库
USE chat_room_db;

-- 2. 创建【用户表】 (users) 【作用：存放账号、密码、昵称等信息】
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '账号',
    password VARCHAR(50) NOT NULL COMMENT '密码',
    nickname VARCHAR(50) NOT NULL COMMENT '昵称',
    avatar INT DEFAULT 1 COMMENT '头像ID(1-9的数字，对应本地图片)',
    reg_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
);

-- 3. 创建【聊天记录表】 (chat_logs)
CREATE TABLE chat_logs (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
    sender_name VARCHAR(50) NOT NULL COMMENT '发送者昵称',
    receiver_name VARCHAR(50) DEFAULT 'ALL' COMMENT '接收者昵称(ALL代表群聊)',
    content TEXT COMMENT '消息内容',
    send_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间'
);

-- 4. 插入几条测试数据，便于直接登录测试
INSERT INTO users (username, password, nickname, avatar) VALUES 
('admin', '123456', '系统管理员', 0),
('master', '123456', 'A', 1),
('maid', '123456', 'B', 2),
('ywy', '123456', '杨文宇', 3),
('zyc', '123456', '朱煜成', 4);

-- 验证一下数据有没有成功插入
SELECT * FROM users;

-- 验证聊天记录是否保存成功
SELECT * FROM chat_logs;