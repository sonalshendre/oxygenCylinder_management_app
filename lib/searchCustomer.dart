import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';

import 'common/commonTextFied.dart';

class SearchCustomerDemo extends StatefulWidget {
  const SearchCustomerDemo({Key? key}) : super(key: key);

  @override
  _SearchCustomerDemoState createState() => _SearchCustomerDemoState();
}

class _SearchCustomerDemoState extends State<SearchCustomerDemo> {
  @override
  TextEditingController searchfieldController = TextEditingController();
  String name = '';
  String email = '';
  String noOfIssueCylinder = '';


  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextField(
            controller: searchfieldController,
            decoration: CommonTextFieldStyle.inputField(
              hintext: 'search....',
              lable: 'Search Customer Name:',
            ),
          ),
          MaterialButton(
            onPressed: () {
              print(MyDataBase.finalData);
              MyDataBase.data.clear();
              MyDataBase.finalData.forEach((element) {
                print('********${element['CustomerName']}');
                if(element['CustomerName'].contains(searchfieldController.text))
                  {
                    MyDataBase.data.add(element);
                  }
              });
              print(MyDataBase.data);
            },
            child: Text('search'),
          ),

        ]
      ),
    ));
  }
}
