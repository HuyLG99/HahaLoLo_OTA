import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hahaloloapp/models/rating_model.dart';
import 'package:hahaloloapp/screen/bookdatetime_page.dart';
import 'package:hahaloloapp/screen/contact_view.dart';
import 'package:hahaloloapp/screen/detail_info_view.dart';
import 'package:hahaloloapp/screen/discount_view.dart';
import 'package:hahaloloapp/screen/privacy_policy_view.dart';
import 'package:hahaloloapp/screen/rating_view.dart';
import 'package:hahaloloapp/screen/rule_view.dart';
import 'package:hahaloloapp/widget/bottom_app_bar_custom.dart';
import 'package:hahaloloapp/widget/carousel_slider_widget.dart';
import 'package:hahaloloapp/widget/service_tour.dart';
import 'package:hahaloloapp/widget/time_tour.dart';

import '../models/detail_data_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);
  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  List<Data> listData = [];
  List<RatingModel> listRating = [];

  final discountKey = GlobalKey();
  final installmentKey = GlobalKey();

  bool activeConnection = true;
  // String T = "";
  // Future checkUserConnection() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       setState(() {
  //         activeConnection = true;
  //         T = "Turn off the data and repress again";
  //       });
  //     }
  //   } on SocketException catch (_) {
  //     setState(() {
  //       activeConnection = false;
  //       T = "Turn On the data and repress again";
  //     });
  //   }
  // }

  Future scrollItem() async {
    final context = discountKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
    );
  }

  Future scrollInstallment() async {
    final context = installmentKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    // print(data["data"]);
    setState(() {
      data["data"].map((data) => listData.add(Data.fromJson(data))).toList();
    });
  }

  Future<void> readJsonRating() async {
    // final String response = await rootBundle.loadString('assets/rating.json');
    // final dataRating = await json.decode(response);
    // print(dataRating["data"]);
    // setState(() {
    //   dataRating["data"]
    //       .map((dataRating) => listRating.add(RatingModel.fromJson(dataRating)))
    //       .toList();
    //   // print(listRating);
    // });
  }

  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(seconds: 2), (timer) {
    //   checkUserConnection();
    //   // print('Check');
    // });

    readJson();
    readJsonRating();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black26),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12)),
              child: Image.network(
                  'https://www.kindpng.com/picc/m/254-2549839_transparent-404-png-404-not-found-medicine-png.png'),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    // listData[0].currency.toString(),
                    '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Text(
                    ' 9 người đã Haha trang này',
                    // '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.more_vert,
                color: Colors.grey,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const CarouselSlider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'CHƯƠNG TRÌNH Đeo Khẩu Trang Xứ Lạ',
                    // listData[0].t550.t551.tv552.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  // const SizedBox(
                  //   width: 50,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: const [
                  //     Text(
                  //       '4.5/5',
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.green,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Tuyệt vời',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w400,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                children: const [
                  Flexible(
                    child: Text(
                      'Ha Noi - Ninh Binh - Ha Long - Da Nang - Hoi An - Hue - Sai Gon - Mekong 12 Days 11 Nights ',
                      // listData[0].t101.tv151.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  // GestureDetector(
                  //   onTap: () {
                  //     scrollInstallment();
                  //   },
                  //   child: Expanded(
                  //     child: Container(
                  //       padding: const EdgeInsets.all(8),
                  //       width: 180,
                  //       height: 60,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.orangeAccent,
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           const Icon(
                  //             Icons.assured_workload,
                  //             color: Colors.white,
                  //             size: 28,
                  //           ),
                  //           const SizedBox(
                  //             width: 10,
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: const [
                  //               Text(
                  //                 'TOUR TRẢ GÓP',
                  //                 style: TextStyle(
                  //                   fontSize: 15,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.white,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'Xem chi tiết',
                  //                 style: TextStyle(
                  //                   fontSize: 13,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Colors.white,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     scrollItem();
                  //   },
                  //   child: Expanded(
                  //     child: Container(
                  //       padding: const EdgeInsets.all(4.5),
                  //       width: 180,
                  //       height: 60,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white,
                  //         border:
                  //             Border.all(color: Colors.redAccent, width: 0.5),
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           const Icon(
                  //             Icons.discount,
                  //             color: Colors.red,
                  //             size: 28,
                  //           ),
                  //           const SizedBox(
                  //             width: 10,
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: const [
                  //               Text(
                  //                 '2 Khuyến Mãi',
                  //                 style: TextStyle(
                  //                   fontSize: 13,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.red,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'đang áp dụng',
                  //                 style: TextStyle(
                  //                   fontSize: 13,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Colors.red,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const TimeTourWidget(),
            // const Divider(
            //   indent: 20,
            //   endIndent: 20,
            // ),
            // InfoTour(
            //   codeTour: listData[0].id.toString(),
            //   timeTour: listData[0].tn123.toString(),
            // ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const ServiceTour(),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
              child: Text(
                  //
                  '25'),
            ),
            const Divider(
              thickness: 8,
            ),
            Column(
              children:
                  // [
                  //   DetailInfoView(
                  //     header: 'Chi tiết',
                  //     date: listData[0].ft300[0].tn305.toString(),
                  //     way: listData[0].ft300[0].tn305.toString(),
                  //   ),
                  // ],
                  listData
                      .map(
                        (e) => DetailInfoView(
                          header: 'Chi tiết',
                          date: listData[0].ft300[0].tn305.toString(),
                          way: listData[0].ft300[0].tn305.toString(),
                        ),
                      )
                      .toList(),
            ),
            const Divider(
              thickness: 8,
            ),
            const RuleView(
              header: 'Quy định riêng',
              title: 'Giá tour bao gồm: ',
            ),
            const Divider(
              thickness: 8,
            ),
            DiscountView(
              header: 'Khuyến mãi',
              key: discountKey,
            ),
            const Divider(
              thickness: 8,
            ),
            const PrivacyView(
              header: 'Chính sách riêng tư',
              title: 'Giá tour bao gồm',
              describe: 'Vé máy bay',
            ),
            const Divider(
              thickness: 8,
            ),
            DiscountView(
              header: 'Chính sách trả góp',
              key: installmentKey,
            ),
            const Divider(
              thickness: 8,
            ),
            const ContactView(
              header: 'Liên hệ',
            ),
            const Divider(
              thickness: 8,
            ),
            const RatingView(
                // rating: listRating[0].data.toString(),
                ),
            const Divider(
              thickness: 8,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: BottomAppBarCustom(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // checkUserConnection();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDateTimePage(
                checkActive: activeConnection,
              ),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}
