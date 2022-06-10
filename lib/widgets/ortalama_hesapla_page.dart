import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constants/app_constant.dart';
import 'package:flutter_ortalama_hesapla/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                const Expanded(
                  flex: 1,
                  child: OrtalamaGoster(dersSayisi: 1, ortalama: 4.5),
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
        ));
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_rounded),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
        ),
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
}
