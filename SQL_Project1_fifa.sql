use ds_mar_2025;

select * from ds_mar_2025.fifa;

#How many players are there in the dataset?
select count(*) from fifa; 

select distinct count(ID) from ds_mar_2025.fifa; ##number of players in dataset

##How many nationalities do these players belong to?
select distinct count(Nationality) from ds_mar_2025.fifa; #nationalities of players

#which nationality has the highest number of players, what are the top 3 nationalities by # of players:
select Nationality, count(Name) as Players 
from ds_mar_2025.fifa
group by Nationality
order by Players desc
limit 3;

#Total wage, average and standard deviation:
select sum(Wage) as Total_Wage, avg(Wage) as Avg_wage, stddev(Wage) as Std_Dev_Wage from ds_mar_2025.fifa;

#Which player has the highest wage and lowest wage?
select Name from ds_mar_2025.fifa where Wage = (select max(Wage) from ds_mar_2025.fifa);
select Name from fifa where Wage = (select min(Wage) from ds_mar_2025.fifa);

#select Name from ds_mar_2025.fifa order by Wage desc limit 1;

#Player having best and worst overall rating 
select * from fifa;
#select sum(Overall) + sum(Potential) as rating from ds_mar_2025.fifa;
select max(Overall) as Best_rating from ds_mar_2025.fifa;

select Name from ds_mar_2025.fifa where Overall = (select max(Overall) as Best_rating from ds_mar_2025.fifa);
select Name from ds_mar_2025.fifa where Overall = (select min(Overall) as worst_rating from ds_mar_2025.fifa);

#Club having highest total of overall rating? Hghest average of overall rating?
select club, sum(overall) as total_rating
from fifa
group by club
order by total_rating desc 
limit 1;

select club, avg(overall) as Avg_overall
from fifa
group by club
order by Avg_overall desc
limit 1;

#Top 5 clubs based on the average rating of their players:
select club, avg(overall) as avg_rating
from fifa
group by club
order by avg_rating desc
limit 5;

#Distribution of plauers whose preferred foot is left vs right:
select count(*) as Player_Count, preferred_foot 
from fifa
where preferred_foot in ('Right','Left')
group by preferred_foot;


#Jersey number which is luckiest:
select jersey_number,sum(wage) as Wage_total
from fifa group by jersey_number
order by Wage_total desc;


#Frequency distribution of nationalities among players whose club name starts with M
select nationality, count(Name) as Distrbn
from fifa
where club like "M%"
group by nationality
order by Distrbn desc;



#How many players have joined their respective clubs in the date range 20 may 2018 to 10 April 2019?
select Club, count(Name) as Number_of_players
from fifa where joined between '20-05-2018' and '10-04-2019'
group by Club;


SELECT 
    Club, 
    COUNT(Name) AS Number_of_players
FROM fifa
WHERE STR_TO_DATE(joined, '%d %M %Y') BETWEEN '2018-05-20' AND '2019-04-10'
GROUP BY Club;


#How many players have joined their respective clubs date wise?
select joined, count(ID) as No_of_players from fifa
group by joined
order by joined asc;


#How many players have joined their respective clubs yearly?
select year(str_to_date(joined,'%Y-%M%d')) as Joined_year, count(*) as No_of_players from fifa
group by year(joined)
order by Joined_year asc;

SELECT 
    YEAR(STR_TO_DATE(joined, '%d %M %Y')) AS join_year,
    COUNT(*) AS number_of_players
FROM fifa
GROUP BY YEAR(STR_TO_DATE(joined, '%d %M %Y'))
ORDER BY join_year;

