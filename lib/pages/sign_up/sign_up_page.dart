import 'dart:convert';
import 'package:firebase_learning/pages/sign_up/sign_up_service.dart';
import 'package:firebase_learning/shared/models/login_model.dart';
import 'package:firebase_learning/values/custom_colors.dart';
import 'package:firebase_learning/shared/constants/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Color topColor = Colors.blue;
  Color bottomColor = Color.fromARGB(255, 212, 247, 255);

  bool _showPassword = false;
  bool _obscure_Text = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColors().getGradienteSecColor(),
              CustomColors().getGradienteMainColor()
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/net2.png",
                height: 200,
              ),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              const Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(

                        controller: _nameInputController,
                        autofocus: true,
                        decoration: const InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.attribution,
                              color: Colors.white,
                              size: 26,
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 5) {
                            return "Esse e-mail parece curto demais";
                          } else if (!value.contains("@")) {
                            return "Esse e-mail está meio estranho, não?";
                          }
                          return null;
                        },
                        controller: _mailInputController,
                        autofocus: true,
                        decoration: const InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 6) {
                            return "A senha deve ter pelo menos 6 caracteres";
                          }
                          return null;
                        },
                        controller: _passwordInputController,
                        obscureText: _obscure_Text,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.vpn_key_sharp,
                              color: Colors.white,
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                      (_showPassword == false)
                          ? TextFormField(
                              controller: _confirmInputController,
                              obscureText: _obscure_Text,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: "Confirme sua Senha",
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.vpn_key_sharp,
                                    color: Colors.white,
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  )),
                            )
                          : Container(),
                      Row(
                        children: [
                          Checkbox(
                            value: _showPassword,
                            onChanged: (value) {
                              setState(() {
                                _showPassword = value!;
                                if (_obscure_Text == true) {
                                  _obscure_Text = false;
                                } else {
                                  _obscure_Text = true;
                                }
                                print(_showPassword);
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Text(
                            "Mostrar senha",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    _doSignUp();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Estou pronto!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: CustomColors().getActiveConfirmButton(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService()
          .signUp(_mailInputController.text, _passwordInputController.text);
      print("Válido, _formKey != null !");
    } else {
      print("invalido, _formKey null");
    }

    /*LoginModel newUser = LoginModel(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );

    print(newUser);
    _saveUser(newUser);*/
  }



  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.activeUser, json.encode(user.toJson()),
    );
  }

}
