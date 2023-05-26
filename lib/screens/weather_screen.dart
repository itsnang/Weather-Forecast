import 'package:flutter/material.dart';
import 'package:to_do_list/controllers/weather_current_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/themController.dart';
import '../widgets/auto_complete_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 42, right: 14, left: 14),
          child: Column(
            children: <Widget>[
              WeatherHeader(),
              const SizedBox(
                height: 16,
              ),
              AutoComplete(),
              const SizedBox(
                height: 32,
              ),
              Current(),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherHeader extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) => _header(context),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Weather Forecast',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 250, 77, 135)),
          ),
          // Could be add some animetion
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 182, 224, 255),
                  borderRadius: BorderRadius.circular(6)),
              child: const Icon(Iconsax.moon),
            ),
          )
        ],
      ),
    );
  }
}

class Current extends StatelessWidget {
  final WeatherCurrent wctr = Get.put(WeatherCurrent());

  Current({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherCurrent>(
      builder: (controller) => _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    //will be design dialog new retry if error
    if (wctr.error.isNotEmpty) {
      return Column(
        children: [
          Text(wctr.error),
          TextButton(onPressed: wctr.getData, child: const Text('Retry')),
        ],
      );
    }
    if (wctr.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: const Color.fromRGBO(227, 242, 253, 1),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${wctr.temperatureC.toInt()}°',
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image(
                  image: NetworkImage('https:${wctr.conditionIcon}'),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        '${wctr.minTempC}°',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 139, 138, 138),
                            fontWeight: FontWeight.normal),
                      ),
                      // const Text('|'),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.3,
                        width: 20,
                      ),

                      Text(
                        '${wctr.maxTempC}°',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Flexible(
                  child: Text(
                    wctr.conditionText,
                    style: const TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            //Detail Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 4, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.arrow_swap,
                        color: Color.fromARGB(231, 1, 52, 255),
                      ),
                      const Text(
                        'Feels Like',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${wctr.feelsLikeC}°',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 245, 248, 255)),
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 4, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.wind,
                        color: Color.fromARGB(231, 1, 52, 255),
                      ),
                      const Text(
                        'Wind',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${wctr.windDegree} km/h',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 4, horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.cloud_lightning,
                        color: Color.fromARGB(231, 1, 52, 255),
                      ),
                      const Text(
                        'Chance of rain',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${wctr.chanceOfRain}%',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
