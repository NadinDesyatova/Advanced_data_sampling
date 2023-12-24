-- Название и продолжительность самого длительного трека
SELECT track_name, duration FROM tracks
 WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name, duration FROM tracks
 WHERE duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM collections
 WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name_alias FROM performers
 WHERE name_alias NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name FROM tracks
 WHERE track_name LIKE '%my%'
       OR track_name LIKE '%мой%';

-- Количество исполнителей в каждом жанре
SELECT genre_name, COUNT(performer_id) performer_q FROM genres g
  JOIN genre_performer g_p ON g.genre_id = g_p.genre_id
 GROUP BY g.genre_name
 ORDER BY performer_q DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(track_id) FROM albums a
JOIN tracks t ON a.album_id = t.album_id
WHERE release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT album_name, AVG(duration) FROM albums a 
  JOIN tracks t ON a.album_id = t.album_id
 GROUP BY album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT name_alias FROM performers 
 WHERE name_alias NOT IN 
       (SELECT name_alias FROM performers p
          JOIN album_performer ap ON p.performer_id = ap.performer_id
          JOIN albums ON ap.album_id = albums.album_id
         WHERE release_year = 2020);

-- Названия сборников, в которых присутствует конкретный исполнитель (Yuri Shevchuk)
SELECT collection_name FROM collections c
  JOIN collection_track ct ON c.collection_id = ct.collection_id
  JOIN tracks t ON ct.track_id = t.track_id
  JOIN album_performer ap ON t.album_id = ap.album_id 
  JOIN performers ON ap.performer_id = performers.performer_id 
 WHERE name_alias = 'Yuri Shevchuk';
 
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT album_name, COUNT(genre_id) genres_number FROM albums a 
  JOIN album_performer ap ON a.album_id = ap.album_id
  JOIN genre_performer gp ON ap.performer_id = gp.performer_id
 GROUP BY album_name
HAVING COUNT(genre_id) > 1;
  
 -- Наименования треков, которые не входят в сборники
SELECT track_name FROM tracks t 
  LEFT JOIN collection_track ct ON t.track_id = ct.track_id
 WHERE collection_id IS NULL;
 
 -- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT name_alias, duration FROM tracks t
  JOIN album_performer ap ON t.album_id = ap.album_id 
  JOIN performers p ON ap.performer_id = p.performer_id 
 WHERE duration = (SELECT MIN(duration) FROM tracks);
 
-- Названия альбомов, содержащих наименьшее количество треков
SELECT album_name, COUNT(track_id) min_tracks_number FROM albums a
  JOIN tracks t ON a.album_id  = t.album_id 
 GROUP BY album_name
HAVING COUNT(track_id) =
       (SELECT COUNT(track_id) FROM albums a 
         JOIN tracks t on a.album_id  = t.album_id 
        GROUP BY album_name
        ORDER BY COUNT(track_id)
        LIMIT 1);