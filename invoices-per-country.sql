SELECT 
    c.country_name, 
    COUNT(i.id) AS total_invoices, 
    ROUND(AVG(i.total_price), 6) AS average_amount
FROM 
    country c
JOIN 
    city ci ON ci.country_id = c.id
JOIN
    customer cu ON ci.id = cu.city_id
JOIN 
    invoice i ON cu.id = i.customer_id
GROUP BY 
    c.country_name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);
