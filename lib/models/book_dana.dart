import 'dart:convert';
BookDana clientFromJson(String str) {
  final jsonData = json.decode(str);
  return BookDana.fromMap(jsonData);
}

String clientToJson(BookDana data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
class BookDana {
  String  idBook;
  String nameBook;
  String urlImageBook;

  BookDana({this.idBook, this.nameBook, this.urlImageBook});
  factory BookDana.fromMap(Map<String, dynamic> json) => new BookDana(
    idBook: json["idBook"],
    nameBook: json["nameBook"],
    urlImageBook: json["urlImageBook"],
  );

  Map<String, dynamic> toMap() => {
    "idBook": idBook,
    "nameBook": nameBook,
    "urlImageBook": urlImageBook,
  };

}