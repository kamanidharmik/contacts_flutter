import 'package:contacts/myContacts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class MySccripts extends StatefulWidget {
  const MySccripts({super.key});

  @override
  State<MySccripts> createState() => _MySccriptsState();
}

class _MySccriptsState extends State<MySccripts> {
  bool checkedprivacy = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scripts'),
        ),
        body: DefaultTextStyle(
          style: const TextStyle(fontSize: 20, color: Colors.black),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              const Text.rich(
                TextSpan(
                  text: 'Price :', // default text style
                  children: <TextSpan>[
                    TextSpan(
                        text: ' \$500 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: ' \$700',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //SubScript Demo
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    const TextSpan(
                      text: 'H',
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, 4.0),
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                    const TextSpan(
                      text: 'O',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //SuperScript Demo
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    const TextSpan(
                      text: 'A',
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -7.0),
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //CheckBox With Demo
              Row(
                children: [
                  Checkbox(
                    value: checkedprivacy,
                    onChanged: (c) {
                      setState(() {
                        checkedprivacy = c!;
                      });
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 27,
                      ),
                      children: [
                        const TextSpan(
                            text: "Please Check",
                            style: TextStyle(fontSize: 14)),
                        TextSpan(
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.none),
                            //make link blue and underline
                            text: " Privacy Policy",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String url = "https://www.google.com";
                                var urllaunchable = await canLaunch(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  await launch(
                                      url); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              }),
                        const TextSpan(
                            text: " and",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        TextSpan(
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            //make link blue and underline
                            text: " T&C.",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String url = "https://www.google.com";
                                var urllaunchable = await canLaunch(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  await launch(
                                      url); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              }),
                      ],
                    ),
                  )
                ],
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyContacts(),
                        ));
                  },
                  child: const Text('Contacts')),
            ],
          ),
        ),
      ),
    );
  }
}
