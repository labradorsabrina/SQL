/*Explore Data*/

SELECT *
FROM survey LIMIT 10;

SELECT COUNT(DISTINCT user_id)
FROM survey;

/*Survey Funnel*/

WITH QStoppedAt AS (
  SELECT user_id, question, MAX(question) AS 'LastQAns'
  FROM survey
  GROUP BY user_id
),
QComplete AS (
  SELECT user_id, question, COUNT(response) AS 'NumResponded'
  FROM survey
  GROUP BY question
)
SELECT QComplete.question, QComplete.NumResponded, COUNT(QStoppedAt.LastQAns) AS NumStoppedHere, ROUND((1.0-(500.0-QComplete.NumResponded)*1.0 / 500.0),2) AS completionPercent
FROM QComplete
LEFT JOIN QStoppedAt
ON (QComplete.question = QStoppedAt.question)
GROUP BY LastQAns;

/*Skipping Rates*/

WITH totQs AS (
  SELECT user_id, response, question, COUNT(question) as countsQ
  FROM survey
  GROUP BY user_id
),
CountSkip AS (
  SELECT user_id, count(response) AS response
  FROM survey
  WHERE response = "I'm not sure. Let's skip it."
  GROUP BY user_id
)
SELECT CountSkip.user_id, CountSkip.response, totQs.countsQ, ROUND((CountSkip.response*1.0)/(totQs.countsQ*1.0),2) AS SkipPercent
FROM CountSkip
LEFT JOIN totQs
ON (CountSkip.user_id = totQs.user_id)
LIMIT 10;

/*Explore Funnel Datasets*/

SELECT *
FROM quiz LIMIT 5;

SELECT *
FROM home_try_on LIMIT 5;

SELECT *
FROM purchase LIMIT 5;

/*funnel + a/b test */
WITH purchases AS (
  SELECT DISTINCT quiz.user_id, quiz.style AS 'quiz_style',
  home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
  home_try_on.number_of_pairs,
  purchase.user_id IS NOT NULL AS 'is_purchase',
  purchase.style AS 'purchase_style',
  purchase.product_id
  FROM quiz
  LEFT JOIN home_try_on
  ON quiz.user_id = home_try_on.user_id
  LEFT JOIN purchase
  ON purchase.user_id = quiz.user_id
  /*Other Table Format
)
SELECT purchase_style, quiz_style, product_id, number_of_pairs, COUNT(DISTINCT user_id) AS 'Quized?', SUM(is_home_try_on) AS 'Tried_On?', SUM(is_purchase) AS 'purchased?'
FROM purchases
GROUP BY purchase_style, product_id;*/
)
SELECT number_of_pairs, COUNT(DISTINCT user_id) AS 'Quized?', SUM(is_home_try_on) AS 'Tried_On?', SUM(is_purchase) AS 'purchased?'
FROM purchases
GROUP BY number_of_pairs;

/*Explore Purchasing Behavior and Data Formats*/
SELECT COUNT(DISTINCT user_id)
FROM quiz;

SELECT style, fit, shape, COUNT(DISTINCT user_id) AS unique_users, ROUND((COUNT(DISTINCT user_id) / 1000.0),3) AS 'percent_of_tot'
FROM quiz
GROUP BY style, fit, shape;

SELECT style AS quiz_style, COUNT(DISTINCT user_id) AS cust_count
FROM quiz
GROUP BY style;

SELECT fit AS quiz_fit, COUNT(DISTINCT user_id) AS cust_count
FROM quiz
GROUP BY fit;

SELECT shape AS quiz_shape, COUNT(DISTINCT user_id) AS cust_count
FROM quiz
GROUP BY shape;
