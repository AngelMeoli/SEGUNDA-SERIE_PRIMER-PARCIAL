import random
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
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Jugar \n 2- Motrar historial \n 3- Salir \n"))

except ValueError:
    print("Tipo de dato no valido!!")
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Jugar \n 2- Motrar historial \n 3- Salir \n"))


def jugar():

    dado1 = random.randint(1, 8)
    dado2 = random.randint(1, 8)
    total=dado1+dado2
    if total==8:
        jugador="Ganas"
        print("Resultado: ", total, jugador)
    elif total==7:
        jugador="Pierdes"
        print("Resultado: ", total, jugador)

    else:
        jugador="Sigue lanzando"
        print("Resultado: ", total, jugador)

    cursor= conexion.cursor()
    cursor.execute("INSERT INTO problema_1 VALUES(%s,%s,%s,%s);",(dado1,dado2,total,jugador))
    conexion.commit()
    cursor.close()

def verdata():
    print("--------------Selecciono Ver Datos--------------- \n")
    cursor= conexion.cursor()
    SQL = "SELECT*FROM problema_1;"
    cursor.execute(SQL)
    valores=cursor.fetchall()
    print(valores)
    cursor.close()

while menu!=3:
    if menu==1:
        jugar()
    
    elif menu==2:
        verdata()
     
    else:
        print("Opcion Invalida")
    
    menu=int(input("----BIENVENDO SELECCIONE UNA OPCION---- \n 1- Jugar \n 2- Motrar historial \n 3- Salir \n"))

conexion.close()






