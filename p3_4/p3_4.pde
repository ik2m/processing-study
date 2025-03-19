/*
* パーリンノイズの線
*/

size(500, 100);
background(255);
strokeWeight(5);
smooth();

// baseline
stroke(0, 30);
line(20, 50,480, 50);

stroke(20, 50, 70);
int step = 1;
float lastX = -999;
float lastY = -999;

float yNoise = random(10);
float y;


for(int x=20; x<=480; x+=step) {
    y = 10 +noise(yNoise) * 80;
    if( lastX > -999) {
        line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
    yNoise += 0.03;
}