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
  rectMode(CORNER);
}

void draw() {
  background(255);
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      square(block_size/2 + block_size*i, block_size/2 + block_size*j, block_size - edge_width);
    }
  }
}
