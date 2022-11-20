import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/bloc/counter_accompanied_cubit/counter_accompanied_cubit.dart';

import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';

import 'amount_accompanied_widget.dart';

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
                        widget.amountCount?.call(state.counter + 1);
                      },
                      onTapDecrement: () {
                        context.read<CounterAccompaniedCubit>().decrement();
                        widget.amountCount?.call(state.counter - 1);
                      },
                      count: state.counter,
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
