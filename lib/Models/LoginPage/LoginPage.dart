import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final user = TextEditingController();
  final senha = TextEditingController();
  bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formfield,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text("Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli')),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 80, 38, 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    controller: user,
                    decoration: InputDecoration(
                      prefixStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36)),
                      labelText: "Usuario",
                    ),
                    validator: (value) {
                      final exp = RegExp(r"^.*[^\s]$");
                      if (value!.isEmpty) {
                        return "Informe seu Usuario!";
                      } else if (value.length > 20) {
                        return 'Seu Usuario deve ter no maximo 20 digitos';
                      } else if (value.length < 2) {
                        return 'Seu Usuario deve ter no minimo 2 digitos';
                      } else if (!exp.hasMatch(value)) {
                        return 'Não é permitido o uso de espaço no final';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 20, 38, 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    controller: senha,
                    obscureText: _isobscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: EdgeInsetsDirectional.only(end: 20),
                        icon: _isobscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isobscure = !_isobscure;
                          });
                        },
                      ),
                      prefixStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36)),
                      labelText: "Senha",
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      final exp = RegExp(r"^.*[^\s]$");
                      final exp2 = RegExp(r"[^0-9a-zA-Z]");
                      if (value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if (value.length < 2) {
                        return 'Sua senha deve ter no mínimo 2 digitos';
                      } else if (value.length > 20) {
                        return 'Sua senha deve ter no maximo 20 digitos';
                      } else if (!exp.hasMatch(value)) {
                        return 'Não é permitido o uso de espaço no final';
                      } else if (exp2.hasMatch(value)) {
                        return 'Não é permitido o uso de caracteres especiais!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 50, 90, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 4),
                            blurRadius: 2.0,
                            spreadRadius: 1.4,
                          ),
                        ]),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)))),
                      onPressed: () {
                        if (_formfield.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,'/home'
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding:const EdgeInsets.fromLTRB(90, 50, 90, 0),
                child: TextButton(onPressed: abrirUrl,
                child: Text('Política de privacidade')), )
              ],
            ),
          ),
        ),
      ),
    );
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
