
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
    num=int(input("Ingres su numero: "))
    resultado=""
    for n in range(2, num):
        if num % n == 0:
            resultado="Compuesto"
            print("Es compuesto")
            cursor= conexion.cursor()
            cursor.execute("INSERT INTO problema_4 VALUES(%s,%s);",(num,resultado))
            conexion.commit()
            cursor.close()
            return resultado
            
    else:
    
        print("Es primo")
        resultado="Primo"
    
    cursor= conexion.cursor()
    cursor.execute("INSERT INTO problema_4 VALUES(%s,%s);",(num,resultado))
    conexion.commit()
    cursor.close()
            

    

def verdata():
    print("--------------Selecciono Ver Datos--------------- \n")
    cursor= conexion.cursor()
    SQL = "SELECT*FROM problema_4;"
    cursor.execute(SQL)
    valores=cursor.fetchall()
    print(valores)
    cursor.close()


while menu!=3:
    if menu==1:
        dato=ingreso()
    elif menu==2:
        verdata()
     
    else:
        print("Opcion Invalida")
    
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Nuevo Ingreso \n 2- Motrar historial \n 3- Salir \n"))

conexion.close()

