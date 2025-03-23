/**
* GoL(ライフゲーム)
*/
Cell[][] _cellArray;
int _cellSize = 10;
int _numX, _numY;

void setup() {
    size(500, 500);
    _numX = floor(width / _cellSize);
    _numY = floor(height / _cellSize);
    restart();
}

void restart() {
    _cellArray = new Cell[_numX][_numY];
    for (int x = 0;x < _numX;x++) {
        for (int y = 0;y < _numY;y++) {
            Cell newCell = new Cell(x,y);
            _cellArray[x][y] = newCell;
        }
    }
    
    for (int x = 0;x < _numX;x++) {
        for (int y = 0; y < _numY; y++) {
            int above = y - 1;
            int below = y + 1;
            int left = x - 1;
            int right = x + 1;
            
            if (above < 0) above = _numY - 1; //画面端であれば反対側とつなげる
            if (below ==  _numY) below = 0;
            if (left < 0) left = _numX - 1;
            if (right ==  _numX) right = 0;
            
            _cellArray[x][y].addNeighbor(0,_cellArray[left][above]);
            _cellArray[x][y].addNeighbor(1,_cellArray[left][y]);
            _cellArray[x][y].addNeighbor(2,_cellArray[left][below]);
            _cellArray[x][y].addNeighbor(3,_cellArray[x][below]);
            _cellArray[x][y].addNeighbor(4,_cellArray[right][below]);
            _cellArray[x][y].addNeighbor(5,_cellArray[right][y]);
            _cellArray[x][y].addNeighbor(6,_cellArray[right][above]);
            _cellArray[x][y].addNeighbor(7,_cellArray[x][above]);
            
        }
    }
}

void draw() {
    background(200);
    
    for (int x = 0; x < _numX;x++) {
        for (int y = 0; y < _numY;y++) {
            _cellArray[x][y].calcNextState();
        }
    }
    translate(_cellSize / 2,_cellSize / 2);
    
    // すべてのセルを描く
    for (int x = 0; x < _numX;x++) {
        for (int y = 0; y < _numY;y++) {
            _cellArray[x][y].drawMe();
        }
    }
}

void mousePressed() {
    restart();
}

class Cell {
    float x,y;
    boolean state; //オンかオフ
    
    boolean nextState; //次の状態
    Cell[] neighbors; //隣接セル
    
    Cell(float ex, float why) {
        // ここわからない。ああ、xとyか
        x = ex * _cellSize;
        y = why * _cellSize;
        if (random(2)>1) {
            nextState = true;
        } else {
            nextState = false;
        }
        state = nextState;
        neighbors = new Cell[8];
    }
    
    void addNeighbor(int idx,Cell cell) {
        neighbors[idx] = cell;
    }
    
    void calcNextState() {
        int liveCount = 0;
        for (int i=0; i < neighbors.length; i++) {
            if(neighbors[i].state) {
                liveCount++;
            }
        }

        if (state) {
            // 生きているセルは、隣接セルが2つか3つなら生存
            if ( liveCount == 2 || liveCount == 3) {
                nextState = true;
            } else {
                nextState = false;
            }
        } else {
            // 死んでいるセルは、隣接セルが3つなら生存
            if (liveCount == 3) {
                nextState = true;
            } else {
                nextState = false;
            }
        }
    }
    
    void drawMe() {
        state = nextState;
        stroke(0);
        if (state) {
            fill(0);
        } else {
            fill(255);
        }
        ellipse(x,y,_cellSize,_cellSize);
    }
}