/*
 * Compute the country with the most customers in it. 
 */

SELECT t.country 
FROM( 
    SELECT country, count(customer_id)
    FROM country
    JOIN city  USING (country_id)
    JOIN address using (city_id)
    JOIN customer USING (address_id)
    GROUP BY country
    ORDER BY count(*) DESC  limit  1) t;
