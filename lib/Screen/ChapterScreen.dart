import 'package:flutter/material.dart';
import 'package:testapp/Screen/HomePage.dart';
import 'package:testapp/Screen/ReadBookScreen.dart';
import 'package:testapp/database/DatabaseHelper.dart';
import 'package:testapp/database/database.dart';
import 'package:testapp/models/list_chapter.dart';
import 'package:testapp/models/list_chapter2.dart';

class ChapterScreen extends StatefulWidget {
  final String nameBook;
  ChapterScreen( {this.nameBook}) : super();
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final int seen = 0;
  int idCurrent=0;
  int idcontentCurrent=0;
  int pagecurrent=0;
  int len = 0;
  final dbHelper = DatabaseHelper.instance;
  List<int> arr=[];
  @override
  void initState() {
    super.initState();
    _querryAll();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(widget.nameBook.toString(),style: TextStyle(color: Colors.black87,fontSize: 18.0),),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: widget.nameBook == 'Phật Học Căn Bản' ? FutureBuilder<List<ListChapter>>(
          future: DBProvider.db.getAllNameChaptersBook1(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<List<ListChapter>> snapshot){
            if(snapshot.hasData){
              return snapshot.data.isNotEmpty ? ListView.builder(
                  itemCount: snapshot.data.length,
                  // ignore: missing_return
                  itemBuilder: (context,index){

                    ListChapter item = snapshot.data[index];
                    if(index > 33){
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadBookScreen(id: index,name: item.nameChap.toString())));
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 5.0,left: 5.0,top: 15.0,bottom: 15.0),
                              margin: EdgeInsets.only(bottom: 10.0
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(width: 1.0,color: Colors.black12)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(item.nameChap,
                                      style: TextStyle(
                                          color: arr.contains(index)?Colors.black:Colors.black54,
                                          fontSize: arr[arr.length-1] == index?20.0 :18.0,
                                          fontWeight:  arr[arr.length-1] == index? FontWeight.w800 : FontWeight.w500
                                      ),
                                      overflow: TextOverflow.clip,

                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 18.0,),
                                ],
                              )

                          )
                      );
                    }else {
                      return Container(width: 0.0, height: 0.0);
                    }
                  }
              ) : CircularProgressIndicator();
            }else  return CircularProgressIndicator();
          },
        ) : FutureBuilder<List<ListChapter2>>(
          future: DBProvider.db.getAllNameChaptersBook2(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<List<ListChapter2>> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  // ignore: missing_return
                  itemBuilder: (context,index){
                    ListChapter2 item = snapshot.data[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ReadBookScreen(id: index,name: item.namePhan.toString())));
                        },
                          child: Container(
                              padding: EdgeInsets.only(right: 5.0,left: 5.0,top: 15.0,bottom: 15.0),
                              margin: EdgeInsets.only(bottom: 10.0
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(width: 1.0,color: Colors.black12)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(item.namePhan,
                                      style: TextStyle(
                                          color: arr.contains(index)?Colors.black:Colors.black54,
                                          fontSize: arr[arr.length-1] == index?20.0 :18.0,
                                          fontWeight:  arr[arr.length-1] == index? FontWeight.w800 : FontWeight.w500
                                      ),
                                      overflow: TextOverflow.clip,

                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 18.0,),
                                ],
                              )

                          )
                      );
                  }
              );
            }else  CircularProgressIndicator();
          },
        ),
      )
    );
  }

  _querryAll() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    if(arr.length == 0){
      arr.add(0);
    }
    final pages = await helper.queryAllRows();
    if (pages != null) {
      pages.forEach((savePage) {
        if(savePage.page != 0){
          arr.add(savePage.idContent);
        }
        print('row ${savePage.id}: ${savePage.idContent} ${savePage.page} ${savePage.totalPage}');
      });
    }
    len = arr.length;
    print(arr);
  }
}
