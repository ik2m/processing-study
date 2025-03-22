/*
* ノイズの多いらせん
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
radius = 10;
float x, y;
float lastX = -999;
float lastY = -999;
float radiusNoise = random(10);
int angleMax = 360 * 4;
for( int angle=0; angle <= angleMax; angle += 5) {
    radiusNoise +=0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
    float rad = radians(angle);
    x = centerX + cos(rad) * thisRadius;
    y = centerY + sin(rad) * thisRadius;
    if( lastX > -999 ) {
        line(lastX, lastY, x, y);
    }
    lastX = x;
    lastY = y;
}