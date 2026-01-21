USE titanic;
SELECT * FROM titanic;

# Q1 Count passengers whose age is *NULL*.
SELECT COUNT(*) AS age_passenger FROM titanic
WHERE  Age is NULL;

# Q2 Count passengers whose embark town is not NULL.
SELECT COUNT(*) AS Not_Null_embarked_passengers FROM titanic
WHERE embarked  IS NOT NULL;

# Q3 Count passengers who paid zero fare.
SELECT COUNT(*) AS zero_fare_passenger FROM titanic
WHERE  fare = 0;

# Q4  Count passengers whose fare is between 10 and 30.
SELECT COUNT(*) AS fare_passenger FROM titanic
 WHERE fare BETWEEN 10 AND 30;
 
 # Q5 Count passengers whose age is between 18 and 30.
 SELECT COUNT(*) AS age_passenger from titanic
 WHERE age BETWEEN 18 and 30;
 
 #Q6 Count passengers who embarked from either 'C' or 'Q'.
SELECT COUNT(*) AS embarked_C_Q_passenger FROM titanic
WHERE embarked IN ("C" , "Q");


# GROUP BY & HAVING
#Q7  Count passengers by embark town where passenger count > 100.
SELECT COUNT(*) AS count_passenger FROM titanic 
GROUP BY embarked HAVING COUNT(*) > 100;

#Q8 Count passengers by class where average fare is greater than 30.
SELECT pclass, COUNT(*) as passenger_count FROM titanic
GROUP BY pclass HAVING AVG(fare) >30;

#Q9 -9. Find passenger classes having more than 200 passengers.
SELECT pclass, COUNT(*) as passenger_count FROM titanic
GROUP BY pclass HAVING COUNT(*) >200;


#Q10 - Count survived passengers by embark town.
SELECT embarked ,COUNT(*) AS survived_passanger FROM titanic 
 WHERE survived =1 GROUP BY embarked ;
 
 #Q11 - 11. Count non-survived passengers by gender.
SELECT sex, COUNT(*) AS non_survived_passenger FROM titanic
WHERE survived = 0 GROUP BY sex;

#Q12 -  Find gender-wise average fare where average fare > 20.
SELECT sex, AVG(fare) as average_fare FROM titanic
GROUP BY sex HAVING  AVG(fare) > 20;

#-  Survival Analysis Questions
#Q13. Count survivors who were traveling alone.
SELECT COUNT(*) AS solo_survived FROM titanic
WHERE survived = 1 and sibsp = 0 and parch = 0;

#Q14 - Count survivors who were not traveling alone.
SELECT COUNT(*) AS not_solo_survivor FROM titanic
WHERE survived = 1 and (sibsp >0 OR parch> 0);

#Q15 Count survivors who were children.
SELECT COUNT(*) AS Child_Survived FROM titanic
WHERE survived = 1 AND age <18;

#Q16 Count survivors who paid fare more than the average fare.
SELECT COUNT(*) AS Survivors_average_fare FROM titanic
WHERE survived = 1 AND fare > (SELECT AVG(fare) FROM titanic);

#Q17 Count survivors in each passenger class.
SELECT pclass, COUNT(*) AS survived FROM titanic
WHERE survived=1 GROUP BY pclass ;

#Q18 - Count survivors by embark town.
SELECT Embarked, COUNT(*) AS Survivors FROM titanic
 WHERE Survived = 1 GROUP BY Embarked;
 
 #Q19 -Create an age group column: Child (<18), Adult (18–59), Senior (60+), and count passengers in each group.
SELECT 
  CASE 
    WHEN Age < 18 THEN 'Child'
    WHEN Age BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group, 
  COUNT(*) AS Passenger_Count 
FROM titanic 
GROUP BY 
  CASE 
    WHEN Age < 18 THEN 'Child'
    WHEN Age BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END;
  
  #Q20 - Count passengers classified as High Fare (>50) and Low Fare (≤50).
  SELECT 
  CASE 
    WHEN Fare > 50 THEN 'High Fare'
    ELSE 'Low Fare'
  END AS Fare_Group, 
  COUNT(*) AS Passenger_Count 
FROM titanic 
GROUP BY 
  CASE 
    WHEN Fare > 50 THEN 'High Fare'
    ELSE 'Low Fare'
  END;
  
  #Q21 - Count passengers grouped as Family (sibsp+parch > 0) and Solo.
  SELECT 
  CASE 
    WHEN SibSp + Parch > 0 THEN 'Family'
    ELSE 'Solo'
  END AS Travel_Group, 
  COUNT(*) AS Passenger_Count 
FROM titanic 
GROUP BY 
  CASE 
    WHEN SibSp + Parch > 0 THEN 'Family'
    ELSE 'Solo'
  END;
  
  #Q22 - Count survival status as Survived / Not Survived using CASE WHEN.
  SELECT 
  CASE 
    WHEN Survived = 1 THEN 'Survived'
    ELSE 'Not Survived'
  END AS Survival_Status, 
  COUNT(*) AS Passenger_Count 
FROM titanic 
GROUP BY 
  CASE 
    WHEN Survived = 1 THEN 'Survived'
    ELSE 'Not Survived'
  END;
  
  # 🔹 Advanced Filtering

  #Q23 - Count male passengers in Third Class who did not survive.
SELECT COUNT(*) AS Male_Third_Class_Not_Survived FROM titanic
 WHERE Sex = 'male' AND Pclass = 3 AND Survived = 0;
 
 #Q24 -Count female passengers in First Class who survived.
 SELECT COUNT(*) AS Female_First_Class_Survived FROM titanic
 WHERE Sex = 'female' AND Pclass = 1 AND Survived = 1;

#Q25 -  Count passengers whose age is greater than average age.
SELECT COUNT(*) AS About_Avg_Age FROM titanic
WHERE age > (SELECT AVG(age) FROM titanic);

#Q26 -  Count passengers who paid fare higher than the class average.
SELECT COUNT(*) as 
About_Class_Avg_Fare FROM titanic t1 WHERE fare > (SELECT AVG(Fare) 
FROM titanic t2 WHERE t1.pclass = t2.pclass);

#Q27 - Show top 10 oldest passengers.
SELECT * from titanic ORDER BY age DESC LIMIT 10;

#Q28 - Show top 10 youngest passengers.
SELECT * FROM titanic ORDER BY age ASC limit 10;


#Q29 Show top 5 embark towns with highest passenger count.
SELECT embarked, COUNT(*) as passenger_count FROM titanic
GROUP BY embarked ORDER BY passenger_count DESC LIMIT 5;

#Q30  30. Show top 5 fares paid by survivors only.
SELECT * FROM titanic WHERE survived = 1 ORDER BY fare
DESC LIMIT 5;
