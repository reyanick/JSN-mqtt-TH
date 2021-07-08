import paho.mqtt.client as mqtt
import mysql.connector as sql

mydb = sql.connect(
    host="localhost",  #seting database
    user="root",
    password="",
    database="temphum"
)

mycursor = mydb.cursor()
sqltemp= (
    "INSERT INTO temp"
    "(temperature)" 
    "VALUES ('%s')")


def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+ str(rc))
    client.subscribe([("Humidity",0),("Temperature",0)])


def on_message_Temp(client,userdata,message):
    Temp = message.payload.decode('utf-8')
    print("Temperature : "+Temp)
    sqltemp= (
    "INSERT INTO temp"
    "(temperature)" 
    "VALUES ("+str(Temp)+")")
    mycursor.execute(sqltemp)
    mydb.commit()

def on_message_Humi(client,userdata,message):
    humi = message.payload.decode('utf-8')
    print("Humidity : "+humi)
    sqlhumi= (
    "INSERT INTO humi"
    "(humidity)" 
    "VALUES ("+str(humi)+")")
    mycursor.execute(sqlhumi)
    mydb.commit()

client= mqtt.Client()

client.on_connect = on_connect
client.message_callback_add("Temperature",on_message_Temp)
client.message_callback_add("Humidity",on_message_Humi)
client.connect("192.168.0.8",1883,60)  #seting broker
client.loop_forever()