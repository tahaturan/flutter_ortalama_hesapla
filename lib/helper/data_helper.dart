import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/model/ders.dart';

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

  static String notuHarfeCevir(not) {
    switch (not) {
      case "4.0":
        return 'AA';
      case "3.5":
        return 'BA';
      case "3.0":
        return 'BB';
      case "2.5":
        return 'CB';
      case "2.0":
        return 'CC';
      case "1.5":
        return 'DC';
      case "1.0":
        return 'DD';
      case "0.5":
        return 'FD';
      case "0.0":
        return 'FF';

      default:
        return '';
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

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNotDegeri = 0;
    double toplamKrediDegeri = 0;

    for (var ders in tumEklenenDersler) {
      toplamNotDegeri = toplamNotDegeri + (ders.krediDegeri * ders.harfDegeri);
      toplamKrediDegeri += ders.krediDegeri;
    }
    return toplamNotDegeri / toplamKrediDegeri;
  }
}
