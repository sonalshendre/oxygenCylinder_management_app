
import 'package:flutter/material.dart';

class CommonTextFieldStyle{

    static InputDecoration inputField({
    String hintext = '',
    String lable = '',
    String? errorT = null,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xffc8e6c9),
      hintStyle: TextStyle(color: Colors.blue),
      hintText: hintext,
      label: Text(
        lable,
        style: TextStyle(color: Colors.blue),
      ),
      errorText: errorT,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.blue,
          style: BorderStyle.solid,
        ),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: Colors.blue,
          )),
    );
  }


}