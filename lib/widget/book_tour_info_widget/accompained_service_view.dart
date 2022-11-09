import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';

import 'accompanied_service_widget.dart';

class AccompaniedServiceView extends StatefulWidget {
  AccompaniedServiceView({
    Key? key,
    required this.accompaniedList,
  }) : super(key: key);
  List<AccompaniedServiceData> accompaniedList;
  @override
  AccompaniedServiceViewState createState() => AccompaniedServiceViewState();
}

class AccompaniedServiceViewState extends State<AccompaniedServiceView> {
  List<AccompaniedServiceData> accompaniedList = [];
  List<AccompaniedServiceData> selectedList = [];
  List<AccompaniedServiceData> remainList = [];
  String? currentID;
  List<MoreServiceModel> moreServiceList = [];
  bool check = true;
  @override
  void initState() {
    super.initState();
    moreServiceList = List.generate(1, (index) => MoreServiceModel());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.accompaniedList.isNotEmpty) {
      if (check == true) {
        accompaniedList = widget.accompaniedList;
        // remainList = widget.accompaniedList;
      }
      setState(() {});
      check = false;
    }

    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: moreServiceList.length,
            itemBuilder: (BuildContext context, int index) {
              return AccompaniedService(
                currentID: (valueCurrentID) {
                  setState(() {
                    currentID = valueCurrentID;
                    print(currentID);
                  });
                },
                onSelected: (value) {
                  setState(() {});
                  if (selectedList.isEmpty) {
                    moreServiceList[index].name = value?.t250.t251.tv251;
                    moreServiceList[index].idSelectedMenuItem = value?.id;
                    selectedList.add(value!);
                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();
                  }
                  selectedList.removeWhere((element) =>
                      element.id == moreServiceList[index].idSelectedMenuItem);
                  selectedList.add(value!);
                  accompaniedList = widget.accompaniedList
                      .toSet()
                      .difference(selectedList.toSet())
                      .toList();
                  if (value.t250.t251.tv251 != currentID) {
                    remainList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);
                  }

                  remainList.add(value);

                  print(remainList);
                  moreServiceList[index].name = value.t250.t251.tv251;
                  moreServiceList[index].idSelectedMenuItem = value.id;
                },
                accompaniedServiceData: accompaniedList,
                name: moreServiceList[index].name,

                /// Delete
                onDeleted: (value) {
                  // setState(() {});
                  // value?.t250.t251.tv251 = currentID!;
                  // if (moreServiceList[index].name == null) {
                  //   moreServiceList.removeAt(index);
                  // } else if (moreServiceList[index].name != null &&
                  //     selectedList[index].id != value?.id) {
                  //   moreServiceList.removeWhere((element) =>
                  //       element.idSelectedMenuItem == selectedList[index].id);
                  //   selectedList.removeWhere(
                  //       (element) => element.id == remainList[index].id);
                  //   print(selectedList);
                  //   accompaniedList = widget.accompaniedList
                  //       .toSet()
                  //       .difference(selectedList.toSet())
                  //       .toList();
                  //   // remainList = widget.accompaniedList
                  //   //     .toSet()
                  //   //     .difference(accompaniedList.toSet())
                  //   //     .toList();
                  //   print(remainList);
                  // } else if (moreServiceList[index].idSelectedMenuItem ==
                  //     value?.id) {
                  //   moreServiceList.removeWhere((element) =>
                  //       element.idSelectedMenuItem == selectedList[index].id);
                  //   selectedList
                  //       .removeWhere((element) => element.id == value?.id);
                  //   accompaniedList = widget.accompaniedList
                  //       .toSet()
                  //       .difference(selectedList.toSet())
                  //       .toList();
                  //   remainList.remove(value!);
                  //   print(remainList);
                  // }

                  setState(() {});
                  print(value?.id);
                  if (moreServiceList[index].name == null) {
                    moreServiceList.removeAt(index);
                  } else if (moreServiceList[index].idSelectedMenuItem ==
                      value?.id) {
                    moreServiceList.removeWhere((element) =>
                        element.idSelectedMenuItem == selectedList[index].id);
                    selectedList
                        .removeWhere((element) => element.id == value?.id);
                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();

                    remainList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);
                    print(remainList);
                  } else if (moreServiceList[index].name != null &&
                      selectedList[index].id != value?.id) {
                    moreServiceList.removeWhere((element) =>
                        element.idSelectedMenuItem == selectedList[index].id);
                    selectedList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);

                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();
                  }
                },
              );
            }),
        moreServiceList.length != widget.accompaniedList.length
            ? TextButton(
                onPressed: () {
                  setState(() {
                    moreServiceList.add(MoreServiceModel());
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
      ],
    );
  }
}
