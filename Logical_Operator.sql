## Logical Operators(AND,OR,NOT)
Select * from personal where age>=18 and age<=20;
Select * from personal where age>=18 or age<=20;
Select * from personal where age<=20 and gender="M";
Select * from personal where age<=20 and gender="M" 
and city="Agra";
Select * from personal where age<=20 or city="Agra";
Select * from personal where city="Bhopal" or city="Agra";
Select * from personal where city="Bhopal" and city="Agra";
Select * from personal where (city="Bhopal" or city="Agra")
 and gender="M";
 Select * from personal where not age>=20;
 Select * from personal where not(city="Bhopal" or city="Agra");