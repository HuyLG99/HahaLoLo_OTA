import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_accompanied_cubit/counter_cubit.dart';

class CounterAccompaniedWidget extends StatefulWidget {
  const CounterAccompaniedWidget({
    Key? key,
    this.count,
    this.typePeople,
    this.typeAge,
    this.colorText,
    required this.onTapIncrement,
    required this.onTapDecrement,
  }) : super(key: key);
  final int? count;
  final String? typePeople;
  final String? typeAge;
  final Color? colorText;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;

  @override
  State<CounterAccompaniedWidget> createState() => _AmountCounterWidgetState();
}

class _AmountCounterWidgetState extends State<CounterAccompaniedWidget> {
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
                      onTapDown: (TapDownDetails details) {
                        timer = Timer.periodic(
                            const Duration(milliseconds: 300), (t) {
                          count <= 1
                              ? null
                              : context
                                  .read<CounterAccompaniedCubit>()
                                  .decrement();
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        timer.cancel();
                      },
                      onTapCancel: () {
                        timer.cancel();
                      },
                      onTap: () {
                        count < 1
                            ? null
                            : context
                                .read<CounterAccompaniedCubit>()
                                .decrement();
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: count > 0 ? Colors.blue : Colors.grey,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Center(
                          child: Text(
                        '$count',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        timer = Timer.periodic(
                            const Duration(milliseconds: 200), (t) {
                          count > 98
                              ? null
                              : context
                                  .read<CounterAccompaniedCubit>()
                                  .increment();
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        timer.cancel();
                      },
                      onTapCancel: () {
                        timer.cancel();
                      },
                      onTap: () {
                        count > 98
                            ? null
                            : context
                                .read<CounterAccompaniedCubit>()
                                .increment();
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: count < 99 ? Colors.blue : Colors.grey,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
