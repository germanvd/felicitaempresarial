import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cargar extends StatefulWidget {
  const Cargar({super.key});

  @override
  State<Cargar> createState() => _add_userState();
}

// ignore: camel_case_types
class _add_userState extends State<Cargar> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cargar el Menu"),
      ),
      body: Container(
        padding: const EdgeInsets.all(150),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/user.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse(
                        'https://felicitavaldez.ddns.net/api/cargarMenu.php',
                      );
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print("Can't launch $url");
                      }
                    },
                    child: const Text('Cargar Menu'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
