float flamesize = 40;
boolean grow = true;
float rocketX = 200;
float rocketY = 250;
float rocketSpeed = 2.5;
float moonRotation = 0;

void setup() {
  size(500, 600, P3D); // Gunakan P3D untuk 3D
  smooth();
  noStroke();
}

void draw() {
  background(0);
  displayInfo();
  lightingSetup();
  
  drawMoon();
  drawRocket3D(); // Menggambar roket dalam bentuk 3D
  drawFlame();
  drawTail();
  drawStars();

  // Animasi api
  animateFlame();

  // Rotasi bulan
  moonRotation = (moonRotation + 1) % 360;
}

void displayInfo() {
  // Menampilkan koordinat mouse dan info
  fill(255);
  textSize(16);
  text("X: " + mouseX + " | Y: " + mouseY, 370, 30);
  textSize(20);
  text("Nama : Miftahul Huda", 10, 30);
  text("NIM : 2209106098", 10, 55);
}

void lightingSetup() {
  // Pencahayaan
  ambientLight(50, 50, 50); // Cahaya ambient
  directionalLight(255, 255, 255, -1, -1, 0); // Cahaya directional dari atas kiri
  pointLight(150, 150, 255, 200, 100, 200); // Sumber cahaya di dekat roket
}

void drawMoon() {
  // Menggambar bulan dengan rotasi
  pushMatrix();
  translate(400, 150, 0);
  rotateY(radians(moonRotation)); // Rotasi Y
  fill(200, 200, 255);
  sphere(65); 
  popMatrix();
}

void drawRocket3D() {
  pushMatrix();
  translate(rocketX, height - rocketY, 0); // Sesuaikan dengan posisi roket

  // Kerucut (bagian atas roket)
  pushMatrix();
  translate(0, -95, 0); // Pindahkan kerucut ke atas badan roket
  fill(255, 0, 0); // Warna kerucut lebih terang
  rotateX(PI); // Rotasi kerucut agar meruncing ke atas
  cone(25, 70); // Kerucut dengan diameter 25 (sama dengan badan) dan tinggi 70
  popMatrix();

  // Badan roket (silinder)
  fill(170, 170, 250); // Warna badan roket sedikit berbeda dari kerucut
  cylinder(25, 120); // Silinder dengan diameter 25 dan tinggi 120
  
  // Jendela di badan roket dengan efek kaca lebih rapi
  pushMatrix();
  translate(0, -30, 26); // Posisikan jendela di tengah badan roket
  fill(255, 255, 255); // Warna bingkai jendela
  ellipse(0, 0, 35, 35); // Bingkai elips dengan diameter sedikit lebih besar
  fill(0, 0, 150, 180); // Warna kaca jendela semi-transparan
  ellipse(0, 0, 30, 30); // Gambar elips dengan diameter 30
  popMatrix();

  // Sirip kiri
  pushMatrix();
  translate(-25, 40, 0); // Geser sirip ke kiri
  fill(150, 50, 50); // Warna sirip
  beginShape();
  vertex(0, 0, 0); // Titik pertama
  vertex(-20, 40, 0); // Titik kedua
  vertex(0, 25, 10); // Titik ketiga
  endShape(CLOSE);
  popMatrix();

  // Sirip kanan
  pushMatrix();
  translate(25, 40, 0); // Geser sirip ke kanan
  fill(150, 50, 50); // Warna sirip
  beginShape();
  vertex(0, 0, 0); // Titik pertama
  vertex(20, 40, 0); // Titik kedua
  vertex(0, 25, 10); // Titik ketiga
  endShape(CLOSE);
  popMatrix();

  // Sirip belakang
  pushMatrix();
  translate(0, 40, -25); // Geser ke belakang roket
  fill(150, 50, 50); // Warna sirip
  beginShape();
  vertex(0, 0, 0);         // Titik pertama
  vertex(-10, 40, -15);    // Sudut kiri bawah
  vertex(10, 40, -15);     // Sudut kanan bawah
  endShape(CLOSE);
  popMatrix();
  
  popMatrix();
}

void drawFlame() {
  // Efek api roket dengan curveVertex dan bezier
  pushMatrix();
  translate(rocketX, height - rocketY + 70); // Sesuaikan dengan posisi roket
  // Lapisan luar api (oranye)
  fill(255, 140, 0);
  beginShape();
  vertex(-20, 0); // Memulai titik pertama
  bezierVertex(-10, flamesize, 10, flamesize, 20, 0); // Kurva Bezier
  endShape(CLOSE);
  
  // Lapisan dalam api (kuning)
  fill(255, 255, 0);
  beginShape();
  vertex(-15, 0); // Memulai titik pertama
  bezierVertex(-5, flamesize * 0.8, 5, flamesize * 0.8, 15, 0); // Kurva Bezier
  endShape(CLOSE);
  popMatrix();
}

void drawTail() {
  // Menggambar tail roket
  pushMatrix();
  translate(rocketX, height - rocketY + 70); // Sesuaikan dengan posisi roket
  for (int i = 0; i < 5; i++) {
    fill(255, 140 - (i * 25), 0); // Warna tail yang memudar
    float tailWidth = map(i, 0, 4, 20, 5); // Lebar tail menurun
    float tailHeight = flamesize * (1 - (i * 0.2)); // Tinggi tail menurun
    
    beginShape();
    vertex(-tailWidth / 2, 0); // Titik awal tail
    bezierVertex(-tailWidth / 4, tailHeight, tailWidth / 4, tailHeight, tailWidth / 2, 0); 
    endShape(CLOSE);
    translate(0, 5); // Pindahkan posisi tail ke bawah untuk setiap iterasi
  }
  popMatrix();
}

void drawStars() {
  // Menggambar bintang
  for (int i = 0; i < 10; i++) {
    fill(255);
    pushMatrix();
    translate(random(width), random(height), random(-200, 200)); // Penempatan acak dalam 3D
    sphere(3); // Mengganti ellipse dengan sphere
    popMatrix();
  }
}

void animateFlame() {
  // Logika animasi api
  flamesize = grow ? flamesize + 1 : flamesize - 1;
  if (flamesize > 60 || flamesize < 40) {
    grow = !grow;
  }
}

void cylinder(float r, float h) {
  // Fungsi untuk menggambar silinder
  int sides = 20;
  float angleStep = TWO_PI / sides;
  
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= sides; i++) {
    float angle = i * angleStep;
    float x = cos(angle) * r;
    float z = sin(angle) * r;
    vertex(x, -h / 2, z); // Bagian bawah
    vertex(x, h / 2, z); // Bagian atas
  }
  endShape();
}

void cone(float r, float h) {
  // Fungsi untuk menggambar kerucut
  int sides = 20;
  float angleStep = TWO_PI / sides;
  
  // Bagian bawah kerucut
  beginShape(TRIANGLE_FAN);
  vertex(0, h / 2, 0); // Titik puncak kerucut
  for (int i = 0; i <= sides; i++) {
    float angle = i * angleStep;
    float x = cos(angle) * r;
    float z = sin(angle) * r;
    vertex(x, -h / 2, z);
  }
  endShape();
}
