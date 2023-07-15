import 'dart:convert';
import 'dart:ui';
import 'package:felicita/ListaEscuela.dart';
import 'package:felicita/AddEscuela.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'EditEscuela.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class Escuelas extends StatefulWidget {
  const Escuelas({Key? key}) : super(key: key);

  @override
  State<Escuelas> createState() => _EscuelasState();
}

class _EscuelasState extends State<Escuelas> {
  Future<List<ListaEscuela>> getEscuelas() async {
    var data = await http
        .get(Uri.parse("https://felicitavaldez.ddns.net/api/readEscuela.php"));
    var jsonData = json.decode(data.body);
    // ignore: non_constant_identifier_names
    List<ListaEscuela> Escuelas = [];
    for (var u in jsonData) {
      ListaEscuela escuela = ListaEscuela(
        int.parse(u["id"]),
        u["idEsc"],
        u["nombreescuela"],
        u["totalraciones"],
        u["directorescuela"],
        u["direccionescuela"],
        u["telefonoescuela"],
        u["provinciamunicipio"],
        u["regionaldistrito"],
      );

      Escuelas.add(escuela);
    }
    return Escuelas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Listado de Escuelas"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: getEscuelas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: Text('Buscando Datos....'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].idEsc),
                    subtitle: Text(
                      snapshot.data[index].nombreescuela,
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/miescuela.png"),
                    ),
                    onTap: () async {
                      // ignore: prefer_typing_uninitialized_variables
                      final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditEscuela(
                              id: snapshot.data[index].id,
                              idEsc: snapshot.data[index].idEsc,
                              nombreescuela: snapshot.data[index].nombreescuela,
                              totalraciones: snapshot.data[index].totalraciones,
                              directorescuela:
                                  snapshot.data[index].directorescuela,
                              direccionescuela:
                                  snapshot.data[index].direccionescuela,
                              telefonoescuela:
                                  snapshot.data[index].telefonoescuela,
                              provinciamuncipio:
                                  snapshot.data[index].provinciamunicipio,
                              regionaldistrito:
                                  snapshot.data[index].regionaldistrito,
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
                                                    "https://felicitavaldez.ddns.net/api/deleteEscuela.php"),
                                                body: {
                                                  'idEsc': snapshot
                                                      .data[index].idEsc
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
                                      "En verdad desea eliminar este contacto? ${snapshot.data[index].nombreescuela} ?"),
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
              context, MaterialPageRoute(builder: (context) => AddEscuela()));
          if (value == "inserted") {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
