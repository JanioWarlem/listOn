// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:list_on/Model/DataListaCompra.dart';
import 'package:list_on/view/ListasDeCompras.dart';
import 'package:list_on/view/listaDeCompra.dart';
import 'package:list_on/view/sobre.dart';
import 'package:provider/provider.dart';

import 'view/login.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
            create: (_) => DataListaCompra(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ListOn',
              home: LoginView(),
              initialRoute: 'login',
              routes: {
                'login':(context) => LoginView(),
                'listasDeCompras':(context) => listasDeComprasView(),
                'listaDecompra':(context) => listaDeCompraView(),
                'sobre':(context) => sobreView()
              },
            ),
      );
  }
}

