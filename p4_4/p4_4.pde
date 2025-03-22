/*
* ノイズを加えた100のらせん
*/

size(500, 300);
background(255);
strokeWeight(0.5);
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
for (int i = 10; i < 100; i++) {
    float lastX = -999;
    float lastY = -999;
    float radiusNoise = random(10);
    radius = 10;
    
    stroke(random(20), random(50), random(70),random(80));
    int startangle = int(random(360));
    int ANGLE_MAX = 360 * 4;
    int endagngle = ANGLE_MAX + int(random(ANGLE_MAX));
    int anglestep = 5 + int(random(5));
    for (int angle = startangle; angle <= endagngle; angle += anglestep) {
        radiusNoise += 0.05;
        radius += 0.5;
        float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
        float rad = radians(angle);
        x = centerX + (cos(rad) * thisRadius);
        y = centerY + (sin(rad) * thisRadius);
        if(lastX > -999) {
            line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;
    }
}