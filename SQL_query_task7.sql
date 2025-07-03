create view v1 as select eid,FIRST_NAME,salary from employee ;

select * from v1 order by eid ; 

delete from v1 where eid=7 ;

-- to disable insertion 
create or replace trigger insert_violate
INSTEAD of insert on v1
BEGIN
    Raise_Application_error(-20001,'insert operation not allowed.');
    end;

create view v2 as select e.eid Employee_id,e.first_name,e.contact,e.SALARY,d.dname Department from employee e,DEPARTMENT d where e.did=d.did and d.did in('D01','D02') ;

select * from v2 where department='finance' ; 

update  v2 set department='hr' where department='HR' ; 

delete from v2 where EMPLOYEE_ID=3 ;

-- to disable updation in view 
create or replace trigger update_violate
Instead of update on v2
begin 
    Raise_application_error(-20002,'update operation not allowed.');
    end;

-- to disable deletion in view 
create or replace trigger delete_violate
Instead of delete on v2
begin 
    Raise_application_error(-20003,'delete operation not allowed.');
    end;

	
