/* 
			Test programs from SAS certification prep guide
							Chapter 4
					Creating SAS data sets
*/

filename exercise "/folders/myfolders/cert/exercise.xlsx";

proc import datafile= exercise
			dbms= xlsx
            out= work.exercise_out
            replace;
            sheet=activitylevels;
            getnames= yes;
run;
/*--------------------------------------------------------------- 
guessingrows=30;
mixed=yes;
           The GUESSINGROWS statement applies to text/delimited 
           files only, not Excel.
		   If using DBMS=EXCEL or EXCELCS, you can try the 
		   Mixed=Yes option. 
		   Mixed=YES will examine columns that contain both text 
		   and numbers and set them to character type.
-----------------------------------------------------------------*/
		  
proc print data= exercise_out;
run;


proc contents data=work.exercise_out;
run;

filename d_path "/folders/myfolders/cert/delimiter.txt";

options obs=3;/* reads only forst 3 observations*/

proc import datafile= d_path
   			dbms= dlm
   			out= work.delimiter_out
   			replace;
   			delimiter= '&';
			getnames= yes;
run;

proc print data=work.delimiter_out;
run;
		
data exercise_male (drop= sex);
			set work.exercise_out (drop= height);
			/*where sex = 'M';*/
			if _n_=3 then output;
run;

/*
1. a
2. b1
3. a
4. d
5. d
6. b
7. c1
8. d
9. b
*/






