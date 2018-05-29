class Star {
    float x;
    float y;
    float z;

    Star() {
        reset();
    }

    void reset() {
        x = random(-width * 4, width * 4);
        y = random(-height * 4, height * 4);
        z = random(0, width);
    }

    void move() {
        z--;
        if (z <= 0) {
            reset();
        }
    }

    void draw(int r) {
        pushMatrix();
        scale((z - width) * 0.001);
        ellipse(x / z * 100, y / z * 100, r, r);
        popMatrix();
    }
}
