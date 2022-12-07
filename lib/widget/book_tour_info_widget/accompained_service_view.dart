import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';
import 'package:hahaloloapp/models/more_service_model.dart';

import 'accompanied_service_widget.dart';

//ignore: must_be_immutable
class AccompaniedServiceView extends StatefulWidget {
  AccompaniedServiceView({
    Key? key,
    required this.accompaniedList,
    this.getSelectedList,
    this.getMoreServiceList,
    this.maxCount,
  }) : super(key: key);
  List<AccompaniedServiceData> accompaniedList;
  final ValueChanged<List<AccompaniedServiceData?>>? getSelectedList;
  final ValueChanged<List<MoreServiceModel?>>? getMoreServiceList;
  final int? maxCount;
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
  int? dattaQty = 0;
  int? qtyChange;
  @override
  void initState() {
    super.initState();
    moreServiceList = List.generate(1, (index) => MoreServiceModel());
  }

  @override
  void didUpdateWidget(covariant AccompaniedServiceView oldWidget) {
    // TODO: implement didUpdateWidget
    if ((oldWidget.maxCount ?? 0) > (widget.maxCount ?? 0)) {
      setState(() {
        for (int i = 0; i < moreServiceList.length; i++) {
          if ((widget.maxCount ?? 0) < (moreServiceList[i].qty ?? 0)) {
            dattaQty = widget.maxCount;
            (moreServiceList[i].qty ?? 0);
            moreServiceList[i].qty = dattaQty;
          }
        }
        for (int i = 0; i < selectedList.length; i++) {
          if ((widget.maxCount ?? 0) < (selectedList[i].qty ?? 0)) {
            dattaQty = widget.maxCount;
            (selectedList[i].qty ?? 0);
            selectedList[i].qty = dattaQty;
          }
        }
      });
    }
    super.didUpdateWidget(oldWidget);
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
                maxCount: widget.maxCount,
                accompaniedServiceData: accompaniedList,
                qty: moreServiceList[index].qty,
                amountCount: (valueQty) {
                  if (valueQty != null && moreServiceList.isNotEmpty) {
                    setState(() {
                      dattaQty = valueQty;
                      widget.getSelectedList?.call(selectedList);
                      if (moreServiceList[index].name != null ||
                          moreServiceList[index].name == null ||
                          valueQty == 0 && moreServiceList[index].qty == null ||
                          valueQty == 0 && selectedList[index].qty == null) {
                        moreServiceList[index].qty = valueQty;
                        moreServiceList[index].qty = valueQty;
                        widget.getSelectedList?.call(selectedList);
                        widget.getMoreServiceList?.call(moreServiceList);
                      }
                    });
                  }
                  widget.getSelectedList?.call(selectedList);
                  widget.getMoreServiceList?.call(moreServiceList);
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
                    moreServiceList[index].maxCount = widget.maxCount;
                    moreServiceList[index].price = value?.tn452;
                    selectedList.add(value!);
                    widget.getSelectedList?.call(selectedList);
                    widget.getMoreServiceList?.call(moreServiceList);
                    if (moreServiceList.isNotEmpty) {
                      moreServiceList[index].qty = dattaQty;
                      moreServiceList[index].maxCount = widget.maxCount;
                      widget.getSelectedList?.call(selectedList);
                      widget.getMoreServiceList?.call(moreServiceList);
                    }
                    accompaniedList = widget.accompaniedList
                        .toSet()
                        .difference(selectedList.toSet())
                        .toList();
                    widget.getMoreServiceList?.call(moreServiceList);
                    widget.getSelectedList?.call(selectedList);
                  }
                  selectedList.removeWhere((element) =>
                      element.id == moreServiceList[index].idSelectedMenuItem);
                  selectedList.add(value!);
                  moreServiceList[index].name = value.t250.t251.tv251;
                  moreServiceList[index].idSelectedMenuItem = value.id;
                  moreServiceList[index].maxCount = widget.maxCount;
                  moreServiceList[index].price = value.tn452;
                  if (moreServiceList[index].name != null) {
                    moreServiceList[index].maxCount = widget.maxCount;
                    widget.getMoreServiceList?.call(moreServiceList);
                    widget.getSelectedList?.call(selectedList);
                  }
                  accompaniedList = widget.accompaniedList
                      .toSet()
                      .difference(selectedList.toSet())
                      .toList();
                  if (value.t250.t251.tv251 != currentID) {
                    selectedList.removeWhere(
                        (element) => element.t250.t251.tv251 == currentID);
                    if (moreServiceList[index].name != null) {
                      moreServiceList[index].maxCount = widget.maxCount;
                      widget.getMoreServiceList?.call(moreServiceList);
                      widget.getSelectedList?.call(selectedList);
                    }
                  }
                  moreServiceList[index].name = value.t250.t251.tv251;
                  moreServiceList[index].idSelectedMenuItem = value.id;
                  widget.getMoreServiceList?.call(moreServiceList);
                  widget.getSelectedList?.call(selectedList);
                },

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
                    dattaQty = 0;
                    widget.getMoreServiceList?.call(moreServiceList);
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
