 ## IN Operator(in place of multiple or)
 Select * from personal where age=18 or age=20 or age=19 or age=24;
 Select * from personal where age in (18,21);
Select * from personal where  age in (18,21,19);
Select * from personal where  age not in (18,21,19);
Select * from personal where  city in ("Delhi","Bhopal");
Select * from personal where  city not in ("Delhi","Bhopal");
Select * from personal where  id in (1,3,4);

## BETWEEN Operator
Select * from personal where age between 18 and 20;

Select * from personal where age not between 18 and 20;

Select * from personal where id between 2 and 5;

Select * from personal where id  not between 2 and 5;

Select * from personal where name between "a" and "k";