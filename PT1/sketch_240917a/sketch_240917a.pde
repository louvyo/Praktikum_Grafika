void setup() {
  size(400, 600); //ukuran window preview
  background(0); //warna bg saat program dijalankan pertama kali
  noStroke(); //menghapus stroke pada objek
}

void draw() {
  //warna bg
  background(0);
  
  //guide posisi x dan y
  fill(255);  // Warna teks putih
  textSize(16);  // Ukuran teks
  text("X: " + mouseX + " | Y: " + mouseY, 305, 30);
  
  //nama dan NIM
  textSize(14);
  text("Nama : Miftahul Huda", 10, 30);
  text("NIM : 2209106098", 10, 50);
  
  // Badan roket
  fill(200);
  rect(170, 300, 60, 150, 10);  
  
  // Bagian atas roket 
  fill (255, 0, 0);
  triangle(200, 240, 168, 310, 233, 310);
  
  // Jendela roket
  fill (0, 100, 255);
  ellipse(200, 350, 40, 40);  
  
  // Jendela bagian dalam
  fill(255);
  ellipse(200, 350, 25, 25);  
  
  // Sirip kiri dan kanan
  fill(150);
  triangle(170, 450, 170, 400, 120, 450); //sirip kiri
  triangle(230, 450, 230, 400, 280, 450); //sirip kanan
  
  //penghubung badan roket dan api
  fill(120);
  rect(180, 450, 40, 20);
  
  // Api roket
  fill (255,140,0);
  triangle(180, 470, 220, 470, 200, 530); //Api Utama
  
  fill (255, 255, 0);
  triangle(185, 470, 215, 470, 200, 510); //bayangan api
}
