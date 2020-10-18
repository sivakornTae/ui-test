import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _loginForm = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpeg'),
              colorFilter: new ColorFilter.mode(
                  Colors.brown[900].withOpacity(0.6), BlendMode.srcATop),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _loginForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'images/coffee-bean-icon.png',
                      ),
                      radius: 75,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: 'Email')),
                  SizedBox(height: 20),
                  TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 7) {
                          return 'Password should be contained at least 7 characters.';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: 'Password')),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'LOGIN',
                    onPressed: () {
                      if (_loginForm.currentState.validate()) {
                        print(email);
                        print(password);
                        print('login Successed');
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomButton(
                    title: 'REGISTRATION',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 10.0),
  labelText: '',
  labelStyle: TextStyle(color: Colors.white, fontSize: 14),
  enabledBorder: UnderlineInputBorder(
    borderSide:
        BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide:
        BorderSide(color: Colors.white, width: 2, style: BorderStyle.solid),
  ),
);

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  CustomButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(title),
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
