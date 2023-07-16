import 'package:contacts/myContacts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:contacts/app-contact.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  String name;
  String phone;
  Uint8List? image;

  ContactDetails(
      {super.key,
      required this.name,
      required this.phone,
      required this.image});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  //String name = con.name;
  AppContact? contact;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                foregroundColor: Colors.white,
                title: const Text('Contact Details'),
              ),
              body: Container(
                alignment: Alignment.topCenter,
                height: 450,
                width: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              spreadRadius: 5)
                        ],
                      ),
                      child: widget.image != null
                          ? CircleAvatar(
                              radius: 70.0,
                              backgroundImage: MemoryImage(widget.image!),
                            )
                          : const CircleAvatar(
                              child: Icon(Icons.person),
                              radius: 70,
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.phone,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ))),
    );
  }
}
