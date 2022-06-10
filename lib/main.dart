import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter_ortalama_hesapla/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ortalama Hesapla",
      theme: ThemeData(
        primarySwatch: Constants.anaRenk,
        //*sabitler sinifimizda artik rengi degistirisek anaregi nerde kulladiysak hepsi degisecektir tek tek ugras yook!!
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //*visualDensity diger platformlarda da o ortama uygun sekilde gorunmesini istedik
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}
