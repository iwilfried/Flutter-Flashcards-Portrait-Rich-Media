import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/slide.dart';

class SlideOne extends ConsumerStatefulWidget {
  final Slide slide;
  final int pages;
  final Function nextPage;
  final Function previousPage;
  const SlideOne({
    Key? key,
    required this.slide,
    required this.pages,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  @override
  ConsumerState<SlideOne> createState() => _SlideOneState();
}

class _SlideOneState extends ConsumerState<SlideOne> {
  Map<String, Function> fontStyles = {
    "robotoCondensed": GoogleFonts.robotoCondensed,
    "alatsi": GoogleFonts.alatsi,
    "amiri": GoogleFonts.amiri,
    "syneMono": GoogleFonts.syneMono,
    "aBeeZee": GoogleFonts.aBeeZee,
  };

  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).backgroundColor.withOpacity(0.9),
                        BlendMode.darken),
                    image: const AssetImage("assets/images/backLandscape.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  width: width * .8,
                  height: height * .55,
                  margin: const EdgeInsets.only(
                      left: 32.0, right: 32.0, top: 0.0, bottom: 0.0),
                  color: Colors.transparent,
                  child: FlipCard(
                    controller: _controller,
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
                          child: Text(widget.slide.firstSide,
                              textAlign: TextAlign.center,
                              style: fontStyles[widget.slide.frontStyle]!(
                                  textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: widget.slide.firstSlideFontSize,
                              )))),
                    ),
                    back: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Center(
                          child: Text(widget.slide.secondSide,
                              textAlign: TextAlign.center,
                              style: fontStyles[widget.slide.backStyle]!(
                                  textStyle: TextStyle(
                                height: 1.7,
                                color: Theme.of(context).primaryColor,
                                fontSize: widget.slide.secondSlideFontSize,
                              )))),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: width * .3,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 35,
                        onPressed: () {
                          widget.previousPage();
                        },
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          _controller.toggleCard();
                        },
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 35,
                        onPressed: () {
                          widget.nextPage();
                        },
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            )));
  }
}
