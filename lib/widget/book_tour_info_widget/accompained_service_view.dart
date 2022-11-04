import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/accompanied_service_bloc/accompanied_bloc.dart';
import 'accompanied_service_widget.dart';

class AccompaniedServiceView extends StatefulWidget {
  const AccompaniedServiceView({Key? key}) : super(key: key);

  @override
  AccompaniedServiceViewState createState() => AccompaniedServiceViewState();
}

class AccompaniedServiceViewState extends State<AccompaniedServiceView> {
  List<Widget> widgetList = [];

  void deleteWidget() {
    setState(() {
      widgetList.removeLast();
    });
  }

  @override
  void initState() {
    super.initState();
    widgetList.add(AccompaniedService(
      // key: UniqueKey(),
      onDeleteClicked: () {
        deleteWidget();
      },
    ));
    context
        .read<AccompaniedServiceBloc>()
        .add(AccompaniedServiceCompareSelected());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccompaniedServiceBloc, AccompaniedServiceState>(
        builder: (context, state) {
      // if (state.remainList!.isEmpty) {
      //   //state.remainList = state.listAccompaniedService.toList();
      // }
      return Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widgetList.length,
              itemBuilder: (BuildContext context, int index) {
                return AccompaniedService(
                  // key: UniqueKey(),
                  onDeleteClicked: () {
                    deleteWidget();
                  },
                );
              }),
          widgetList.isNotEmpty &&
                      state.listAccompaniedService!.length >
                          widgetList.length ||
                  widgetList.isEmpty &&
                      state.listAccompaniedService!.length > widgetList.length
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      widgetList.add(AccompaniedService(
                        // key: UniqueKey(),
                        onDeleteClicked: () {
                          deleteWidget();
                        },
                      ));
                    });
                  },
                  child: const Text(
                    '+ Thêm dịch vụ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlueAccent,
                      fontSize: 20,
                    ),
                  ),
                )
              : const SizedBox(),

          // TextButton(
          //     onPressed: () {
          //       setState(() {
          //         widgetList.removeLast();
          //       });
          //     },
          //     child: const Text(
          //       'Delete dịch vụ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           color: Colors.lightBlueAccent,
          //           fontSize: 20),
          //     ))
        ],
      );
    });
  }
}
