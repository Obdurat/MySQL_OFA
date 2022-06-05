SELECT
    user_name as usuario,
    COUNT(id_song) AS qtde_musicas_ouvidas,
    ROUND(SUM(song_duration_seconds / 60), 2) AS total_minutos
FROM
    user AS USER
    JOIN reproductions AS USER_HISTORY ON id_user = user_id_user
    JOIN songs AS SONG ON USER_HISTORY.songs_id_song = SONG.id_song
GROUP BY
    usuario
ORDER BY
    usuario; 