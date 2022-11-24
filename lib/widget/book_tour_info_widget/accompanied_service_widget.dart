import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hahaloloapp/models/accompanied_service_model.dart';

import '../../bloc/counter_accompanied_cubit/counter_accompanied_cubit.dart';
import 'amount_accompanied_widget.dart';

//ignore: must_be_immutable
class AccompaniedService extends StatefulWidget {
  AccompaniedService({
    Key? key,
    this.id,
    required this.name,
    this.qty,
    required this.accompaniedServiceData,
    this.onSelected,
    this.onDeleted,
    this.currentID,
    this.amountCount,
    this.maxCount,
  }) : super(key: key);

  final String? id;
  final String? name;
  int? qty;
  int? maxCount;
  final List<AccompaniedServiceData> accompaniedServiceData;
  final ValueChanged<AccompaniedServiceData?>? onSelected;
  final ValueChanged<AccompaniedServiceData?>? onDeleted;

  ValueChanged<String?>? currentID;
  ValueChanged<int?>? amountCount;
  @override
  State<AccompaniedService> createState() => _AccompaniedServiceState();
}

class _AccompaniedServiceState extends State<AccompaniedService> {
  AccompaniedServiceData? selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterAccompaniedCubit(),
      child: BlocBuilder<CounterAccompaniedCubit, CounterAccompaniedState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CounterAccompaniedCubit>(context);
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<AccompaniedServiceData>(
                            elevation: 1,
                            onTap: () {
                              setState(() {
                                widget.currentID?.call(widget.name);
                              });
                            },
                            hint: Text(
                              widget.name ?? "Dịch vụ đính kèm",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            underline: Container(
                              height: 2,
                              width: 30,
                              color: Colors.white24,
                            ),
                            // values should match
                            onChanged: (selected) async {
                              setState(() {
                                selectedMenuItem = selected;
                                widget.onSelected?.call(selected);
                                widget.currentID?.call(widget.name);
                                widget.amountCount?.call(state.counter);
                              });
                            },
                            items: widget.accompaniedServiceData
                                .map(
                                  (selected) => DropdownMenuItem(
                                    onTap: () {
                                      setState(() {
                                        widget.currentID?.call(widget.name);
                                      });
                                    },
                                    value: selected, // you must provide a value
                                    child: Text(
                                      selected.t250.t251.tv251,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),

                            // value: selectedMenuItem,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.currentID?.call(widget.name);
                                widget.onDeleted?.call(selectedMenuItem);
                                state.counter = widget.qty ?? 0;
                                // widget.amountCount?.call(state.counter);
                                selectedMenuItem = null;
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.red[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    CounterAccompaniedWidget(
                      typePeople: 'Số khách hàng',
                      colorText: Colors.grey,
                      maxCount: widget.maxCount ?? 1,
                      qualityChange: widget.qty,
                      onTapIncrement: () {
                        context.read<CounterAccompaniedCubit>().increment();

                        if ((widget.qty ?? 0) <= state.counter &&
                            widget.qty != 0) {
                          setState(() {
                            state.counter = widget.qty ?? 0;
                          });
                        }
                        widget.amountCount?.call(state.counter + 1);
                        // print('state count: ${state.counter + 1}');
                        // print('max count: ${(widget.maxCount ?? 1)}');
                      },
                      onTapDecrement: () {
                        context.read<CounterAccompaniedCubit>().decrement();
                        if ((state.counter) > (widget.maxCount ?? 1) &&
                            state.counter > 1) {
                          setState(() {
                            state.counter = widget.maxCount ?? 0;
                          });

                          if (((widget.maxCount ?? 1)) == 1) {
                            cubit.clean();
                          }
                          if (((widget.maxCount ?? 1)) == 2) {
                            cubit.clean1();
                          }
                          if (((widget.maxCount ?? 1)) == 3) {
                            cubit.clean2();
                          }
                          if (((widget.maxCount ?? 1)) == 4) {
                            cubit.clean3();
                          }
                          if (((widget.maxCount ?? 1)) == 5) {
                            cubit.clean4();
                          }
                          if (((widget.maxCount ?? 1)) == 6) {
                            cubit.clean5();
                          }
                          if (((widget.maxCount ?? 1)) == 7) {
                            cubit.clean6();
                          }
                          if (((widget.maxCount ?? 1)) == 8) {
                            cubit.clean7();
                          }

                          context.read<CounterAccompaniedCubit>().decrement();
                          // print('state count clean: ${state.counter}');
                        }
                        if ((widget.qty ?? 0) <= state.counter) {
                          setState(() {
                            state.counter = widget.qty ?? 0;
                          });
                        }
                        widget.amountCount?.call((state.counter < 1)
                            ? (state.counter)
                            : (state.counter - 1));

                        // print('state count: ${state.counter - 1}');
                        // print('max count: ${(widget.maxCount ?? 1)}');
                      },
                      count: ((widget.maxCount ?? 1)) >= (state.counter)
                          ? ((widget.qty ?? 0) == (state.counter)
                              ? (state.counter)
                              : (widget.qty == 0)
                                  ? (state.counter)
                                  : (widget.qty ?? 0))
                          : (state.counter == 1)
                              ? (state.counter - 1)
                              : ((widget.qty ?? 0) < (widget.maxCount ?? 1)
                                  ? (widget.qty ?? 0)
                                  : (widget.maxCount ?? 1)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
