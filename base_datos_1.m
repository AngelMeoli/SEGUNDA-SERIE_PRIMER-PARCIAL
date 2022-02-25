#Conexión Octave con PostgreSQL
pkg load database;
pkg load signal;

#pq_exec_params (conn, "create table estudiantes (Nombre varchar(20),Carnet int not null);");


menu=input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n")

function ingreso()
        conn = pq_connect (setdbopts ('dbname','redes','host','localhost','port','5432','user','postgres','password','angel'));
        precio=input("Ingrese el precio en quetzales: ")
        iva=precio*0.12

        nuevo=precio-iva

        #print("El precio sin iva es: ",str(nuevo),"El iva es: ", str(iva))
        pq_exec_params(conn, "insert into problema_3 VALUES(precio,iva,nuevo);");
        #cursor= conexion.cursor()
        #cursor.execute("INSERT INTO problema_3 VALUES(%s,%s,%s);",(precio,iva,nuevo))
        #conexion.commit()
        #cursor.close()

endfunction

while (menu!=3)
  if(menu==1)
   ingreso();
   elseif(menu==2)


   else
    print("Opcion Invalida")
    
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n"))
  endif
 
endwhile

#pq_exec_params(conn, "insert into estudiantes values ('Maria','201000524');");
#pq_exec_params(conn, "insert into estudiantes values ('Alejandra','201711252');");
#pq_exec_params(conn, 'select * from estudiantes;')
pq_close (conn);