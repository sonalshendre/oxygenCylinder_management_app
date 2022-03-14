import 'dart:async';


import 'package:flutter/material.dart';
import 'package:oxygen_management_app/customerlist.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';
import 'package:oxygen_management_app/searchCustomer.dart';
import 'package:oxygen_management_app/userEntryPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
String cylinder='';
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    MyDataBase.selectData();
    MyDataBase.selectDataCylinder().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {
          print('**********');
          cylinder =
          MyDataBase.dataCylinder.isNotEmpty ? MyDataBase.dataCylinder[0] : '0';
        });
      });
    });
  }

  int lengthd = MyDataBase.dataCylinder.length;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.redAccent,
          child: TabBar(
            controller: tabController,
            tabs: [
              Column(
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  Text(
                    'homeScreen',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.library_add, color: Colors.white),
                  Text(
                    'Entry',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.upload_file, color: Colors.white),
                  Text(
                    'Update',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.storage, color: Colors.white),
                  Text(
                    'List',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              height: 200,
              child: Center(
                  child: Text(
                'No of Cylinder available : ${cylinder}',
                style: TextStyle(fontSize: 25),
              )),
            ),
            UserEntryDemo(),
            SearchCustomerDemo(),
            ViewCustomerList(),
          ],
        ),
      ),
    );
  }
}
