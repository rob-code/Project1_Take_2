DROP TABLE targets;
DROP TABLE transactions;
DROP TABLE budgets;
DROP TABLE categories;

CREATE TABLE categories(
id SERIAL8 primary key,
name VARCHAR(255)
);

CREATE TABLE budgets(
id SERIAL8 primary key,
total_budget NUMERIC(12,2)
);

CREATE TABLE transactions(
id SERIAL8 primary key,
merchant_name VARCHAR(255),
amount NUMERIC(12,2),
category_id INT8 references categories(id) ON DELETE CASCADE
);

CREATE TABLE targets(
id SERIAL8 primary key,
amount NUMERIC(12,2),
category_id INT8 references categories(id) ON DELETE CASCADE
);

