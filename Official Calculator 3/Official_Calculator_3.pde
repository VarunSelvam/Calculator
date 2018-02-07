
Button[] numButtons = new Button[10];
Button[] opsButtons = new Button[12];
String ls, rs;
float ans; //answer
char op;
boolean left, eq;
String displayValue = "0";



void setup() {
  size(1000, 1000);
  ls = "0";
  rs = "0";
  ans = 0.0;
  op= ' ';
  left= true;
  eq = false;
  numButtons[0] = new Button(0, 790, 270, 210).asNumber(0);
  numButtons[1] = new Button(270, 790, 270, 210).asNumber(1);
  numButtons[2] = new Button(540, 790, 270, 210).asNumber(2);
  numButtons[3] = new Button(0, 580, 270, 210).asNumber(3);
  numButtons[4] = new Button(270, 580, 270, 210).asNumber(4);
  numButtons[5] = new Button(540, 580, 270, 210).asNumber(5);
  numButtons[6] = new Button(0, 370, 270, 210).asNumber(6);
  numButtons[7] = new Button(270, 370, 270, 210).asNumber(7);
  numButtons[8] = new Button(540, 370, 270, 210).asNumber(8);
  numButtons[9] = new Button(0, 180, 270, 190).asNumber(9);

  opsButtons[0] = new Button(810, 430, 270, 90).asOperator('/');
  opsButtons[1] = new Button(810, 700, 270, 90).asOperator('+');
  opsButtons[2] = new Button(810, 610, 270, 90).asOperator('*');
  opsButtons[3] = new Button(810, 520, 270, 90).asOperator('-');
  opsButtons[4] = new Button(810, 250, 270, 90).asOperator('n');
  opsButtons[5] = new Button(810, 790, 270, 210).asOperator('=');
  opsButtons[6] = new Button(810, 160, 270, 90).asOperator('C');
  opsButtons[7] = new Button(810, 340, 270, 90).asOperator('.');
  opsButtons[8] = new Button(270, 280, 270, 90).asOperator('π');
  opsButtons[9] = new Button(270, 180, 270, 100).asOperator('^');
  opsButtons[10] = new Button(540, 180, 270, 100).asOperator('%');
  opsButtons[11] = new Button(540, 280, 270, 90).asOperator('√');
}
void draw() {
  background(4,204,197);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opsButtons.length; i++) {
    opsButtons[i].display();
    opsButtons[i].hover();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs+= numButtons[i].v;
    }
  }
  
  for (int i=0; i<opsButtons.length; i++) {
    if (opsButtons[i].hov && opsButtons[i].o == '+') {
      left = false;
      op = opsButtons[i].o;
      rs = "";
    } else if (opsButtons[i].hov && opsButtons[i].o == '-') {
      left = false;
      op = opsButtons[i].o;
      rs = "";
    } else if (opsButtons[i].hov && opsButtons[i].o == '*') {
      left = false;
      op = opsButtons[i].o;
      rs = "";
    } else if (opsButtons[i].hov && opsButtons[i].o == '/') {
      left = false;
      op = opsButtons[i].o;
      rs = "";
    } else if (opsButtons[i].hov && opsButtons[i].o == 'C') {
      performClear();
    } else if (opsButtons[i].hov && opsButtons[i].o == '=') {
      eq = true;
      performCalculation();
    } else if (opsButtons[i].hov && opsButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opsButtons[i].hov && opsButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opsButtons[i].hov && opsButtons[i].o == '^') {
      if (left) {
        ans = float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opsButtons[i].hov && opsButtons[i].o == 'π') {
      if (left) {
        ans = float(ls)* 3.14;
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opsButtons[i].hov && opsButtons[i].o == '.') {
      if (left) {
        ls += opsButtons[i].o;
      } else {
        rs += opsButtons[i].o;
      }
    } else if (opsButtons[i].hov && opsButtons[i].o == '√') {
      if (left) {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    }
  }
}
  

void performCalculation() {
  switch(op) {
  case '+':
    ans = float(ls)+float(rs);
    ls= str((float)ans);
    left = true;
    break;
  case '-':
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case'*':
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}
void performClear() {
  ls = "0";
  rs = "0";
  ans = 0.0;
  op= ' ';
  left= true;
  eq = false;
}
void updateDisplay() {
  fill(50, 100);
  noStroke();
  rect(13, 13, 450, 85, 4);
  fill(177);
  stroke(0);
  rect(0, 0, 1000, 180, 4);
  fill(10);
  textSize(10);
  //text("Eq" + eq, 15, 25);
  //text("Ans:" + (float)ans, 70, 45);
  textSize(33);
  fill(255);
  if (eq) {
    text((float)ans, 15, 80);
  } else {
    if (left) {
      text(ls, 15, 80);
    }
  }
}
