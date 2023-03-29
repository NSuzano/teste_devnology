import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../controller/http.dart';
import '../model/clients.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import 'mainPage.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController controllernome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllersenha = TextEditingController();
  Http http = Http();
  final _formKey = GlobalKey<FormState>();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Sucesso"),
          content: new Text("Usuário Salvo"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new ElevatedButton(
              child: new Text("Voltar para Login"),
              onPressed: () {
                Get.to(LoginPage());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Olá!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cadastro!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite um nome';
                          }
                          return null;
                        },
                        controller: controllernome,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Nome'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite um email';
                          } else {
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (emailValid == false) {
                              return "Digite um email válido";
                            }
                          }
                          return null;
                        },
                        controller: controllerEmail,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite uma senha';
                          }
                          return null;
                        },
                        controller: controllersenha,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Senha'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LightColor.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        Clients client = Clients(controllernome.text,
                            controllerEmail.text, controllersenha.text);

                        await http.postClientRequest(client);

                        _showDialog();
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: AppTheme.h3Style,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
