USE trailerflixdb;

CREATE VIEW vistaCatalogo AS
SELECT
    c.catalogoId AS id,
    CONCAT('https://www.trailerflix.com',c.poster) AS poster,
    c.titulo,
    cat.categoriaNombre AS categoria,
    (
        SELECT GROUP_CONCAT(DISTINCT g.generoNombre SEPARATOR ', ')
        FROM genero g
        JOIN catalogogenero cg ON g.generoId = cg.generoId
        WHERE cg.catalogoId = c.catalogoId
    ) AS genero,
    c.resumen,
    c.temporadas,
    GROUP_CONCAT(DISTINCT a.repartoNombre SEPARATOR ', ') AS reparto,
    c.trailer
FROM
    catalogo c
JOIN
    categoria cat ON c.categoriaId = cat.categoriaId
JOIN
    catalogoreparto ca ON c.catalogoId = ca.catalogoId
JOIN
    reparto a ON ca.repartoId = a.repartoId
GROUP BY
    c.catalogoId, c.poster, c.titulo, cat.categoriaNombre, c.resumen, c.temporadas, c.trailer;