class Slide {
  String firstSide;
  double firstSlideFontSize;
  String secondSide;
  double secondSlideFontSize;
  String frontStyle;
  String backStyle;
  List<String> highLightFront;
  List<String> highLightBack;

  Slide(
      {required this.firstSide,
      required this.firstSlideFontSize,
      required this.secondSide,
      required this.secondSlideFontSize,
      required this.frontStyle,
      required this.backStyle,
      required this.highLightFront,
      required this.highLightBack});

  Map<String, dynamic> toJson() => {
        "firstSide": firstSide,
        "firstSlideFontSize": firstSlideFontSize,
        "secondSide": secondSide,
        "secondSlideFontSize": secondSlideFontSize,
        "frontStyle": frontStyle,
        "backStyle": backStyle,
        "highLightFront": List<dynamic>.from(highLightFront.map((x) => x)),
        "highLightBack": List<dynamic>.from(highLightBack.map((x) => x)),
      };

  Slide.fromJson(Map<String, dynamic> json)
      : firstSide = json["firstSide"],
        firstSlideFontSize = json['firstSlideFontSize'],
        secondSide = json['secondSide'],
        secondSlideFontSize = json["secondSlideFontSize"],
        frontStyle = json['frontStyle'],
        backStyle = json['backStyle'],
        highLightFront =
            List<String>.from(json["highLightFront"].map((x) => x)),
        highLightBack = List<String>.from(json["highLightBack"].map((x) => x));
}
