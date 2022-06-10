import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //*sabitler sinifimizi olusturduk ve bu siniftan nesne uretmenden direk degiskenlerimize erismek icinde degiskenlerimizi static olarak tanimliyoruz
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
}
