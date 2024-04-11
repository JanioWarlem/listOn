// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:list_on/Model/DataListaCompra.dart';
import 'package:list_on/Model/ListasCompras.dart';
import 'package:provider/provider.dart';

class listasDeComprasView extends StatefulWidget {
  const listasDeComprasView({super.key});

  @override
  State<listasDeComprasView> createState() => _listasDeComprasView();
}

class _listasDeComprasView extends State<listasDeComprasView> {

final TextEditingController textNomeCotroller = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("janiowarlem@gmail.com"),
              accountName: Text("Janio Warlem"),
              currentAccountPicture: CircleAvatar(
                child: Text("JW"),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, 'sobre');
              },
              leading: Icon(Icons.info),
              title: Text("Sobre"),
            )
          ]
        ),
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
                                return 'Informe um nome';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 25, color: Colors.black,),
                            decoration: InputDecoration(
                              hintText: 'Criar Nova lista',
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
                      if(COMPRAS.getListasCompras.isEmpty){
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Nenhum item na lista'),
                            ],
                          )
                        );
                      }else{
                        return ListView.builder(
                                  itemCount: COMPRAS.getListasCompras.length,
                                  itemBuilder: (context, index){
                                    return Card(
                                      color: const Color.fromARGB(255, 228, 220, 220),
                                      elevation: 20,
                                      child:  Column(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.list),
                                            title: Text(COMPRAS.getListasCompras[index].nome),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context, 
                                                'listaDecompra',
                                                arguments: index,
                                                );
                                            }
                                            ),
                                            ButtonBar(
                                              children: [
                                                TextButton(
                                                    onPressed:() {
                                                      if(textNomeCotroller.text.trim().isEmpty){
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('O campo de texto está vaxio!'),
                                                          duration: Duration(seconds: 2),
                                                        )
                                                        );
                                                      }else{
                                                        int flag = Provider.of<DataListaCompra>(context, listen: false).EditListasCompras(index,textNomeCotroller.text);
                                                        if(flag == 1){
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('O nome ja exite na lista'),
                                                            duration: Duration(seconds: 2),
                                                          )
                                                        );
                                                        }
                                                        textNomeCotroller.clear();
                                                      }
                                                      
                                                    }, 
                                                    child: Text("Editar")
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
                                                              COMPRAS.getListasCompras.removeAt(index);
                                                            });
                                                          },
                                                          child: SizedBox(width: 25, height: 25, child: Icon(Icons.delete)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
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
                              setState(() {
                                Navigator.pop(context);
                              });  
                            },
                            child: SizedBox(width: 56, height: 56, child: Icon(Icons.reply)),
                          ),
                        ),
                      ),
                
                      ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  int flag = Provider.of<DataListaCompra>(context, listen: false).addDataListasDeCompras(itemListaDecompras(textNomeCotroller.text));
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
