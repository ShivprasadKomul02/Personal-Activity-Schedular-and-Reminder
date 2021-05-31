import 'package:flutter/material.dart';
import 'package:flutter_todolist/home.dart';

import 'util.dart';
import 'package:flutter_todolist/empty.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Hero(
                  tag: 'Clipboard',
                  child: Image.asset('assets/images/Clipboard.png'),
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          CustomColors.GreenLight,
                          CustomColors.GreenDark,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreenShadow,
                          blurRadius: 15.0,
                          spreadRadius: 7.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Center(
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
