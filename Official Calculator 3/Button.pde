class Button {
  int x, y, w, h, v; //Position and Dimensions and Values
  char o;
  boolean hov, num; //Hover 

  //Constructors
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }


  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }
  //Display method
  void display() {
    fill(255,48,52);
    noStroke();
    rect(x+3, y+3, w, h);
    stroke(5);
    rect(x, y, w, h);
    fill(0);
    textSize(80);
    if (num) {
      text(v, x+5, y+h-4);
       } else {
      if (o == 'C') {
        text("C", x+5, y+h-5);
      } else if (o == '/') {
        text("÷", x+5, y+h-5);
      } else if (o == '%') {
        text("%", x+5, y+h-5);
      } else if (o == '.') {
        text(".", x+5, y+h-5);
    } else if (o == '√') {
        text("√", x+5, y+h-5);
    } else if (o == 'n') {
      text("+/-", x+5, y+h-5);
    } else if (o == '-') {
      text("-", x+5, y+h-5);
    } else if (o == '=') {
      text("=", x+6, y+h-5);
    } else if (o == '+') {
      text("+", x+6, y+h-5);
    } else if (o == '*') {
      text("x", x+6, y+h-5);
    } else if (o == '^') {
      text("^2", x+6, y+h-5);
    } else if (o == 'π') {
      text("π", x+6, y+h-5);
    }else {
      text(o, x, y);
    }
  }
}

   

  void hover() {
    // errors in this
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}
