import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'first_screen.dart';
import 'first_screenemail.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Text(
                    'Hello.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(width: 20),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
      autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              validator: (email) {
                return email.isEmpty ? "*Mohon diisi" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              validator: (password) {
                return password.isEmpty ? "*Mohon diisi" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20, width: 10),
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () {
                signInEmail(emailController.text, passwordController.text)
                    .then((result) {
                  if (result != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FirstScreenEmail();
                    }));
                  }
                });
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.blue),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              borderSide: BorderSide(color: Colors.grey),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'OR',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: OutlineButton(
              onPressed: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstScreen();
                        },
                      ),
                    );
                  }
                });
              },
              child: Text(
                'Sign with Google',
                style: TextStyle(color: Colors.blue),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              borderSide: BorderSide(color: Colors.grey),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
