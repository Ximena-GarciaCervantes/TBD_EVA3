delimiter $$
create procedure dooms_day()
begin
	declare emp_id int;
    declare h_d date;
    declare j_i varchar(10);
    declare dep_id int;
    declare salir int default false;
    declare datos_emp cursor for 
    select employee_id, hire_date, job_id, department_id from employees;
    declare continue handler for not found set salir = true;
    
    open datos_emp;
    empleados: loop
		fetch datos_emp into emp_id, h_d, j_i, dep_id;
        if salir then
			leave empleados;
		end if;
        insert into  job_history(EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
        value (emp_id, h_d, curdate(), j_i, dep_id);
    end loop;
end$$
delimiter ;