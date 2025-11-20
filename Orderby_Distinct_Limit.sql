## ORDER BY
 select * from personal order by name;
 
 select * from personal order by name asc;
 
  select * from personal order by name desc;
  
select * from personal order by age;

select * from personal order by city;

select * from personal order by name, city;

 select * from personal where city="agara" order by name desc;
 
 ## DISTINCT
 select distinct city from personal;
 
 select distinct age from personal;
 
 select distinct age from personal order by age;
 
 select distinct city from personal order by city;
 
 ## LIMIT 
select * from personal;

select * from personal limit 3;

select * from personal limit 4;

select * from personal where city = "agara";

select * from personal where city = "agara" limit 2;