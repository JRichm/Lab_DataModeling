DROP TABLE album, artist, customer, employee, genre, invoice, invoice_line, media_type, playlist, playlist_track, track;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
    username VARCHAR NOT NULL
);

CREATE TABLE food (
    food_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    price INT
);

CREATE TABLE grocery_lists (
    user_id INT NOT NULL REFERENCES users(user_id),
    cart_item_1 INT REFERENCES food(food_id),
    cart_item_2 INT REFERENCES food(food_id),
    cart_item_3 INT REFERENCES food(food_id),
    cart_item_4 INT REFERENCES food(food_id),
    cart_item_5 INT REFERENCES food(food_id),
    cart_item_6 INT REFERENCES food(food_id),
    cart_item_7 INT REFERENCES food(food_id),
    cart_item_8 INT REFERENCES food(food_id)
);

CREATE TABLE recipes (
	recipe_id SERIAL PRIMARY KEY NOT NULL,
    recipe_name VARCHAR,
    author_id INT NOT NULL REFERENCES users(user_id),
    food_item_1 INT REFERENCES food(food_id),
    food_item_2 INT REFERENCES food(food_id),
    food_item_3 INT REFERENCES food(food_id),
    food_item_4 INT REFERENCES food(food_id),
    food_item_5 INT REFERENCES food(food_id),
    food_item_6 INT REFERENCES food(food_id), 
    food_item_7 INT REFERENCES food(food_id),
    food_item_8 INT REFERENCES food(food_id)
);

CREATE TABLE occasions(
	date SERIAL PRIMARY KEY,
    occasion_name VARCHAR,
    recipe_id INT REFERENCES recipes(recipe_id)
);

INSERT INTO users (email, username, password) VALUES
('JRichm@fmail.com', 'JRichm', '9778password'),
('hungryGuy@yaboo.com', 'hungryGuy', '12345'),
('someoneelse@notmail.com', 'someoneelse', 'someoneelse');

INSERT INTO food (price, name) VALUES
(5, 'milk'),
(6, 'eggs'),
(4, 'flour'),
(1, 'water'),
(3, 'butter'),
(4, 'cream'),
(2, 'sugar');

INSERT INTO recipes (author_id, recipe_name, food_item_1, food_item_2, food_item_3, food_item_4, food_item_5, food_item_6, food_item_7, food_item_8)
VALUES (1, 'cake', 1, 2, 3, 7, NULL, NULL, NULL, NULL);

INSERT INTO occasions (occasion_name, recipe_id)
VALUES ('birthday', 1);

INSERT INTO grocery_lists (user_id, cart_item_1, cart_item_2, cart_item_3, cart_item_4, cart_item_5, cart_item_6, cart_item_7, cart_item_8)
VALUES (1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SELECT * FROM users;
SELECT * FROM grocery_lists;
SELECT * FROM food;
SELECT * FROM recipes;
SELECT * FROM occasions;