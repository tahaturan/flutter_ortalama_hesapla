import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seciniz",
          style: Constants.ortalamaTextStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0.0",
          style: Constants.ortalamaStyle,
        ),
        Text(
          "ortalama",
          style: Constants.ortalamaTextStyle,
        ),
      ],
    );
  }
}
