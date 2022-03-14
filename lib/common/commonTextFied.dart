
import 'package:flutter/material.dart';

class CommonTextFieldStyle{



    static InputDecoration inputField({
    String hintext = '',
    String lable = '',
    String? errorT = null,
  }) {
    return InputDecoration(
      hintText: hintext,
      label: Text(
        lable,
        style: TextStyle(color: Colors.black),
      ),
      errorText: errorT,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 5,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          )),
    );
  }


}