class Points {
  String? stringEn;
  String? stringAr;
  String? image;
  String? descAr;
  String? descEn;
  String? points;
  String? lessThan70;
  String? between7080;
  String? more90;

  Points({this.stringEn, this.stringAr, this.image});

  Points.fromJson(Map<String, dynamic> json) {
    stringEn = json['stringEn'];
    stringAr = json['stringAr'];
    image = json['image'];
    descAr = json['descAr'];
    descEn = json['descEn'];
    points = json['points'];
    lessThan70 = json['Less than 70%'];
    between7080 = json['7080'];
    more90 = json['90More'];
  }
}
