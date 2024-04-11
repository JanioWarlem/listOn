import 'package:flutter/material.dart';
import 'package:list_on/Model/ListasCompras.dart';
import 'package:list_on/Model/itemList.dart';

class DataListaCompra extends ChangeNotifier {

  final List<item> dataItendListaDecompras = [];
  final List<itemListaDecompras> dataListasDeCompras = [];



  //Adicionar listas de compras 
  int addDataListasDeCompras(itemListaDecompras compraList){
    int temp = 0;
    for(int i=0; i < dataListasDeCompras.length; i++){
      if( dataListasDeCompras[i].nome.toUpperCase().trim() == compraList.nome.toUpperCase().trim()){
        temp = 1;
      }
    }
    if (temp==1){

      return 1;
    }else{
      dataListasDeCompras.add(compraList);
      notifyListeners();
      return 0;
    }
  }
  List<itemListaDecompras> get getListasCompras => dataListasDeCompras;

void setIsChecked(bool value, int indexListasCompras, int indexItem){
    dataListasDeCompras[indexListasCompras].listaCompras[indexItem].isChecked = value;
    notifyListeners();
}

//adicionar item a lista de compra
  int addDataItemListasDeCompras(int index,item itemList){
    int temp = 0;
    for(int i=0; i< dataListasDeCompras[index].listaCompras.length; i++){
      if (dataListasDeCompras[index].listaCompras[i].nome.trim().toUpperCase() == itemList.nome.trim().toUpperCase()){
      temp = 1;
    }
    }
    if(temp ==0){
      dataListasDeCompras[index].listaCompras.add(itemList);
      notifyListeners();
      return 0;
    }else{
      return 1;
    }
  }
  
  List<item> getItensListaCompras(int index) {
      return dataListasDeCompras[index].listaCompras;
  }

  int EditListasCompras(int index, String value){
    int temp = 0;
    for(int i=0; i< dataListasDeCompras.length; i++){
      if(dataListasDeCompras[i].nome.toUpperCase().trim() == value.toUpperCase().trim()){
        temp = 1;
      }
    }

    if (temp==1){

      return 1;
    }else{
      dataListasDeCompras[index].nome = value;
      notifyListeners();
      return 0;
    }
  }


  int editItemListaCompra(int index1, int index2, String value, int quantidade){
    int temp = 0;
    for(int i=0; i < dataListasDeCompras[index1].listaCompras.length; i++){
      if(dataListasDeCompras[index1].listaCompras[i].nome.trim().toUpperCase() == value.trim().toUpperCase()){
        temp =  1;
      }
    }
    if(temp == 0){
      dataListasDeCompras[index1].listaCompras[index2].nome = value;
      dataListasDeCompras[index1].listaCompras[index2].quantidade = quantidade;
      notifyListeners();
      return 0;
    }else{
      return 1;
    }
    
  }
}