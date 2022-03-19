import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';
import 'package:oxygen_management_app/homepage.dart';
import 'package:oxygen_management_app/returnCylinderUpdate.dart';

import 'common/commonTextFied.dart';

class SearchCustomerDemo extends StatefulWidget {
  const SearchCustomerDemo({Key? key}) : super(key: key);

  @override
  _SearchCustomerDemoState createState() => _SearchCustomerDemoState();
}

class _SearchCustomerDemoState extends State<SearchCustomerDemo> {
  TextEditingController searchfieldController = TextEditingController();

  String name = '';
  String email = '';
  String noOfIssueCylinder = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(height: 10,),
          TextField(
            controller: searchfieldController,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.blueAccent,
              ),
              label: Text(
                'Enter Customer Name',
                style: TextStyle(color: Colors.blue),
              ),
              filled: true,
              fillColor: Color(0xffc8e6c9),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              print(MyDataBase.finalData);
              MyDataBase.data.clear();
              MyDataBase.finalData.forEach((element) {
                if (element['CustomerName']
                    .contains(searchfieldController.text)) {
                  MyDataBase.data.add(element);
                }
              });

              setState(() {});
            },
            child: Text(
              'search',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: MyDataBase.data.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => ListTile(
              minVerticalPadding: 20,
              onTap: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => ReturnCylinderUpdatedemo(
                      customerName: MyDataBase.data[index]['CustomerName'],
                      email: MyDataBase.data[index]['email'],
                      keyCu: MyDataBase.data[index]['key'],
                      numOfCylinder: MyDataBase.data[index]
                          ['NoOfIssueCylinder'],
                    ),
                  ),
                )
                    .then((value) {
                  Timer(Duration(seconds: 3), () {
                    setState(() {});
                  });
                });
              },
              title: Text(
                '  ${MyDataBase.data[index]['CustomerName']}  ',
                style: styles(
                  fosize: 25,
                  fbcolor: Color(0xffc8e6c9),
                  focolor: Colors.deepPurple,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email.id:     ${MyDataBase.data[index]['email']}',
                    style: styles(fosize: 20,),
                  ),
                  Text(
                      'phone Number:   ${MyDataBase.data[index]['CustomerMobileNo']}',style: styles(fosize: 20,),),
                  Text(
                      'No of issuse cylinder:  ${MyDataBase.data[index]['NoOfIssueCylinder']}',style: styles(fosize: 20,),),
                ],
              ),
            ),
          )),
        ]),
      ),
    ));
  }
}

TextStyle styles(
    {double fosize = 23,
    Color focolor = Colors.blue,
    Color fbcolor = Colors.white}) {
  return TextStyle(
    fontSize: fosize,
    color: focolor,
    backgroundColor: fbcolor,
  );
}
