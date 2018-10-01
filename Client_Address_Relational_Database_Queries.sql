create database userAddress
use userAddress


/*Create the user records*/
create table rootOperDefn ( 
networkid varchar(15),
username varchar(50),
emailid varchar(20),
primary key(networkid, emailid)
); 
/*Drop down kind HOME, PERS, OTH, OTH2, MAIL*/
create table rootUserAddresses(
networkid varchar(15),
addresstype varchar(5), 
address1 varchar(55),
address2 varchar(55),
country varchar(20),
city varchar(20),
state varchar(20),
county varchar(20),
postal varchar(12),
primary key(networkid, addresstype),
foreign key(networkid) references rootOperDefn(networkid)
);

desc rootOperDefn
desc rootUserAddresses

/* Insert into data into the rootOperDefn*/

insert into rootOperDefn (networkid, username, emailid) values( 'kompell', 'Krishna', 'kompell@test.com');
insert into rootOperDefn (networkid, username, emailid) values( 'alejandor', 'Alejndo', 'alejandor@test.com');
insert into rootOperDefn (networkid, username, emailid) values( 'richard', 'Richard', 'richard@test.com');
insert into rootOperDefn (networkid, username, emailid) values( 'dave', 'Dave', 'dave@test.com');

/*Queries to fetch data from the tabels*/
