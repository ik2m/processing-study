/**
* フラクタル木？振り子みたいなもの
*/
int _numChildren = 3;
int _maxLevels = 5;

Branch _trunck;// 幹

void setup() {
    size(750, 500);
    background(255);
    noFill();
    smooth();
    newTree();
}

void newTree() {
    _trunck = new Branch(1, 0, width / 2, height / 2);
    _trunck.drawMe();
}

void draw() {
    background(255);
    _trunck.updateMe(width / 2, height / 2);
    _trunck.drawMe();
}

class Branch {
    float level, index;
    float x, y;
    float endX, endY;
    
    float strokeW, alpha;
    float len, lenChange;
    float rot, rotChange;
    
    Branch[] children = new Branch[0];
    
    Branch(float lev, float idx, float ex, float why) {
        level = lev;
        index = idx;
        
        strokeW = (1 / level) * 10; // 末端ほど細く
        alpha = 255 / level; // 末端ほど薄く
        len = (1 / level) * random(500); //　末端ほど短く
        rot = random(360);
        lenChange = random(10) - 5;
        rotChange = random(10) - 5;
        updateMe(ex, why);
        
        if (level < _maxLevels) {
            // 子を作る
            children = new Branch[_numChildren];
            for (int x = 0; x < _numChildren; x++) {
                children[x] = new Branch(level + 1, x, endX, endY);
            }
        }
    }
    
    void updateMe(float ex, float why) {
        x = ex;
        y = why;
        
        rot += rotChange; //回転を増やす
        if (rot > 360) rot = 0;
        if (rot < 0) rot = 360;
        
        len -= lenChange; //長さを増やす？本当か？
        if (len < 0) lenChange *= -1;
        if (len > 500) lenChange *= -1;
        
        float radian = radians(rot);
        endX = x + len * cos(radian);
        endY = y + len * sin(radian);
        
        for (int i = 0; i < children.length; i++) {
            children[i].updateMe(endX, endY);
        }
    }
    
    void drawMe() {
        if(level > 1){// 幹を描かない
            strokeWeight(strokeW);
            stroke(0, alpha);
            fill(255, alpha);
            line(x, y, endX, endY);
            ellipse(endX, endY, len / 12, len / 12);
        }
        for (int i = 0; i < children.length; i++) {
            children[i].drawMe();
        }
    }
}