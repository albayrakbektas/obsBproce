import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const Password());
}

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text('Sifre Talep'),
          ),
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.2,
                        vertical: deviceHeight(context) * 0.02),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Numaran',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.2,
                        vertical: deviceHeight(context) * 0.02),
                    child: const SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mail Adresin',
                        ),
                      ),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'Sifre Talep',
                  //     style: TextStyle(
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: deviceHeight(context) * 0.05,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                        ),
                        child: const Text('Sifre Olustur'),
                        onPressed: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => const Home()),
                          //     (route) => false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
