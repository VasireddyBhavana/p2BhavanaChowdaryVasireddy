import controlP5.*;

ControlP5 cp5;

PFont font;
PFont font1;
PFont font2;
PFont font3;
Knob speedometer;
Knob tachometer;
Knob engineTemp;
Knob fuel;
Textlabel l1;
Textlabel l2;
Textlabel l3;
Textlabel s0;
Textlabel s20;
Textlabel s40;
Textlabel s60;
Textlabel s80;
Textlabel s100;
Textlabel s120;
Textlabel s140;
Textlabel odolabel;
Textlabel odovalue;
Textlabel t1;
Textlabel t2;
Textlabel t3;
Textlabel t4;
Textlabel t5;
Textlabel t6;
Textlabel t7;
Textlabel H;
Textlabel C;
Textlabel F;
Textlabel E;

Toggle cruisecontrol;
Toggle right;
Toggle left;
Toggle emergency;
Toggle warnings;
Toggle mph;
Textlabel rightLabel;
Textlabel leftLabel;
Textlabel emergencyLabel;
Textlabel warningsLabel;
Textlabel cruiseLabel;
Textlabel milesLabel;
Button Brake;
Button Accelerator;
Button off;
boolean cruiseOn = false;
boolean cruiseSet = false;
boolean rightSig = false;
boolean leftSig = false;
boolean sigLightOn = false;
float startTime;
float eTempSpeed = 3000;
float lasttimecheck;
float timeinterval;
int warningChoice = -1;
PImage engTemp;
PImage fuelpump;
PImage doors;
PImage seatbelt;
PImage cruiseControl;
PImage cruiseControlOn;
PImage airbag;
PImage antilock;
PImage battery;
PImage engine;
PImage oil;
PImage security;
PImage tire;
PImage traction;
PImage tractionMal;
PFont f;

void setup(){
  
  size(1000,700);
  background(0);
 
 
  cp5 = new ControlP5(this);
  font = createFont("Arial", 20);
  font1= createFont("Arial",10);
  font3= createFont("Arial",15);
  f= createFont("Arial",5);
  speedometer = (cp5.addKnob("MPH")
                    .setRange(0, 140)
                    .setValue(0)
                    .setPosition(350, 150)
                    .setRadius(155)
                    .setFont(font)
                    .setNumberOfTickMarks(14)
                    .snapToTickMarks(false)
                    .setTickMarkLength(20)
                    .setTickMarkWeight(5))
                    .setColorBackground(color(0))
                    .setColorForeground(color(255))
                    .setColorActive(color(255));
              cp5.getController("MPH")
                 .getCaptionLabel()
                 .setVisible(false); 
  s0 = cp5.addLabel("0")
              .setColorValue(color(255))
              .setPosition(400, 400)
              .setFont(font);
  s20 = cp5.addLabel("20")
                .setColorValue(color(255))
                .setPosition(355, 310)
                .setFont(font);
  s40 = cp5.addLabel("40")
               .setColorValue(color(255))
               .setPosition(375, 220)
               .setFont(font);
  s60 = cp5.addLabel("60")
               .setColorValue(color(255))
               .setPosition(450, 160)
               .setFont(font);
  s80 = cp5.addLabel("80")
                .setColorValue(color(255))
                .setPosition(550, 160)
                .setFont(font);
  s100 = cp5.addLabel("100")
                .setColorValue(color(255))
                .setPosition(600, 210)
                .setFont(font);
  s120 = cp5.addLabel("120")
                .setColorValue(color(255,0,0))
                .setPosition(610, 310)
                .setFont(font);
  s140 = cp5.addLabel("140")
                .setColorValue(color(255,0,0))
                .setPosition(580, 390)
                .setFont(font); 
                rect(440,420,140,70);
   l1=cp5.addLabel("MP/H")
         .setPosition(480,390)
         .setFont(font);
  odolabel=cp5.addLabel("ODOMETER (Miles)")
                .setColorValue(color(255))
                .setPosition(460, 440)
                .setFont(font1); 
                
  odovalue=cp5.addLabel("141229")
                .setColorValue(color(255))
                .setPosition(470, 460)
                .setFont(font); 
  tachometer = (cp5.addKnob("tach")
                    .setRange(0, 7)
                    .setValue(0)
                    .setPosition(100, 250)
                    .setRadius(80)
                    .setFont(font)
                    .setNumberOfTickMarks(7)
                    .snapToTickMarks(false)
                    .setTickMarkLength(20)
                    .setTickMarkWeight(5))
                    .setColorBackground(color(0))
                    .setColorForeground(color(255))
                    .setColorActive(color(255));
  cp5.getController("tach").getCaptionLabel().setVisible(false);
  cp5.getController("tach").getValueLabel().setVisible(false);

  t1 = cp5.addLabel(" ")
             .setPosition(130, 370)
             .setFont(font)
             .setColorValue(color(255));
  t2 = cp5.addLabel("1")
             .setPosition(110, 330)
             .setFont(font)
             .setColorValue(color(255));
  t3 = cp5.addLabel("2")
             .setPosition(120, 290)
             .setFont(font)
             .setColorValue(color(255));
  t4 = cp5.addLabel("3")
             .setPosition(150, 260)
             .setFont(font)
             .setColorValue(color(255));
  t5 = cp5.addLabel("4")
             .setPosition(200, 260)
             .setFont(font)
             .setColorValue(color(255));
  t6 = cp5.addLabel("5")
              .setPosition(230, 280)
              .setFont(font)
              .setColorValue(color(255));
  t7 = cp5.addLabel("6")
              .setPosition(240, 330)
              .setFont(font)
              .setColorValue(color(255, 0, 0));
  t7 = cp5.addLabel("7")
            .setPosition(220, 370)
            .setFont(font)
            .setColorValue(color(255, 0, 0));
            
     l2=cp5.addLabel("X 1000")
           .setPosition(160,315)
           .setFont(font);
      l3=cp5.addLabel("RPM")
           .setPosition(160,390)
           .setFont(font);
           
   airbag = loadImage("airbag.jpg");
   antilock = loadImage("antiLock.jpg");
   battery = loadImage("battery.jpg");
   cruiseControl = loadImage("cruiseControl.jpg");
   cruiseControlOn = loadImage("cruiseControlOn.jpg");
   doors = loadImage("openDoor.jpg");
   engTemp=loadImage("engineTemp.jpg");
   engine = loadImage("engine.jpg");
   fuelpump= loadImage("fuelPump.jpg");
   oil = loadImage("oil.jpg");
   seatbelt = loadImage("seatbelt.jpg");
   security = loadImage("security.jpg");
   tire = loadImage("tire.jpg");
   traction = loadImage("traction.jpg");
   tractionMal = loadImage("tractionMal.jpg");
            
  engineTemp = (cp5.addKnob("engineTemp")
                    .setRange(60, 120)
                    .setValue(0)
                    .setPosition(750, 250)
                    .setRadius(80)
                    .setFont(font)
                    .setNumberOfTickMarks(5)
                    .snapToTickMarks(false)
                    .setTickMarkLength(15)
                    .setTickMarkWeight(6)
                    .setStartAngle(PI/2)
                    .setAngleRange(PI))
                    .setColorBackground(color(0))
                    .setColorForeground(color(255))
                    .setColorActive(color(255));
  cp5.getController("engineTemp").getCaptionLabel().setVisible(false);
  cp5.getController("engineTemp").getValueLabel().setVisible(false);
  
   H = cp5.addLabel("H")
            .setPosition(830, 235)
            .setFont(font)
            .setColorValue(color(255, 0, 0));
    C = cp5.addLabel("C")
            .setPosition(830, 400)
            .setFont(font)
            .setColorValue(color(255));
  fuel= (cp5.addKnob("gauge")
            .setRange(0, 100)
            .setValue(100)
            .setPosition(800, 250)
            .setRadius(80)
            .setFont(font)
            .setNumberOfTickMarks(4)
            .snapToTickMarks(false)
            .setTickMarkLength(15)
            .setTickMarkWeight(6)
            .setStartAngle(PI*3/2)
            .setAngleRange(PI))
            .setColorBackground(color(0))
            .setColorForeground(color(255))
            .setColorActive(color(255));
  cp5.getController("gauge").getCaptionLabel().setVisible(false);
  cp5.getController("gauge").getValueLabel().setVisible(false);
   F = cp5.addLabel("F")
            .setPosition(855, 390)
            .setFont(font)
            .setColorValue(color(255));
     E = cp5.addLabel("E")
            .setPosition(855, 255)
            .setFont(font)
            .setColorValue(color(255, 0, 0));
          
  Accelerator = (cp5.addButton("Accelerate")
                    .setSize(120, 60)
                    .setPosition(10, 540)
                    .setFont(font1))
                    .setColorBackground(color(#688698))
                    .setColorForeground(color(150))
                    .setColorActive(color(78, 173, 220));
  Brake = (cp5.addButton("Brake")
              .setSize(120, 60)
              .setPosition(150, 540)
              .setFont(font1))
              .setColorBackground(color(#688698))
              .setColorForeground(color(150))
              .setColorActive(color(78, 173, 220));
  right = (cp5.addToggle("Right")
              .setSize(120, 60)
              .setPosition(430, 540)
              .setFont(font))
              .setColorBackground(color(#688698))
              .setColorForeground(color(150))
              .setColorActive(color(78, 173, 220));
  cp5.getController("Right").getCaptionLabel().setVisible(false);
  right.setState(false);
  left = (cp5.addToggle("Left")
              .setSize(120, 60)
              .setPosition(290, 540)
              .setFont(font))
              .setColorBackground(color(#688698))
              .setColorForeground(color(150))
              .setColorActive(color(78, 173, 220));
  cp5.getController("Left").getCaptionLabel().setVisible(false);
  left.setState(false);
  emergency = (cp5.addToggle("Emergency")
                  .setSize(260, 60)
                  .setPosition(290, 620)
                  .setFont(font))
                  .setColorBackground(color(#688698))
                  .setColorForeground(color(150))
                  .setColorActive(color(78, 173, 220));
  cp5.getController("Emergency").getCaptionLabel().setVisible(false); 
  emergency.setState(false);
  
  rightLabel = cp5.addLabel("RIGHT SIGNAL").setPosition(450, 563).setFont(font1);
  leftLabel = cp5.addLabel("LEFT SIGNAL").setPosition(310, 563).setFont(font1);
  emergencyLabel = cp5.addLabel("EMERGENCY").setPosition(375, 640).setFont(font1);
  warnings = (cp5.addToggle("Warning")
                  .setSize(120, 60)
                  .setPosition(590, 540)
                  .setFont(font))
                  .setColorBackground(color(#688698))
                  .setColorForeground(color(150))
                  .setColorActive(color(78, 173, 220));
   cp5.getController("Warning").getCaptionLabel().setVisible(false);
   warnings.setState(false);
   
  warningsLabel = cp5.addLabel("WARNINGS").setPosition(610,563).setFont(font1);
  
    cruisecontrol = (cp5.addToggle("Cruise")
                        .setSize(120, 60)
                        .setPosition(730, 540)
                        .setFont(font))
                        .setColorBackground(color(#688698))
                        .setColorForeground(color(150))
                        .setColorActive(color(78, 173, 220));
  cp5.getController("Cruise").getCaptionLabel().setVisible(false);
  cruisecontrol.setState(false);
  Button set = (cp5.addButton("Set")
                         .setSize(120,60)
                         .setPosition(870, 540)
                         .setFont(font1))
                         .setColorBackground(color(#688698))
                         .setColorForeground(color(150))
                         .setColorActive(color(78, 173, 220));

  cruiseLabel = cp5.addLabel("CRUISE CONTROL").setPosition(740, 563).setFont(font1);
   mph = (cp5.addToggle("mphT").setSize(75, 50).setPosition(1005, 375).setFont(font))
    .setColorBackground(color(0)).setColorForeground(color(150)).setColorActive(color(78, 173, 220));
  cp5.getController("mphT").getCaptionLabel().setVisible(false);
  mph.setState(true);   
}

void draw() {  

  fill(0);
  stroke(255);
  //around speedometer
  circle(500, 300, 380);
  fill(0);
  rect(820,40,120,90);
  rect(440,420,140,70);
  fill(0);
  circle(185, 330, 220);  
  arc(840, 330, 218, 218, PI/2, 3*PI/2);
  arc(880, 330, 213, 213, 3*PI/2, 5*PI/2);
  //rect(780,100,120,90);
  fill(255);
  textFont(font3);
  text(month()+"/"+day()+"/"+year(),840,70);
  text(hour(),850,90);
  text(":",860,90);
  text(minute(),870,90);
  text("Temp: 55°F", 830, 110);
  image(fuelpump, 870, 460);
  image(engTemp, 790, 460);
  float currentEngineTemp = engineTemp.getValue();
  float currentSpeed = speedometer.getValue();
  float currentTacho = tachometer.getValue();
  
 if (mouseX > 10 && mouseX < 130 && mouseY > 540 && mouseY < 600 && mousePressed) {
    currentSpeed++;
    speedometer.setValue(currentSpeed);
    
    
    currentTacho = tachometer.getValue();
    currentTacho += .1;
    tachometer.setValue(currentTacho);
  }
  else {
    if (speedometer.getValue() > 0) {
      if (mph.getState() == true) {
        if (speedometer.getValue() < 20) {
          if (currentTacho > 1.9) {
            currentTacho = tachometer.getValue();
            currentTacho -= .05;
            tachometer.setValue(currentTacho);
          }
        }
        else {
          if (currentTacho > 2.3) {
            currentTacho = tachometer.getValue();
            currentTacho -= .05;
            tachometer.setValue(currentTacho);
           } 
         }
      }
      else {
        if (speedometer.getValue() < 40) {
          if (currentTacho > 1.9) {
            currentTacho = tachometer.getValue();
            currentTacho -= .05;
            tachometer.setValue(currentTacho);
          }
        }
        else {
          if (currentTacho > 2.3) {
            currentTacho = tachometer.getValue();
            currentTacho -= .05;
            tachometer.setValue(currentTacho);
           } 
         }
      }
      
      if (currentEngineTemp < 90) {
        if (millis() > startTime + eTempSpeed) {
          startTime = millis();
          currentEngineTemp++;
          engineTemp.setValue(currentEngineTemp);
        }
      }
    }
    else {
      if (currentTacho > 0.9) {
        currentTacho = tachometer.getValue();
        currentTacho -= .05;
        tachometer.setValue(currentTacho);
      } 
    }
  }
  if (mouseX > 150 && mouseX < 270 && mouseY > 540 && mouseY < 600 && mousePressed) {
      currentSpeed--;
      speedometer.setValue(currentSpeed);
  }

  if (cruiseOn == false) {
    image(cruiseControl, 700, 100);
  } else {
    image(cruiseControlOn, 700, 100);
  }
  timeinterval = 500;
  if (leftSig == true) {
    if(sigLightOn == true) {
      fill(60, 220, 124);
      stroke(60, 220, 124);
      
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = false;
      }
    }
    else {
      fill(25);
      stroke(25);
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = true;
      }
    }
  }
  else {
    fill(25);
    stroke(25);
  }
  //left arrow
  rect(370, 40, 40, 40);
  triangle(330, 60, 370, 20, 370, 100);


  if (rightSig == true) {
    if(sigLightOn == true) {
      fill(60, 220, 124);
      stroke(60, 220, 124);
      
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = false;
      }
    }
    else {
      fill(25);
      stroke(25);
      if(millis() > lasttimecheck + timeinterval) {
        lasttimecheck = millis();
        sigLightOn = true;
      }
    }
  } else {
    fill(25);
    stroke(25);
  }
 
   //right arrow
  rect(595, 40, 40, 40);
  triangle(675, 60, 635, 20, 635, 100);
  fill(255);
  stroke(0);
  font2 = createFont("Arial", 15);
  switch(warningChoice) {
     case -1:
       fill(25);
       rect(30, 40, 190, 100); //warning box
       break;
     case 0:
     textFont(font2);
       image(airbag,30,40);
       text("Airbag",155,100);
       break;
     case 1:
       textFont(font2);
       image(antilock,30,40);
       text("Anti-Lock",150,90);
       text("Brake",160,110);
       break;
     case 2:
     textFont(font2);
       image(battery,30,40);
       text("Battery",155,100);
       break;
     case 3:
     textFont(font2);
       image(engine,30,40);
       text("Engine",155,100);
       break;
     case 4:
     textFont(font2);
       image(oil,30,40);
       text("Oil",155,100);
       break;
     case 5:
     textFont(font2);
       image(security,30,40);
       text("Security",145,100);
       break;
     case 6:
       textFont(font2);
       image(tire,30,40);
       text("Tire",155,90);
       text("Pressure",145,110);
       break;
     case 7:
       textFont(font2);
       image(traction,30,40);
       text("Traction",145,90);
       text("Control",145,110);
       break;
     case 8:
       textFont(font2);
       image(tractionMal,30,40);
       text("Traction",145,90);
       text("Malfunction",140,110);
       break;
  }
  
 
}

void controlEvent(ControlEvent theEvent) {
  
  switch(theEvent.getController().getName()) {
  case "mph":
    if (mph.getState() == true) { 
      font = createFont("Arial", 25);
      speedometer.setRange(0, 140).setValue(0).setNumberOfTickMarks(14);
      tachometer.setValue(0.9);
      cp5.getController("speed").setCaptionLabel("mph");
      milesLabel.setVisible(true);
      s0.setPosition(400, 400).setFont(font);
      s20.setPosition(355, 310).setFont(font);
      s40.setPosition(375, 220).setFont(font);
      s60.setPosition(450, 160).setFont(font);
      s80.setPosition(550, 160).setFont(font);
      s100.setPosition(600, 210).setFont(font);
      s120.setPosition(610, 310).setFont(font);
      s140.setPosition(580, 390).setFont(font);
     
    }
    break;
  case "Cruise":
    if (cruisecontrol.getState() == true) {
      cruiseOn = true;
    } else {
      cruiseOn = false;
      cruiseSet = false;
    }
    break;
  case "Set":
    if (cruiseOn == true) {
      cruiseSet = true;
    }
    break;

  case "Right":
    lasttimecheck = millis();
    sigLightOn = true;
    if (right.getState() == true) {
      emergency.setState(false);
      left.setState(false);
      leftSig = false;
      rightSig = true;
    } else {
      rightSig = false;
      sigLightOn = false;
    }
    break;
  case "Left":
    lasttimecheck = millis();
    sigLightOn = true;
    if (left.getState() == true) {
      emergency.setState(false);
      right.setState(false);
      rightSig = false;
      leftSig = true;
    } else {
      leftSig = false;
      sigLightOn = false;
    }
    break;
  case "Emer":
    lasttimecheck = millis();
    sigLightOn = true;
    if (emergency.getState() == true) {
      right.setState(false);
      left.setState(false);
      rightSig = true;
      leftSig = true;
    } else {
      rightSig = false;
      leftSig = false;
      sigLightOn = false;
    }
    break;
    
    case "Warning":
      if(warnings.getState() == true) {
        warningChoice = int(random(9));
      }
      else {
        warningChoice = -1;
      }
      break;
  
  case "Brake":
    cruiseSet = false;
    break;
  }
}

