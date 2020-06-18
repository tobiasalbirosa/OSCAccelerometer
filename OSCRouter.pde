import controlP5.*;
import oscP5.*;
import netP5.*;

ControlP5 cp5;
OscP5 oscControl;
NetAddress myRemoteLocation;

String ipInput = "10.0.12.202";

int myColor1 = color(0, 0, 0);
int myColor2 = color(0, 0, 0);
int myColor3 = color(0, 0, 0);
int myColor4 = color(0, 0, 0);
int myColor5 = color(0, 0, 0);
int myColor6 = color(0, 0, 0);
int myColor7 = color(0, 0, 0);
int myColor8 = color(0, 0, 0);

int saturacion1 = 9;  // -180 +180 AZUMUTH
int saturacion2 = 9; //  -90 / +90 PITCH
int saturacion3 = 9; // -180 / +180 ROLL
int saturacion4 = 9; 
int saturacion5 = 9;
int saturacion6 = 9;
int saturacion7 = 9;
int saturacion8 = 9;  

float exp1;
float exp2;
float exp3;
float exp4;
float exp5;
float exp6;
float exp7;
float exp8;

float result1;
float result2;
float result3;
float result4;
float result5;
float result6;
float result7;
float result8;

float valor1 = .5;
float valor2 = .5;
float valor3 = .5;
float valor4 = .5;
float valor5 = .5;
float valor6 = .5;
float valor7 = .5;
float valor8 = .5;

float valor1Real = 0;
float valor2Real = 0;
float valor3Real = 0;
float valor4Real = 0;
float valor5Real = 0;
float valor6Real = 0;
float valor7Real = 0;
float valor8Real = 0;

String canal1_Input = "''/emg/emg/ch1''";
String canal2_Input = "''/emg/emg/ch2''";
String canal3_Input = "''/emg/emg/ch3''";
String canal4_Input = "''/emg/emg/ch4''";
String canal5_Input = "''/emg/emg/ch5''";
String canal6_Input = "''/emg/emg/ch6''";
String canal7_Input = "''/emg/emg/ch7''";
String canal8_Input = "''/emg/emg/ch8''";

String canal1_Output = "''1''";
String canal2_Output = "''2''";
String canal3_Output = "''3''";
String canal4_Output = "''4''";
String canal5_Output = "''5''";
String canal6_Output = "''6''";
String canal7_Output = "''7''";
String canal8_Output = "''8''";

boolean SEND1 = false;
boolean SEND2 = false;
boolean SEND3 = false;
boolean SEND4 = false;
boolean SEND5 = false;
boolean SEND6 = false;
boolean SEND7 = false;
boolean SEND8 = false;

boolean send1 = false;
boolean send2 = false;
boolean send3 = false;
boolean send4 = false;
boolean send5 = false;
boolean send6 = false;
boolean send7 = false;
boolean send8 = false;

boolean RECIEVE1 = false;
boolean RECIEVE2 = false;
boolean RECIEVE3 = false;
boolean RECIEVE4 = false;
boolean RECIEVE5 = false;
boolean RECIEVE6 = false;
boolean RECIEVE7 = false;
boolean RECIEVE8 = false;

Chart grafico1;
Chart grafico2;
Chart grafico3;
Chart grafico4;
Chart grafico5;
Chart grafico6;
Chart grafico7;
Chart grafico8;

void setup() {

  size(980, 640);
  noStroke();
  cp5 = new ControlP5(this);
  oscControl = new OscP5(this, 12000);
  //Aquí debajo seteamos el IP local(127.0.0.1) o web (192.168.0.244)
  myRemoteLocation = new NetAddress("127.0.0.1", 10000);
  ipInput = oscControl.ip();

  background(127);

  // INPUTS OSC CHANNEL

  //1
  cp5.addTextfield("canal1_Input")
    .setPosition(15, 120)
    .setSize(50, 10)
    .setAutoClear(false)
    ; 
  //2  
  cp5.addTextfield("canal2_Input")
    .setPosition(width/2+15, 120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //3
  cp5.addTextfield("canal3_Input")
    .setPosition(15, 240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //4
  cp5.addTextfield("canal4_Input")
    .setPosition(width/2+15, 240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //5
  cp5.addTextfield("canal5_Input")
    .setPosition(15, 240+120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //6
  cp5.addTextfield("canal6_Input")
    .setPosition(width/2+15, 240+120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //7
  cp5.addTextfield("canal7_Input")
    .setPosition(15, 240+240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //8
  cp5.addTextfield("canal8_Input")
    .setPosition(width/2+15, 240+240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  // OUTPUT OSC CHANNEL
  //1
  cp5.addTextfield("canal1_Output")
    .setPosition(260, 120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //2
  cp5.addTextfield("canal2_Output")
    .setPosition(width/2+260, 120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //3
  cp5.addTextfield("canal3_Output")
    .setPosition(260, 240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //4
  cp5.addTextfield("canal4_Output")
    .setPosition(width/2+260, 240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;

  //5
  cp5.addTextfield("canal5_Output")
    .setPosition(260, 240+120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //6
  cp5.addTextfield("canal6_Output")
    .setPosition(width/2+260, 240+120)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //7
  cp5.addTextfield("canal7_Output")
    .setPosition(260, 240+240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  //8
  cp5.addTextfield("canal8_Output")
    .setPosition(width/2+260, 240+240)
    .setSize(50, 10)
    .setAutoClear(false)
    ;
  // SATURACION
  //1
  cp5.addSlider("saturacion1")
    .setPosition(110, 175)
    .setRange(-9, saturacion1)
    ;
  //2
  cp5.addSlider("saturacion2")
    .setPosition(width/2+110, 175)
    .setRange(-9, saturacion2)
    ;
  //3
  cp5.addSlider("saturacion3")
    .setPosition(110, 175+120)
    .setRange(-9, saturacion3)
    ;
  //4
  cp5.addSlider("saturacion4")
    .setPosition(width/2+110, 175+120)
    .setRange(-9, saturacion4)
    ;
  //5
  cp5.addSlider("saturacion5")
    .setPosition(110, 175+240)
    .setRange(-9, saturacion5)
    ;
  //6
  cp5.addSlider("saturacion6")
    .setPosition(width/2+110, 175+240)
    .setRange(-9, saturacion6)
    ;
  //7
  cp5.addSlider("saturacion7")
    .setPosition(110, 175+360)
    .setRange(-9, saturacion7)
    ;
  //8
  cp5.addSlider("saturacion8")
    .setPosition(width/2+110, 175+360)
    .setRange(-9, saturacion8)
    ;
  // GRAFICO DE ENTRADA

  //1
  grafico1 = cp5.addChart("grafico1")
    .setPosition(180, 110)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255))
    ; 
  grafico1.addDataSet("saturacion1");
  grafico1.setData("saturacion1", new float[360]);

  //2
  grafico2 = cp5.addChart("grafico2")
    .setPosition(width/2+180, 110)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico2.addDataSet("saturacion2");
  grafico2.setData("saturacion2", new float[360]);

  //3
  grafico3 = cp5.addChart("grafico3")
    .setPosition(180, 110+120)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico3.addDataSet("saturacion3");
  grafico3.setData("saturacion3", new float[360]); 

  //4
  grafico4 = cp5.addChart("grafico4")
    .setPosition(width/2+180, 110+120)
    .setSize(50, 50)  
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico4.addDataSet("saturacion4");
  grafico4.setData("saturacion4", new float[360]);

  //5
  grafico5 = cp5.addChart("grafico5")
    .setPosition(180, 110+240)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico5.addDataSet("saturacion5");
  grafico5.setData("saturacion5", new float[360]); 

  //6
  grafico6 = cp5.addChart("grafico6")
    .setPosition(width/2+180, 110+240)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico6.addDataSet("saturacion6");
  grafico6.setData("saturacion6", new float[360]); 

  //7
  grafico7 = cp5.addChart("grafico7")
    .setPosition(180, 110+360)
    .setSize(50, 50)
    .setRange(0, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico7.addDataSet("saturacion7");
  grafico7.setData("saturacion7", new float[360]); 
  //8
  grafico8 = cp5.addChart("grafico8")
    .setPosition(width/2+180, 110+360)
    .setSize(50, 50)
    .setRange(-1, 1)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(color(255));
  grafico8.addDataSet("saturacion8");
  grafico8.setData("saturacion8", new float[360]); 
  //RECIEVES
  //1
  cp5.addToggle("RECIEVE1")
    .setPosition(110, 115)
    .setSize(50, 20)
    ;
  //1
  cp5.addToggle("RECIEVE2")
    .setPosition(610, 115)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE3")
    .setPosition(110, 240)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE4")
    .setPosition(610, 240)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE5")
    .setPosition(110, 360)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE6")
    .setPosition(610, 360)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE7")
    .setPosition(110, 480)
    .setSize(50, 20)
    ;
  cp5.addToggle("RECIEVE8")
    .setPosition(610, 480)
    .setSize(50, 20)
    ;
  // SWITCH DE ENVIO DE DATOS
  //1
  cp5.addToggle("SEND1")
    .setPosition(340, 115)
    .setSize(50, 20)
    ;
  //2
  cp5.addToggle("SEND2")
    .setPosition(width/2+340, 115)
    .setSize(50, 20)
    ;
  //3
  cp5.addToggle("SEND3")
    .setPosition(340, 115+120)
    .setSize(50, 20)
    ;
  //4
  cp5.addToggle("SEND4")
    .setPosition(width/2+340, 115+120)
    .setSize(50, 20)
    ;
  //5
  cp5.addToggle("SEND5")
    .setPosition(340, 115+240)
    .setSize(50, 20)
    ;
  //6
  cp5.addToggle("SEND6")
    .setPosition(width/2+340, 115+240)
    .setSize(50, 20)
    ;
  //7
  cp5.addToggle("SEND7")
    .setPosition(340, 115+360)
    .setSize(50, 20)
    ;
  //8
  cp5.addToggle("SEND8")
    .setPosition(width/2+340, 115+360)
    .setSize(50, 20)
    ;
}


void draw() {
  // m = millis();

  //PANEL DE ESTADO

  pushMatrix();
  fill(255);
  stroke(255);
  rect(0, 0, width, 100);
  fill(0);
  text("Frame rate: " + int(frameRate), 10, 20);
  text("IP:" + ipInput, 10, 40);
  text("Enviando a" + " " + myRemoteLocation, 10, 60); 
  text("Extensión UNLP", 10, 80);
  popMatrix();

  // MODULOS OSC

  //1
  pushMatrix();
  fill(0);
  stroke(255);
  rect(0, 100, width/2, 120);
  fill(0, 255, 0);
  text(canal1_Input, 10, 115);
  text(canal1_Output, 260, 115);

  grafico1.push("saturacion1", valor1);

  text("Receiving:", 10, 160);
  text(valor1Real, 10, 175);

  if (valor1 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(15, 190, 20, 20);
  }  
  popMatrix();

  //2
  pushMatrix();
  fill(0);
  stroke(255);
  rect(width/2, 100, width/2, 120);
  fill(0, 255, 0);
  text(canal2_Input, width/2+10, 115);
  text(canal2_Output, width/2+260, 115);

  grafico2.push("saturacion2", valor2);


  text("Receiving:", width/2+15, 160);
  text(valor2Real, width/2+15, 175);
  if (valor2 >= 0.1) {

    fill(0, 255, 0, 255);
    rect(width/2+15, 190, 20, 20);
  }  
  popMatrix();

  //3
  pushMatrix();
  fill(0);
  rect(0, 100+120, width/2, 120);
  fill(0, 255, 0);
  text(canal3_Input, 10, 115+120);
  text(canal3_Output, 260, 115+120);

  grafico3.push("saturacion3", valor3);

  text("Receiving:", 15, 160+120);
  text(valor3Real, 15, 175+120);
  if (valor3 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(15, 150+160, 20, 20);
  }  
  popMatrix();

  //4
  pushMatrix();
  fill(0);
  rect(width/2, 100+120, width/2, 120);
  fill(0, 255, 0);
  text(canal4_Input, width/2+10, 115+120);
  text(canal4_Output, width/2+260, 115+120);

  grafico4.push("saturacion4", valor4);


  text("Receiving:", width/2+15, 160+120);
  text(valor4Real, width/2+15, 175+120);
  if (valor4 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(width/2+15, 150+160, 20, 20);
  }  
  popMatrix();
  //5
  pushMatrix();
  fill(0);
  rect(0, 100+240, width/2, 120);
  fill(0, 255, 0);
  text(canal5_Input, 10, 115+240);
  text(canal5_Output, 260, 115+240);

  grafico5.push("saturacion5", valor5);


  text("Receiving:", 15, 160+240);
  text(valor5Real, 15, 175+240);
  if (valor5 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(15, 150+280, 20, 20);
  }  
  popMatrix();

  //6
  pushMatrix();
  fill(0);
  rect(width/2, 100+240, width/2, 120);
  fill(0, 255, 0);
  text(canal6_Input, width/2+10, 115+240);
  text(canal6_Output, width/2+260, 115+240);

  grafico6.push("saturacion6", valor6);

  text("Receiving:", width/2+15, 160+240);
  text(valor6Real, width/2+15, 175+240);
  if (valor6 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(width/2+15, 150+280, 20, 20);
  }  
  popMatrix();

  //7

  pushMatrix();
  fill(0);
  rect(0, 100+360, width/2, 120);
  fill(0, 255, 0);
  text(canal7_Input, 10, 115+360);
  text(canal7_Output, 260, 115+360);

  grafico7.push("saturacion7", valor7);


  text("Receiving:", 15, 160+360);
  text(valor7Real, 15, 175+360);
  if (valor7 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(15, 150+400, 20, 20);
  }  
  popMatrix();

  //8

  pushMatrix();
  fill(0);
  rect(width/2, 100+360, width/2, 120);
  fill(0, 255, 0);
  text(canal8_Input, width/2+10, 115+360);
  text(canal8_Output, width/2+260, 115+360);

  grafico8.push("saturacion8", valor8);

  text("Receiving:", width/2+15, 160+360);
  text(valor8Real, width/2+15, 175+360);
  if (valor8 >= 0.1) {
    fill(0, 255, 0, 255);
    rect(width/2+15, 150+400, 20, 20);
  }  
  popMatrix();
  // save(an_array_of_strings, "filename", "xml");
}


void oscEvent(OscMessage theOscMessage) {

// println("### RECIEVEd an osc message.");
// println(theOscMessage); 

  //1 

  if (theOscMessage.checkAddrPattern(canal1_Input) == true && RECIEVE1 == true) {  
    valor1 = theOscMessage.get(0).floatValue();
    valor1Real = valor1;
    // DERIVADA DE POSICIÓN 
    /*
X AZIMUTH 
     Norte = -0 || 0;
     SUR = -180 || 180;
     ESTE = 90;
     ESTE = -90;
     */
    /*exp1 = float(saturacion1)/18.864;
     result1 = pow(10, exp1);
     */
    result1 = saturacion1;
    if (valor1>result1) {
      valor1 = result1;
    }
    valor1 = valor1/result1;
    if (SEND1 == true) {
      OscMessage mensaje1 = new OscMessage(canal1_Output);
      mensaje1.add(valor1);
      oscControl.send(mensaje1, myRemoteLocation);
  //    println("mensajeOSC:",valor1);
    }
  }
  //2
  if (theOscMessage.checkAddrPattern(canal2_Input)== true  && RECIEVE2 == true) {
    valor2 = theOscMessage.get(0).floatValue();
    valor2Real = valor2;
    /*
    exp2 = float(saturacion2)/18.864;
     result2 = pow(10, exp2);
     */
    result2 = saturacion2;
    if (valor2>result2) {
      valor2 = result2;
    }
    valor2 = valor2/result2;
    if (SEND2 == true) {
      OscMessage mensaje2 = new OscMessage(canal2_Output);
      mensaje2.add(valor2); 
      oscControl.send(mensaje2, myRemoteLocation);
   //   println("mensajeOSC:",valor2);
    }
  }
  //3
  if (theOscMessage.checkAddrPattern(canal3_Input)== true  && RECIEVE3 == true) {
    valor3 = theOscMessage.get(0).floatValue();
    //   valor3 = valor3;
    valor3Real = valor3;
    /*
    exp3 = float(saturacion3)/18.864;
     result3 = pow(10, exp3);
     */
    result3 = saturacion3;
    if (valor3>result3) {
      valor3 = result3;
    }

    valor3 = valor3/result3;
    if (SEND3 == true) {
      OscMessage mensaje3 = new OscMessage(canal3_Output);
      mensaje3.add(valor3); 
      oscControl.send(mensaje3, myRemoteLocation);
  

    }
  }
  //4
  if (theOscMessage.checkAddrPattern(canal4_Input)== true  && RECIEVE4 == true) {

    valor4 = theOscMessage.get(0).floatValue();
    valor4Real = valor4;
    result4 = saturacion4;
    /*
    exp4 = float(saturacion4)/18.864;
     result4 = pow(10, exp4);
     */
    if (valor4>result4) {
      valor4 = result4;
    }
    valor4 = valor4/result4;


    if (SEND4 == true) {
      OscMessage mensaje4 = new OscMessage(canal4_Output);
      mensaje4.add(valor4); 
      oscControl.send(mensaje4, myRemoteLocation);
      /*
      TableRow newRow = table.addRow();     
       newRow.setString("millis", str(m));
       newRow.setString("mensaje", theOscMessage.toString() + ' ' +str(valor4Real));      
       saveTable(table, "data/new.csv");
       */
    }
  }

  //5
  if (theOscMessage.checkAddrPattern(canal5_Input)== true  && RECIEVE5 == true) {

    valor5 = theOscMessage.get(0).floatValue();

    valor5Real = valor5;
    /*
    exp5 = float(saturacion5)/18.864;
     result5 = pow(10, exp5); */
    result5 = saturacion5;
    valor5 = valor5/result5;

    if (SEND5 == true) {
      OscMessage mensaje5 = new OscMessage(canal5_Output);
      mensaje5.add(valor5); 
      oscControl.send(mensaje5, myRemoteLocation);
    }
  }

  //6
  if (theOscMessage.checkAddrPattern(canal6_Input) == true  && RECIEVE6 == true) {

    valor6 = theOscMessage.get(0).floatValue();

    valor6Real = valor6;
    /*
    exp6 = float(saturacion6)/18.864;
     result6 = pow(10, exp6);
     */
    result6 = saturacion5;
    valor6 = valor6/result6;


    if (SEND6 == true) {
      OscMessage mensaje6 = new OscMessage(canal6_Output);
      mensaje6.add(valor6); 
      oscControl.send(mensaje6, myRemoteLocation);
    }
  }

  //7
  if (theOscMessage.checkAddrPattern(canal7_Input) == true  && RECIEVE7 == true) {

    valor7 = theOscMessage.get(0).floatValue();

    valor7Real = valor7;
    /*
    exp7 = float(saturacion7)/18.864;
     result7 = pow(10, exp7);
     */
    result7 = saturacion7;
    valor7 = valor7/result7;

    if (SEND7 == true) {
      OscMessage mensaje7 = new OscMessage(canal7_Output);
      mensaje7.add(valor7); 
      oscControl.send(mensaje7, myRemoteLocation);
    }
  }
  //8
  if (theOscMessage.checkAddrPattern(canal8_Input)== true  && RECIEVE8 == true) {
    valor8 = theOscMessage.get(0).floatValue();

    valor8Real = valor8;
    /*
    exp8 = float(saturacion8)/18.864;
     result8 = pow(10, exp8);
     */
     result8 = saturacion8;
    valor8 = valor8/result8;

    if (SEND8 == true) {
      OscMessage mensaje8 = new OscMessage(canal8_Output);
      mensaje8.add(valor8); 
      oscControl.send(mensaje8, myRemoteLocation);
    }
  }
}

void mousePressed() {
  if (SEND1 == false) {
    OscMessage mensaje1 = new OscMessage(canal1_Output);
    mensaje1.add(valor1*0); 
    oscControl.send(mensaje1, myRemoteLocation);
  }
  if (SEND2 == false) {
    OscMessage mensaje2 = new OscMessage(canal2_Output);
    mensaje2.add(valor2*0); 
    oscControl.send(mensaje2, myRemoteLocation);
  }
  if (SEND3 == false) {
    OscMessage mensaje3 = new OscMessage(canal3_Output);
    mensaje3.add(valor3*0); 
    oscControl.send(mensaje3, myRemoteLocation);
  }
  if (SEND4 == false) {
    OscMessage mensaje4 = new OscMessage(canal4_Output);
    mensaje4.add(valor4*0); 
    oscControl.send(mensaje4, myRemoteLocation);
  }
  if (SEND5 == false) {
    OscMessage mensaje5 = new OscMessage(canal5_Output);
    mensaje5.add(valor5*0); 
    oscControl.send(mensaje5, myRemoteLocation);
  }
  if (SEND6 == false) {
    OscMessage mensaje6 = new OscMessage(canal6_Output);
    mensaje6.add(valor6*0); 
    oscControl.send(mensaje6, myRemoteLocation);
  }
  if (SEND7 == false) {
    OscMessage mensaje7 = new OscMessage(canal7_Output);
    mensaje7.add(valor7*0); 
    oscControl.send(mensaje7, myRemoteLocation);
  }
  if (SEND8 == false) {
    OscMessage mensaje8 = new OscMessage(canal8_Output);
    mensaje8.add(valor1*0); 
    oscControl.send(mensaje8, myRemoteLocation);
  }
}
