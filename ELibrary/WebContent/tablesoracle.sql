
 
   CREATE TABLE  e_book
   (	callno VARCHAR(40), 
	name VARCHAR(40), 
	author VARCHAR(40), 
	publisher VARCHAR(40), 
	quantity INT, 
	issued INT, 
	PRIMARY KEY (callno)
   );
/
CREATE TABLE  e_librarian
   (	id INT AUTO_INCREMENT,  
	name VARCHAR(40), 
	password VARCHAR(40), 
	email VARCHAR(40), 
	mobile VARCHAR(10), 
	PRIMARY KEY (id)
   );
/
Note: ID must be generated through sequence in E_LIBRARIAN table.

CREATE TABLE  e_issuebook
   (	callno VARCHAR(40) NOT NULL , 
	stundentid VARCHAR(40) NOT NULL , 
	studentname VARCHAR(40), 
	syudentmobile INT, 
	issueddate DATE, 
	returnstatus VARCHAR(40)
   );
/


