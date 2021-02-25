import 'dart:convert';

import 'package:tesst/Core/Exceptions.dart';
import 'package:tesst/Core/Params.dart';
import 'package:tesst/Features/Feature_Prototype/Data/Remote%20Data%20Source/Remote_data_source.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImplementation implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImplementation({this.client});
  @override
  Future<List<Data>> getData(Params params) async {
    var response =
        await http.get("https://api.covidtracking.com/v1/us/daily.json");
    if (response.statusCode == 200) {
      List<dynamic> listdata = json.decode(response.body);
      List<Data> dataList = List();
      for (Map<dynamic, dynamic> data in listdata) {
        dataList.add(Data.fromJson(data));
      }
      return dataList;
    } else {
      throw ServerExeption;
    }
  }
}
