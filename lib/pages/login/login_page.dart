import 'package:firebase_learning/pages/login/login_service.dart';
import 'package:firebase_learning/pages/sign_up/sign_up_page.dart';
import 'package:firebase_learning/values/custom_colors.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color topColor = Colors.blue;
  Color bottomColor = Color.fromARGB(255, 212, 247, 255);
  bool _showPassword = false;

  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              CustomColors().getGradienteMainColor(),
              CustomColors().getGradienteSecColor()
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
                "Entrar",
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
                            errorStyle: TextStyle(color: Color.fromARGB(250,
                                233, 190, 255)),
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
                          if(value!.length < 6){
                            return "A senha menor que 6 dígitos";
                          }
                          return null;
                        },
                        obscureText: !_showPassword,
                        controller: _passwordInputController,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Color.fromARGB(250,
                                233, 190, 255)),
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

                      Row(
                        children: [
                          Checkbox(
                            value: _showPassword,
                            onChanged: (value) {
                              setState(() {
                                _showPassword = value!;
                                print(_showPassword);
                              });
                            },
                          ),
                          const Text(
                            "Mostrar senha",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                    ],
                  )),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors().getActivePrimaryColor(),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
              const Text(
                "Ainda não tem uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: CustomColors().getActiveSecundaryColor(),
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

  void _doLogin() async {

    if (_formKey.currentState!.validate()) {
    //if (_formKey != null) {
      LoginService()
          .login(_mailInputController.text, _passwordInputController.text);
    } else {
      print("ERRO:::::> ao autenticar!");
    }
  }

  /*Future _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(Preferenceskeys.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }*/
}
