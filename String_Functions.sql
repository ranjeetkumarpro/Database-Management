## STRING FUNCTIONS
select id, upper(name), percantage from personal1;

select id, ucase(name), percantage from personal1;

select id, lower(name), percantage from personal1;

select id, name, character_length(name),percantage from personal1;

select id, name, char_length(name),percantage from personal1;

select id, name, length(name),percantage from personal1;

select id, concat(name,age) from personal1;

select id, concat(name,"-" ,percantage) from personal1;

select concat("Ranjeet");

select concat_ws("-","Ranjeet" "Hello","class");

select concat_ws(" ","Ranjeet" "Hello","class");

select trim(      "ranjeet"       );

select position("world" in "helloworld");

select position("o" in "helloworld");

select instr("helloworld","ell");

select locate("ell","helloworld");

select locate("l","helloworld",7);

select locate("l","helloworld",10);

select substring("ranjeet kumar",5);

select substring("ranjeet kumar",3,6);

select substring("ranjeet kumar",6,3);

select mid("ranjeet kumar",-6,3);

 select substring("ranjeet kumar",-6,3);
 
 select substring_index("www.NehaJha.net",".",1);
 
 select substring_index("www.NehaJha.net",".",2);
 
 select substring_index("www.NehaJha.net","e",2);
 
 select strcmp("Neha Jha","Neha");
 
  select strcmp("Neha Jha","Neha Jha");
  
   select strcmp("Neha","Neha Jha");
   
   select format(235.3568,3);
   
   select left("Ruby Jha",3);
   
   select left("Ruby Jha",5);
   
   select right("Ruby Jha",3);
   
select rpad("Ruby Jha",20,"-");
   
select rpad("Ruby Jha",20,"*");
    
select lpad("Ruby Jha",20,"*");
       
select rpad("Ruby Jha",20,"-");
             
select replace("Ranjeet Kumar","Ranjeet","Mr.");
     
select field("A","X","A","K");
     
select field("a","X","A","k");
     
	select field(5,0,1,2,3,4,5);
     
	select field("ram","Ram","mohan","Shyam");
          
select find_in_set("mohan","Ram,mohan,Shyam"); 