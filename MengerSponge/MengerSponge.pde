float theta = 0;
Box b;
ArrayList<Box> sponge;

void setup() {
    size(800, 450, P3D);
    smooth(4);
    pixelDensity(2);
    b = new Box(0, 0, 0, 200);
    sponge = new ArrayList<Box>();
    sponge.add(b);
}

void draw() {
    background(50);
    stroke(255);
    noFill();
    lights();
    translate(width / 2, height / 2);
    rotateX(theta);
    rotateY(theta / 2);
    for (Box b : sponge) {
        b.show();
    }
    theta += 0.01;
}

void mousePressed() {
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge) {
        ArrayList<Box> newBoxes = b.generate();
        next.addAll(newBoxes);
    }
    sponge = next;
}
