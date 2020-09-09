import 'dart:convert';
ListChapter clientFromJson(String str) {
  final jsonData = json.decode(str);
  return ListChapter.fromMap(jsonData);
}

String clientToJson(ListChapter data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
class ListChapter {
  String idChap;
  String nameChap;

  ListChapter({this.idChap, this.nameChap});

  factory ListChapter.fromMap(Map<String, dynamic> json) => new ListChapter(
    idChap: json["idChap"],
    nameChap: json["nameChap"],
  );

  Map<String, dynamic> toMap() => {
    "idChap": idChap,
    "nameChap": nameChap,
  };

}