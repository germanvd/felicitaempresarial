import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class EditMenu extends StatefulWidget {
  final int id;
  final String idpro;
  final String descripcion;
  final String precio;
  final String fechaentrega;

  EditMenu(
      {required this.id,
      required this.idpro,
      required this.descripcion,
      required this.precio,
      required this.fechaentrega});

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  TextEditingController id = TextEditingController();
  TextEditingController idpro = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController fechaentrega = TextEditingController();

  @override
  void initState() {
    super.initState();
    idpro.text = widget.idpro;
    descripcion.text = widget.descripcion;
    precio.text = widget.precio;
    fechaentrega.text = widget.fechaentrega;
  }

  UpdateMenu() async {
    final http.Response response = await http.post(
        Uri.parse("https://felicitavaldez.ddns.net/api/editMenu.php"),
        body: {
          'id': widget.id.toString(),
          'idpro': idpro.text,
          'descripcion': descripcion.text,
          'precio': precio.text,
          'fechaentrega': fechaentrega.text,
        });

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, "updated");
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Editar Menu"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/edit.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.code_rounded),
                    labelText: "Id Pro",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: idpro,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.shopping_basket),
                    labelText: "Descripcion-",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: descripcion,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.money_sharp),
                    labelText: "Precio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: precio,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    labelText: 'Fecha Entrega',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: fechaentrega,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    UpdateMenu();
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Modificar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
