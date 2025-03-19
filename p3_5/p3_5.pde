/*
* サインカーブ
*/
size(500, 100);
float xStep = 1;
float lastX = -999;
float lastY = -999;
// 角度
float angle = 0;
float y = 50;
for (int x = 20; x <=  480; x += xStep) {
    float rad = radians(angle);
    y = 50 + sin(rad) * 40;
    if (lastX > -999) {
        line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
    angle++;
}