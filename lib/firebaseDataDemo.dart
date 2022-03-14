import 'package:firebase_database/firebase_database.dart';

class MyDataBase {
  static List<String> dataCylinder = [];
  static List<Map> data = [];
  static List<Map> finalData = [];
  static DatabaseReference db = FirebaseDatabase.instance.ref('customerInfo');
  static DatabaseReference dbadmin = FirebaseDatabase.instance.ref('admin');

  static Future insertDateCylinder(String noOfCylinder) async {
    //String keyc = db.push().key!;
    dbadmin.child('totalCylinder').set({
      'totalCylinder': noOfCylinder,
    }).then((value) {
      selectDataCylinder();
    });
  }

  static Future updateDateCylinder(String noOfCylinder) async {
    dbadmin.child('totalCylinder').update({
      'totalCylinder': noOfCylinder,
    }).then((value) {
      selectDataCylinder();
    });
  }

  static Future selectDataCylinder() async {
    Map temp = {};
    dbadmin.once().then((value) {
      temp = value.snapshot.value as Map;
      print('----$temp');
      temp.forEach((key, value) {
        dataCylinder.add(value['totalCylinder']);
      });
    });
  }

  static Future insertData(
      {String email = '',
      String name = '',
      String mobileNo = '',
      String noOfIssueCylinder = ''}) async {
    String key = db.push().key!;
    db.child(key).set({
      'key': key,
      'email': email,
      'CustomerName': name,
      'CustomerMobileNo': mobileNo,
      'NoOfIssueCylinder': noOfIssueCylinder
    }).then((value) {
      selectData();
    });
  }

  static Future selectData() async {
    Map temp = {};
    db.once().then((value) {
      temp = value.snapshot.value as Map;
      data.clear();
      finalData.clear();
      temp.forEach((key, value) {
        data.add(value);
        finalData.add(value);
      });
      print(' FINAL DATA :: ${finalData}');
    });
  }
}
