int field_size = 800;
int block_size = 16;
int edge_width = 2;

void setup() {
  size(800, 800);
  rectMode(CORNER);
}

void draw() {
  background(255);
  for(int i = 0; i < (int)(field_size/block_size) - 1; i++) {
    for(int j = 0; j <  (int)(field_size/block_size) - 1; j++) {
      square(block_size/2 + block_size*i, block_size/2 + block_size*j, block_size - edge_width);
    }
  }
}
aaa