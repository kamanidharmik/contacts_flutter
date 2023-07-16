import 'dart:typed_data';

import 'package:contacts/contactdetails.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyContacts> {
  List<Contact>? contacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  final primaryColor = Color.fromARGB(255, 247, 247, 248);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Contacts",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          body: (contacts) == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: contacts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    //This Variable Gets Photo
                    Uint8List? image = contacts![index].photo;

                    //This Variable Gets Phone Number
                    String num = (contacts![index].phones.isNotEmpty)
                        ? (contacts![index].phones.first.number)
                        : "--";
                    return ListTile(
                        leading: (contacts![index].photo == null)
                            ? const CircleAvatar(child: Icon(Icons.person))
                            : CircleAvatar(
                                backgroundImage: MemoryImage(image!)),
                        title: Text(
                            "${contacts![index].name.first} ${contacts![index].name.last}"),
                        subtitle: Text(num),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactDetails(
                                        name: contacts![index].name.first +
                                            " " +
                                            contacts![index].name.last,
                                        phone: num,
                                        image: image,
                                      )));
                          /* if (contacts![index].phones.isNotEmpty) {
                            launch('tel: ${num}');
                          }*/
                        });
                  },
                )),
    );
  }
}
