import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hahaloloapp/bloc/accompanied_service_bloc/accompanied_bloc.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';

import '../../screen/book_tour/amount_book_tour_view.dart';

class AccompaniedService extends StatefulWidget {
  AccompaniedService({
    Key? key,
    this.onDeleteClicked,
  }) : super(key: key);
  final VoidCallback? onDeleteClicked;

  @override
  State<AccompaniedService> createState() => _AccompaniedServiceState();
}

class _AccompaniedServiceState extends State<AccompaniedService> {
  AccompaniedServiceData? selectedMenuItem;
  List<AccompaniedServiceData> selectedList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AccompaniedServiceBloc>(context).data;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccompaniedServiceBloc, AccompaniedServiceState>(
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
                        hint: selectedMenuItem == null
                            ? const Text(
                                "Dịch vụ đính kèm",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                '${selectedMenuItem?.t250?.t251?.tv251}',
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
                          context.read<AccompaniedServiceBloc>().add(
                              AccompaniedServiceSelected(
                                  selected!, selectedMenuItem));
                          setState(() {
                            selectedMenuItem = selected;
                          });
                        },
                        //value: selectedMenuItem!,

                        items: state.remainList!
                            .map(
                              (selected) => DropdownMenuItem(
                                // enabled: selectedMenuItem != selected,
                                value: selected, // you must provide a value
                                child: Text(
                                  selected.t250?.t251?.tv251 ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        //value: selectedMenuItem,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onDeleteClicked!,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                const AmountCounterWidget(
                  typePeople: 'Số khách hàng',
                  colorText: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
