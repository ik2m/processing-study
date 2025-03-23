/**
* 波（平均化）
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
            
            _cellArray[x][y].addNeighbor(_cellArray[left][above]);
            _cellArray[x][y].addNeighbor(_cellArray[left][y]);
            _cellArray[x][y].addNeighbor(_cellArray[left][below]);
            _cellArray[x][y].addNeighbor(_cellArray[x][below]);
            _cellArray[x][y].addNeighbor(_cellArray[right][below]);
            _cellArray[x][y].addNeighbor(_cellArray[right][y]);
            _cellArray[x][y].addNeighbor(_cellArray[right][above]);
            _cellArray[x][y].addNeighbor(_cellArray[x][above]);
            
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
    float state;
    
    float nextState; //次の状態
    float lastState = 0;
    Cell[] neighbors; //隣接セル
    
    Cell(float ex, float why) {
        // ここわからない。ああ、xとyか
        x = ex * _cellSize;
        y = why * _cellSize;
        nextState = (x / width + y / height) * 14; //初期状態を作る
        state = nextState;
        neighbors = new Cell[0];
    }
    
    void addNeighbor(Cell cell) {
        neighbors = (Cell[])append(neighbors,cell);
    }
    
    void calcNextState() {
        float total = 0;
        for (int i = 0; i < neighbors.length; i++) {
            total += neighbors[i].state;
        }
        
        float avarage = int(total / 8);
        
        if (avarage == 255) {
            // 平均が255の時、次の状態は0
            nextState = 0;
        } else if (avarage == 0) {
            // 平均が0の時、次の状態は255
            nextState = 255;
        } else {
            // それ以外の時、次の状態は現在の状態+平均-前の状態
            nextState = state + avarage;
            if (lastState > 0) nextState -= lastState;
            if (nextState > 255) nextState = 255;
            if (nextState < 0) nextState = 0;
        }
        
        lastState = state;
    }
    
    void drawMe() {
        state = nextState;
        stroke(0);
        fill(state);
        ellipse(x,y,_cellSize,_cellSize);
    }
}