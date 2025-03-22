/*
* 2次元のノイズ(四角)
*/

void setup() {
    size(300, 300);
    smooth();
    background(255);
    float xStart = random(10);
    float xNoise = xStart;
    float yNoise = random(10);
    
    for (int y = 0; y <=  height; y += 5) {
        yNoise += 0.1;
        xNoise = xStart;
        for (int x = 0; x <=  width; x += 5) {
            xNoise += 0.1;
            drawPoint(x,y,noise(xNoise, yNoise));
        }
    }
}
        
void draw() {
        
}
        
void drawPoint(float x, float y, float noiseFactor) {
    float len = 10 * noiseFactor;
    rect(x, y, len, len);
}