/*
* カスタムなランダムな値
*/

void setup() {
    size(500, 100);
    float xStep = 1;
    float lastX = -999;
    float lastY = -999;
    // 角度
    float y = 50;
    for (int x = 20; x <=  480; x += xStep) {
        y = customRandom() * 60 + 20;
        if (lastX > - 999) {
            line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;
    }
    }

float customRandom() {
    return  1 - pow(random(1), 5);
}