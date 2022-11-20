import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';
import 'package:hahaloloapp/screen/book_tour/amount_book_tour_view.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/accompained_service_view.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/bottomSheetDetail.dart';
import 'package:hahaloloapp/widget/core_widget.dart';

import '../../bloc/accompanied_service_bloc/accompanied_bloc.dart';
import '../../bloc/accompanied_service_bloc/accompanied_repository.dart';
import '../../bloc/counter_cubit/counter_cubit.dart';
import '../../widget/book_tour_info_widget/appbar_payment_widget.dart';
import '../../widget/book_tour_info_widget/book_tour_widget.dart';

class BookTourPage extends StatefulWidget {
  const BookTourPage({Key? key}) : super(key: key);

  @override
  BookTourPageState createState() => BookTourPageState();
}

class BookTourPageState extends State<BookTourPage> {
  List<AccompaniedServiceData?> listBottomSheetDetail = [];
  List<MoreServiceModel?> listShowMoreServiceDetail = [];
  ValueChanged<List<AccompaniedServiceData?>>? showListBottomSheetDetail;
  ValueChanged<List<MoreServiceModel?>>? showListMoreService;
  var sum = 0;

  @override
  void initState() {
    super.initState();
  }

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
      child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, stateAmount) {
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
          body: BookTourPageBody(
            header: 'Thông tin người liên hệ',
            sum: sum,
            getSum: (valueSum) {
              setState(() {
                sum = valueSum ?? 0;
              });
            },
            // showListBottomSheetDetail: (valueSelected) {
            //   setState(() {
            //     listBottomSheetDetail = valueSelected;
            //   });
            // },
            // getListBottomSheetDetail: listBottomSheetDetail,

            showListMoreService: (valueMoreService) {
              setState(() {
                listShowMoreServiceDetail = valueMoreService;
              });
            },
            getListMoreServiceDetail: listShowMoreServiceDetail,
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              listShowMoreServiceDetail.isNotEmpty
                  ? showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AppBarPaymentWidget(
                                  textButton: 'Thanh toán',
                                  title: 'Tổng thanh toán',
                                  price: sum,
                                ),
                                const Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  thickness: 1,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Chi tiết giá',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: listShowMoreServiceDetail.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return BottomSheetDetail(
                                        name: listShowMoreServiceDetail[index]
                                                ?.name ??
                                            '',
                                        qty: listShowMoreServiceDetail[index]
                                                ?.qty ??
                                            0,
                                        price: listShowMoreServiceDetail[index]
                                            ?.price,
                                        maxCount: stateAmount
                                            .amountCustomer.totalCustomer,
                                      );
                                    }),
                              ],
                            ),
                          ),
                        );
                      })
                  : const SizedBox();
            },
            child: BottomAppBar(
              child: AppBarPaymentWidget(
                textButton: 'Thanh toán',
                title: 'Tổng thanh toán',
                price: sum,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class BookTourPageBody extends StatefulWidget {
  BookTourPageBody({
    Key? key,
    this.header,
    this.describe,
    this.title,
    this.showListBottomSheetDetail,
    this.getSum,
    this.sum,
    this.currentSum,
    this.onCheck,
    this.getListBottomSheetDetail,
    this.showListMoreService,
    this.getListMoreServiceDetail,
  }) : super(key: key);

  final String? header;
  final String? describe;
  final String? title;
  int? sum;
  int? currentSum;
  ValueChanged<List<AccompaniedServiceData?>>? showListBottomSheetDetail;
  ValueChanged<List<MoreServiceModel?>>? showListMoreService;
  List<AccompaniedServiceData?>? getListBottomSheetDetail;
  List<MoreServiceModel?>? getListMoreServiceDetail;

  ValueChanged<int?>? getSum;
  ValueChanged<bool?>? onCheck;
  @override
  State<BookTourPageBody> createState() => _BookTourPageBodyState();
}

class _BookTourPageBodyState extends State<BookTourPageBody> {
  List<AccompaniedServiceData?> listSelectedService = [];
  bool check = false;
  @override
  void initState() {
    super.initState();
    context
        .read<AccompaniedServiceBloc>()
        .add(AccompaniedServiceCompareSelected());
  }

  List<AccompaniedServiceData> accompaniedListGet = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
        builder: (context, stateAmount) {
      return SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: TitleWidget(
                header: widget.header,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AmountBookTourWidget(
                listBottomSheetDetail: widget.getListBottomSheetDetail,
                maxCount: stateAmount.amountCustomer.totalCustomer,
                qty: (value) {
                  setState(() {
                    widget.getSum?.call(value);
                  });
                },
              ),
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
            BlocBuilder<AccompaniedServiceBloc, AccompaniedServiceState>(
                builder: (context, state) {
              accompaniedListGet = state.listAccompaniedService;

              return AccompaniedServiceView(
                maxCount: stateAmount.amountCustomer.totalCustomer,
                accompaniedList: accompaniedListGet,
                getMoreServiceList: (valueMore) {
                  setState(() {
                    widget.showListMoreService?.call(valueMore);
                    final totalPrice = valueMore.fold(
                        0,
                        (int sum, element) =>
                            sum + (element!.qty ?? 0) * element.price!);

                    widget.getSum?.call(totalPrice);
                  });
                },
                // getSelectedList: (value) {
                //   setState(() {
                //     widget.showListBottomSheetDetail?.call(value);
                //     final totalPrice = value.fold(
                //         0,
                //         (int sum, element) => (stateAmount
                //                     .amountCustomer.totalCustomer) <
                //                 (element?.qty ?? 0)
                //             ? (sum + ((element!.qty ?? 0) - 1) * element.tn452)
                //             : (sum + (element!.qty ?? 0) * element.tn452));
                //
                //     widget.getSum?.call(totalPrice);
                //   });
                // },
              );
            }),
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
      );
    });
  }
}
