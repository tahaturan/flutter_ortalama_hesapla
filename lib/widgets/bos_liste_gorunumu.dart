import 'package:flutter/material.dart';

import '../constants/app_constant.dart';

class BosListeGorunumu extends StatelessWidget {
  const BosListeGorunumu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Lutfen Ders Ekleyiniz",
        style: Constants.baslikStyle,
      ),
    );
  }
}
