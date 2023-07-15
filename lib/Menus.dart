import 'dart:convert';
import 'package:felicita/ListaMenu.dart';
import 'package:felicita/cargar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'EditMenu.dart';

// ignore: unused_element
final Uri _url = Uri.parse('https://flutter.dev');

class Menus extends StatefulWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  Future<List<ListaMenu>> getMenus() async {
    var data = await http
        .get(Uri.parse("https://felicitavaldez.ddns.net/api/read1.php"));
    var jsonData = json.decode(data.body);
    // ignore: non_constant_identifier_names
    List<ListaMenu> Menus = [];
    for (var u in jsonData) {
      ListaMenu menu = ListaMenu(int.parse(u["id"]), u["idpro"],
          u["descripcion"], u["precio"], u["fechaentrega"]);

      Menus.add(menu);
    }
    return Menus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Listado de Menu"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: getMenus(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: Text("Cargando...."));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].fechaentrega),
                    subtitle: Text(snapshot.data[index].descripcion),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/img.png"),
                    ),
                    onTap: () async {
                      final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditMenu(
                              id: snapshot.data[index].id,
                              idpro: snapshot.data[index].idpro,
                              descripcion: snapshot.data[index].descripcion,
                              precio: snapshot.data[index].precio,
                              fechaentrega: snapshot.data[index].fechaentrega,
                            ),
                          ));
                      if (value == "updated") {
                        setState(() {});
                      }
                    },
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (builder) {
                                return AlertDialog(
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            http.post(
                                                Uri.parse(
                                                    "https://felicitavaldez.ddns.net/api/delete.php"),
                                                body: {
                                                  'idpro': snapshot
                                                      .data[index].idpro
                                                      .toString()
                                                });
                                            Navigator.of(context).pop(true);
                                          });
                                        },
                                        child: const Text("Confirmar")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancelar")),
                                  ],
                                  title: const Icon(
                                    Icons.dangerous,
                                    color: Colors.red,
                                  ),
                                  content: Text(
                                      "En verdad desea eliminar este contacto? ${snapshot.data[index].descripcion} ?"),
                                );
                              });
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () async {
          final value = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cargar()));
          if (value == "inserted") {
            setState(() {});
          }
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
