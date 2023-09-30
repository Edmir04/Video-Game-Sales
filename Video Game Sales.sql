--change the column data type to do aggregate functions
alter table [dbo].[vgsales$]
alter column NA_sales decimal

alter table [dbo].[vgsales$]
alter column EU_sales decimal

alter table [dbo].[vgsales$]
alter column JP_sales decimal

alter table [dbo].[vgsales$]
alter column Other_sales decimal

alter table [dbo].[vgsales$]
alter column Global_sales decimal


-- check the TOP 5 year sales at global scale (order by year)
SELECT top (5) year, sum(Global_Sales) As Total_Sales
From [dbo].[vgsales$]
Where Year is not null
group by Year
order by Total_Sales desc


--check the TOP 5 Publisher (order by sales at global scale )
SELECT top (5) Publisher, sum(Global_Sales) As Total_Sales
From [dbo].[vgsales$]
Where Publisher is not null
group by Publisher
order by Total_Sales desc


--Most Popular game gender
SELECT Genre, count(Genre) AS Count_gender
From [dbo].[vgsales$]
Where Genre is not null
group by Genre
order by Count_gender desc


--Top Nintendo gender
SELECT Genre, count(genre) AS Count_game_genre
From [dbo].[vgsales$]
Where Publisher = 'Nintendo'
group by Genre
order by Count_game_genre desc

