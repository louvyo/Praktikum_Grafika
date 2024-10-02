// Deklarasi variabel global
float flamesize = 40;      // Ukuran api awal
boolean grow = true;       // Kontrol pembesaran api
float rocketX = 250;       // Posisi horizontal roket

void setup() {
  size(500, 600);          // Ukuran window preview
  background(0);           // Warna background saat program dijalankan pertama kali
  noStroke();              // Menghapus stroke pada objek
}

void draw() {
  background(0);           // Menghapus jejak gambar sebelumnya
  
  // Menampilkan posisi kursor (X dan Y)
  fill(255);               // Warna teks putih
  textSize(16);            // Ukuran teks
  text("X: " + mouseX + " | Y: " + mouseY, 370, 30);

  // Menampilkan Nama dan NIM
  textSize(14);
  text("Nama : Miftahul Huda", 10, 30);
  text("NIM : 2209106098", 10, 50);
  
  // Menggambar badan roket
  fill(200);
  rect(rocketX - 30, 300, 60, 150, 10); // Badan roket dengan posisi tetap (rocketX)

  // Menggambar bagian atas roket
  fill(255, 0, 0);
  triangle(rocketX, 240, rocketX - 32, 310, rocketX + 33, 310);

  // Menggambar jendela roket
  fill(0, 100, 255);
  ellipse(rocketX, 350, 40, 40);        // Jendela utama
  fill(255);
  ellipse(rocketX, 350, 25, 25);        // Jendela bagian dalam

  // Menggambar sirip kiri dan kanan roket
  fill(150);
  triangle(rocketX - 30, 450, rocketX - 30, 400, rocketX - 80, 450); // Sirip kiri
  triangle(rocketX + 30, 450, rocketX + 30, 400, rocketX + 80, 450); // Sirip kanan

  // Penghubung badan roket dan api
  fill(120);
  rect(rocketX - 20, 450, 40, 20);

  // Mengatur ukuran api menggunakan percabangan
  if (grow) {
    flamesize += 1;
    if (flamesize > 60) {
      grow = false; // Ubah arah jika api mencapai ukuran maksimal
    }
  } else {
    flamesize -= 1;
    if (flamesize < 40) {
      grow = true;  // Ubah arah jika api mencapai ukuran minimal
    }
  }
  
  // Menggambar api roket
  fill(255, 140, 0);
  triangle(rocketX - 20, 470, rocketX + 20, 470, rocketX, 470 + flamesize); // Api utama
  fill(255, 255, 0);
  triangle(rocketX - 15, 470, rocketX + 15, 470, rocketX, 470 + flamesize); // Bayangan api

  // Menggambar bintang secara acak di langit
  for (int i = 0; i < 10; i++) {
    fill(255);
    ellipse(random(width), random(height), 3, 3); // Gambar bintang acak di seluruh layar
  }
}
