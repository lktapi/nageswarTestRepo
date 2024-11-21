CREATE OR REPLACE PROCEDURE  FIRST_SECOND_TABLE_TO_THIRD_TABLE
AS 
BEGIN

  -- Inserting date from two tables to one table table name is TempFIRST_SECOND_TABLE_DATA (new temp table)
  select * INTO #TempFIRST_SECOND_TABLE_DATA from First_table ft inner join Second_table st on (ft.personnum = st.personnum)
  
  -- looping distinct employee IDS 
  DECLARE 
  C_EMPLOYEEID TempFIRST_SECOND_DATE.EMPLOYEEID%type;
  CURSOR distinctEmployees is 
      SELECT distinct EMployeeID FROM TempFIRST_SECOND_TABLE_DATA
  BEGIN  
   OPEN distinctEmployees;
   LOOP
	 FETCH distinct Employees into C_EMPLOYEEID;  
     EXIT WHEN distinctEmployees%notfound; 
   
			---- write your own logic here to fetch the records from temple table 
			--- finally drop the table 
			
			
			
			
   END LOOP;
   END
END;
