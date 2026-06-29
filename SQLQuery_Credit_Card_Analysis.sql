select * from credit_card_applications

--Select all approved applications

select Full_Name,City,Annual_Income,Approval_Status from credit_card_applications
where Approval_Status='approved'

-- Count total applications by gender

select Gender,COUNT(*)  as total_appliction  from credit_card_applications
group by Gender

--Find all applicants from Mumbai

select City,COUNT(*) as Total_Appliction from credit_card_applications
where city = 'mumbai'
group by city

--Show the top 5 highest annual incomes

select top 5 Full_Name, Annual_Income from credit_card_applications order by  Annual_Income desc

--Count approvals vs rejections

select Approval_Status,count(*) as Total_count from credit_card_applications
group by Approval_Status

--Average credit score for approved vs rejected

SELECT Approval_Status,ROUND(AVG(Credit_Score), 1) AS Avg_Credit_Score,ROUND(AVG(Annual_Income), 0) AS Avg_Income
FROM credit_card_applications
GROUP BY Approval_Status;

--List applicants with credit score above 800 who were rejected
select Full_Name,City,Annual_Income,Approval_Status,Credit_Score from credit_card_applications 
where Credit_Score > 800 and Approval_Status='rejected' 
order by Credit_Score desc

--City-wise approval count, only cities with more than 25 approvals

SELECT City,COUNT(*) AS Total,SUM(CASE WHEN Approval_Status = 'Approved' THEN 1 ELSE 0 END) AS Approved
FROM credit_card_applications
GROUP BY City
HAVING Approved > 25
ORDER BY Approved DESC;

--Average credit limit granted by card type

SELECT Card_Type_Applied,COUNT(*) AS Approved_Count,ROUND(AVG(Credit_Limit_Granted), 0) AS Avg_Credit_Limit
FROM credit_card_applications
WHERE Approval_Status = 'Approved'
GROUP BY Card_Type_Applied
ORDER BY Avg_Credit_Limit DESC;