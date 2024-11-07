delimiter $$
create function calcular_potencia_loop(base int, expo int)
returns int deterministic
begin
    declare resultado int default 1;
    declare cont int default 1;

    loop_prueba: loop
        if cont > expo then
            leave loop_label;
        end if;

        set resultado = resultado * base;
        set cont = cont + 1;
    end loop loop_prueba;

    return resultado;
end$$
delimiter ;