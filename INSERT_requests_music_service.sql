-- добавляет жанры
INSERT INTO genres(genre_name) 
VALUES ('Rock_n_roll'), 
       ('Synthpop'), 
       ('Hip hop'),
       ('Punk rock'),
       ('Electro music'),
       ('Indie pop');

-- добавляет исполителей
INSERT INTO performers(name_alias) 
VALUES ('Yuri Shevchuk'),
       ('Taylor Alison Swift'), 
       ('Oxxxymiron'), 
       ('Noize MС'),
       ('Порнофильмы'),
       ('Race to Space'),
       ('R.A.SVET');

-- добавляет альбомы
INSERT INTO albums(album_name, release_year)
VALUES ('Creativity in the void', 2021), 
       ('Midnights', 2022), 
       ('Beauty and ugliness', 2021), 
       ('Exit to the city', 2021),
       ('Галя ходи', 2018), 
       ('Это пройдёт', 2020),
       ('We exist', 2023);

-- добавляет коллекции
INSERT INTO collections (collection_name, release_year) 
VALUES ('Sad music', 2023), 
       ('Music about love', 2023), 
       ('The music of our time', 2023), 
       ('Music for different moods', 2023),
       ('The Best', 2020);

-- добавляет треки
INSERT INTO tracks (track_name, duration, album_id) 
VALUES ('Букет крапивы', '00:03:05', 4), 
       ('Миокард', '00:03:03', 4), 
       ('Sweet Nothing', '00:03:08', 2), 
       ('Где я', '00:05:31', 1), 
       ('Пантеллерия', '00:02:53', 3),
       ('Дрейдл', '00:02:26', 3),
       ('Вокзал', '00:04:57', 5), 
       ('Уроки любви', '00:05:17', 6), 
       ('Если ты мой настоящий друг', '00:03:50', 7),
       ('Крылья', '00:05:15', 7);
       
-- добавляет связь между альбомами и исполнителями
INSERT INTO album_performer (album_id, performer_id) 
VALUES (1, 1), 
       (2, 2), 
       (3, 3), 
       (4, 4),
       (5, 1), 
       (6, 5), 
       (7, 6),
       (7, 7);

-- добавляет связь между коллекциями и треками
INSERT INTO collection_track (collection_id, track_id) 
VALUES (1, 4), 
       (1, 5), 
       (2, 1),
       (2, 3),
       (3, 2),
       (3, 4),
       (3, 6),
       (4, 1),
       (4, 2),
       (4, 3),
       (4, 4),
       (4, 5),
       (4, 6),
       (5, 7), 
       (5, 8),
       (2, 9);

-- добавляет связь между жанрами и исполнителями
INSERT INTO genre_performer (genre_id, performer_id) 
VALUES (1, 1), 
       (2, 2), 
       (3, 3),
       (3, 4),
       (4, 5), 
       (5, 6),
       (6, 7);
       