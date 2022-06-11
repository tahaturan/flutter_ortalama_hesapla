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
  static BorderRadius borderRadius = BorderRadius.circular(18);
  static final TextStyle ortalamaTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: anaRenk,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );

  static const EdgeInsets dropDownPadding = EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16,
  );

  static const EdgeInsets yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
