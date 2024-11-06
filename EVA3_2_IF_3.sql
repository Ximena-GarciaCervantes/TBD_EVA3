delimiter $$
create function dia_semana(numero int)
returns varchar(10) deterministic
begin
	declare resu varchar(10);
    case numero
		when 1 then set resu = "Domingo";
        when 2 then set resu = "Lunes";
        when 3 then set resu = "Martes";
        when 4 then set resu = "Miercoles";
        when 5 then set resu = "Jueves";
        when 6 then set resu = "Viernes";
        when 7 then set resu = "Sabado";
        else
			set resu = "NO VALIDO";
		end case;
        return resu;
	end $$
    delimiter ;