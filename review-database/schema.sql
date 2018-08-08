DROP DATABASE IF EXISTS reviews;

CREATE DATABASE reviews;

USE reviews;

CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(250),
img VARCHAR(250)
);

CREATE TABLE reviews (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date DATETIME DEFAULT CURRENT_TIMESTAMP,
user_id INT NOT NULL,
product_id INT NOT NULL,
rating INT(1) NOT NULL,
title VARCHAR(250),
verified BOOL,
review VARCHAR(20000),
helpful INT(9),
not_helpful INT(9),
abuse INT(9),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE aggregates (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_id INT NOT NULL,
score DECIMAL(2,1),
qty INT(9),
five INT(9),
four INT(9),
three INT(9),
two INT(9),
one INT(9)
);

CREATE TABLE images (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
review_id INT NOT NULL,
title VARCHAR(250),
url VARCHAR(250),
FOREIGN KEY (review_id) REFERENCES reviews(id)
);

CREATE TABLE comments (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
review_id INT NOT NULL,
user_id INT NOT NULL,
date DATETIME DEFAULT CURRENT_TIMESTAMP,
title VARCHAR(250),
comment VARCHAR(20000),
abuse INT(9),
FOREIGN KEY (review_id) REFERENCES reviews(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
comment_id INT NOT NULL,
user_id INT NOT NULL,
date DATETIME DEFAULT CURRENT_TIMESTAMP,
reply VARCHAR(20000),
abuse INT(9),
FOREIGN KEY (comment_id) REFERENCES comments(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);
