import 'package:flutter/material.dart';



ElevatedButton getBtn(String string, context) {
  switch (string) {
    case 'Entrar':
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
          context,
          'listasDeCompras', 
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 25,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo do botão
          textStyle: TextStyle(color: Colors.white, fontSize: 25,), // Cor do texto do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada do botão
          ),
          minimumSize: Size(180, 50),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.blue.shade900,
        ),
        child: Text('Entrar'),
      );
      break;

    case 'limpar':
      return ElevatedButton(
        onPressed: () {
          // Adicione sua lógica de ação aqui
        },
        style: ElevatedButton.styleFrom(
          elevation: 25,
          backgroundColor: const Color.fromARGB(255, 174, 174, 174), // Cor de fundo do botão
          textStyle: TextStyle(color: Colors.white, fontSize: 25,), // Cor do texto do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada do botão
          ),
          minimumSize: Size(180, 50),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color.fromARGB(255, 152, 152, 152),
        ),
        child: Text('limpar'),
      );
      break;


    default:
      return ElevatedButton(
        onPressed: () {
          // Adicione sua lógica de ação aqui
        },
        style: ElevatedButton.styleFrom(
         // primary: Colors.green, // Cor de fundo do botão
          textStyle: TextStyle(color: Colors.white), // Cor do texto do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada do botão
          ),
        ),
        child: Text('Texto padrão'),
      );
  }
}
