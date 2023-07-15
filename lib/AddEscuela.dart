import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class AddEscuela extends StatefulWidget {
  @override
  State<AddEscuela> createState() => _AddEscuelaState();
}

class _AddEscuelaState extends State<AddEscuela> {
  String result = "";

  TextEditingController idEsc = TextEditingController();
  TextEditingController nombreescuela = TextEditingController();
  TextEditingController totalraciones = TextEditingController();
  TextEditingController direccionescuela = TextEditingController();
  TextEditingController directorescuela = TextEditingController();
  TextEditingController telefonoescuela = TextEditingController();
  TextEditingController provinciamunicipio = TextEditingController();
  TextEditingController regionaldistrito = TextEditingController();

  // ignore: non_constant_identifier_names
  insert_escuela() async {
    final http.Response response = await http.post(
        Uri.parse("https://felicitavaldez.ddns.net/api/addEscuela.php"),
        body: {
          'idEsc': idEsc.text,
          'nombreescuela': nombreescuela.text,
          'totalraciones': totalraciones.text,
          'direccionescuela': direccionescuela.text,
          'directorescuela': directorescuela.text,
          'telefonoescuela': telefonoescuela.text,
          'provinciamunicipio': provinciamunicipio.text,
          'regionaldistrito': regionaldistrito.text,
        });
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop("inserted");
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
        title: const Text("CREANDO ESCUELA"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/miescuela.jpeg",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.code),
                    labelText: "Codigo Escuela",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: idEsc,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.school_sharp),
                    labelText: "Nombre Escuela",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: nombreescuela,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.cookie),
                    labelText: "Total Raciones",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: totalraciones,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    labelText: "Direccion Escuela",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: direccionescuela,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    labelText: "Director Escuela",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: directorescuela,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Telefono Escuela",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: telefonoescuela,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    labelText: "Provincia Municipio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: provinciamunicipio,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    labelText: "Regional Distrito",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: regionaldistrito,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    insert_escuela();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("CREAR ESCUELA"))
            ],
          ),
        ),
      ),
    );
  }

  launchUrlStart({required String url}) {}
}
