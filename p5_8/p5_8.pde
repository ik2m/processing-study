/*
* 3次元のノイズ(四角形)
*/

float xStart, yStart, zSrart;
float xNoise, yNoise, zNoise;

int sideLength = 200;
int spacing = 5;

void setup() {
    size(500, 300, P3D);
    background(0);
    // sphereDetail(8);
    noStroke();

    xStart = random(10);
    yStart = random(10);
    zSrart = random(10);
}

void draw() {
    background(0);

    xStart += 0.01;
    yStart += 0.01;
    zSrart += 0.01;
    
    xNoise = xStart;
    yNoise = yStart;
    zNoise = zSrart;

    translate(150, 20, -150);
    /* フレームごとに回転させる */
    rotateZ(frameCount * 0.01);
    rotateY(frameCount * 0.01);

    for (int z=0; z<=sideLength;z+=spacing){
        zNoise += 0.1;
        yNoise = yStart;
            for(int y=0;y<=sideLength;y+=spacing){
        yNoise += 0.1;
        xNoise = xStart;
        for(int x=0;x<=sideLength;x+=spacing){
            xNoise+=0.1;
            drawPoint(x,y,z,noise(xNoise,yNoise, zNoise));
        }
    }
    }
}

void drawPoint(float x, float y,float z, float noiseFactor) {
    pushMatrix();
    translate(x, y, z);
    float grey = noiseFactor * 255;
    fill(grey, 10);
    box(spacing, spacing, spacing);
    popMatrix();
}
