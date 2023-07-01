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
  data_c = new int[n + 2][n + 2]; // 
  data_p = new int[n + 2][n + 2];
  for(int i = 0; i < n+2; i++) {
    for(int j = 0; j < n+2; j++) {
      data_c[i][j] = 0;
      data_p[i][j] = 0;
    }
  }
  data_p[10][9] = 1;
  data_p[10][10] = 1;
  data_p[10][11] = 1;
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
  
  // 境界条件
  for(int i = 1; i <= n; i++) {
    data_c[i][0]     = data_c[i][n];
    data_c[i][n + 1] = data_c[i][1];
    data_c[0][i]     = data_c[n][i];
    data_c[n + 1][i] = data_c[1][i];
  }
  data_c[0][0]         = data_c[n][n];
  data_c[0][n + 1]     = data_c[n][1];
  data_c[n + 1][0]     = data_c[1][n];
  data_c[n + 1][n + 1] = data_c[1][1];
  // 表示
  for(int i = 1; i <= n; i++) {
    for(int j = 1; j <= n; j++) {
      square(block_size/2 + block_size*(i-1), block_size/2 + block_size*(j-1), block_size - edge_width);
      if(data_c[i][j] == 1) fill(0, 0, 0);
    }
  }

  delay(1000);
}
