import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          title: 'Tên Tour',
          info: name ?? '',
        ),
        TextInfo(
          title: 'Điểm khởi hành',
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
                  'Ngày khởi hành',
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
                  'Ngày kết thúc',
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
          title: 'Số ngày',
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
                  'Số lượng khách',
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
                    '${qtyAdult! > 0 ? '$qtyAdult người lớn' : ''}${qtyChild! > 0 ? ', $qtyChild trẻ em' : ''}'
                    '${qtyLittleChild! > 0 ? ', $qtyLittleChild trẻ nhỏ' : ''}${qtyBaby! > 0 ? ', $qtyBaby em bé' : ''}',
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
          title: 'Họ Tên',
          info: name ?? '',
        ),
        TextInfo(
          title: 'Email',
          info: email ?? '',
        ),
        TextInfo(
          title: 'Số điện thoại',
          info: phone ?? '',
        ),
        TextInfo(
          title: 'Địa chỉ',
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
          title: 'Họ Tên',
          info: name ?? '',
        ),
        TextInfo(
          title: 'Email',
          info: email ?? '',
        ),
        TextInfo(
          title: 'Số điện thoại',
          info: phone ?? '',
        ),
        TextInfo(
          title: 'Địa chỉ',
          info: address ?? '',
        ),
        TextInfo(
          title: 'Quốc gia',
          info: nation ?? '',
        ),
        TextInfo(
          title: 'Bang/Thành Phố',
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
  final List<AccompaniedServiceData?> listBottomSheetDetail;
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
                  name: listBottomSheetDetail[index]?.t250.t251.tv251 ?? '',
                  qty: (listBottomSheetDetail[index]?.qty ?? 0),
                  price: listBottomSheetDetail[index]?.tn452,
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
