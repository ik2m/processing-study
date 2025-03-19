/**
* ランダムな横線
*/
size(1000, 300);


int step = 10;
float lastX = -999;
float lastY = -999;
float y = 50;
int bordarX = 10;
int bordarY = 10;

int START = bordarX;
int END = width - bordarX;
for (int x = START; x <= END; x += step) {
    y = bordarY + random(height-2*bordarY);
    if (lastX > - 999) {
        line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
}