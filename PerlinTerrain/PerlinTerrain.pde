int cols;
int rows;
int scale = 20;
int w = 3000;
int h = 1500;
float[][] terrain;
float position;

void setup() {
    size(800, 450, P3D);
    smooth(4);
    pixelDensity(2);
    cols = w / scale;
    rows = h / scale;
    terrain = new float[cols][rows];
}

void draw() {
    background(0);
    stroke(255);
    noFill();
    translate(width / 2, height / 2);
    rotateX(PI / 3);

    float offsetDelta = 0.2;
    float yOffset = position;
    for (int y = 0; y < rows; y++) {
        float xOffset = 0;
        for (int x = 0; x < cols; x++) {
            terrain[x][y] = map(noise(xOffset, yOffset), 0, 1, -75, 75);
            xOffset += offsetDelta;
        }
        yOffset += offsetDelta;
    }

    translate(-w / 2, -h / 2);
    for (int y = 0; y < rows - 1; y++) {
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < cols; x++) {
            vertex(x * scale, y * scale, terrain[x][y]);
            vertex(x * scale, (y + 1) * scale, terrain[x][y+1]);
            // rect(x * scale, y * scale, scale, scale);
        }
        endShape();
    }

    position -= 0.05;
}
