import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import '../helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double harfDropDownsecilenDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade200.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 20,
        iconEnabledColor: Constants.anaRenk.shade300,
        value: harfDropDownsecilenDeger,
        onChanged: (deger) {
          setState(() {
            harfDropDownsecilenDeger = deger!;
            widget.onHarfSecildi(harfDropDownsecilenDeger);
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
      ),
    );
  }
}
