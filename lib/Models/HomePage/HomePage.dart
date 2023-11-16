import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_targetsistemas/controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _anotacao = TextEditingController();
  final controller = Controller();
  final title = "Texto 01";
  String anotacao = '';

  void _newString() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('anotacao', anotacao);
    setState(() {
      anotacao = _anotacao.text;
    });
  }

  void cleartext() {
    _anotacao.clear();
  }

  @override
  void initState() {
    _lersave();
    super.initState();
  }

  _lersave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      anotacao = (prefs.getString('anotacao') ?? 'vazio');
    });
  }

  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 100, 38, 10),
                child: Container(
                  height: 350,
                  width: 800,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 4),
                          blurRadius: 2.0,
                          spreadRadius: 1.4,
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(78, 10, 0, 10),
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.create)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                            child: IconButton(
                                onPressed: () {
                                  QuickAlert.show(
                                      onCancelBtnTap: () {
                                        Navigator.pop(context);
                                      },
                                      onConfirmBtnTap: () {
                                        setState(() {
                                          anotacao = "";
                                          cleartext();
                                          Navigator.pop(context);
                                        });
                                      },
                                      title: 'Tem certeza que deseja excluir?',
                                      confirmBtnText: 'Sim',
                                      cancelBtnText: 'Não',
                                      context: context,
                                      type: QuickAlertType.confirm);
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                )),
                          ),
                        ]),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            topRight: Radius.circular(18.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [Text(anotacao)],
                          ),
                        ),
                        height: 287,
                        width: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(18.0),
                            bottomRight: Radius.circular(18.0),
                          ),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 80, 38, 30),
                child: RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (event) {
                    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                      if (_anotacao.text == '') {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: "Prencha o texto!",
                        );
                      } else {
                        _newString();
                      }
                    }
                  },
                  child: TextFormField(
                    controller: _anotacao,
                    textInputAction: TextInputAction.go,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    onChanged: controller.changeAnotacao,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      labelText: "Digite seu Texto",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Prencha o texto!";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 10, 90, 0),
                child: TextButton(
                    onPressed: abrirUrl,
                    child: Text('Política de privacidade')),
              )
            ],
          )),
        ),
      );
    });
  }
}

void abrirUrl() async {
    const url = 'https://google.com.br/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }