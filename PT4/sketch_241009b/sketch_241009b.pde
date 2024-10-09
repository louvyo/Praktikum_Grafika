float flamesize = 40;
boolean grow = true;
float rocketX = 250;
float rocketSpeed = 2.5;
float moonRotation = 0;

void setup() {
  size(500, 600);
  background(0);
  noStroke();
}

void draw() {
  background(0);

  fill(255);
  textSize(16);
  text("X: " + mouseX + " | Y: " + mouseY, 370, 30);
  textSize(20);
  text("Nama : Miftahul Huda", 10, 30);
  text("NIM : 2209106098", 10, 55);

  // Menggambar bulan dengan rotasi
  pushMatrix();
  translate(400, 100);
  rotate(radians(moonRotation));
  fill(200, 200, 255);
  ellipse(0, 0, 130, 130);
  fill(180, 180, 230);
  ellipse(-20, -15, 20, 20);
  ellipse(30, -10, 15, 15);
  ellipse(-10, 25, 10, 10);
  popMatrix();

  // Menggambar roket
  pushMatrix();
  translate(rocketX, 0);
  fill(200);
  rect(-30, 300, 60, 150, 10);
  fill(255, 0, 0);
  triangle(0, 240, -32, 310, 33, 310);
  fill(0, 100, 255);
  ellipse(0, 350, 40, 40);
  fill(255);
  ellipse(0, 350, 25, 25);
  fill(150);
  triangle(-30, 450, -30, 400, -80, 450);
  triangle(30, 450, 30, 400, 80, 450);
  fill(120);
  rect(-20, 450, 40, 20);
  popMatrix();

  // Api roket dengan scaling
  pushMatrix();
  translate(rocketX, 470);
  scale(1, flamesize / 40);
  fill(255, 140, 0);
  triangle(-20, 0, 20, 0, 0, flamesize);
  fill(255, 255, 0);
  triangle(-15, 0, 15, 0, 0, flamesize);
  popMatrix();

  // Menggambar bintang
  for (int i = 0; i < 10; i++) {
    fill(255);
    ellipse(random(width), random(height), 3, 3);
  }

  // Gerakkan roket bolak-balik
  rocketX += rocketSpeed;
  if (rocketX > width - 200 || rocketX < 200) {
    rocketSpeed *= -1;
  }

  // Animasi api
  flamesize = grow ? flamesize + 1 : flamesize - 1;
  if (flamesize > 60 || flamesize < 40) {
    grow = !grow;
  }

  // Rotasi bulan
  moonRotation = (moonRotation + 1) % 360;
}
