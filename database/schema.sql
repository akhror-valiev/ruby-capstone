CREATE TABLE item(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT REFERENCES genre(id) ON DELETE CASCADE,
  author_id INT REFERENCES author(id) ON DELETE CASCADE,
  label_id INT REFERENCES label(id) ON DELETE CASCADE,
  publish_date DATE,
  archived BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  items_id INT REFERENCES item(id),
  publish_date DATE,
  publisher VARCHAR(100),
  cover_state VARCHAR(100)
);