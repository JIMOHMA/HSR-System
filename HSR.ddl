-- connecting to database;
connect to cs3db3;

--++++++++++++++++++++++++++++++++++++++++++++++
-- CREATE TABLES PERSON, PHONE NUMBER, PASSENGER, BUS DRIVER,
--++++++++++++++++++++++++++++++++++++++++++++++

------------------------------------------------
--  DDL Statements for table Person 1)
------------------------------------------------
create table Person(
	ID integer not null,
	firstName varchar(10),
	lastName varchar(10),
	gender varchar(10),
	dateOfBirth integer,
	streetAddress varchar(10),
	city varchar(10),
	province varchar(10),
	occupation varchar(10),
	primary key (ID)
);


------------------------------------------------
--  DDL Statements for table Phone#  2
------------------------------------------------
create table Phone#(
	ID integer not null,
	cell integer not null,
	home_Number integer,
	work_Number integer,
	primary key (ID),
	foreign key (ID) references Person (ID)
);


------------------------------------------------
--  DDL Statements for table Passenger 3)
------------------------------------------------
create table Passenger(
	ID integer not null,
	type varchar(10),
	primary key (ID),
	foreign key (ID) references Person (ID)
);


------------------------------------------------
--  DDL Statements for Bus Driver 4
------------------------------------------------
create table Bus_Driver(
	ID integer not null,
	salary integer,
	years_of_experience integer,
	primary key (ID),
	foreign key (ID) references Person (ID)
	
);

------------------------------------------------
--  DDL Statements for Maintenance Personnel 5
------------------------------------------------
create table Maintenance_Personnel(
	ID integer not null,
	salary integer,
	area_of_specialization varchar(10),
	years_of_service integer,
	level integer,
	primary key (ID),
	foreign key (ID) references Person (ID)
);

------------------------------------------------
--  DDL Statements for Route  6
------------------------------------------------
create table Route(
	route_ID integer not null,
	route_Name varchar(10),
	primary key (route_ID)	
);


------------------------------------------------
--  DDL Statements for Bus 7
------------------------------------------------
create table Bus(
	busID integer not null,
	route_ID integer  not null,
	yrs_of_operation integer,
	fuel_type varchar(10),
	number_of_sits integer,
	advertising_revenue varchar(10),
	manufacturer varchar(10),
	primary key (busID),
	foreign key (route_ID) references Route (route_ID) on delete cascade
);


------------------------------------------------
--  DDL Statements for Infractions 8
------------------------------------------------
create table Infractions(
	ID integer not null,
	date integer,
	type_of_infraction varchar(10),
	demerits_point integer,
	financial_penalty integer,
	primary key (ID),
	foreign key (ID) references Bus_Driver (ID) on delete cascade
);


------------------------------------------------
--  DDL Statements for Drives  9
------------------------------------------------
create table Drives(
	busID integer not null,
	ID integer not null,
	date integer,
	primary key (ID, busID),
	foreign key (ID) references Bus_Driver (ID) ,
	foreign key (busID) references Bus (busID)
);


------------------------------------------------
--  DDL Statements for table Rides  10
------------------------------------------------
create table Rides(
	ID integer not null,
	busID integer not null,
	fare integer not null,
	primary key (ID, busID, fare),
	foreign key (ID) references Passenger (ID),
	foreign key (busID) references Bus (busID)	
);


------------------------------------------------
--  DDL Statements for Fix   11
------------------------------------------------
create table Fix(
	ID integer not null,
	busID integer not null,
	date integer,
	primary key (ID, busID),
	foreign key (ID) references Maintenance_Personnel (ID),
	foreign key (busID) references Bus (busID)
);



------------------------------------------------
--  DDL Statements for Sites  12
------------------------------------------------
create table Sites(
	site_Name varchar(10) not null,
	category varchar(10),
	address varchar(10),
	capacity varchar(10),
	phone_number integer,
	primary key (site_Name)
	
);

------------------------------------------------
--  DDL Statements for Stops  13
------------------------------------------------
create table Stops(
	stop_ID integer not null,
	stop_Name varchar(10),
	primary key (stop_ID)
	
);


------------------------------------------------
--  DDL Statements for isOn for route and site relationship  14
------------------------------------------------
create table isOn(
	route_ID integer not null,
	site_Name varchar(10) not null,
	primary key (route_ID, site_Name),
	foreign key (route_ID) references Route (route_ID),
	foreign key (site_Name) references Sites (site_Name)
);


------------------------------------------------
--  DDL Statements for Serves 15
------------------------------------------------
create table Serves(
	stop_ID integer not null,
	route_ID integer not null,
	primary key (stop_ID, route_ID),
	foreign key (stop_ID) references Stops (stop_ID),
	foreign key (route_ID) references Route (route_ID)
);


------------------------------------------------
--  DDL Statements for table Schedule 16
------------------------------------------------
create table Schedule(
	arrival_Time integer,
	route_ID integer not null,
	stop_ID integer not null,
	primary key (route_ID, stop_ID),
	foreign key (route_ID) references Route (route_ID),
	foreign key (stop_ID) references Stops (stop_ID)
);

------------------------------------------------
--  DDL Statements for table Belongs  17
------------------------------------------------
create table Belongs(
	stop_ID integer not null,
	site_Name varchar(10) not null,
	primary key (stop_ID, site_Name),
	foreign key (stop_ID) references Stops (stop_ID),
	foreign key (site_Name) references Sites (site_Name)
);

------------------------------------------------
--  DDL Statements for table Events  18
------------------------------------------------
create table Events(
	event_Name varchar(10) not null,
	site_Name varchar(10) not null,
	number_of_participant integer,
	date integer,
	time integer,
	primary key (event_Name),
	foreign key (site_Name) references Sites (site_Name)
);

------------------------------------------------
-- List all tables your created
------------------------------------------------
list tables;
