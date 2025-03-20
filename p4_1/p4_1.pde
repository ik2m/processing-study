/*
* 三角関数を使って円を描く
*/

size(500, 300);
background(255);
strokeWeight(5);
smooth();

float radius = 100;
float centerX = 250;
float centerY = 150;

/** 基準となる円*/
stroke(0, 30);
noFill();
ellipse(centerX, centerY, radius * 2, radius * 2);

/** 三角関数の円 */
stroke(20, 50, 70);
float x, y;
float lastX = -999;
float lastY = -999;
for( int angle=0; angle <= 360; angle += 5) {
    float rad = radians(angle);
    x = centerX + cos(rad) * radius;
    y = centerY + sin(rad) * radius;
    point(x, y);
}