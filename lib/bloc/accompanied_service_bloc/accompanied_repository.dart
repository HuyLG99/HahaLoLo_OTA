import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';

class AccompaniedServiceRepository {
  List<AccompaniedServiceData> listAccompanied = [];
  Future<List<AccompaniedServiceData>> readAccompanied() async {
    final String response =
        await rootBundle.loadString('assets/accompanied_service.json');
    final dataAccompanied = await json.decode(response);
    // print(dataAccompanied['data']);
    listAccompanied.clear();
    dataAccompanied['data']
        .map((data) =>
            listAccompanied.add(AccompaniedServiceData.fromJson(data)))
        .toList();

    // print(listAccompanied);
    // await Future.delayed(const Duration(seconds: 2));
    return listAccompanied;
  }
}
