import 'package:flutter/material.dart';

class BottomSheetDetail extends StatefulWidget {
  const BottomSheetDetail({
    Key? key,
    required this.name,
    required this.qty,
    this.price,
    this.checkNull,
    this.getCheckValue,
    required this.maxCount,
  }) : super(key: key);

  final String name;
  final int qty;
  final int? price;
  final bool? checkNull;
  final ValueChanged<bool>? getCheckValue;
  final int maxCount;

  @override
  BottomSheetDetailState createState() => BottomSheetDetailState();
}

class BottomSheetDetailState extends State<BottomSheetDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: widget.name.isNotEmpty && widget.qty != 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'x ${widget.qty}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.price ?? ''} đ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
