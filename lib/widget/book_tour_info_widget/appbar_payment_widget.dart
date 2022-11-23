import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppBarPaymentWidget extends StatefulWidget {
  AppBarPaymentWidget(
      {Key? key,
      this.title,
      this.price,
      this.textButton,
      this.check,
      this.onChanged})
      : super(key: key);
  final String? title;
  final int? price;
  final String? textButton;
  bool? check;
  final ValueChanged<bool>? onChanged;

  @override
  State<AppBarPaymentWidget> createState() => _AppBarPaymentWidgetState();
}

class _AppBarPaymentWidgetState extends State<AppBarPaymentWidget> {
  bool _enabled = false;

  @override
  void didUpdateWidget(covariant AppBarPaymentWidget oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.price != widget.price) {
      setState(() {
        _enabled = true;
      });
      Timer(const Duration(milliseconds: 700), () {
        setState(() {
          _enabled = false;
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.title}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _enabled == true
                  ? SizedBox(
                      width: 200.0,
                      height: 20.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.white24,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      '${widget.price} đ',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue,
                border: Border.all(color: Colors.black12),
              ),
              child: Center(
                child: Text(
                  "${widget.textButton}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
