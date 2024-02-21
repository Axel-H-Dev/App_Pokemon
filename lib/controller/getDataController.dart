import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/getDataModel.dart';
import 'package:get/get.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel = GetDataModel(result: []).obs;

  getDataFromapi() async {
    try {
      isLoading.value = true;
      var response = await Dio().get(
          "http://192.168.1.33:90/personal_api_pokemon/controller/pokemon.php?op=listar");
      final datax = json.decode(response.data);
      getDataModel.value = GetDataModel.fromJson(datax);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
