1. 
SELECT *
from quiz
LIMIT 10;



2.
SELECT question,
     COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;



3. (see attached Excel sheet)

question	COUNT(DISTINCT user_id)	Percent of change question to question	Overall percentage change
1. What are you looking for?	500	100%	100%
2. What's your fit?	475	95%	95%
3. Which shapes do you like?	380	80%	76%
4. Which colors do you like?	361	95%	72%
5. When was your last eye exam?	270	75%	54%



4.
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;



5.
SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 10;



6.
with funnels AS (
SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id)
SELECT COUNT(*) AS 'Number_of_pairs',
   SUM(is_home_try_on) AS 'Try_On',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'HOME_TRY_ON',
   1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'checkout_to_purchase'
FROM funnels;



7.
SELECT style, COUNT(style)
from quiz
GROUP BY style;


SELECT *,
COUNT(product_id) AS 'total purchased'
from purchase
GROUP BY 2
ORDER BY 7 DESC
LIMIT 10;
