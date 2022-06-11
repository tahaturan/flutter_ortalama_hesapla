import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (gelenHarf) => DropdownMenuItem(
            value: _harfiNotaCevir(gelenHarf),
            child: Text(gelenHarf),
          ),
        )
        .toList();
    //*Tek tek butun harflerimizi gez ve hepsi icin bir DropdownMenuItem olustur dedik
    //*value kismina da yukarida harfinotacevir fonksiyomuzdan gelen degerleri akatardik
    //*child kisminida kullanicinin gorecegi kisma yani orayada gelen harflerimizi yazdik
    //*en sonda bunu DropdownButton kimimizin items bolumunde kullandik cunku oda bizden icinde DropdownMenuItem olan bir liste bekliyordu
  }

//*Krediler dropDown icin listemizi ve elemanlarimizi olsuturduk
  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map(
          (gelenKredi) => DropdownMenuItem(
            value: gelenKredi.toDouble(),
            child: Text("$gelenKredi"),
          ),
        )
        .toList();
  }
}
