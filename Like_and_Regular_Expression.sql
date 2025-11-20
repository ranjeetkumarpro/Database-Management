# LIKE Operator
Select * from personal where name like "s%";

Select * from personal where name like "a%";

Select * from personal where name like "ram%";

Select * from personal where name like "rm%";

Select * from personal where name like "%am%";

Select * from personal where name like "r%" OR name like "s%";

Select * from personal where name not like "r%";

Select * from personal where name like "%r";

Select * from personal where name like "%ar";

Select * from personal where phone like "%21";

Select * from personal where phone not like "%21";

Select * from personal where name like "s%n";

Select * from personal where name like "r%r";

Select * from personal where name like "_am%";

Select * from personal where name like "__m%";

Select * from personal where name like "__l%";

Select * from personal where name like "r_m%";

## REGULAR EXPRESSIONS
select * from personal where name regexp 'ra';

select * from personal where name regexp 'la';

select * from personal where name regexp 'man';

select * from personal where name regexp '^ra';

select * from personal where name regexp '^sa';

select * from personal where name regexp 'an$';

select * from personal where name regexp 'ram|kapoor|khan';

select * from personal where name regexp 'ram|poor|khan';

select * from personal where name regexp '^ram|kapoor|^khan';

select * from personal where name regexp '^ram|kapoor|khan$';

select * from personal where name regexp '[is]';

select * from personal where name regexp '[rm]';

select * from personal where name regexp '[rm]a';

select * from personal where name regexp '[rmh]a';

select * from personal where name regexp '^[rs]';

select * from personal where name regexp 'r[am]';