1.	Find the app with an ID of 1880.

SELECT * FROM analytics WHERE id = 1880;
  
  
2.	Find the ID and app name for all apps that were last updated on August 01, 2018.

SELECT id, app_name FROM analytics  WHERE last_updated = '2018-08-01';
   
   
3.	Count the number of apps in each category, e.g. “Family | 1972”.

Select category, Count(id) From analytics Group By  category


4.	Find the top 5 most-reviewed apps and the number of reviews for each.

SELECT app_name, reviews from analytics order by reviews desc LIMIT 5;

5.	Find the app that has the most reviews with a rating greater than equal to 4.8.

SELECT app_name, reviews from analytics where rating > 4.8 order by reviews desc LIMIT 1;

6.	Find the average rating for each category ordered by the highest rated to lowest rated.

select category, avg(rating) from analytics group by category order by avg(rating) desc;

7.	Find the name, price, and rating of the most expensive app with a rating that’s less than 3.

select app_name, price, rating from analytics where rating < 3 order by price desc LIMIT 1;


8.	Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.

select * from analytics where min_installs <= 50 and rating is not null order by rating desc;



9.	Find the names of all apps that are rated less than 3 with at least 10000 reviews.

select app_name from analytics where rating < 3 and reviews >= 10000;


10.	Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.


select * from analytics where price between 0.10 and 1 order by reviews desc limit 10;


11.	Find the most out of date app. 

select * from analytics order by last_updated desc limit 1;


12.	Find the most expensive app (the query is very similar to #11).

select * from analytics order by price desc limit 1;


13.	Count all the reviews in the Google Play Store.

select sum(reviews) from analytics;

14.	Find all the categories that have more than 300 apps in them.

select category, count(category) from analytics group by category having count(category) > 300;

15.	Find the app that has the highest proportion of min_installs to reviews, 
among apps that have been installed at least 100,000 times. 
Display the name of the app along with the number of reviews, the min_installs, and the proportion.

select app_name, reviews, min_installs, (min_installs/reviews) as "proportion"
from analytics 
where min_installs >= 100000 
order by (min_installs/reviews)
Limit 1;
