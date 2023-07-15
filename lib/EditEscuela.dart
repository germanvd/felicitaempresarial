import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditEscuela extends StatefulWidget {
  final int id;
  final String idEsc;
  final String nombreescuela;
  final String totalraciones;
  final String directorescuela;
  final String direccionescuela;
  final String telefonoescuela;

  final String provinciamuncipio;
  final String regionaldistrito;

  EditEscuela({
    required this.id,
    required this.idEsc,
    required this.nombreescuela,
    required this.totalraciones,
    required this.directorescuela,
    required this.direccionescuela,
    required this.telefonoescuela,
    required this.provinciamuncipio,
    required this.regionaldistrito,
  });

  @override
  State<EditEscuela> createState() => _EditEscuelaState();
}

class _EditEscuelaState extends State<EditEscuela> {
  TextEditingController id = TextEditingController();
  TextEditingController idEsc = TextEditingController();
  TextEditingController nombreescuela = TextEditingController();
  TextEditingController totalraciones = TextEditingController();
  TextEditingController direccionescuela = TextEditingController();
  TextEditingController directorescuela = TextEditingController();
  TextEditingController telefonoescuela = TextEditingController();
  TextEditingController provinciamunicipio = TextEditingController();
  TextEditingController regionaldistrito = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    idEsc.text = widget.idEsc;
    nombreescuela.text = widget.nombreescuela;
    totalraciones.text = widget.totalraciones;
    direccionescuela.text = widget.direccionescuela;
    directorescuela.text = widget.directorescuela;
    telefonoescuela.text = widget.telefonoescuela;
    provinciamunicipio.text = widget.provinciamuncipio;
    regionaldistrito.text = widget.regionaldistrito;
  }

  UpdateEscuela() async {
    final http.Response response = await http.post(
        Uri.parse("https://felicitavaldez.ddns.net/api/editEscuela.php"),
        body: {
          'id': widget.id.toString(),
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
        title: const Text("Editar Escuela"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/miescuela.jpeg",
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.code_off),
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
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
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
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
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
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.directions),
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
                    labelText: "Teléfono Escuela",
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
                    prefixIcon: const Icon(Icons.streetview),
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
                    prefixIcon: const Icon(Icons.directions_transit),
                    labelText: "Raciones Primarias",
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
                    UpdateEscuela();
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
