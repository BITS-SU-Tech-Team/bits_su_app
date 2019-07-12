import 'package:flutter/material.dart';

void main() => runApp(Login());
Color bg = Color(0xff08599B);
Color buttonbg = Color(0xffFCAD01);
Color signingsbg = Color(0xffEFF4F8);
Color text = Color(0xff377DB6);
var HidePassword = true;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  hello() {
    print('whatsapp');
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image(
                  image: AssetImage('images/su.png'),
                ),
              ),
              Text(
                'Welcome!',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: Align(
                  alignment: Alignment(-0.8, 0.2),
                  child: Text(
                    'Student login',
                    style: TextStyle(
                      color: text,
                      fontSize: 20,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: RaisedButton(
                      elevation: 10,
                      color: buttonbg,
                      onPressed: () {
                        setState(() {
                          print('hello');
                        });
                      },
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            height: 50,
                            child: Image.asset(
                              'images/search.png',
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 120,
                            color: buttonbg,
                            child: Text(
                              'Login With BITS Mail',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment(-0.8, 0.2),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                    child: Text(
                      'Coordinator Login',
                      style: TextStyle(
                        color: text,
                        fontSize: 20,
                        fontFamily: 'CeraPro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 200,
                child: TextField(
                  decoration: new InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Username',
                  ),
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
                child: TextField(
                  obscureText: HidePassword,
                  decoration: new InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          HidePassword = !HidePassword;
                        });
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Password',
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: 250,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: RaisedButton(
                      color: buttonbg,
                      onPressed: () {
                        print('hello');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'CeraPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ))
            ]),
      ),
    ));
  }
}
