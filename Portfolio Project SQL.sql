create database churn_dataset;

select * from ibm_telco_customer;

ALTER TABLE `ibm_telco_customer` 
CHANGE `Churn Reason` `Churn_Reason` varchar(256);

ALTER TABLE `ibm_telco_customer` 
CHANGE `Customer ID` `Customer_ID` VARCHAR(255);

ALTER TABLE `ibm_telco_customer` 
CHANGE `Payment Method` `Payment_Method` VARCHAR(255);

# Query 1: Considering the top 5 groups with the highest average monthly charges among churned customers, 
# how can personalized offers be tailored based on age, gender, and contract type to potentially improve customer retention rates? 

select customer_id , avg(`Monthly Charge`) as avg_monthly_charges, age, gender, contract
from ibm_telco_customer
where `Customer status` = "Churned"
group by customer_id, age, gender, contract
order by avg_monthly_charges desc
limit 5;

#This query shows top 5 churned customers paying highest monthly charges. As you can see most of them are old Male.

select age, count(customer_id) as churned_customrs
from ibm_telco_customer
group by age
order by churned_custoemrs desc;

SELECT `Monthly Charge`, COUNT(Customer_ID) AS ChurnedCount
FROM ibm_telco_customer
where `Customer Status` = "Churned"
GROUP BY `Monthly Charge`
ORDER BY ChurnedCount desc;


# Query 2: What are the feedback or complaints from those churned customers 

select churn_reason, count(customer_id) as no_of_customers
from ibm_telco_customer
where `Customer Status` = "Churned"
group by churn_reason
order by no_of_customers desc;

#The select Query select the column which we want to see fROM the Table, While WHERE shows the only Churned customer, and Group by tells to be specific and does not repeat the reason.


# Query 3: How does the payment method influence churn behavior? 
select payment_method, count(customer_id) as churned_customers
from ibm_telco_customer
where `Customer Status` = "Churned"
group by payment_method;

#The count function is counting the customers who has churned already and its grouping them by Payment_method. As you can see most of the churned customers payment method was Bank withdrawl.