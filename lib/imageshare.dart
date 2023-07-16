import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class MyImageShare extends StatefulWidget {
  const MyImageShare({super.key});

  @override
  State<MyImageShare> createState() => _MyImageShareState();
}

class _MyImageShareState extends State<MyImageShare> {
  // Future<void> Share(String img) async {
  //   await FlutterShare.share(title: 'I Am Dharmik', text: img);
  // }

  // Future<void> ShareFile(String img) async {
  //   await FlutterShare.shareFile(title: 'Image Share', filePath: img);
  //   //Share(img);
  // }

  var image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU6MujnPOgHwg2zVZKSgvUyaOPRsEkfgF_6A&usqp=CAU";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Share Image'),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/hanumandada.jpg'),
            ElevatedButton(
                onPressed: () async {
                  //Below Code Sends Data To Any PlatFormgit
                  final ByteData bytes =
                      await rootBundle.load('assets/images/hanumandada.jpg');
                  final Uint8List list = bytes.buffer.asUint8List();
                  final directory = (await getExternalStorageDirectory())!.path;
                  File imgFile = File('$directory/hanumandada.jpg');
                  imgFile.writeAsBytesSync(list);

                  Share.shareFiles(['$directory/hanumandada.jpg']);
                },
                child: const Text('Share'))
          ],
        ),
      ),
    );
  }
}
