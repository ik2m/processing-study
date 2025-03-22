/*
* 2次元のノイズ(フレームループで動く)
*/
float xStart, xNoise, yStart, yNoise;

void setup() {
    size(300, 300);
    smooth();
    background(0);
    frameRate(24);
    
    xStart = random(10);
    yStart = random(10);
}

void draw() {
    background(0);
    
    xStart += 0.01;
    yStart += 0.01;
    
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
    rotate(noiseFactor * radians(540));
    noStroke();
    float edgeSize = noiseFactor * 35;
    float grey = 150 + (noiseFactor * 120);
    float alpha = 150 + (noiseFactor * 120);
    fill(grey, alpha);
    ellipse(0, 0, edgeSize, edgeSize / 2);
    popMatrix(); // 位置と回転を復元
}