import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/weather_current_controller.dart';
import 'package:to_do_list/services/weather_api.dart';

class AutoComplete extends StatelessWidget {
  final SearchApi searchApi = SearchApi();
  final selectedController = TextEditingController();

  //Test
  Future<List<String>> getRequestData(String query) async {
    debugPrint('search $query');
    final value = await searchApi.getSearch(query);
    final data = value.map((e) => e.name).toList();
    debugPrint('search result ${data.toString()}');

    return data;

    // debugPrint('search result ${value2.toString()}');
    // List<String> data = ['Developer', 'Designer', 'Consultant', 'Student'];

    // return await Future.delayed(const Duration(seconds: 1), () {
    //   return data.where((e) {
    //     log(data.toString());
    //     return e.toLowerCase().contains(query.toLowerCase());
    //   }).toList();
    // });
  }

  AutoComplete({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('UI create');
    return GetBuilder<WeatherCurrent>(
      builder: (controller) => _buildAutoComplete(context),
    );
  }

  Widget _buildAutoComplete(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomDropdown.searchRequest(
          controller: selectedController,
          futureRequest: getRequestData,
          onChanged: (p0) =>
              Get.find<WeatherCurrent>().getSelectedString(p0.toString()),
          hintText: 'Enter city or state',
          futureRequestDelay: const Duration(seconds: 1),
          borderSide: const BorderSide(
              width: 1.5, color: Color.fromARGB(255, 182, 224, 255)),
        ),
      );
}
