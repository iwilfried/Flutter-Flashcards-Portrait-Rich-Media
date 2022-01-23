class Slide {
  String firstSide;
  double firstSlideFontSize;
  String secondSide;
  double secondSlideFontSize;
  String frontStyle;
  String backStyle;

  Slide(
      {required this.firstSide,
      required this.firstSlideFontSize,
      required this.secondSide,
      required this.secondSlideFontSize,
      required this.frontStyle,
      required this.backStyle});

  Map<String, dynamic> toJson() => {
        "firstSide": firstSide,
        "firstSlideFontSize": firstSlideFontSize,
        "secondSide": secondSide,
        "secondSlideFontSize": secondSlideFontSize,
        "frontStyle": frontStyle,
        "backStyle": backStyle,
      };

  Slide.fromJson(Map<String, dynamic> json)
      : firstSide = json["firstSide"],
        firstSlideFontSize = json['firstSlideFontSize'],
        secondSide = json['secondSide'],
        secondSlideFontSize = json["secondSlideFontSize"],
        frontStyle = json['frontStyle'],
        backStyle = json['backStyle'];
}
