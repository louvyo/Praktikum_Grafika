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

  // Efek api roket dengan curveVertex dan bezier
  pushMatrix();
  translate(rocketX, 470);

  // Lapisan luar api (oranye)
  fill(255, 140, 0);
  beginShape();
  vertex(-20, 0);  // Memulai titik pertama
  bezierVertex(-10, flamesize, 10, flamesize, 20, 0);  // Kurva Bezier
  vertex(15, 0);
  endShape(CLOSE);

  // Lapisan dalam api (kuning)
  fill(255, 255, 0);
  beginShape();
  vertex(-15, 0);  // Memulai titik pertama
  bezierVertex(-5, flamesize * 0.8, 5, flamesize * 0.8, 15, 0);  // Kurva Bezier
  vertex(10, 0);
  endShape(CLOSE);
  popMatrix();

  // Menggambar tail roket
  pushMatrix();
  translate(rocketX, 470); // Posisi tail roket
  for (int i = 0; i < 5; i++) {
    fill(255, 140 - (i * 25), 0); // Warna tail yang memudar
    float tailWidth = map(i, 0, 4, 20, 5); // Lebar tail menurun
    float tailHeight = flamesize * (1 - (i * 0.2)); // Tinggi tail menurun

    beginShape();
    vertex(-tailWidth / 2, 0); // Titik awal tail
    bezierVertex(-tailWidth / 4, tailHeight, tailWidth / 4, tailHeight, tailWidth / 2, 0); // Kurva Bezier untuk efek tail
    endShape(CLOSE);
    translate(0, 5); // Pindahkan posisi tail ke bawah untuk setiap iterasi
  }
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
