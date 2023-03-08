/*
 * Compute the number of customers who live outside of the US.
 */


SELECT count(*)
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
WHERE city.country_id NOT IN (
    SELECT country_id FROM country WHERE country = 'United States');
