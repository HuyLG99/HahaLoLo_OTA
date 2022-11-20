import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/more_service_model.dart';

class CounterAccompaniedWidget extends StatefulWidget {
  const CounterAccompaniedWidget({
    Key? key,
    this.typePeople,
    this.typeAge,
    this.colorText,
    required this.maxCount,
    this.qty,
    required this.onTapIncrement,
    required this.onTapDecrement,
    required this.count,
    int? qualityChange,
  }) : super(key: key);
  final ValueChanged<int?>? qty;
  final String? typePeople;
  final String? typeAge;
  final Color? colorText;
  final num maxCount;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;
  final int count;
  @override
  State<CounterAccompaniedWidget> createState() =>
      _CounterAccompaniedWidgetState();
}

class _CounterAccompaniedWidgetState extends State<CounterAccompaniedWidget> {
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.typePeople != null
                  ? Text(
                      '${widget.typePeople}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: widget.colorText,
                      ),
                    )
                  : const SizedBox(),
              widget.typeAge != null
                  ? Text(
                      '${widget.typeAge}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.count < 1 ? null : widget.onTapDecrement();
                },
                child: Icon(
                  Icons.remove_circle_outline,
                  color: widget.count > 0 ? Colors.blue : Colors.grey,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    '${widget.count}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.count > 98 ||
                          widget.count >= widget.maxCount ||
                          widget.count == widget.maxCount
                      ? null
                      : widget.onTapIncrement();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: widget.count == widget.maxCount
                      ? Colors.grey
                      : Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
