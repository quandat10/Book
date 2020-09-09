import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/custom/constants.dart';
import 'package:testapp/database/database.dart';
import 'package:testapp/models/book_dana.dart';

import 'ChapterScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String FIND_BOOK = "Tìm kiếm sách tại đây";
  final String INSTRUCTION = "Hướng dẫn sử dụng";
  final String ITEM1 = "Huyền Không Sơn Thượng";

  final String TITLE = "Minh Đức Triều Tâm Ảnh";

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black26);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.only(left: 0.0),
            padding: EdgeInsets.only(top: 10.0,right: 5.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/icon_app.png'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  TITLE,
                  style: TextStyle(color: Colors.black87, fontSize: 18.0),
                )
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150.0,
                child: DrawerHeader(
                  child: Center(
                    child: Text(TITLE),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset("assets/icons/ic_1.png"),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(INSTRUCTION),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset("assets/icons/ic_2.png"),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(ITEM1),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        title: Text('TÁC GIẢ:'),
                        content: SingleChildScrollView(
                          child: Text("""
Minh Đức Triều Tâm Ảnh là bút hiệu của hoà thượng Giới Đức -
chủ trì Chùa Huyền Không Sơn Thượng - Huế. Ngài có thế danh
là Nguyễn Duy Kha sinh ngày  19 tháng 7  năm  1944  tại Dã Lê thượng,
huyện  Hương Thuỷ , tỉnh Thừa Thiên-Huế . Thân sinh là cụ ông Nguyễn
Duy Hoan và thân mẫu là cụ bà Nguyễn Thị Sừng. Song thân ngài là
người theo Phật với đức tin thuần thành. Năm 19 tuổi, vượt qua mấy
ngàn sĩ tử, ngài đổ vào trường Sư Phạm Quy Nhơn. Sau khi tốt nghiệp,
ngài đã tham gia hoạt động cộng đồng và giảng dạy nhiều nơi. Năm
1969 ngài có ý định xuất gia nên lên ở chùa Từ Quang (thuộc hệ phái
Bắc Truyền).
Năm  1972  , vào chùa Tam Bảo-Đà Nẵng, ngài xin được diện kiến
hòa thượng  Giới Nghiêm với mục đích là tìm hiểu về giáo pháp của hệ
Nam Truyền.
Năm  1973 , với quyết định chuyển màu y, ngài vào Tam Bảo thiền
viện tại Núi Lớn,  Vũng Tàu ; và được hoà thượng Giới Nghiêm
nhận làm giới tử rồi cho xuất gia Sa-di với pháp danh là Giới Đức
(Sīlaguna). Sau mùa an cư năm  1973 , ngài theo thầy về chùa Phật
Bảo,  Phú Thọ Hòa, Gia Định .
Năm  1974 , tháng 11, cơ duyên đọc được quyển “Con Đường Hạnh
Phúc” của ngài Viên Minh-Trần Minh Tài; vì mến mộ đức độ và hạnh
nguyện của một vị “huynh” đi trước, ngài đã khăn gói xin về tu tập tại
chùa Huyền Không, chân đèo Hải Vân Lăng Cô,  Lộc Hải, Phú Lộc ,
Thừa Thiên Huế - một am tranh do ngài Viên Minh sáng lập năm 1973.
Năm 1976, tháng 2, vì phải vào Sài Gòn nhận trọng trách chủ trì
chùa Kỳ Viên kiêm Tổng Thư Ký hệ phái PGNTVN nên ngài Viên
Minh bàn giao chùa Huyền Không lại cho ngài Giới Đức kế nhiệm.
Năm  1977 , ngày  17 tháng 2 , ngài được thọ đại giới tỳ-khưu tại
chùa Tam Bảo - Đà Nẵng, thầy bổn sư tế độ là hòa thượng  Giới
Nghiêm , thầy Yết-ma là đại đức Giới Hỷ.
Năm 1978, tháng 11, vì sự đổi thay của thời cuộc, chùa Huyền
Không-Hải Vân, Lăng Cô phải di dời về thôn Nham Biều, Hương Trà,
Huế để tạo lập cơ sở mới.
Năm 1988, hưởng ứng chương trình phủ xanh đất trống, đồi trọc
của Nhà Nước – nhà chùa làm đơn xin được 50,4ha tại thôn Chầm,
chân núi Hòn Vượn để trồng cây gây rừng.
Năm 1990-1991 sau khi xây dựng xong cầu Bạch Yến tại thôn
Nham Biều, ngài bàn giao chùa Huyền Không lại cho sư Pháp Tông và
chính thức vào núi ở; và sau 30 năm đã tạo lập nên rừng thiền Huyền
Không Sơn Thượng như ngày nay.
Vậy là, trải qua gần 50 năm tu tập và cống hiến, ngài là bậc trưởng
lão đạo hạnh cao thâm, thông bác Phật học, am tường ngoại điển. Ngài
đã góp công lớn trong việc tiếp bước gầy dựng và phát triển Phật Giáo
Nguyên Thuỷ tại Việt Nam được cả phật tử, chư Tăng Ni trong và
ngoài hệ phái tôn trọng và quý mến. Ngoài ra, nhắc đến bút hiệu Minh
Đức Triều Tâm Ảnh, giới yêu văn chương, nghệ thuật không ai là
không biết một bậc tài hoa nhiều lãnh vực: làm thơ, viết văn, viết khảo
cứu, am tường hội họa, trang trí mỹ thuật, kiến trúc và thiết kế vườn
cảnh mang phong cách thiền môn… Đặt biệt, ngài là một trong những
người đầu tiên thể hiện thành công nghệ thuật thư pháp bằng tiếng Việt
được nhiều người ngưỡng mộ.
Ngày 23 tháng 2 năm 2016, tổ chức World Alliance of Buddhist
Leaders tại Thái Lan đã trao Giải Thưởng Nhà Lãnh Đạo Xuất Sắc Phật
Giáo Thế Giới (The World Buddhist Outstanding Leader Award) để ghi
nhận những cống hiến của ngài đối với sự thịnh vượng của Phật giáo
thế giới nói chung và Phật giáo Việt Nam nói riêng.
II- TÁC PHẨM:

I- Về Thơ, Đối, Điếu:
1- Chèo Vỡ Sông Trăng (Tập thơ - Nxb Thuận Hóa).
2- Kinh Lời Vàng (Nxb Thuận Hóa) – in ba lần.
3- Đá Trắng Chiêm Bao (Tập thơ - Nxb Thuận Hóa).
4- Ân Đức Sinh Thành – Tập thơ Mùa Báo Hiếu - chưa in.
5- Lửa Lạnh Non Thiêng (Tập thơ - Nxb Thuận Hóa).
6- Chữ Cháy Bờ Lau (Tập thơ - Nxb Thuận Hóa).
7- Giun Dế, Hư Vô Và Hạt Lửa Xanh (Tập thơ - Nxb Văn Học).
8- Bụi, Trăng Và Lửa (Thơ nhiều thể loại, 4 tập, 1100 trang - Nxb
Văn Học).
9- Đá, Rác Và Cỏ Thơm (1000 bài thơ lục bát tứ tuyệt – Nxb Văn
Học).
10- Hoa Vàng Trên Đỉnh Non Không (Thơ mùa Dâng Y - chưa in)
11- Thiền Và Chữ Du Ca (250 bài thơ ngũ ngôn tứ tuyệt - chưa in).
12- Sương Khói Đường Thi (Tập thơ luật Đường, 500 trang - chưa
in)
13- Tuyển Tập 1200 Câu Đối (Từ đối 5 chữ, 7 chữ đến 217 chữ
mỗi vế - 300 trang - chưa in)
14- Tuyển Tập Điếu Văn (Phúng điếu các bậc trưởng lão Nam, Bắc
tông - chưa in).
15- Tuyển Tập Trường Ca (Những bài thơ dài, 200 trang, chưa in).
16- Rèn Tập Thơ, Văn (350, đã in nội bộ, 2 lần).
II- Về Giáo pháp, Sử, Truyện, Văn học:
17- Một Cuộc Đời, Một Vầng Nhật Nguyệt (Bộ truyện Đại sử
Đức Phật Sākya Gotama - 6 tập, 3000 trang - Nxb Văn Học).
18- Ngàn Xưa Hương Bối (Truyện cổ Phật giáo, Nxb Tôn Giáo,
trọn bộ, 500 trang).
19- Một Cuộc Đời, Một Ngôi Sao (Cuộc đời và hành trạng của
tôn giả Sāriputta - Nxb Tôn Giáo, 400 trang – in 7 lần).
20- Mi-Tiên Vấn Đáp (Cố HT Giới Nghiêm biên dịch, MĐTTA
nhuận sắc và hiệu chính, Nxb Văn Học, 1000 trang, in 4 lần).
21- 38 Pháp Hạnh Phúc (Cư sĩ Thông Kham biên soạn, MĐTTA
nhuận sắc và hiệu chính - Nxb Tôn Giáo).
22- Thắp Lửa Tâm Linh (Cuộc đời Cố Đại Trưởng Lão Hộ Tông,
Sơ Tổ PGNT Việt Nam - Nxb Thời Đại, 1000 trang, in 3 lần).
23- Đức Phật Sākya Muni (Tóm tắt bộ MCĐMVNN, Nxb Văn
Học, 700 trang).
24- Nhặt Lá Rừng Xưa (Gồm một số bài giảng, nghiên cứu, hỏi,
đáp – Nxb Hội Nhà Văn, 700 trang).
25- Con Gái Đức Phật (Truyện Thánh Ni và Nữ thánh đệ tử - 400
trang, Nxb Tổng hợp Tp. HCM – in 4 lần)..
26- Vị Thánh Tăng Cận Đại (Cuộc đời ngài Ajhan Mun, Nxb Văn
Học, 400 trang).
27- Sa Di Trưởng Lão (Hành trạng của chư vị Thánh Tăng 7 tuổi
thời đức Phật, Nxb Văn Học, 400 trang).
28- Chuyện Cửa Thiền (Tập truyện, nhiều nhà xuất bản – in 7
lần).
29- Phật Học Căn Bản (Nxb Phương Đông, 400 trang đã in hai
lần).

30- Abhidhamma Khái Lược (Nxb Phương Đông, 350 trang).
31- Sử Phật Giáo Ấn Độ (Nxb Hồng Đức, 170 trang).
32- Sử Phật Giáo Trung Quốc (160 trang, in nội bộ)
33- Hành Hương Tâm Linh (Truyện dài tư tưởng - Nxb Phương
Đông).
34- Người Trồng Hoa Và Chàng Tu Sĩ (Tập truyện ngắn - Nxb
Phương Đông, in 4 lần).
35- Bức Tranh Thay Đổi Thế Giới (Tập truyện ngắn - Nxb
Phương Đông).
36- Tiếng Hú Trên Đỉnh Cô Phong (Tiểu luận, tạp luận văn học -
Nxb Văn Học).
37- Tìm Hiểu Phật Giáo (Cư sĩ Thông Kham biên soạn, MĐTTA
hiệu đính – Nxb Tôn Giáo).
38- Dấu Chân Trên Cát (Sưu tập một số bài giảng ở Mỹ và ở Úc,
Nxb Văn Học, 350 trang).
39- Kinh Tụng Pāḷi-Việt (In nội bộ)
40- Pháp thoại An Cư (Nxb Văn Học, 350 trang).
                        """),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset("assets/icons/ic_3.png"),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(TITLE),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 50.0,
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.black12)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      hintText: FIND_BOOK,
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<BookDana>>(
                future: DBProvider.db.getAllNameBooks(),
                // ignore: missing_return
                builder: (BuildContext context,
                    AsyncSnapshot<List<BookDana>> snapshot) {
                  if (snapshot.hasData) {
                    return StaggeredGridView.countBuilder(
                      padding: EdgeInsets.all(10),
                      crossAxisCount: 2,
                      itemCount: snapshot.data.length,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      itemBuilder: (context, index) {
                        BookDana item = snapshot.data[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChapterScreen(
                                            nameBook: item.nameBook,
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  height: index.isEven ? 200 : 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/" + item.urlImageBook),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Text(
                                    item.nameBook,
                                    style: kTitleTextStyle,
                                  ),
                                )
                              ],
                            ));
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                  } else {
                    return Container();
                  }
                },
              ))
            ],
          ),
        ));
  }
}
