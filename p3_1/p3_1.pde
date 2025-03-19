/**
* ただの横線
*/
size(1000, 300);

int step = 10;
float lastX = -999;
float lastY = -999;
float y = 50;
int bordar = 20;

for (int x = bordar; x <= width - bordar; x += step) {
    if (lastX > - 999) {
        line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
}