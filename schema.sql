\c testingsdc

DROP TABLE IF EXISTS alltable;

CREATE TABLE alltable (
	product_id 					INT 		NOT NULL,
	five 				SMALLINT,
	four 				SMALLINT,
	three 				SMALLINT,
	two 				SMALLINT,
	one 				SMALLINT,
	qty 				SMALLINT,
	score 				NUMERIC	(2,1),
    username            VARCHAR(30),
    img                 VARCHAR(20),
    title               VARCHAR(30),
    rating              SMALLINT,
    date                VARCHAR(20),
    verified            boolean,
    review              VARCHAR(130)
);

COPY alltable(product_id, five, four, three, two, one, qty, score, username, img, title, rating, date, verified, review) 
FROM '/home/ec2-user/serverSDC/review-module-database/normalizePractice.csv' DELIMITER ',';

CREATE INDEX alltable_productid ON alltable (product_id);

