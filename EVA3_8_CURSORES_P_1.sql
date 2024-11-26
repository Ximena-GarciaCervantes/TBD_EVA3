delimiter $$

create function generar_rfc(nombre varchar(50), apellido_pat varchar(50), apellido_mat varchar(50), fecha_nac date)
returns varchar(13)
deterministic
begin
    declare rfc varchar(13);
    
    set apellido_pat = upper(apellido_pat);
    set apellido_mat = upper(coalesce(apellido_mat, 'X'));
    set nombre = upper(nombre);

    set rfc = concat(
        substring(apellido_pat, 1, 2),
        substring(apellido_mat, 1, 1),
        substring(nombre, 1, 1),
        date_format(fecha_nac, '%y%m%d')
    );

    return rfc;
end$$

delimiter ;
