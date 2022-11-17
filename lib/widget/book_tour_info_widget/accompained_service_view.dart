import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';

import 'accompanied_service_widget.dart';

class AccompaniedServiceView extends StatefulWidget {
  AccompaniedServiceView({
    Key? key,
    required this.accompaniedList,
    this.getSelectedList,
    this.getValueQty,
    this.getMoreServiceList,
  }) : super(key: key);
  List<AccompaniedServiceData> accompaniedList;
  final ValueChanged<List<AccompaniedServiceData?>>? getSelectedList;
  final ValueChanged<List<MoreServiceModel?>>? getMoreServiceList;
  final ValueChanged<int?>? getValueQty;
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
  int? dattaQty;
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
                qty: moreServiceList[index].qty,
                amountCount: (valueQty) {
                  if (valueQty != null && moreServiceList.isNotEmpty) {
                    setState(() {
                      dattaQty = valueQty;
                      widget.getSelectedList?.call(selectedList);
                      widget.getValueQty?.call(valueQty);
                      if (moreServiceList[index].name != null ||
                          valueQty == 0 && moreServiceList[index].qty == null ||
                          valueQty == 0 && selectedList[index].qty == null) {
                        moreServiceList[index].qty = valueQty;
                        if (moreServiceList[index].name ==
                            selectedList[index].t250.t251.tv251) {
                          moreServiceList[index].qty = valueQty;
                          selectedList[index].qty = valueQty;
                        }
                        widget.getSelectedList?.call(selectedList);
                      }
                    });
                  }
                },
                currentID: (valueCurrentID) {
                  if (moreServiceList[index].name != null) {
                    setState(() {
                      currentID = valueCurrentID;
                    });
                  }
                },
                onSelected: (value) {
                  setState(() {});
                  if (selectedList.isEmpty) {
                    moreServiceList[index].name = value?.t250.t251.tv251;
                    moreServiceList[index].idSelectedMenuItem = value?.id;
                    selectedList.add(value!);
                    if (moreServiceList.isNotEmpty) {
                      if (moreServiceList[index].name ==
                          selectedList[index].t250.t251.tv251) {
                        if (moreServiceList[index].name != null) {
                          selectedList[index].qty = moreServiceList[index].qty;
                        }
                        selectedList[index].qty = dattaQty;
                        widget.getSelectedList?.call(selectedList);
                      }
                    }
                    // widget.getSelectedList?.call(selectedList);
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
                    selectedList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);
                    widget.getSelectedList?.call(selectedList);
                  }
                  moreServiceList[index].name = value.t250.t251.tv251;
                  moreServiceList[index].idSelectedMenuItem = value.id;
                  widget.getSelectedList?.call(selectedList);
                },
                accompaniedServiceData: accompaniedList,
                name: moreServiceList[index].name,

                /// Delete
                onDeleted: (value) {
                  setState(() {});
                  if (moreServiceList[index].name == null &&
                          currentID == null ||
                      value == null && currentID == null ||
                      moreServiceList[index].name == null &&
                          currentID != null) {
                    moreServiceList.removeAt(index);
                    if (moreServiceList[index].qty != null) {
                      selectedList[index].qty = moreServiceList[index].qty;
                    }
                    widget.getSelectedList?.call(selectedList);
                    widget.getMoreServiceList?.call(moreServiceList);
                  } else if (moreServiceList[index].name != null &&
                      moreServiceList[index].idSelectedMenuItem == value?.id) {
                    moreServiceList
                        .removeWhere((element) => element.name == currentID);

                    selectedList
                        .removeWhere((element) => element.id == value?.id);
                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();
                    if (moreServiceList[index].qty != null) {
                      selectedList[index].qty = moreServiceList[index].qty;
                    }

                    widget.getSelectedList?.call(selectedList);
                    widget.getMoreServiceList?.call(moreServiceList);
                  } else if (moreServiceList[index].name != null ||
                      selectedList[index].id != currentID) {
                    moreServiceList
                        .removeWhere((element) => element.name == currentID);

                    selectedList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);

                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();
                    if (moreServiceList[index].qty != null) {
                      selectedList[index].qty = moreServiceList[index].qty;
                    }

                    widget.getSelectedList?.call(selectedList);
                    widget.getMoreServiceList?.call(moreServiceList);
                  }
                },
              );
            }),
        moreServiceList.length != widget.accompaniedList.length
            ? TextButton(
                onPressed: () {
                  setState(() {
                    moreServiceList.add(MoreServiceModel());
                    currentID = null;
                    dattaQty = null;

                    widget.getSelectedList?.call(selectedList);
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
