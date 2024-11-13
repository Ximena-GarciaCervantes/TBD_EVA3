delimiter $$
create procedure contar_empleados(out cont int)
	begin
		select count(*) into cont from employees;
    end$$
delimiter ;