import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/screen/book_tour/amount_book_tour_view.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/accompained_service_view.dart';
import 'package:hahaloloapp/widget/core_widget.dart';
import '../../bloc/accompanied_service_bloc/accompanied_bloc.dart';
import '../../bloc/accompanied_service_bloc/accompanied_repository.dart';
import '../../bloc/counter_bloc.dart';
import '../../bloc/counter_cubit/counter_cubit.dart';
import '../../widget/book_tour_info_widget/appbar_payment_widget.dart';
import '../../widget/book_tour_info_widget/book_tour_widget.dart';

class BookTourPage extends StatefulWidget {
  const BookTourPage({Key? key}) : super(key: key);

  @override
  BookTourPageState createState() => BookTourPageState();
}

class BookTourPageState extends State<BookTourPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black26,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: Row(
          children: [
            const Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'Thông tin đặt Tour',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Chi tiết',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const BookTourPageBody(
        header: 'Thông tin người liên hệ',
      ),
      bottomNavigationBar: const BottomAppBar(
        child: AppBarPaymentWidget(
          textButton: 'Thanh toán',
          title: 'Tổng thanh toán',
          price: 1791000,
        ),
      ),
    );
  }
}

class BookTourPageBody extends StatelessWidget {
  const BookTourPageBody({Key? key, this.header, this.describe, this.title})
      : super(key: key);

  final String? header;
  final String? describe;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccompaniedServiceBloc>(
          create: (BuildContext context) => AccompaniedServiceBloc(
              context.read<AccompaniedServiceRepository>()),
        ),
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
      ],
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: TitleWidget(
                header: header,
                sizeText: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: BookTourInfoWidget(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: TitleWidget(
                header: 'Số lượng hành khách',
                sizeText: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AmountBookTourWidget(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: TitleWidget(
                header: 'Dịch vụ đính kèm',
                sizeText: 22,
              ),
            ),
            const AccompaniedServiceView(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: TitleWidget(
                header: 'Thông tin người thanh toán',
                sizeText: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleRadioWidget(
                radioText: 'Sử dụng thông tin người liên hệ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormValidation2(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleRadioWidget(
                radioText: 'Lưu thông tin thanh toán cho lần sau',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
            const DiscountCodeWidget(
              text: 'Mã giảm giá',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
            const UseCoinWidget(
              coinUse: 10000,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: Divider(
                thickness: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
