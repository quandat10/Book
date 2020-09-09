import 'dart:convert';
ContentChapDana clientFromJson(String str) {
  final jsonData = json.decode(str);
  return ContentChapDana.fromMap(jsonData);
}

String clientToJson(ContentChapDana data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
class ContentChapDana {
  int  idContent;
  String nameContent;
  String frkldChapterMerge;

  ContentChapDana({this.idContent, this.nameContent, this.frkldChapterMerge});
  factory ContentChapDana.fromMap(Map<String, dynamic> json) => new ContentChapDana(
    idContent: json["idContent"],
    nameContent: json["nameContent"],
    frkldChapterMerge: json["frkldChapterMerge"],
  );

  Map<String, dynamic> toMap() => {
    "idContent": idContent,
    "nameContent": nameContent,
    "frkldChapterMerge": frkldChapterMerge,
  };
  
}