import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recogniseimage/screen/recoganization.dart';
import 'package:recogniseimage/utils/image_cropper_page.dart';
import 'package:recogniseimage/utils/image_picker_class.dart';
import 'package:recogniseimage/utils/widgets/modal_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Text Reconganization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //   _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Text(
                'Hello! Everyone ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                ' Iam Text Recognizer ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/scanner.png',
                width: 300,
                height: 200,
              )
            ],
          ),
        ),
      ),
      // body: Center(

      //   child: Column(

      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          imagepickerModal(context, onCameraTap: () {
            log('Camera');
            pickImage(source: ImageSource.camera).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => recoganizePage(
                                  path: value,
                                )));
                  }
                });
              }
            });
          }, onGalleryTap: () {
            log("Gallery");
            pickImage(source: ImageSource.gallery).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => recoganizePage(
                                  path: value,
                                )));
                  }
                });
              }
            });
          });
        },
        tooltip: 'Increment',
        label: const Text('Scan Photo'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
