/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

with bacall_1 AS (
    SELECT a1.actor_id FROM actor a1
    JOIN film_actor fa1 ON (a1.actor_id = fa1.actor_id)
    JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id)
    JOIN actor a2 ON (fa2.actor_id = a2.actor_id)
    WHERE a2.actor_id IN (
        SELECT actor_id FROM  actor
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
    )
    AND a1.actor_id NOT IN (
        SELECT actor_id FROM actor
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
    )
)
SELECT DISTINCT  a1.first_name || ' ' || a1.last_name AS  "Actor Name" 
FROM actor a1
JOIN  film_actor fa1 ON (a1.actor_id = fa1.actor_id)
JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id)
JOIN actor a2 ON (fa2.actor_id = a2.actor_id)
WHERE  a2.actor_id IN (select * from bacall_1)
AND  a1.actor_id NOT IN  (select * from bacall_1)
AND a1.actor_id NOT IN  (select actor_id from actor where first_name = 'RUSSELL' and last_name = 'BACALL')
ORDER BY  "Actor Name";

