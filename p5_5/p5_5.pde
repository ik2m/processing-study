/*
* 2次元のノイズ(フレームループで動く)
*/
float xStart, xNoise, yStart, yNoise;
float xStartNoise, yStartNoise;

void setup() {
    size(300, 300);
    smooth();
    background(255);
    frameRate(24);

    xStartNoise = random(10);
    yStartNoise = random(10);
    xStart = random(10);
    yStart = random(10);
}

void draw() {
    background(255);
    
    xStart += 0.01;
    yStart += 0.01;
    xStart += (noise(xStartNoise) - 0.5) * 0.1;
    yStart += (noise(yStartNoise) - 0.5) * 0.1;
    
    xNoise = xStart;
    yNoise = yStart;
    
    for (int y = 0; y <=  height; y += 5) {
        yNoise += 0.1;
        xNoise = xStart;
        for (int x = 0;x <=  width;x += 5) {
            xNoise += 0.1;
            drawPoint(x, y, noise(xNoise, yNoise));
        }
    }
}

void drawPoint(float x, float y, float noiseFactor) {
    pushMatrix(); // 位置と回転を保存
    translate(x, y);
    rotate(noiseFactor * radians(360));
    stroke(0, 150);
    line(0, 0, 20, 0);
    popMatrix(); // 位置と回転を復元
}