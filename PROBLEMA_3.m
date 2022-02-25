#Conexión Octave con PostgreSQL PROMBLEMA 3
pkg load database;
pkg load signal;



menu=input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n")

function ingreso()
        conn = pq_connect (setdbopts ('dbname','redes','host','localhost','port','5432','user','postgres','password','angel'));
        precio=input("Ingrese el precio en quetzales: ")
        iva=precio*0.12

        nuevo=precio-iva
        pq_exec_params(conn, "insert into problema_3 VALUES('450','142','300');");


endfunction

while (menu!=3)
  if(menu==1)
   ingreso();
   elseif(menu==2)
  conn = pq_connect (setdbopts ('dbname','redes','host','localhost','port','5432','user','postgres','password','angel'));
    pq_exec_params(conn, "select * from problema_3;")
   else
    print("Opcion Invalida")
    
    
  endif
 menu=input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n")
endwhile

pq_close (conn);