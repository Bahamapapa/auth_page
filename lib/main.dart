import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(height: 60, ),
              SizedBox(width: 120, height: 120, child: Image.asset('assets/images/logo.png'), ),
              SizedBox(height: 20,),
              Text("Введите номер телефона",
              style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
              SizedBox(height: 20,),
              SizedBox(width: 224,
                child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      labelText: "Телефон",
                    ),
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
                  child: ElevatedButton(onPressed: () {},
                    child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                  ),
          )
      ),
              SizedBox(height: 32,),
              InkWell(child: const Text('Регистрация',
                  style: linkTextStyle,
              ),
                onTap: () {}),
              SizedBox(height: 20,),
              InkWell(child: const Text('Забыли пароль?',
                  style: linkTextStyle,
              ), onTap: () {}),

        ],),
      )
      ),
    );
  }
}


