/* Q1- Mention the total no of nations who participated in each olympics game?*/

With t1 as
(select distinct NOC, Games
from olympics_events
where Season= 'Summer'
order by Games
)

select Games, count(NOC) as no_of_countries
from t1
group by Games



/*Q2- Identify the sport which was played in all summer olympics.*/

    
	   select Sport, count(distinct Games) as total_games
          	from olympics_events
			where Season = 'Summer'
			  
           group by Sport
	  order by total_games desc
	  limit 5



/*Q3- Fetch the top 5 athletes who have won the most gold medals */

	  SELECT Name, count( Medal) as total_gold from olympics_events
	  where Medal= 'Gold'
	  group by 1
	  order by total_gold desc



/*Q4- Which countries have never won gold medal but have won silver/bronze medals? */ 
     
select distinct NOC
from olympics_events
where Medal in ('Silver', 'Bronze')
AND NOC not in
(
select NOC
from olympics_events
where Medal = 'Gold'
)



/*Q5- In which Sport/event, India has won highest medals.*/

select Sport, count(Medal) as all_medals
from olympics_events
where Medal <> 'NA' and "NOC" = 'IND'
group by 1
order by all_medals desc
limit 1