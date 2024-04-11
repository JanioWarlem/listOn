// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:list_on/Model/itemList.dart';
import 'package:list_on/Model/DataListaCompra.dart';
import 'package:provider/provider.dart';

class listaDeCompraView extends StatefulWidget {
  const listaDeCompraView({super.key});

  @override
  State<listaDeCompraView> createState() => _listaDeCompraView();
}

class _listaDeCompraView extends State<listaDeCompraView> {

final TextEditingController textNomeCotroller = TextEditingController();
final TextEditingController textQuantidadeCotroller = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool isChecked = false;
final List<item> listaCompra = [];


  @override
  Widget build(BuildContext context) {
    int indexListas = ModalRoute.of(context)!.settings.arguments as int;

    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text('List'),
          Text('O', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          Text('n')
        ]),
        elevation: 25,
      ),
    
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 20, right: 10, left: 10),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child:Column(
                        children: [
                          TextFormField(
                            controller: textNomeCotroller,
                            validator: (value){
                              if (value!.trim().isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 25, color: Colors.black,),
                            decoration: InputDecoration(
                              
                              hintText: 'Nome',
                              hintStyle: TextStyle(color: Colors.grey)),
                            ),

                            TextFormField(
                            controller: textQuantidadeCotroller,
                            validator: (value){
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              } else if (int.tryParse(value) == null) {
                                return 'Informe um valor NUMÉRICO';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 25, color: Colors.black,),
                            decoration: InputDecoration(
                              
                              hintText: 'Quantidade',
                              hintStyle: TextStyle(color: Colors.grey)),
                            ),
                        ],
                      ) 
                      ), 
                    
                  ],
                )
                ),
            ),
              Expanded(
                child:Consumer<DataListaCompra>(
                    builder: (_, COMPRAS, __) {
                      if( COMPRAS.getItensListaCompras(indexListas).isEmpty){
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Nenhum item na lista de compras'),
                            ],
                          )
                        );
                      }else{
                        return ListView.builder(
                          itemCount: COMPRAS.getItensListaCompras(indexListas).length,
                          itemBuilder: (context, index){
                            return Card(
                              color: const Color.fromARGB(255, 228, 220, 220),
                              elevation: 20,
                              child:  Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.list),
                                    title: Text(COMPRAS.getItensListaCompras(indexListas)[index].nome),
                                    subtitle:  Text(
                                      ('Quantidade = ${COMPRAS.getItensListaCompras(indexListas)[index].quantidade}')
                                      ),
                                    contentPadding: null,
                                    ),
                                    ButtonBar(
                                      children: [
                                      TextButton(
                                          onPressed:() {
                                            if(_formKey.currentState!.validate()){
                                              setState(() {
                                                int flag = Provider.of<DataListaCompra>(context, listen: false).editItemListaCompra(indexListas, index,textNomeCotroller.text, int.parse(textQuantidadeCotroller.text));
                                                if(flag == 1){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('O nome ja exite na lista'),
                                                    duration: Duration(seconds: 2),
                                                  )
                                                );
                                                }
                                                textNomeCotroller.clear();
                                                textQuantidadeCotroller.clear();
                                              });
                                            }
                                          }, 
                                          child: Text("Editar")
                                        ),
                                        Checkbox(
                                          value: COMPRAS.getItensListaCompras(indexListas)[index].isChecked,
                                          onChanged: (bool? value){
                                            if(value != null){
                                              setState(() {
                                                COMPRAS.setIsChecked(value, indexListas, index);
                                                //sChecked = value!;
                                              });
                                            }
                                          }
                                          ),
                                        TextButton(
                                          onPressed: null, 
                                          child: ClipOval(
                                              child: Material(
                                                color: Color.fromARGB(255, 255, 255, 255), // Button color
                                                child: InkWell(
                                                  splashColor: Color.fromARGB(255, 208, 15, 5), // Splash color
                                                  onLongPress: () {
                                                    setState(() {
                                                      COMPRAS.getItensListaCompras(indexListas).removeAt(index);
                                                    });
                                                  },
                                                  child: SizedBox(width: 25, height: 25, child: Icon(Icons.delete)),
                                                ),
                                              ),
                                            ),
        
                                          ),
                                      ],
                                    )
                                ],
                              ),
                              
                            );
                          },
                          );
                      }
                    },
                )
              ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                
                      ElevatedButton(
                            onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  setState(() {
                                    //listaCompra.add(item(textNomeCotroller.text, int.parse(textQuantidadeCotroller.text)));
                                  int flag = Provider.of<DataListaCompra>(context, listen: false).addDataItemListasDeCompras(indexListas, item(textNomeCotroller.text, int.parse(textQuantidadeCotroller.text), isChecked));
                                  if(flag == 1){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('A lista já contém esse item!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  }
                                  });
                                  textNomeCotroller.clear();
                                  textQuantidadeCotroller.clear();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                backgroundColor:  Colors.blue.shade900, // Cor de fundo do botão
                                textStyle: TextStyle(color: Colors.white, fontSize: 25,), // Cor do texto do botão
                                shape:  CircleBorder(),
                                minimumSize: Size(90, 100),
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: const Color.fromARGB(255, 152, 152, 152),
                              ),
                              child: Text('+'),
                          ),
                      
                    ],
                  ),
                ),

              
          ],
        ),
      ),
    );
  }
}
