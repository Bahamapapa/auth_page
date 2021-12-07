import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(height: 60, ),
              SizedBox(width: 120, height: 120, child: Image.asset('assets/images/logo.png'), ),
              SizedBox(height: 20,),
              Text("Введите номер телефона"),
              SizedBox(height: 20,),
              SizedBox(width: 224,
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.blue,
                      labelText: "Телефон",
                    ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(width: 224,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.blue,
                    labelText: "Пароль",
                  ),
                ),
              ),
              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42, child: ElevatedButton(onPressed: () {}, child: Text('Войти'))),
              SizedBox(height: 62,),
              InkWell(child: Text('Регистрация'), onTap: () {}),
              SizedBox(height: 20,),
              InkWell(child: Text('Забыли пароль?'), onTap: () {}),

        ],),
      )
      ),
    );
  }
}


