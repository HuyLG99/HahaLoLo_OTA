import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/bloc/counter_cubit/counter_cubit.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';

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
  }) : super(key: key);

  final String? id;
  final String? name;
  final num? qty;
  final List<AccompaniedServiceData> accompaniedServiceData;
  final ValueChanged<AccompaniedServiceData?>? onSelected;
  final ValueChanged<AccompaniedServiceData?>? onDeleted;
  ValueChanged<String?>? currentID;
  @override
  State<AccompaniedService> createState() => _AccompaniedServiceState();
}

class _AccompaniedServiceState extends State<AccompaniedService> {
  AccompaniedServiceData? selectedMenuItem;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, stateAmount) {
                return CounterAccompaniedWidget(
                  typePeople: 'Số khách hàng',
                  colorText: Colors.grey,
                  maxCount: stateAmount.amountCustomer.totalCustomer,
                  count: widget.qty,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
