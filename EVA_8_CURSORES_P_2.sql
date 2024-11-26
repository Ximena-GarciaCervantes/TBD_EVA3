delimiter $$

create procedure actualizar_rfc()
begin
    declare done int default false;
    declare _id int;
    declare _nombre varchar(50);
    declare _apellido_pat varchar(50);
    declare _apellido_mat varchar(50);
    declare _fecha_nac date;
    declare cur cursor for select id, nombre, apellido_pat, apellido_mat, fecha_nac from personas where clave_rfc is null;
    declare continue handler for not found set done = true;

    open cur;

    read_loop: loop
        fetch cur into _id, _nombre, _apellido_pat, _apellido_mat, _fecha_nac;
        if done then
            leave read_loop;
        end if;

        update personas set clave_rfc = generar_rfc(_nombre, _apellido_pat, _apellido_mat, _fecha_nac) WHERE id = _id;
    end loop;

    close cur;
end$$

delimiter ;