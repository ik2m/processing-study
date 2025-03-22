/*
* wave clock?
*/

void setup() {
    size(500, 300);
    background(255);
    strokeWeight(5);
    smooth();
    
    float _radiusnoise = 0;
    float _angleNoise = 0;
    float _xNoise = 0;
    float _ynoise = 0;
    float _angle = 0;
    /** 三角関数の円 */
    strokeWeight(1);
    
    for (int step = 0; step <= 360; step +=1){
        _radiusnoise += 0.005;
        float _radius = noise(_radiusnoise) * 200;

        /** 角度のノイズ */
        _angleNoise += 0.005;
        _angle +=(noise(_angleNoise) * 6) - 3;
        if(_angle > 360) _angle -= 360;
        if(_angle < 0) _angle += 360;
        
        /** 基準となる円*/
        _xNoise += 0.01;
        _ynoise += 0.01;
        float centerX = width/2 + (noise(_xNoise) * 100) - 50;
        float centerY = height/2 + (noise(_ynoise) * 100) - 50;
        
        float radians = radians(_angle);
        float x1 = centerX + cos(radians) * _radius;
        float y1 = centerY + sin(radians) * _radius;
        float opprad = radians + PI; //反対側のラジアン
        float x2 = centerX + cos(opprad) * _radius;
        float y2 = centerY + sin(opprad) * _radius;
        stroke( 255 - ( _angle % 255 )); // 線の色
        line(x1, y1, x2, y2);
    }
}

void draw() {
    
}