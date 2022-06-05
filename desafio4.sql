SELECT
    user_name AS usuario,
    IF(
        YEAR(MAX(reproduction_date)) = "2021",
        "Usuário ativo",
        "Usuário inativo"
    ) AS condicao_usuario
FROM
    user AS USER
    JOIN reproductions AS USER_HISTORY ON id_user = USER_HISTORY.user_id_user
GROUP BY
    usuario; 