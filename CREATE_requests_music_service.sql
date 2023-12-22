CREATE TABLE if not exists genres (
       genre_id SERIAL PRIMARY KEY, 
       genre_name VARCHAR(50) NOT NULL 
);

CREATE TABLE if not exists performers (
       performer_id SERIAL PRIMARY KEY, 
       name_alias VARCHAR(250) NOT NULL 
);

CREATE TABLE if not exists albums (
       album_id SERIAL PRIMARY KEY, 
       album_name VARCHAR(250) NOT NULL,
       release_year INT not NULL
);

CREATE TABLE if not exists collections (
       collection_id SERIAL PRIMARY KEY, 
       collection_name VARCHAR(250) NOT NULL,
       release_year INT not NULL
);

CREATE TABLE if not exists tracks (
       track_id SERIAL PRIMARY KEY, 
       track_name VARCHAR(250) NOT NULL,
       duration time(0) NOT NULL,
       album_id INT NOT NULL, 
       CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(album_id) ON DELETE CASCADE
);

CREATE TABLE if not exists collection_track (
       collection_track_id SERIAL PRIMARY KEY, 
       collection_id INT NOT NULL,
       track_id INT NOT NULL, 
       CONSTRAINT fk_collection FOREIGN KEY(collection_id) REFERENCES collections(collection_id) ON DELETE cascade,
       CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES tracks(track_id) ON DELETE cascade
);

CREATE TABLE if not exists genre_performer (
       genre_performer_id SERIAL PRIMARY KEY, 
       genre_id INT NOT NULL,
       performer_id INT NOT NULL, 
       CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(genre_id) ON DELETE cascade,
       CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES performers(performer_id) ON DELETE cascade
);

CREATE TABLE if not exists album_performer (
       album_performer_id SERIAL PRIMARY KEY, 
       album_id INT NOT NULL,
       performer_id INT NOT null,
       CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(album_id) ON DELETE cascade,
       CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES performers(performer_id) ON DELETE cascade
);