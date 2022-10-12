import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class recoganizePage extends StatefulWidget {
  final String? path;
  const recoganizePage({super.key, this.path});

  @override
  State<recoganizePage> createState() => _recoganizePageState();
}

class _recoganizePageState extends State<recoganizePage> {
  bool _isBusy = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recoganized page')),
        body: _isBusy == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  maxLines: MediaQuery.of(context).size.height.toInt(),
                  controller: controller,
                  decoration: InputDecoration(hintText: "Text goes here..."),
                ),
              ));
  }

  void processImage(InputImage image) async {
    final textRecoginzer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecoginzer.processImage(image);

    controller.text = recognizedText.text;

    setState(() {
      _isBusy = false;
    });
  }
}
