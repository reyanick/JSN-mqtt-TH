#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <DHT.h>

#define pinDHT D2
#define DHTType DHT11

DHT dht(pinDHT,DHTType);

char ssid[] = "REYA"; //isi ssid
char password[] = "03052000";//isi passwd


WiFiClient espClient;
PubSubClient client(espClient);

unsigned long currentTime = millis();
unsigned long previousTime = 0;
const long delayTime = 2000;

void setup(){
  Serial.begin(115200);
  dht.begin();
  delay(100);
  
  Serial.println();
  Serial.print("Connecting to :");
  Serial.println(ssid);
  WiFi.begin(ssid,password);
  while(WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address:");
  Serial.println(WiFi.localIP());

  client.setServer("192.168.0.8", 1883); //isi localhost komputer
  delay(200);
}

void loop(){
  if(!client.connected()){
    reconnect();
  }
  client.loop();

  currentTime = millis();
  if (currentTime - previousTime >= delayTime){
    currentTime = millis();
    previousTime = currentTime;
    String strTemp = String(dht.readTemperature());
    String strHumi = String(dht.readHumidity());
    char chrTemp[strTemp.length()+1];
    char chrHumi[strHumi.length()+1];
    strTemp.toCharArray(chrTemp,sizeof(chrTemp));
    strHumi.toCharArray(chrHumi,sizeof(chrHumi));
    Serial.print("Temprature: ");
    Serial.println(strTemp);
    Serial.print("Humidity: ");
    Serial.println(strHumi);
    client.publish("Temperature",chrTemp);
    client.publish("Humidity",chrHumi);
  }
  delay(250);
}

void reconnect(){
  while(!client.connected()){
    Serial.println("Trying To connect MQTT Broker");
    if(client.connect("NodeMCU")){
      Serial.println("Connected");
    } else {
      Serial.println(client.connect("NodeMCU"));
      Serial.print("Failed , Connection state = ");
      Serial.println(client.state());
      delay(5000);
    }
  }
}
