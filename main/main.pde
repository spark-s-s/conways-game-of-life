int field_size;
int block_size;
int edge_width;
int n;
int[][] data_c;
int[][] data_p;

void setup() {
  size(800, 800);
  field_size = 800;
  block_size = 16;
  edge_width = 2;
  n = (int)(field_size / block_size) - 1;
  data_c = new int[n + 2][n + 2];
  data_p = new int[n + 2][n + 2];
  for(int i = 0; i < n+2; i++) {
    for(int j = 0; j < n+2; j++) {
      data_c[i][j] = 0;
      data_p[i][j] = 0;
    }
  }
  rectMode(CORNER);
}

// あるセルに隣接する生きたセルの数を求める
int count(int[][] a, int x, int y) {
  int cnt = 0;
  for(int i = x-1; i <= x+1; i++) {
    for(int j = y-1; j <= y+1; j++) {
      cnt += a[x][y];
    }
  }
  return cnt;
}

void draw() {
  background(255);
  // 配列の更新
  for(int i = 1; i < n+1; i++) {
    for(int j = 1; j < n+1; j++) {
      if(data_p[i][j] == 0) {
        // 誕生
        if(count(data_p, i, j) == 3) data_c[i][j] = 1;
      } else {
        // 生存
        if(count(data_p, i, j) == 2 || count(data_p, i, j) == 3) data_c[i][j] = 1;
      }
    }
  }
  // 表示
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      square(block_size/2 + block_size*i, block_size/2 + block_size*j, block_size - edge_width);
    }
  }
  delay(1000);
}
