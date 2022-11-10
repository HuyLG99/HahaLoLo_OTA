import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_accompanied_cubit/counter_cubit.dart';

class CounterAccompaniedWidget extends StatefulWidget {
  CounterAccompaniedWidget({
    Key? key,
    this.count,
    this.typePeople,
    this.typeAge,
    this.colorText,
    required this.maxCount,
  }) : super(key: key);
  num? count;
  final String? typePeople;
  final String? typeAge;
  final Color? colorText;
  final num maxCount;
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
                      count < 1
                          ? null
                          : context.read<CounterAccompaniedCubit>().decrement();
                      setState(() {
                        widget.count = count;
                        print(widget.count);
                      });
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
                    onTap: () {
                      count > 98 || count >= widget.maxCount
                          ? null
                          : context.read<CounterAccompaniedCubit>().increment();
                      setState(() {
                        widget.count = count;
                        print(widget.count);
                      });
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
      ),
    );
  }
}
