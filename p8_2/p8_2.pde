/**
* フラクタル木
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
    _trunck = new Branch(1, 0, width /2, 50);
    _trunck.drawMe();
}

class Branch {
    float level, index;
    float x, y;
    float endX, endY;
    Branch[] children = new Branch[0];

    Branch(float lev, float idx, float ex, float why) {
        level = lev;
        index = idx;
        updateMe(ex, why);

        if( level < _maxLevels ) {
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
        endX = x + (level *  (random(100)-50));
        endY = y + 50 + level * random(50);
    }

    void drawMe() {
        strokeWeight(_maxLevels - level + 1);
        line(x, y, endX, endY);
        ellipse(x, y, 5, 5);
        for (int i = 0; i < children.length; i++) {
            children[i].drawMe();
        }
    }
}



