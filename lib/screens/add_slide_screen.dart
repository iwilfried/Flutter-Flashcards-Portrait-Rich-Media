import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';

import '../state_managment/slides_state_manager.dart';
import '../models/slide.dart';

class AddSlideScreen extends ConsumerStatefulWidget {
  const AddSlideScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddSlideScreen> createState() => _AddSlideScreenState();
}

class _AddSlideScreenState extends ConsumerState<AddSlideScreen> {
  TextEditingController frontController = TextEditingController();
  TextEditingController backController = TextEditingController();

  String frontValue = "";
  String backValue = "";
  double frontFontSize = 36;
  double backFontSize = 19;
  String frontStyle = "robotoCondensed";
  String backStyle = "robotoCondensed";
  Map<String, Function> fontStyles = {
    "robotoCondensed": GoogleFonts.robotoCondensed,
    "alatsi": GoogleFonts.alatsi,
    "amiri": GoogleFonts.amiri,
    "syneMono": GoogleFonts.syneMono,
    "aBeeZee": GoogleFonts.aBeeZee,
  };
  List<Function> stylesList = [
    GoogleFonts.amiri,
    GoogleFonts.syneMono,
    GoogleFonts.aBeeZee,
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add new Slide"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                ref.read(slideListStateManagerProvider.notifier).addslide(
                      Slide(
                          firstSide: frontValue,
                          firstSlideFontSize: frontFontSize,
                          secondSide: backValue,
                          secondSlideFontSize: backFontSize,
                          frontStyle: frontStyle,
                          backStyle: backStyle),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(children: [
            const Text("First side content"),
            TextField(
              controller: frontController,
              onChanged: (newValue) {
                setState(() {
                  frontValue = newValue;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("FontSize:"),
                      DropdownButton<double>(
                        value: frontFontSize,
                        items: <double>[
                          44,
                          42,
                          40,
                          38,
                          36,
                          34,
                          32,
                          30,
                          28,
                          26,
                          24,
                          22,
                          20,
                          18,
                          16
                        ].map((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            frontFontSize = value!;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Font Style:"),
                      DropdownButton<String>(
                        value: frontStyle,
                        items: fontStyles
                            .map((description, value) {
                              return MapEntry(
                                  description,
                                  DropdownMenuItem<String>(
                                    value: description,
                                    child: Text(description),
                                  ));
                            })
                            .values
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            frontStyle = value!;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Text("Second Side content"),
            TextField(
              controller: backController,
              onChanged: (newValue) {
                setState(() {
                  backValue = newValue;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("FontSize:"),
                      DropdownButton<double>(
                        value: backFontSize,
                        items: <double>[
                          27,
                          26,
                          25,
                          24,
                          23,
                          22,
                          21,
                          20,
                          19,
                          18,
                          17,
                          16
                        ].map((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            backFontSize = value!;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Font Style:"),
                      DropdownButton<String>(
                        value: backStyle,
                        items: fontStyles
                            .map((description, value) {
                              return MapEntry(
                                  description,
                                  DropdownMenuItem<String>(
                                    value: description,
                                    child: Text(description),
                                  ));
                            })
                            .values
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            backStyle = value!;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            const Center(
                child: Text('Preview',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            Container(
              width: width * .8,
              height: height * .55,
              margin: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 0.0, bottom: 0.0),
              color: Colors.transparent,
              child: FlipCard(
                direction: FlipDirection.VERTICAL,
                speed: 1000,
                onFlipDone: (status) {
                  //print(status);
                },
                front: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Center(
                      child: Text(frontValue,
                          textAlign: TextAlign.center,
                          style: fontStyles[frontStyle]!(
                              textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: frontFontSize,
                          )))),
                ),
                back: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Center(
                      child: Text(backValue,
                          textAlign: TextAlign.center,
                          style: fontStyles[backStyle]!(
                              textStyle: TextStyle(
                            height: 1.7,
                            color: Theme.of(context).primaryColor,
                            fontSize: backFontSize,
                          )))),
                ),
              ),
            ),
          ]),
        ));
  }
}
