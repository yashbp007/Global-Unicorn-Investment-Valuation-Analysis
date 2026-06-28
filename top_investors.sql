SELECT
    TRIM(investor) AS investor_name,
    COUNT(*) AS unicorn_count
FROM(
    SELECT
        UNNEST(STRING_TO_ARRAY(select_investors, ',')) AS investor
    FROM unicorn_companies
    WHERE select_investors IS NOT NULL
) AS investor_list
GROUP BY investor_name
ORDER BY unicorn_count DESC
LIMIT 20;

