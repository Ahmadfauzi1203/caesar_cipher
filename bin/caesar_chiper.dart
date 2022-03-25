import 'dart:io';

void main() {
  int pil;
  bool stop = true;

  while (stop) {
    print("Wellcome to Caesar Chiper");

    print("Menu: ");
    print("1. Encrypt ");
    print("2. Decrypt ");
    print("3. Exit ");
    print("");
    stdout.write("pilih Menu: ");
    pil = int.parse(stdin.readLineSync());

    switch (pil) {
      case 1:
        {
          print("Encrypt");
          proses(true);
          break;
        }
      case 2:
        {
          print("Decrypt");
          proses(false);
          break;
        }
      case 3:
        {
          stop = false;
          break;
        }
      default:
        {
          print("option salah!");
        }
    }
  }
}

void proses(bool menu) {
  int k;
  String hasil = "";
  String plaintext;

  stdout.write("Masukkan Pesan: "); //input kata
  plaintext = stdin.readLineSync();
  stdout.write("Masukkan Jumlah pergeseran (0-25): "); //input pergeseran
  k = int.parse(stdin.readLineSync());

  for (int i = 0; i < plaintext.length; i++) {
    int ch = plaintext
        .codeUnitAt(i); // mengubah character menjadi kode UTF-16 Desimal
    int offset; //variabel untuk nilai awal desimal dari character
    String h;
    if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
      offset = 97;
    } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
      offset = 65;
    } else if (ch == ' '.codeUnitAt(0)) {
      hasil += " ";
      continue;
    } else {
      print("Input Pesan Salah!!"); // jikalau input pesan bukan alphabet
      break;
    }

    int c;
    if (menu) {
      c = (ch + k - offset) % 26;
    } else {
      c = (ch - k - offset) % 26;
    }
    h = String.fromCharCode(c + offset);
    hasil += h;
  }
  print("Hasil Konversi: $hasil"); // output hasil konversi
  print("");
}
