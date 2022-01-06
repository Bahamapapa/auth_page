import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: FlutterDemo(storage: LoginStorage()),

    );
  }
}

class LoginStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/login.txt');
  }

  Future<String> readLogin() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return empty string
      return "";
    }
  }

  Future<File> writeLogin(String login) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$login');
  }
}

class FlutterDemo extends StatefulWidget{
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final LoginStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  String _login = "";

  @override
  void initState() {
    super.initState();
    widget.storage.readLogin().then((value) {
      setState(() {
        _login = value;
        myController.text = _login;
      });
    });
  }

  Future<File> _setLogin() {
    setState(() {
    });

    // Write the variable as a string to the file.
    _login = myController.text;
/*    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the that user has entered by using the
            // TextEditingController.
            content: Text("Логин ${myController.text} успешно сохранен"),
          );}
    );*/
    return widget.storage.writeLogin(_login);

  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0)
    );
    return Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(children: [
            SizedBox(height: 60,),
            SizedBox(width: 120,
              height: 120,
              child: Image.asset('assets/images/logo.png'),),
            SizedBox(height: 20,),
            Text("Введите логин",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
            SizedBox(height: 20,),
            SizedBox(width: 224,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  labelText: "Логин",
                ),
                controller: myController,
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(width: 224,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  labelText: "Пароль",
                ),
              ),
            ),
            SizedBox(height: 28,),
            SizedBox(width: 154, height: 42,
                child: ElevatedButton(
                  onPressed: _setLogin,
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )
            ),
            //SizedBox(height: 32,),
            //InkWell(child: const Text('Регистрация',
            //  style: linkTextStyle,
            //),
            //    onTap: () {}),
            //SizedBox(height: 20,),
            //InkWell(child: const Text('Забыли пароль?',
            //  style: linkTextStyle,
            //), onTap: () {}),

          ],),
        )
    );
  }
}

