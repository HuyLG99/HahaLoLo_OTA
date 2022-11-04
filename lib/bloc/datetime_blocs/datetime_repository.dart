import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hahaloloapp/models/datetime_data_model.dart';

class DateTimeRepository {
  Future<List<DataDate>> readDate() async {
    List<DataDate> listDataDate = [];
    final String response = await rootBundle.loadString('assets/datetime.json');
    final dataTime = await json.decode(response);

    dataTime["data"]
        .map((data) => listDataDate.add(DataDate.fromJson(data)))
        .toList();
    // print(listDataDate);
    await Future.delayed(const Duration(seconds: 1));
    return listDataDate;
  }

  Future<List<DataDate>> readDate2() async {
    List<DataDate> listDataDate2 = [];
    final String response =
        await rootBundle.loadString('assets/datetime2.json');
    final dataTime = await json.decode(response);
    // print(dataTime["data"]);

    dataTime["data"]
        .map((data) => listDataDate2.add(DataDate.fromJson(data)))
        .toList();
    // print(listDataDate2);
    await Future.delayed(const Duration(seconds: 1));
    return listDataDate2;
  }
}
