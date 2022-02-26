

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

    datos=[]

    cal1=int(input("Ingrese la calificacion 1 (0-100): "))
    datos.append(cal1)
    cal2=int(input("Ingrese la calificacion 1 (0-100): "))
    datos.append(cal2)
    cal3=int(input("Ingrese la calificacion 1 (0-100): "))
    datos.append(cal3)
    cal4=int(input("Ingrese la calificacion 1 (0-100): "))
    datos.append(cal4)
    cal5=int(input("Ingrese la calificacion 1 (0-100): "))
    datos.append(cal5)
    
    media=mean(datos) #media
    mediana=median(datos) #mediana
    moda=mode(datos) #moda
    desviacion=stdev(datos) #desviacion
    varianza=pvariance(datos) #varianza

    cursor= conexion.cursor()
    cursor.execute("INSERT INTO problema_2 VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);",(cal1,cal2,cal3,cal4,cal5,media,mediana,moda,desviacion,varianza))
    conexion.commit()
    cursor.close()

def verdata():
    print("--------------Selecciono Ver Datos--------------- \n")
    cursor= conexion.cursor()
    SQL = "SELECT*FROM problema_2;"
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