SELECT
    COUNT(DISTINCT(id_song)) AS cancoes,
    COUNT(DISTINCT(id_author)) AS artistas,
    COUNT(DISTINCT(id_albums)) AS albuns
FROM
    authors AS ARTISTS
    JOIN albuns AS ALBUM ON id_author = id_author
    JOIN songs AS SONG ON id_albums = albuns_id_albums; 