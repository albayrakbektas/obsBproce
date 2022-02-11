import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsChildComponent extends StatefulWidget {
  const ContactUsChildComponent({Key? key}) : super(key: key);

  @override
  State<ContactUsChildComponent> createState() =>
      _ContactUsChildComponentState();
}

class _ContactUsChildComponentState extends State<ContactUsChildComponent> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  void dispose() {
    subjectController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  // late Email email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Konuyu Yaziniz'),
                  minLines: 2,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(
                      hintText: 'Mesajinizi  Yaziniz',
                      border: OutlineInputBorder()),
                  minLines: 10,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: deviceHeight(context) * 0.07,
                  width: deviceWidth(context),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                    ),
                    child: const Text(
                      'Gonder',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      // await FlutterEmailSender.send(email = Email(
                      //   body: bodyController.text,
                      //   subject: subjectController.text,
                      //   recipients: ['a@gmail.com'],
                      //   isHTML: false,
                      // ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
