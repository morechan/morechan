DROP TABLE IF EXISTS 4u_post;
DROP TABLE IF EXISTS 4u_board;
DROP TABLE IF EXISTS 4u_access;

CREATE TABLE 4u_board (
  id INT PRIMARY KEY AUTO_INCREMENT,
  max_filesize INT DEFAULT NULL,
  upload_mandatory TINYINT NOT NULL DEFAULT 0,
  captcha TINYINT NOT NULL DEFAULT 1,
  board_name VARCHAR(10) NOT NULL,
  post_interval TINYINT NOT NULL DEFAULT 60
);


CREATE TABLE 4u_post (
  id INT PRIMARY KEY AUTO_INCREMENT,
  board_id INT NOT NULL,
  ip VARCHAR(15) NOT NULL,
  content TEXT NOT NULL,
  attachment VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (board_id) REFERENCES 4u_board(id)
);

CREATE TABLE 4u_access (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user VARCHAR(60) NOT NULL,
  password VARCHAR(255) NOT NULL,
  ROLE ENUM('MODERATOR', 'ADMINISTRATOR') NOT NULL DEFAULT 'MODERATOR'
);

INSERT INTO 4u_board (id, max_filesize, upload_mandatory, captcha, board_name, post_interval) VALUES (
  NULL,
  4000, /* 4mb */
  0,
  0,
  'b',
  60);

INSERT INTO 4u_access(id, user, password, ROLE) VALUES (
  NULL,
  'hero',
  'fdc2cf024e1896852245ed0267c0ee13e827a9ae', /* baum */
  'ADMINISTRATOR'
);