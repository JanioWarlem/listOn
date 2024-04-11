import 'package:list_on/Model/itemList.dart';

// ignore: camel_case_types
class itemListaDecompras{
  String nome;

  List<item> listaCompras = [];

  void addCompras(item item){
    listaCompras.add(item);
  }

  itemListaDecompras(this.nome);
}