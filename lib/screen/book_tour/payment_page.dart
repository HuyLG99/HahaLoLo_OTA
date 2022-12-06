import 'package:flutter/material.dart';

import 'package:hahaloloapp/screen/detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/accompanied_service_model.dart';
import '../../models/more_service_model.dart';
import '../../widget/payment/card_info_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, required this.listBottomSheetDetail})
      : super(key: key);

  final List<MoreServiceModel?> listBottomSheetDetail;
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? firstName2;
  String? lastName2;
  String? email2;
  String? phone2;
  String? address2;
  String? nation2;
  String? city2;
  int? dayStart;
  int? monthStart;
  int? yearStart;
  int? dayEnd;
  int? monthEnd;
  int? yearEnd;

  int? qtyAdult;
  int? qtyChild;
  int? qtyLittleChild;
  int? qtyBaby;

  void loadData() async {
    final SharedPreferences prefs = await _prefs;
    firstName = prefs.getString('firstName') ?? '';
    lastName = prefs.getString('lastName') ?? '';
    email = prefs.getString('email') ?? '';
    phone = prefs.getString('phone') ?? '';
    address = prefs.getString('address') ?? '';
    setState(() {});
  }

  void loadData2() async {
    final SharedPreferences prefs = await _prefs;
    firstName2 = prefs.getString('firstName2') ?? '';
    lastName2 = prefs.getString('lastName2') ?? '';
    email2 = prefs.getString('email2') ?? '';
    phone2 = prefs.getString('phone2') ?? '';
    address2 = prefs.getString('address2') ?? '';
    nation2 = prefs.getString('nation2') ?? '';
    city2 = prefs.getString('city2') ?? '';

    setState(() {});
  }

  void getQtyCustomer() async {
    final SharedPreferences prefs = await _prefs;
    qtyAdult = prefs.getInt('qtyAdult');
    qtyChild = prefs.getInt('qtyChild');
    qtyLittleChild = prefs.getInt('qtyLittleChild');
    qtyBaby = prefs.getInt('qtyBaby');

    setState(() {});
  }

  void resetData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('qtyAdult', 1);
    prefs.setInt('qtyChild', 0);
    prefs.setInt('qtyLittleChild', 0);
    prefs.setInt('qtyBaby', 0);
    prefs.setString('firstName2', '');
    prefs.setString('lastName2', '');
    prefs.setString('email2', '');
    prefs.setString('phone2', '');
    prefs.setString('address2', '');
    prefs.setString('nation2', '');
    prefs.setString('city2', '');
  }

  void getStartEndDateTour() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      dayStart = prefs.getInt('dayStartTour');
      monthStart = prefs.getInt('monthStartTour');
      yearStart = prefs.getInt('yearStartTour');
      dayEnd = prefs.getInt('dayEndTour');
      monthEnd = prefs.getInt('monthEndTour');
      yearEnd = prefs.getInt('yearEndTour');
    });
  }

  void getCheckSave(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkSave_key', value);
  }

  @override
  void initState() {
    loadData();
    loadData2();
    getStartEndDateTour();
    getCheckSave(false);
    getQtyCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            'Thông tin tour',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        )),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              resetData();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailPage()),
              );
            },
            child: const Text(
              'Xong',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 30, 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Đặt tour thành công',
                    style: TextStyle(color: Colors.green, fontSize: 24),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Yêu cầu đặt tour của bạn đã được thực hiện thành công(Đã thanh toán). '
                'Bạn có thể kiểm tra thông tin chi tiết phòng đặt bên dưới.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            CardTourInfo(
              header: 'Thông tin Tour',
              name: 'CHƯƠNG TRÌNH Đeo Khẩu Trang Xứ Lạ ',
              pointStart: 'Thành phố Hồ Chí Minh',
              dayStart: dayStart,
              montStart: monthStart,
              yearStart: yearStart,
              dayEnd: dayEnd,
              montEnd: monthEnd,
              yearEnd: yearEnd,
              totalDay: '8 ngày',
              qtyAdult: qtyAdult,
              qtyBaby: qtyBaby,
              qtyChild: qtyChild,
              qtyLittleChild: qtyLittleChild,
            ),
            CardContactInfo(
              header: 'Thông tin liên hệ',
              name: '$firstName $lastName',
              phone: '$phone',
              address: '$address',
              email: '$email',
            ),
            CardTransactionInformation(
              header: 'Thông tin giao dịch',
              name: '$firstName2 $lastName2',
              phone: '$phone2',
              address: '$address2',
              email: '$email2',
              nation: '$nation2',
              city: '$city2',
            ),
            (widget.listBottomSheetDetail).isNotEmpty
                ? CardAccompaniedService(
                    header: 'Dịch vụ đính kèm',
                    listBottomSheetDetail: widget.listBottomSheetDetail,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
