import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter_ortalama_hesapla/model/ders.dart';
import 'package:flutter_ortalama_hesapla/widgets/bos_liste_gorunumu.dart';

class DersListesi extends StatefulWidget {
  DersListesi({Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> eklenenDerslerListesi = DataHelper.tumEklenenDersler;
    return eklenenDerslerListesi.isNotEmpty
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (BuildContext context, int index) {
              Ders ders = DataHelper.tumEklenenDersler[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (yon) {
                  eklenenDerslerListesi.removeAt(index);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(ders.dersAdi),
                      subtitle: Text(
                        "Kredi: ${ders.krediDegeri.toStringAsFixed(0)} Harf Notu: ${DataHelper.notuHarfeCevir(ders.harfDegeri.toString())}",
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Constants.anaRenk,
                        child: Text("${index + 1}"),
                      ),
                      trailing: Constants.cardTrailingIcon,
                    ),
                  ),
                ),
              );
            },
          )
        : BosListeGorunumu();
  }
}
