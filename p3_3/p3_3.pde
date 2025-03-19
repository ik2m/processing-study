/*
* 少しランダムな線
*/

size(500, 300);


float xStep = 10;
float yStep = 10;
float lastX = 20;
float lastY = 150;
float y = 150;

int START = 20;
int END = 480;
for (int x = START; x <= END; x += xStep) {
    yStep = random(-10, 10);
    y += yStep;
    line(x, y, lastX, lastY);
    lastX = x;
    lastY = y;
}