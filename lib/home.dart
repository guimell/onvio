import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userInput = TextEditingController();
  TextEditingController userPinput = TextEditingController();

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/onvio.txt';

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail Onvio",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              controller: userInput,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Senha Onvio",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                controller: userPinput,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                void saveFile() async {
                  File file = File(await getFilePath()); // 1
                  file.writeAsString(
                      "This is my demo text that will be saved to : demoTextFile.txt"); // 2
                }
              },
              child: const Text("Submit"),
            ),
            ElevatedButton(
              onPressed: () {
                void saveFile() async {
                  File file = File(await getFilePath()); // 1
                  file.writeAsString(
                      "This is my demo text that will be saved to : demoTextFile.txt"); // 2
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
