import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class teste extends StatefulWidget {
  teste({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _testeState createState() => _testeState();
}

class _testeState extends State<teste> {
  String _contentOfFile = "";

  TextEditingController userInput = TextEditingController();
  TextEditingController userPinput = TextEditingController();

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/onvio.txt';

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath());
    file.writeAsString("E-MAIL: ${userInput.text} SENHA: ${userPinput.text}");
  }

  void readFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();

    print('File Content: $fileContent');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () => {saveFile()},
                    child: const Text("Save File"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {readFile()},
                  child: const Text("Read File"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
