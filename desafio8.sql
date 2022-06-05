SELECT
    ARTISTS.author_name AS artista,
    ALBUM.album_name AS album
FROM
    authors as ARTISTS
    JOIN albuns AS ALBUM ON ARTISTS.id_author = ALBUM.authors_id_author
WHERE
    ARTISTS.author_name = "Walter Phoenix"; 