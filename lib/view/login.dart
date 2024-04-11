//
// TELA login
// Stateful = stf + TAB

import 'package:flutter/material.dart';
import 'package:list_on/style/textFieldStyle.dart';
import 'package:list_on/style/btnLogin.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            
            // CAMPO DE TEXTO
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    //Associar o atributo
                    controller: txtValor1,
                    validator: (value){
                              if (value!.trim().isEmpty) {
                                return 'Informe um nome';
                              }
                              return null;
                            },
                    style:  TextStyle(fontFamily: 'robot', fontSize: 24),
                    decoration: getAuthenticationInputDecoration("E-mail"),
                    
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            // CAMPO DE TEXTO
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: txtValor2,
                    validator: (value){
                              if (value!.trim().isEmpty) {
                                return 'Digite a senha';
                              }
                              return null;
                            },
                    obscureText: true,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 24),
                    decoration: (getAuthenticationInputDecoration("Senha")
                    ),
                  ),
          ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Expanded(child: Divider(
                      color: Color.fromARGB(255, 110, 109, 109)
                    ),
                  ),
                  Text(
                    'Ou continue com',
                    style: TextStyle(
                      color: Color.fromARGB(255, 105, 179, 240), // Altere a cor aqui
                    ),
                  ),
                  Expanded(child: Divider(
                        color: Color.fromARGB(255, 110, 109, 109)
                      ),
                    ),
              ],
            ),

            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child:ElevatedButton(
                  onPressed: (){
                  
                  }, 
                  child: Icon(Icons.crop_square, size: 40,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300]
                  ),
                ),
                )
              ],
            ),
            const SizedBox(height: 30,),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: getBtn('Entrar', context)),
              ],
            ),
            SizedBox(height: 15),
            
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: getBtn('limpar', context),)
              ],
            ),*/
            
          ],
        ),
      ),
    );
  }
}