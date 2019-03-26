-- The following sqls are used to delete duplicate rows without primary key

delete from t_location a using t_location b where a=b and a.ctid < b.ctid;

-- Delete duplicate rows 2
WITH x AS(
  SELECT
    t_location dup,
    MIN( ctid )
  FROM
    t_location
  GROUP BY
    1
  HAVING
    COUNT(*)> 1
) DELETE
FROM
  t_location
    USING x
WHERE
  (t_location)=(dup)
  AND t_location.ctid <> x.min RETURNING *;
