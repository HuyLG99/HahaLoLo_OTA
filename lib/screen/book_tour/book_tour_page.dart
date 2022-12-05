import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';
import 'package:hahaloloapp/screen/book_tour/amount_book_tour_view.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/accompained_service_view.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/bottom_sheet_detail.dart';
import 'package:hahaloloapp/widget/core_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/accompanied_service_bloc/accompanied_bloc.dart';
import '../../bloc/accompanied_service_bloc/accompanied_repository.dart';
import '../../bloc/counter_cubit/counter_cubit.dart';
import '../../models/customer_information_model.dart';
import '../../widget/book_tour_info_widget/appbar_payment_widget.dart';
import '../../widget/book_tour_info_widget/form_validation_2_widget.dart';
import '../../widget/book_tour_info_widget/fom_validation_widget.dart';
import '../../widget/book_tour_info_widget/infor_input_customer_widget.dart';
import 'payment_page.dart';

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
  List<CustomerInformationModel>? listInformationCustomer = [];
  bool? isCheckSave;
  bool oneOn = false;
  bool isValidateFirstNameNull = false;
  bool isValidateLastNameNull = false;
  bool isValidatePhoneNull = false;
  bool isValidateEmailNameNull = false;
  bool isValidateAddressNameNull = false;
  bool isValidateFirstNameNull2 = false;
  bool isValidateLastNameNull2 = false;
  bool isValidatePhoneNull2 = false;
  bool isValidateEmailNameNull2 = false;
  bool isValidateAddressNameNull2 = false;
  bool isActiveValidate = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String? firstName2;
  String? lastName2;
  String? email2;
  String? phone2;
  String? address2;
  String? nation2;
  String? city2;

  void checkStatusValidate() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isCheckSave = prefs.getBool('checkSave_key')!;
      isValidateFirstNameNull = prefs.getBool('checkFirstNameValidate_key')!;
      isValidateLastNameNull = prefs.getBool('checkLastNameValidate_key')!;
      isValidateEmailNameNull = prefs.getBool('checkEmailValidate_key')!;
      isValidatePhoneNull = prefs.getBool('checkPhoneValidate_key')!;
      isValidateAddressNameNull = prefs.getBool('checkAddressValidate_key')!;
      isValidateFirstNameNull2 = prefs.getBool('checkFirstNameValidate2_key')!;
      isValidateLastNameNull2 = prefs.getBool('checkLastNameValidate2_key')!;
      isValidateEmailNameNull2 = prefs.getBool('checkEmailValidate2_key')!;
      isValidatePhoneNull2 = prefs.getBool('checkPhoneValidate2_key')!;
      isValidateAddressNameNull2 = prefs.getBool('checkAddressValidate2_key')!;
    });
  }

  void getNewValueUpdate() async {
    final SharedPreferences prefs = await _prefs;
    firstName2 = prefs.getString('firstName2');
    lastName2 = prefs.getString('lastName2');
    email2 = prefs.getString('email2');
    phone2 = prefs.getString('phone2');
    address2 = prefs.getString('address2');
    nation2 = prefs.getString('nation2');
    city2 = prefs.getString('city2');

    CustomerInformationModel textInputValue = CustomerInformationModel(
      firstName: firstName2,
      lastName: lastName2,
      email: email2,
      phone: phone2,
      address: address2,
      nation: nation2,
      city: city2,
    );
    // listInformationCustomer?.add(textInputValue);
  }

  void updateListInfo() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      final resultDataString = prefs.getString('textInput') ?? '';
      getNewValueUpdate();
      if (listInformationCustomer!.isEmpty && resultDataString == '' ||
          listInformationCustomer!.isNotEmpty && resultDataString == '') {
        isCheckSave = prefs.getBool('checkSave_key')!;
        isValidateFirstNameNull = prefs.getBool('checkFirstNameValidate_key')!;
        isValidateLastNameNull = prefs.getBool('checkLastNameValidate_key')!;
        isValidateEmailNameNull = prefs.getBool('checkEmailValidate_key')!;
        isValidatePhoneNull = prefs.getBool('checkPhoneValidate_key')!;
        isValidateAddressNameNull = prefs.getBool('checkAddressValidate_key')!;
        isValidateFirstNameNull2 =
            prefs.getBool('checkFirstNameValidate2_key')!;
        isValidateLastNameNull2 = prefs.getBool('checkLastNameValidate2_key')!;
        isValidateEmailNameNull2 = prefs.getBool('checkEmailValidate2_key')!;
        isValidatePhoneNull2 = prefs.getBool('checkPhoneValidate2_key')!;
        isValidateAddressNameNull2 =
            prefs.getBool('checkAddressValidate2_key')!;
        if (isValidateFirstNameNull == false &&
            isValidateLastNameNull == false &&
            isValidateEmailNameNull == false &&
            isValidatePhoneNull == false &&
            isValidateAddressNameNull == false &&
            isValidateFirstNameNull2 == false &&
            firstName2!.isEmpty &&
            lastName2!.isEmpty &&
            email2!.isEmpty &&
            address2!.isEmpty &&
            phone2!.isEmpty &&
            isValidateLastNameNull2 == false &&
            isValidateEmailNameNull2 == false &&
            isValidatePhoneNull2 == false &&
            isValidateAddressNameNull2 == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentPage(
                      listBottomSheetDetail: listBottomSheetDetail,
                    )),
          );
        }
      }
      final resultEndCode = jsonDecode(resultDataString);
      final resultObject = CustomerInformationModel.fromJson(resultEndCode);

      if (listInformationCustomer!.length < 4) {
        isCheckSave = prefs.getBool('checkSave_key')!;
        isValidateFirstNameNull = prefs.getBool('checkFirstNameValidate_key')!;
        isValidateLastNameNull = prefs.getBool('checkLastNameValidate_key')!;
        isValidateEmailNameNull = prefs.getBool('checkEmailValidate_key')!;
        isValidatePhoneNull = prefs.getBool('checkPhoneValidate_key')!;
        isValidateAddressNameNull = prefs.getBool('checkAddressValidate_key')!;
        isValidateFirstNameNull2 =
            prefs.getBool('checkFirstNameValidate2_key')!;
        isValidateLastNameNull2 = prefs.getBool('checkLastNameValidate2_key')!;
        isValidateEmailNameNull2 = prefs.getBool('checkEmailValidate2_key')!;
        isValidatePhoneNull2 = prefs.getBool('checkPhoneValidate2_key')!;
        isValidateAddressNameNull2 =
            prefs.getBool('checkAddressValidate2_key')!;
        if (isValidateFirstNameNull == false &&
            isValidateLastNameNull == false &&
            isValidateEmailNameNull == false &&
            isValidatePhoneNull == false &&
            isValidateAddressNameNull == false &&
            isValidateFirstNameNull2 == false &&
            isValidateLastNameNull2 == false &&
            isValidateEmailNameNull2 == false &&
            isValidatePhoneNull2 == false &&
            isValidateAddressNameNull2 == false) {
          if (listInformationCustomer!.length == 3 && isCheckSave == true) {
            listInformationCustomer!.removeAt(0);
          }
          isCheckSave == true
              ? listInformationCustomer?.add(resultObject)
              : null;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentPage(
                      listBottomSheetDetail: listBottomSheetDetail,
                    )),
          );
        }
      }
      final String encodedData =
          CustomerInformationModel.encode(listInformationCustomer!);
      prefs.setString('listValueUpdate_key', encodedData);
    });
  }

  void addDataToList() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      final String? listValueUpdateString =
          prefs.getString('listValueUpdate_key');
      final List<CustomerInformationModel> listChange =
          CustomerInformationModel.decode(listValueUpdateString ?? '');
      listInformationCustomer = listChange;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      addDataToList();
      if (listInformationCustomer!.isNotEmpty) {
        updateListInfo();
      }
    });
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
            isActiveValidate: isActiveValidate,
            getSum: (valueSum) {
              setState(() {
                sum = valueSum ?? 0;
              });
            },
            showListBottomSheetDetail: (valueSelected) {
              setState(() {
                listBottomSheetDetail = valueSelected;
              });
            },
            getListBottomSheetDetail: listBottomSheetDetail,
            listInformationCustomer: listInformationCustomer,
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              listBottomSheetDetail.isNotEmpty
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
                                  callback: () {
                                    updateListInfo();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentPage(
                                                listBottomSheetDetail:
                                                    listBottomSheetDetail,
                                              )),
                                    );
                                  },
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
                                    itemCount: listBottomSheetDetail.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return BottomSheetDetail(
                                        name: listBottomSheetDetail[index]
                                                ?.t250
                                                .t251
                                                .tv251 ??
                                            '',
                                        qty: (stateAmount.amountCustomer
                                                    .totalCustomer) >
                                                (listBottomSheetDetail[index]
                                                        ?.qty ??
                                                    0)
                                            ? (listBottomSheetDetail[index]
                                                    ?.qty ??
                                                0)
                                            : (stateAmount
                                                .amountCustomer.totalCustomer),
                                        price:
                                            listBottomSheetDetail[index]?.tn452,
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
                callback: () {
                  setState(() {
                    isActiveValidate = true;
                  });
                  updateListInfo();
                },
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

//ignore: must_be_immutable
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
    this.getListBottomSheetDetail,
    this.showListMoreService,
    this.getListMoreServiceDetail,
    this.listInformationCustomer,
    this.isActiveValidate,
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
  final bool? isActiveValidate;
  List<CustomerInformationModel>? listInformationCustomer;

  @override
  State<BookTourPageBody> createState() => _BookTourPageBodyState();
}

class _BookTourPageBodyState extends State<BookTourPageBody> {
  List<AccompaniedServiceData?> listSelectedService = [];
  List<AccompaniedServiceData> accompaniedListGet = [];
  bool check = false;
  List<CustomerInformationModel>? listInformationCustomer = [];
  final formValidateKey = GlobalKey();
  Future scrollItem() async {
    final context = formValidateKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<AccompaniedServiceBloc>()
        .add(AccompaniedServiceCompareSelected());
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormValidation(
                key: formValidateKey,
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
                header: 'Số lượng hành khách',
                sizeText: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AmountBookTourWidget(
                listBottomSheetDetail: widget.getListBottomSheetDetail,
                maxCount: stateAmount.amountCustomer.totalCustomer,
                getSum: (value) {
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
                getSelectedList: (value) {
                  setState(() {
                    widget.showListBottomSheetDetail?.call(value);
                    final totalPrice = value.fold(
                        0,
                        (int sum, element) => (stateAmount
                                    .amountCustomer.totalCustomer) <
                                (element?.qty ?? 0)
                            ? (sum + ((element!.qty ?? 0) - 1) * element.tn452)
                            : (sum + (element!.qty ?? 0) * element.tn452));

                    widget.getSum?.call(totalPrice);
                  });
                },
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormValidation2(
                onChanged: (value) {
                  setState(() {
                    scrollItem();
                  });
                },
                listInformation: widget.listInformationCustomer,
                isValidateActive: widget.isActiveValidate,
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
