import 'package:flutter/material.dart';

///Variável 
bool _showPassword  = false;


InputDecoration getAuthenticationInputDecoration(String label){
  return InputDecoration(
    hintText: label, hintStyle: TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
    labelStyle: TextStyle(fontSize: 15,),
    border: OutlineInputBorder(),
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Color.fromARGB(255, 143, 143, 143))
      ),
  );
}
