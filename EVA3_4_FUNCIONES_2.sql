delimiter $$
create function generar_correo(nombre varchar(50), apellido varchar(50), puesto varchar(50))
returns varchar(70) deterministic
	begin 
		declare correo varchar(70);
        declare inicial varchar(1);
        
        set inicial = substring(nombre, 1, 1);
        set correo = CONCAT (inicial, ".", apellido, "@", puesto, ".com");
        
        return correo;
	end$$
delimiter ;