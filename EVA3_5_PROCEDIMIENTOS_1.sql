delimiter $$
create function contar_empleados()
returns int READS SQL DATA
begin
	declare cont int;
    select count(*) into cont from employees;
    return cont;
end$$
delimiter ;