select description,
count(*) as count_of_conditions
from public.conditions
where description != 'Body Mass Index 30.0-30.9, adult'
group by description
having count(*) >5000
order by count(*) desc

select * 
from public.patients 
where city = 'Boston' --make sure wording is correct


select *
from public.conditions
where code in ('585.1', '585.2')

-------------------------------------------------------------------------
--write a query that does the following:
--1. lists out number of patients per city in desc order
--2. does not include boston
--3. must have at least 100 paitents from that city
-------------------

select *
from public.patients

select city, count(*) 
from public.patients
group by city


-- count of patient in each city without boston
select city, count(*) 
from public.patients
where city != 'Boston' -- '!' means not equal too
group by city
having count (*) >= 100
order by count(*) desc



--- immunization table but will deal with joins

select *
from public.immunizations

-------------------------------------------
-- 1. having a starting table
-- 2. having a joining table
-- 3. pick the join type
   --- A. left join
   --- B. Inner Join
   --- C. Right Join
   --- D. Full outer Join
-- 4. Specify what you want to join
-- 5. Provide ALiases
-------------------------------------------------------------------------------------------------------------------------------


select t1.*,
       t2.first,
	   t2.last,
	   t2.birthdate
from public.immunizations as t1
left join public.patients as t2
on t1.patient = t2.id

-- OR

select pat.id,
	   pat.first,
	   pat.last,
	   imm.description 
from patients as pat
left join immunizations as imm -- included values that didn't match
on pat.id = imm.patient
--and pat.first = 'Adelina' -- only to include adelina
	   
-- inner join, only rows that match will kept while the others will be excluded

select distinct on (description) ---including start and end of a virus or bacteria
       patient,
       start,
	   stop,
	   description
from public.conditions
-- where stop is not Null; to only include durations
	   