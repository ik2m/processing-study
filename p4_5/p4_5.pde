/*
* 独自のノイズ関数で描かれた円
*/

void setup() {
    size(500, 300);
    background(255);
    strokeWeight(5);
    smooth();

    float radius = 100;
    float centerX = 250;
    float centerY = 150;

    /** 基準となる円*/
    stroke(0, 30);
    noFill();
    ellipse(centerX, centerY, radius * 2, radius * 2);

    /** 三角関数の円 */
    stroke(20, 50, 70);
    strokeWeight(1);
    float x, y;
    float noiseVal = random(10);

    float radVariance, thisRadius, rad;

    beginShape();
    fill(20, 50, 70, 50);

    for (float angle = 0; angle <= 360; angle +=1){
        noiseVal += 0.1;
        radVariance = 30 * customNoise(noiseVal);
        thisRadius = radius + radVariance; // 半径
        rad = radians(angle);
        x = centerX + (cos(rad) * thisRadius);
        y = centerY + (sin(rad) * thisRadius);

        curveVertex(x, y);
    }

    endShape();


}

void draw() {
    
}

float customNoise(float val) {
    int count = int(val % 12);
    return pow(sin(val), count);
}