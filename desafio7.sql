SELECT
    ARTISTS.author_name AS artista,
    ALBUM.album_name AS album,
    COUNT(UFA.user_id_user) AS seguidores
FROM
    authors AS ARTISTS
    JOIN albuns AS ALBUM ON ARTISTS.id_author = ALBUM.authors_id_author
    JOIN following AS UFA ON ARTISTS.id_author = UFA.authors_id_author
GROUP BY
    album,
    artista
ORDER BY
    seguidores DESC,
    artista,
    album; 