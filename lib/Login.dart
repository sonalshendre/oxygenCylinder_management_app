import 'package:flutter/material.dart';

import 'common/commonTextFied.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,


          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                // controller:widget.adminEmailController,
                decoration: CommonTextFieldStyle.inputField(lable: 'Email Id'),
              ),
              TextFormField(
                //controller:widget.adminPasswordController,
                decoration: CommonTextFieldStyle.inputField(lable: 'Company Name'),
              ),
              MaterialButton(color: Colors.blue ,child: Text('Login', style: TextStyle(color: Colors.white),), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
