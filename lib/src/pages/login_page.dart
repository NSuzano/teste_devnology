import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/sign_in_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:get/get.dart';

import '../controller/http.dart';
import '../themes/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          title: new Text("Erro"),
          content: new Text("Email/Senha não encontrado"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new ElevatedButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
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
                  'Bem Vindo!',
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
                            return 'Digite um email';
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
                            return 'Digite uma Senha';
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
                        print(controllerEmail.text);

                        int id = await http.checkUserRequest(
                            controllerEmail.text, controllersenha.text);

                        if (id != 0) {
                          print("ID: $id");
                          Get.to(MainPage(), arguments: id);
                        } else {
                          _showDialog();
                          print("NAO");
                        }
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: AppTheme.h3Style,
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Não tem cadastro?"),
                    TextButton(
                        onPressed: () {
                          Get.to(SignInPage());
                        },
                        child: Text('Registre -se agora')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
