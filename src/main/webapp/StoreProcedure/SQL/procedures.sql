Delimiter $$
CREATE PROCEDURE raul_getAllGuests()
begin 
	SELECT * FROM heroku_e64aed2083389e0.raul_myguests;
end$$

Delimiter $$
CREATE PROCEDURE raul_getOneGuests(IN idselect int)
begin 
	SELECT * FROM heroku_e64aed2083389e0.raul_myguests where id=idselect;
end$$

Delimiter $$
CREATE PROCEDURE raul_updateGuests(IN idupdate int, IN first_name varchar(255), IN  last_name varchar(255),IN emailupdate varchar(255))
begin 
	update raul_myguests 
    set firstname=first_name,
    lastname=last_name,
    email= emailupdate
    where id=idupdate;
end$$

Delimiter $$
CREATE PROCEDURE raul_deleteGuests(IN iddelete int)
begin 
	delete from raul_myguests 
    where id=iddelete;
end$$

Delimiter $$
CREATE PROCEDURE raul_addGuests(IN first_name varchar(255), IN  last_name varchar(255),IN emailadd varchar(255))
begin 
	Insert into raul_myguests (firstname,lastname,email)
    values (first_name,last_name,emailadd);
end$$

call raul_getAllGuests();
call raul_getOneGuests(4);
call raul_updateGuests(4,"pepe","papa","pepepapa@gmail.com");
call raul_deleteGuests(4);
call raul_addGuests("pepe","papa","pepepapa@gmail.com");



