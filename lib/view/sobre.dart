//
// TELA login
// Stateful = stf + TAB
import 'package:flutter/material.dart';


class sobreView extends StatefulWidget {
  const sobreView({super.key});

  @override
  State<sobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<sobreView> {
  var title1 = 'List';
  var title2 = 'O';
  var title3 = 'n';

  var resultado = '';

  //Atributos para leitura dos valores dos Campos de Texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //Espaçamento com o mesmo valor nas 4 extremidades
        //padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Center(
                child: Text(
                  title1,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 17, 17, 17),
                  ),
                ),
              ),
              Center(
                child: Text(
                  title2,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              Center(
                child: Text(
                  title3,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              ]
            ),
            const Text(
              "ListOn é um aplicativo de lista de compras, onde podemos criar uma lista de compra para nossa semana ou até mesmo para feira do mês. \n\nTem como um dos focos ser intuitivo e simples",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30,),
            const Text(
              "By Janio Warlem",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 200,),
            ClipOval(
                        child: Material(
                          color: Colors.blue, // Button color
                          child: InkWell(
                            splashColor:  Color.fromARGB(255, 132, 174, 237), // Splash color
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(width: 56, height: 56, child: Icon(Icons.reply)),
                          ),
                        ),
                      ),
          ]
          ),
      ),
    );
  }
}