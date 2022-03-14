import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';

class ViewCustomerList extends StatelessWidget {
  const ViewCustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MyDataBase.data.length,
        itemBuilder: (BuildContext context, int index) =>
           ListTile(
             hoverColor: Colors.redAccent,
             contentPadding: EdgeInsets.all(10),
            title: Text(MyDataBase.data[index]['CustomerName'],style: TextStyle(fontSize: 25),),
             subtitle: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment:CrossAxisAlignment.start,
               children: [
                 Text('email:   ${MyDataBase.data[index]['email']}',style: TextStyle(fontSize: 20,),),
                 Text('phone number:   ${MyDataBase.data[index]['CustomerMobileNo']}',style: TextStyle(fontSize: 20),),
                 Text('No of cylinder issue: ${MyDataBase.data[index]['NoOfIssueCylinder']}',style: TextStyle(fontSize: 20,),)
               ],
             ),
           ),


      ),
    );
  }
}

