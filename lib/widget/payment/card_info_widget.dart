import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/models/more_service_model.dart';
import 'package:hahaloloapp/widget/payment/text_info_widget.dart';

import '../../bloc/counter_cubit/counter_cubit.dart';
import '../../models/accompanied_service_model.dart';
import '../book_tour_info_widget/bottom_sheet_detail.dart';

class CardTourInfo extends StatelessWidget {
  const CardTourInfo({
    Key? key,
    required this.header,
    this.title,
    this.name,
    this.pointStart,
    this.totalDay,
    this.qtyAdult,
    this.qtyChild,
    this.qtyLittleChild,
    this.qtyBaby,
    this.dayStart,
    this.montStart,
    this.yearStart,
    this.dayEnd,
    this.montEnd,
    this.yearEnd,
  }) : super(key: key);
  final String header;
  final String? title;
  final String? name;
  final String? pointStart;
  final int? dayStart;
  final int? montStart;
  final int? yearStart;
  final int? dayEnd;
  final int? montEnd;
  final int? yearEnd;
  final String? totalDay;
  final int? qtyAdult;
  final int? qtyChild;
  final int? qtyLittleChild;
  final int? qtyBaby;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                header ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextInfo(
          title: 'T??n Tour',
          info: name ?? '',
        ),
        TextInfo(
          title: '??i???m kh???i h??nh',
          info: pointStart ?? '',
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 5, bottom: 5, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'Ng??y kh???i h??nh',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    '$dayStart/$montStart/$yearStart',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  )),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 5, bottom: 5, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'Ng??y k???t th??c',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    '$dayEnd/$montEnd/$yearEnd',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  )),
            ],
          ),
        ),
        TextInfo(
          title: 'S??? ng??y',
          info: totalDay ?? '',
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 5, bottom: 5, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'S??? l?????ng kh??ch',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    '${(qtyAdult ?? 1) > 0 ? '$qtyAdult ng?????i l???n' : ''}${(qtyChild ?? 0) > 0 ? ', $qtyChild tr??? em' : ''}'
                    '${(qtyLittleChild ?? 0) > 0 ? ', $qtyLittleChild tr??? nh???' : ''}${(qtyBaby ?? 0) > 0 ? ', $qtyBaby em b??' : ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  )),
            ],
          ),
        ),
        const Divider(
          thickness: 10,
        ),
      ],
    );
  }
}

class CardContactInfo extends StatelessWidget {
  const CardContactInfo({
    Key? key,
    required this.header,
    this.title,
    this.name,
    this.email,
    this.address,
    this.phone,
  }) : super(key: key);
  final String header;
  final String? title;
  final String? name;
  final String? email;
  final String? address;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                header ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextInfo(
          title: 'H??? T??n',
          info: name ?? '',
        ),
        TextInfo(
          title: 'Email',
          info: email ?? '',
        ),
        TextInfo(
          title: 'S??? ??i???n tho???i',
          info: phone ?? '',
        ),
        TextInfo(
          title: '?????a ch???',
          info: address ?? '',
        ),
        const Divider(
          thickness: 10,
        ),
      ],
    );
  }
}

class CardTransactionInformation extends StatelessWidget {
  const CardTransactionInformation({
    Key? key,
    required this.header,
    this.title,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.nation,
    this.city,
  }) : super(key: key);
  final String header;
  final String? title;
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final String? nation;
  final String? city;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                header ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextInfo(
          title: 'H??? T??n',
          info: name ?? '',
        ),
        TextInfo(
          title: 'Email',
          info: email ?? '',
        ),
        TextInfo(
          title: 'S??? ??i???n tho???i',
          info: phone ?? '',
        ),
        TextInfo(
          title: '?????a ch???',
          info: address ?? '',
        ),
        TextInfo(
          title: 'Qu???c gia',
          info: nation ?? '',
        ),
        TextInfo(
          title: 'Bang/Th??nh Ph???',
          info: city ?? '',
        ),
        const Divider(
          thickness: 10,
        ),
      ],
    );
  }
}

class CardAccompaniedService extends StatelessWidget {
  const CardAccompaniedService({
    Key? key,
    required this.header,
    this.title,
    this.qty,
    this.price,
    required this.listBottomSheetDetail,
  }) : super(key: key);
  final String header;
  final String? title;
  final String? qty;
  final String? price;
  final List<MoreServiceModel?> listBottomSheetDetail;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
        builder: (context, stateAmount) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  header ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listBottomSheetDetail.length,
              itemBuilder: (BuildContext context, int index) {
                return BottomSheetDetail(
                  name: listBottomSheetDetail[index]?.name ?? '',
                  qty: (listBottomSheetDetail[index]?.qty ?? 0),
                  price: listBottomSheetDetail[index]?.price,
                  maxCount: stateAmount.amountCustomer.totalCustomer,
                );
              }),
          const Divider(
            thickness: 10,
          ),
        ],
      );
    });
  }
}
