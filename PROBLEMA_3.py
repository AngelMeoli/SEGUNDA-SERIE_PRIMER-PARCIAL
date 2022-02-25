"""Realice un programa que ingrese un precio en quetzales, e indique cuanto de esa totalidad es IVA y 
cuanto es el precio sin IVA. (Recuerda que el IVA en Guatemala es del 12%) """

import psycopg2

try:
    conexion=psycopg2.connect(
        host ="localhost",
        port = "5432",
        user = "postgres",
        password = "angel",
        dbname = "redes"
    )
    print("CONEXION EXITOSA")
except psycopg2.Error as e:
    print("HUBOUN ERROR EN LA CONEXION")

try:
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n"))

except ValueError:
    print("Tipo de dato no valido!!")
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n"))

def ingreso():
    try:
        precio=int(input("Ingrese el precio en quetzales: "))
        iva=precio*0.12

        nuevo=precio-iva

        print("El precio sin iva es: ",str(nuevo),"El iva es: ", str(iva))

        cursor= conexion.cursor()
        cursor.execute("INSERT INTO problema_3 VALUES(%s,%s,%s);",(precio,iva,nuevo))
        conexion.commit()
        cursor.close()


    except ValueError:
        print("Tipo de dato no valido!!")
    



def verdata():
    print("--------------Selecciono Ver Datos--------------- \n")
    cursor= conexion.cursor()
    SQL = "SELECT*FROM problema_3;"
    cursor.execute(SQL)
    valores=cursor.fetchall()
    print(valores)
    cursor.close()


while menu!=3:
    if menu==1:
        ingreso()
    
    elif menu==2:
        verdata()
     
    else:
        print("Opcion Invalida")
    
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n"))

conexion.close()
