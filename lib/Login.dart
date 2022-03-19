import 'package:flutter/material.dart';
import 'package:oxygen_management_app/shared_perference_demo.dart';

import 'Register_page.dart';
import 'common/commonTextFied.dart';
import 'homepage.dart';

class LoginAdminPage extends StatefulWidget {
   LoginAdminPage({Key? key}) : super(key: key);
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  String password = SharedPeferrenceDemo.getData(key: 'password')??'';
  String email = SharedPeferrenceDemo.getData(key: 'email')??'';
  String company = SharedPeferrenceDemo.getData(key: 'company')??'';

  @override
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  'https://cdn-icons-png.flaticon.com/128/3782/3782074.png'),
                // Text(email),
              //Text(password),
              TextFormField(

                 controller:widget.adminEmailController,
                decoration: CommonTextFieldStyle.inputField(lable: 'Email Id'),
              ),
              TextFormField(
                controller:widget.adminPasswordController,
                decoration: CommonTextFieldStyle.inputField(lable: 'Password'),
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),

                  onPressed: () {
                    SharedPeferrenceDemo.addBoolData(key: 'login',value: true);
                   if(widget.adminEmailController.text == email &&  widget.adminPasswordController.text == password){
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (context) => HomePage()));
                   }
                   else{
                     showDialog(context: context, builder: (context){
                       return AlertDialog(title: Text('Enter valid password'),);
                     });
                   }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create Accout first?'),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminRegisterPage()));
                      },
                      child: Text(
                        " Register...",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.dashed),
                      ))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
