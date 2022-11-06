import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_cubit/counter_cubit.dart';

class AmountBookTourWidget extends StatelessWidget {
  const AmountBookTourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      return Column(
        children: [
          AmountCounterWidget(
              typePeople: 'Người lớn',
              typeAge: 'Từ 12 tuổi',
              count: state.amountCustomer.adult + 1,
              onTapDecrement: () {
                context
                    .read<CounterCubit>()
                    .decrementAdult(state.amountCustomer.adult - 1);
              },
              onTapIncrement: () {
                context
                    .read<CounterCubit>()
                    .incrementAdult(state.amountCustomer.adult + 1);
              }),
          AmountCounterWidget(
            typePeople: 'Trẻ em',
            typeAge: '11 tuổi - dưới 12 tuổi',
            count: state.amountCustomer.child,
            onTapIncrement: () {
              context
                  .read<CounterCubit>()
                  .incrementChild(state.amountCustomer.child + 1);
            },
            onTapDecrement: () {
              context
                  .read<CounterCubit>()
                  .decrementChild(state.amountCustomer.child - 1);
            },
          ),
          AmountCounterWidget(
            typePeople: 'Trẻ nhỏ',
            typeAge: '6 tuổi dưới - dưới 11 tuổi',
            count: state.amountCustomer.littleChild,
            onTapIncrement: () {
              context
                  .read<CounterCubit>()
                  .incrementLittleChild(state.amountCustomer.littleChild + 1);
            },
            onTapDecrement: () {
              context
                  .read<CounterCubit>()
                  .decrementLittleChild(state.amountCustomer.littleChild - 1);
            },
          ),
          AmountCounterWidget(
            typePeople: 'Em bé',
            typeAge: 'Dưới 6 tuổi',
            count: state.amountCustomer.baby,
            onTapIncrement: () {
              context
                  .read<CounterCubit>()
                  .incrementBaby(state.amountCustomer.baby + 1);
            },
            onTapDecrement: () {
              context
                  .read<CounterCubit>()
                  .decrementBaby(state.amountCustomer.baby - 1);
            },
          ),
          const RadioOptionWidget(),
        ],
      );
    });
  }
}

class AmountCounterWidget extends StatefulWidget {
  const AmountCounterWidget({
    Key? key,
    required this.count,
    this.typePeople,
    this.typeAge,
    this.colorText,
    required this.onTapIncrement,
    required this.onTapDecrement,
  }) : super(key: key);
  final int count;
  final String? typePeople;
  final String? typeAge;
  final Color? colorText;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;

  @override
  State<AmountCounterWidget> createState() => _AmountCounterWidgetState();
}

class _AmountCounterWidgetState extends State<AmountCounterWidget> {
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
                onTapDown: (TapDownDetails details) {
                  timer =
                      Timer.periodic(const Duration(milliseconds: 300), (t) {
                    widget.count <= 1 ? null : widget.onTapDecrement();
                  });
                },
                onTapUp: (TapUpDetails details) {
                  timer.cancel();
                },
                onTapCancel: () {
                  timer.cancel();
                },
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
                )),
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  timer =
                      Timer.periodic(const Duration(milliseconds: 200), (t) {
                    widget.count > 98 ? null : widget.onTapIncrement();
                  });
                },
                onTapUp: (TapUpDetails details) {
                  timer.cancel();
                },
                onTapCancel: () {
                  timer.cancel();
                },
                onTap: () {
                  widget.count > 98 ? null : widget.onTapIncrement();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: widget.count < 99 ? Colors.blue : Colors.grey,
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

class RadioOptionWidget extends StatefulWidget {
  const RadioOptionWidget({Key? key}) : super(key: key);

  @override
  RadioOptionWidgetState createState() => RadioOptionWidgetState();
}

enum Choice { enable, disable }

class RadioOptionWidgetState extends State<RadioOptionWidget> {
  Choice? _choice = Choice.enable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<Choice>(
              value: Choice.disable,
              groupValue: _choice,
              onChanged: (Choice? value) {
                setState(() {
                  _choice = value;
                });
              },
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Text Color
                ),
                onPressed: () {
                  setState(() {
                    _choice = Choice.disable;
                  });
                },
                child: const Text(
                  'Yêu cầu hỗ trợ nhập thông tin khách hàng sau',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio<Choice>(
              value: Choice.enable,
              groupValue: _choice,
              onChanged: (Choice? value) {
                setState(() {
                  _choice = value;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text Color
              ),
              onPressed: () {
                setState(() {
                  _choice = Choice.enable;
                });
              },
              child: const Text(
                'Nhập thông tin hành khách đi Tour',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        _choice == Choice.enable
            ? Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.warning_amber_outlined,
                              color: Colors.orange.withOpacity(0.3),
                            ),
                          ),
                          const Expanded(
                            flex: 4,
                            child: Text(
                              ' Lưu ý: Chưa hoàn tất thông tin khách hàng',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 220,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.8),
                        ),
                        child: const Center(
                          child: Text(
                            'Cập nhật ngay',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
