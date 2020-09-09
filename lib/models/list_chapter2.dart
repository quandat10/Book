import 'dart:convert';
ListChapter2 clientFromJson(String str) {
  final jsonData = json.decode(str);
  return ListChapter2.fromMap(jsonData);
}

String clientToJson(ListChapter2 data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
class ListChapter2 {
  String idPhan;
  String namePhan;

  ListChapter2({this.idPhan, this.namePhan});

  factory ListChapter2.fromMap(Map<String, dynamic> json) => new ListChapter2(
    idPhan: json["idPhan"],
    namePhan: json["namePhan"],
  );

  Map<String, dynamic> toMap() => {
    "idPhan": idPhan,
    "namePhan": namePhan,
  };

}