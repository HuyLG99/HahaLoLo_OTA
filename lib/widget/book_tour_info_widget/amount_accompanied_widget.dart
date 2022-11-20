import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_accompanied_cubit/counter_accompanied_cubit.dart';

class CounterAccompaniedWidget extends StatefulWidget {
  const CounterAccompaniedWidget({
    Key? key,
    this.typePeople,
    this.typeAge,
    this.colorText,
    required this.maxCount,
    this.qty,
    this.qualityChange,
  }) : super(key: key);
  final ValueChanged<int?>? qty;
  final int? qualityChange;
  final String? typePeople;
  final String? typeAge;
  final Color? colorText;
  final int maxCount;

  @override
  State<CounterAccompaniedWidget> createState() =>
      _CounterAccompaniedWidgetState();
}

class _CounterAccompaniedWidgetState extends State<CounterAccompaniedWidget> {
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterAccompaniedCubit(),
      child: BlocBuilder<CounterAccompaniedCubit, int>(
        builder: (context, count) => Padding(
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
                      count <= 0
                          ? null
                          : context.read<CounterAccompaniedCubit>().decrement();
                      setState(() {
                        if (widget.maxCount < count) {
                          count = widget.maxCount;
                        }
                        widget.qty?.call(count > 1 ? count : count - 1);
                        print(count);
                      });
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: (count) > 0 ? Colors.blue : Colors.grey,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: (widget.qualityChange ?? count) > widget.maxCount
                          ? Text(
                              '${((widget.qualityChange ?? count) - 1)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          : Text(
                              '${((widget.qualityChange ?? count))}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count > 98 ||
                                count >= widget.maxCount ||
                                count == widget.maxCount
                            ? null
                            : context
                                .read<CounterAccompaniedCubit>()
                                .increment();
                        if (count < widget.maxCount) {
                          if (widget.maxCount < count) {
                            count = widget.maxCount;
                            print(count);
                          }
                          widget.qty?.call(
                              (widget.qualityChange ?? count) < widget.maxCount
                                  ? count + 1
                                  : count);
                        }
                      });
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color:
                          count >= widget.maxCount ? Colors.grey : Colors.blue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
