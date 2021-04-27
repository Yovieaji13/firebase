import 'package:flutter/material.dart';
import 'login_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
              FlutterLogo(size: 200),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  splashColor: Colors.grey,
                  onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => LoginPage());
                Navigator.push(context, route);                    
                  },
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Start Firebase',
                    style: TextStyle(color: Colors.blue),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    
                  ),
                  color: Colors.white,
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
