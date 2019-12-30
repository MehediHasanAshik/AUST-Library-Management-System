SET SERVEROUTPUT ON;

DECLARE
	card NUMBER(3);
	type namesarray IS VARRAY(6) OF VARCHAR2(100);
	colName namesarray;
	total integer;
	colSize integer;
	disVal integer :=0;
	totalSize integer := 0;

BEGIN

	SELECT count(*) into card FROM student1;
	dbms_output.put_line('----------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Cardinality of student1 fragment: ' || card);
	dbms_output.put_line('----------------------------------------------');
	
	colName := namesarray('s_id','name','department','email','password','city');
	total := colName.count;
	dbms_output.put_line('---DISTINCT NO OF ROWS IN EVERY ATTRIBUTE---');
	

	  SELECT count(DISTINCT s_id) into disVal from student1;
      dbms_output.put_line('Val[' || colName(1)|| ']' || ' = ' || disVal);
	  SELECT count(DISTINCT name) into disVal from student1;
      dbms_output.put_line('Val[' || colName(2) || ']' || ' = ' || disVal);
	  SELECT count(DISTINCT department) into disVal from student1;
      dbms_output.put_line('Val[' || colName(3) || ']' || ' = ' || disVal);
	  SELECT count(DISTINCT email) into disVal from student1;
      dbms_output.put_line('Val[' || colName(4) || ']' || ' = ' || disVal);
	  SELECT count(DISTINCT password) into disVal from student1;
      dbms_output.put_line('Val[' || colName(5) || ']' || ' = ' || disVal);
	  SELECT count(DISTINCT city) into disVal from student1;
      dbms_output.put_line('Val[' || colName(6) || ']' || ' = ' || disVal);
	
	dbms_output.put_line('----------------------------------------------');
	dbms_output.put_line('---MAX SIZE OF ROW FOR EVERY ATTRIBUTE---');
	
	FOR i in 1 .. total LOOP
	  SELECT max(lengthb(colName(i))) into colSize from student1;
	  
	  totalSize := totalSize + colSize;
	  
      dbms_output.put_line('Column[' || colName(i)|| ']' || ' = ' || colSize); 
    END LOOP; 
	
	dbms_output.put_line('----------------------------------------------'); 
	dbms_output.put_line('SUM OF SIZE OF ALL ATTRIBUTES : ' || totalSize); 
	dbms_output.put_line('----------------------------------------------');
 
END;
/

SELECT * FROM student1;
