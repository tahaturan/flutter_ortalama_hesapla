import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter_ortalama_hesapla/model/ders.dart';
import 'package:flutter_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:flutter_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:flutter_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
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
      resizeToAvoidBottomInset: false,
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
            child: DersListesi(
              onElemanCikarildiginda: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
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
                  child: HarfDropDownWidget(
                    onHarfSecildi: (secilenHarf) {
                      harfDropDownsecilenDeger = secilenHarf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: KrediDropDownWidget(
                    onKrediSecildi: (secilenKredi) {
                      krediDropDownSecilenDeger = secilenKredi;
                    },
                  ),
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
        hintText: "Ders Giriniz",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.5),
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
