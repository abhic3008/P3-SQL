/* Q1- Select countries with highest number of universities in the list */

select count(*), country from qsdata 
group by country
order by 1 desc
limit 1



/*Q2- Select Indian universities along with thier rank and city */

select rank_no, university_name, city from qsdata
where country = 'India'



/*Q3- Select top 5 Indian universities with highest net flow of students- outbound/inbound ratio(till 2 decimal place) */

select university_name, round(CAST(outbound_exchange/inbound_exchange AS numeric),2) as ratio_n
from qsdata
where country = 'India'
order by 2 desc
limit 5

/*realised that postgres does not handle automatic conversion from float/real to numeric */



/*Q4- Select the university with the highest and lowest faculty-student ratio */

(
 select university_name, faculty_student_ratio from qsdata
order by faculty_student_ratio desc
limit 1
   )
union all
(
 select university_name, faculty_student_ratio from qsdata
order by faculty_student_ratio asc
limit 1
  )



/*Q5-  Top Indian university with the highest number of international students and compare it with the one with overall highest international students */

(
  select university_name, international_students, country from qsdata 
 where country = 'India'
 order by 2 desc
 limit 1
  )
union all
(
 select university_name, international_students,country 
 from qsdata 
 where international_students=100
  )
