import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter_ortalama_hesapla/model/ders.dart';
import 'package:flutter_ortalama_hesapla/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double harfDropDownsecilenDeger = 4;
  double krediDropDownSecilenDeger = 1;
  late String girilenDersAdi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.baslikText,
            style: Constants.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //*Form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
          //*Liste
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Text("Liste Buraya Gelecek"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: _buildKrediler(),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: const Icon(Icons.arrow_forward_sharp),
                color: Constants.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (gelenDeger) {
        if (gelenDeger!.isEmpty) {
          return "Ders Adini Giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.5),
      ),
    );
  }

  Widget _buildHarfler() {
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
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
      ),
    );
  }

  Widget _buildKrediler() {
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
        underline: Container(),
        value: krediDropDownSecilenDeger,
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (deger) {
          setState(() {
            krediDropDownSecilenDeger = deger!;
          });
        },
      ),
    );
  }

  _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          dersAdi: girilenDersAdi,
          harfDegeri: harfDropDownsecilenDeger,
          krediDegeri: krediDropDownSecilenDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
