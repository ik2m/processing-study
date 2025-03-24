/**
* フラクタル(じゃない)
*/
int _numChildren = 3;
int _maxLevels = 3;

Branch _trunck;// 幹

void setup() {
    size(750, 500);
    // size(750, 500); // これいる？
    background(255);
    noFill();
    smooth();
    newTree();
}

void newTree() {
    _trunck = new Branch(1, 0, width /2 , 50);
    _trunck.drawMe();
}

class Branch {
    float level, index;
    float x, y;
    float endX, endY;

    Branch(float lev, float idx, float ex, float why) {
        level = lev;
        index = idx;
        updateMe(ex, why);
    }

    void updateMe(float ex, float why) {
        x = ex;
        y = why;
        endX = x + 150;
        endY = y + 15;
    }

    void drawMe() {
        line(x, y, endX, endY);
        ellipse(x, y, 5, 5);
    }
}



