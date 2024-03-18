import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:registration_page/QR.dart';
import 'package:registration_page/registration.dart';
import 'package:http/http.dart' as http;
// import 'package:registration_page/scanner.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController roll = TextEditingController();
  TextEditingController password = TextEditingController();
  void login() async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'rollno': roll.text,
          'password': password.text
        }));
    var data= jsonDecode(response.body);
    print(data["message"]);
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QR(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: roll,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                  ),
                  hintText: 'Enter your Roll no',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
              login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  login();
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Reg(),
                    ));
              },
              child: Text(
                "Don't have an account? Register now",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
