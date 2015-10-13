int lightPin = 4;

void setup() {
  pinMode(lightPin, INPUT);
  Serial.begin(9600);
}

void loop() {
 //brightness = map(lightPin, 0,MAX, 0,1);
 
  if(digitalRead(lightPin)==HIGH){
  Serial.write(1);
}
  else{
  Serial.write(0);
}
  delay(100);

Serial.println(digitalRead(lightPin));
}
