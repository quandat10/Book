import 'package:flutter/material.dart';
import 'package:testapp/database/DatabaseHelper.dart';
import 'package:testapp/database/database.dart';
import 'package:testapp/models/ContentChap_dana.dart';

class ReadBookScreen extends StatefulWidget {
  int id;
  String name;

  ReadBookScreen({this.id, this.name}) : super();

  @override
  _ReadBookScreenState createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  List<String> content = [];
  int _pos = 0;
  int idcontentCurrent;
  int pagecurrent = 0;
  int idCurrent;
  double _size = 18;
  int check;
  int _page = 0;
  int _idxPage = 0;
  int _whitespace = 0;
  int totalPage = 0;
  int showTotalPage = 0;
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
    _read();
  }
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    title: Text('Bạn có muốn lưu trang này lại không ?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Có'),
                        onPressed: () {
                          idcontentCurrent == widget.id ? _update() : _insert();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text('Không'),
                        onPressed: () {
                          _idxPage = 0;
                          _update();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            widget.name,
            style: TextStyle(fontSize: 18.0, color: Colors.black87),
          ),
          actions: <Widget>[

            IconButton(
              icon: Icon(
                Icons.zoom_out,
                color: Colors.black87,
              ),
              onPressed: () {
                // do something

                setState(() {
                  _size -= 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.zoom_in,
                color: Colors.black87,
              ),
              onPressed: () {
                setState(() {
                  _size += 2;
                });
                // do something
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder<List<ContentChapDana>>(
              future: DBProvider.db.getAllBooks(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ContentChapDana>> snapshot) {
                _pos = 0;
                _page = 0;
                if (snapshot.hasData) {
                  String data = widget.id > 33
                      ? snapshot.data[widget.id - 34].nameContent.trim()
                      : snapshot.data[widget.id + 22].nameContent.trim();
                  int len = data.length;

                  //Caculte whitespace
                  for (int i = 0; i < len; i++) {
                    if (data[i] == " ") {
                      _whitespace += 1;
                    }
                    if ((data[i] == " ") && (_whitespace % 180 == 0)) {
                      content.add(data.substring(_pos, i));
                      _pos = i + 1;
                      _page++;

                    }
                  }

                  content.add(data.substring(_pos, len - 1));
                  totalPage = _page ;

                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 5.0),
                          child: content.isNotEmpty
                              ? PageView.builder(
                                  controller: PageController(
                                      initialPage: pagecurrent,
                                      keepPage: true,
                                      viewportFraction: 1),
                                  onPageChanged: (value) {
                                    setState(() {
                                      _idxPage = value;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: totalPage+1,
                                  // ignore: missing_return
                                  itemBuilder: (context, index) {
//                                    _idxPage = pagecurrent;
                                    return ListView(
                                      children: [
                                        Text(
                                          content[index],
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: _size),
                                        )
                                      ],
                                    );
                                  },
                                )
                              : CircularProgressIndicator()),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        color: Colors.black26,
                        height: 30.0,
                        width: 60.0,
                        child: Text(
                          "${_idxPage + 1}${showTotalPage==0?" ":"/"+showTotalPage.toString()}" ,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      )
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        )
    );
  }

  _read() async {
    // row to insert
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowIdContent = widget.id;
    SavePage savePage = await helper.queryPage(rowIdContent);
    idcontentCurrent = savePage.idContent;
    _idxPage = pagecurrent = savePage.page;
    idCurrent = savePage.id;
    showTotalPage = savePage.totalPage;
    if (savePage == null) {
      print('read row $rowIdContent: empty');
    } else {
      print('read row $rowIdContent: ${savePage.id} ${savePage.page} ${savePage.totalPage}');
    }
  }
  _delete()async{
    final helper = DatabaseHelper.instance;
    int id = 2;
    int count = await helper.delete(id);
    print('deleted $count row(s)');
  }
  _querryAll() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    final pages = await helper.queryAllRows();
    if (pages != null) {
      pages.forEach((savePage) {
        print('row ${savePage.id}: ${savePage.idContent} ${savePage.page}');
      });
    }
  }

  _insert() async {
    SavePage savePage = SavePage();
    savePage.totalPage = totalPage+1;
    savePage.idContent = widget.id;
    savePage.page = _idxPage;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(savePage);
    print('inserted row: $id');
  }

  _update() async {
    SavePage savePage = SavePage();
    savePage.totalPage = totalPage+1;
    savePage.id = idCurrent;
    savePage.idContent = idcontentCurrent;
    savePage.page = _idxPage;
    final helper = DatabaseHelper.instance;
    int count = await helper.update(savePage);
    print('updated $count row(s)');
  }
}
