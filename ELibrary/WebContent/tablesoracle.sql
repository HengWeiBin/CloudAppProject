
 
   CREATE TABLE  e_book
   (	callno VARCHAR(40), 
	name VARCHAR(40), 
	author VARCHAR(40), 
	publisher VARCHAR(40), 
	quantity INT, 
	issued INT, 
	PRIMARY KEY (callno)
   );

CREATE TABLE  e_librarian
   (	id INT AUTO_INCREMENT,  
	name VARCHAR(40), 
	password VARCHAR(40), 
	email VARCHAR(40), 
	mobile VARCHAR(10), 
	PRIMARY KEY (id)
   );

#Note: ID must be generated through sequence in E_LIBRARIAN table.

CREATE TABLE  e_issuebook
   (	callno VARCHAR(40) NOT NULL , 
	studentid VARCHAR(40) NOT NULL , 
	studentname VARCHAR(40), 
	studentmobile INT, 
	issueddate DATE, 
	returnstatus VARCHAR(40)
   );

insert into e_book values(	"A-5",	"C programming",	"Oliver",	"Apple",	7,	0);
insert into e_book values(	"D-2",	"Database",	"Jack",	"Microsoft",	10,	0);
insert into e_book values(	"C-13",	"Networks",	"Harry",	"Saudi",	3,	0);
insert into e_book values(	"D-10",	"Project-I",	"Jacob",	"Amazon",	6,	0);
insert into e_book values(	"A-16",	"Calculas",	"Charlie",	"Alphabet",	21,	0);
insert into e_book values(	"C-11",	"Physics",	"Thomas",	"Facebook",	19,	0);
insert into e_book values(	"B-7",	"Electronics-I",	"George",	"Tecent",	9,	0);
insert into e_book values(	"D-9",	"Linear Algebra",	"Oscar",	"Bershire",	16,	0);
insert into e_book values(	"B-15",	"Electromagnetics",	"James",	"Tesla",	14,	0);
insert into e_book values(	"C-14",	"Logic Design",	"Wiliam",	"Alibaba",	15,	0);
insert into e_book values(	"A-7",	"Data structure",	"Jake",	"TSMC",	10,	0);
insert into e_book values(	"B-9",	"English",	"Connor",	"Samsung",	5,	0);
insert into e_book values(	"D-16",	"Mechanical",	"Callum",	"JPMorgan",	7,	0);
insert into e_book values(	"C-1",	"Management",	"Joe",	"Incorporation",	13,	0);
insert into e_book values(	"B-3",	"Financial",	"Reece",	"NVIDIA",	22,	0);
insert into e_book values(	"A-22",	"Business ethics",	"Rhys",	"Johnson",	13,	0);
insert into e_book values(	"B-18",	"Seminar",	"Damian",	"Kweichow",	2,	0);
insert into e_book values(	"D-1",	"Automation tech",	"Noah",	"LVMH",	1,	0);
insert into e_book values(	"E-14",	"Thesis",	"Liam",	"Walmart",	9,	0);
insert into e_book values(	"A-19",	"Probability",	"Mason",	"UnitedHealth",	8,	0);
insert into e_book values(	"E-10",	"Power system",	"Ethan",	"Mastercard",	18,	0);
insert into e_book values(	"C-9",	"Control system",	"Michael",	"Nestle",	14,	0);
insert into e_book values(	"A-4",	"Fuzzy control",	"Alex",	"Home Depot Inc",	12,	0);
insert into e_book values(	"D-14",	"Detection",	"John",	"Procter",	2,	0);
insert into e_book values(	"B-10",	"Eletromagnetic Waves",	"Robert",	"Roche Holding",	6,	0);
insert into e_book values(	"E-20",	"VLSI Design",	"Richard",	"Paypal",	9,	0);

