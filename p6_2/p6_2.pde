/*
* マウスクリックのたびにいくつか円を書く(OOPバージョン)
*/
int _num = 10;
Cirle[] _circleArr = {};

void setup() {
    size(500, 300);
    background(255);
    smooth();
    strokeWeight(1);
    fill(150, 50);
    drawCircles();
}

void draw() {
    background(255);
    for (int i = 0; i <  _circleArr.length; i++) {
        Cirle thisCircle = _circleArr[i];
        thisCircle.updateMe();
    }
}

void mouseReleased() {
    drawCircles();
}

void drawCircles() {
    for (int i = 0; i < _num; i++) {
        Cirle thisCircle = new Cirle();
        thisCircle.drawMe();
        _circleArr = (Cirle[])append(_circleArr, thisCircle);
    }
}

class Cirle {
    float x, y, r;
    color lineColor, fillColor;
    float alpha;
    float xMove, yMove;
    
    /**
    * コンストラクタ
    */
    Cirle() {
        x = random(width);
        y = random(height);
        r = random(100) + 10;
        lineColor = color(random(255), random(255), random(255));
        fillColor = color(random(255), random(255), random(255));
        alpha = random(255);
        xMove = random(10) - 5;
        yMove = random(10) - 5;
    }
    
    void drawMe() {
        noStroke();
        fill(fillColor, alpha);
        ellipse(x, y,r * 2, r * 2);
        stroke(lineColor, alpha);
        noFill();
        ellipse(x, y, 10, 10);
    }
    
    void updateMe() {
        x += xMove;
        y += yMove;
        if (x > width + r) x = 0 - r;
        if (x < 0 - r) x = width + r;
        if (y > height + r) y = 0 - r;
        if (y < 0 - r) y = height + r;
        
        drawMe();
    }
}