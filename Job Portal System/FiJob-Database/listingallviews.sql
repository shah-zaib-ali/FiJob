-- List all created views
SELECT name AS ViewName, create_date AS CreatedDate, modify_date AS LastModified
FROM sys.views
WHERE name LIKE 'vw_%'
ORDER BY name;
GO