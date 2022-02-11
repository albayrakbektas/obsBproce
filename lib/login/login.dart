import 'package:flutter/material.dart';
import 'package:obs_bproce/home/main.dart';
import '../api/api_service.dart';
import '../globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'new_password.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  set myVariable(value) => myVariable = value;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  String? invalidUserNameText = null;
  String? invalidPasswordText = null;
  late bool _isLoading;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    invalidUserNameText;
    invalidPasswordText;
    _obscureText = true;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'Matematik Bölümü',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.2,
                      vertical: deviceHeight(context) * 0.02),
                  child: TextFormField(
                    autofocus: true,
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Öğrenci Numarası',
                      errorText: invalidUserNameText,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.2,
                      vertical: deviceHeight(context) * 0.02),
                  child: SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: invalidPasswordText,
                        labelText: 'Şifre',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Password()));
                  },
                  child: const Text(
                    'Şifre Talep',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: deviceHeight(context) * 0.05,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                      ),
                      child: const Text(
                        'Giriş',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (!(userNameController.text.length == 10)) {
                          setState(() {
                            invalidUserNameText =
                                "Öğrenci numarası 10 karakterden oluşmalıdır.";
                            invalidPasswordText = null;
                          });
                        } else if (!(passwordController.text.length == 6)) {
                          setState(() {
                            invalidUserNameText = null;
                            invalidPasswordText =
                                'Şifre 6 karakterden oluşmalıdır.';
                          });
                        } else if (userNameController.text == '') {
                          setState(() {
                            invalidPasswordText = null;
                            invalidUserNameText = 'Öğrenci numarası giriniz..';
                          });
                        } else if (passwordController.text == '') {
                          setState(() {
                            invalidUserNameText = null;
                            invalidPasswordText = 'Şifre giriniz..';
                          });
                        } else {
                          setState(() {
                            _isLoading = true;
                            invalidUserNameText = null;
                            invalidPasswordText = null;
                          });
                          login(userNameController.text,
                                  passwordController.text)
                              .then(
                            (value) => {
                              setState(() {
                                _isLoading = true;
                                Student = value.nesne;
                              }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              ),
                              setState(() {
                                _isLoading = false;
                              })
                            },
                          )
                              .catchError(
                            (onError) {
                              setState(() {
                                _isLoading = false;
                              });
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Kullanıcı Bulunamadı'),
                                  content: const Text(
                                      'Lütfen geçerli öğrenci numarası ya da şifre giriniz.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('TAMAM'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                if (_isLoading)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: deviceHeight(context) * 0.05,
                      width: 150,
                      child: SpinKitWave(
                        color: Colors.blue,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
