SELECT
    song_name AS cancao,
    COUNT(id_song) AS reproducoes
FROM
    songs AS song
    JOIN reproductions ON id_song = songs_id_song
GROUP BY
    cancao
ORDER BY
    reproducoes DESC,
    cancao ASC
LIMIT
    2; 