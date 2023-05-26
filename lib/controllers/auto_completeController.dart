import 'package:get/get.dart';
import 'package:to_do_list/models/search_model.dart';
import 'package:to_do_list/services/weather_api.dart';

class AutoCompleteController extends GetxController {
  SearchApi searchApi = SearchApi();
  List<String> option = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getLocation(String search) async {}
}
