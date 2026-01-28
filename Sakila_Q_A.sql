USE sakila;
SELECT * FROM customer;
# 1- TOTAL NUMBER OF ACTIVE CUSTOMERS
SELECT COUNT(*) AS total_customer FROM customer
WHERE  active = 1;

# 2- LIST ALL FILMS RATING PG-13;
SELECT title, rating FROM film
WHERE rating = "PG-13";

# 3 - COUNT FILM WITH LENGTH > 100 MINUTES
SELECT COUNT(*) FROM film
WHERE  length > 100;


# 4 - AVERAGE REPLACEMENT  COST OF FILMS
SELECT AVG(replacement_cost) FROM film;

# 5 - CUSTOMER CREATED IN 2006
SELECT * FROM customer 
WHERE YEAR(create_date) = 2006;

# 6 - TOTALL NUMBER OF RENTALS
SELECT COUNT(*) FROM rental;

# 7 - NUMBER  OF RENTALS DONE BY EACH CUSTOMER
SELECT customer_id ,COUNT(*) FROM  rental  GROUP BY customer_id;

# 8 - LIST  CUSTOMER  RENTED MORE THAN  20 TIME
SELECT customer_id FROM rental GROUP BY customer_id HAVING COUNT(*) > 20;


# 9 - TOTAL NUMBER OF PAYMENT
SELECT COUNT(*) AS total_payment FROM payment;

# 10 - CUSTOMER WITH TOTAL PAYMENT > $150 
SELECT customer_id , SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING total_spent > 150;


# 11 - TOTAL PAYMENT  PER STAFF MEMBER
SELECT staff_id, SUM(amount) FROM payment GROUP BY staff_id;

# 12 - FILM  WITH MAX RENTAL RATE
SELECT title FROM  film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

# 13 - FILM SHORTER THAN AVERAGE LENGTH
SELECT  title FROM film WHERE length < (SELECT AVG(length) FROM film);


# 14 - FILM WITH 7 - DAY RENTAL DURATION 
SELECT COUNT(*) FROM film  WHERE rental_duration = 7;

# 15 - FIND EARLIEST RENTAL DATE
SELECT MIN(rental_date) FROM rental;

# 16 - DISTINCT PAYMENT DETES
SELECT DISTINCT DATE(payment_date) FROM payment;


# 18 - NUMBER OF INACTIVE CUSTOMER
SELECT COUNT(*) FROM customer WHERE active= 0;

# 19 - find WITH REPLACEMENT COST BETWEEN 10 AND 15 
SELECT title FROM film WHERE replacement_cost  BETWEEN 10 AND 15;


# 20 - CUSTOMER WHO NEVER RENTED
SELECT customer_id FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM rental);