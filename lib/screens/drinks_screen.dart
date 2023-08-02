import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_counter_app/screens/start_screen.dart';
import 'dart:async';

class DrinksScreen extends StatelessWidget {

  final double hidratacion;
  final int valueWater;
  DrinksScreen({Key? key, required this.hidratacion, required this.valueWater}) : super(key: key);
  final List<dynamic> typesOfDrinks = [
    [
      240,
      'Un vaso de agua',
      const Color.fromARGB(255, 26, 49, 70),
      const Color.fromARGB(255, 139, 215, 255), .5
    ],
    [
      550,
      'Una botella de agua',
      const Color.fromARGB(255, 26, 49, 70),
      const Color.fromARGB(255, 139, 215, 255), .1
    ],
    [
      240,
      'Una taza de café',
      const Color.fromARGB(255, 67, 47, 19),
      const Color.fromARGB(255, 255, 207, 115), .5
    ],
    [
      250,
      'Un vaso de leche',
      Color.fromARGB(255, 74, 29, 27),
      Color.fromARGB(255, 208, 115, 109), .7
    ],
    [
      200,
      'Una taza de té',
      Color.fromARGB(255, 59, 68, 25),
      Color.fromARGB(255, 76, 129, 85), .2
    ],
    [
      200,
      'Un vaso de agua de sabor',
      const Color.fromARGB(255, 64, 31, 44),
      const Color.fromARGB(255, 255, 157, 200), .5
    ],
    [
      200,
      'Un vaso de refresco',
      const Color.fromARGB(255, 32, 29, 69),
      const Color.fromARGB(255, 159, 147, 255), .2
    ],
    [
      200,
      'Un vaso de licuado verde u otro',
      Color.fromARGB(255, 28, 63, 19),
      Color.fromARGB(255, 89, 170, 73), .3
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16.0,
        leadingWidth: 100,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 14, 47, 83),
          ),
          onPressed: () {
              Navigator.pop(context);
            },
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        actions: [
          _hour(context),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: [
          _oneCard(context, 0),
          _oneCard(context, 1),
          _oneCard(context, 2),
          _oneCard(context, 3),
          _oneCard(context, 4),
          _oneCard(context, 5),
          _oneCard(context, 6),
          _oneCard(context, 7),
        ],
        //List.generate(6, (index){
        //   return Center(
        //     child: Text(
        //       'Item $index',
        //       style: Theme.of(context).textTheme.headlineSmall,
        //     ),
        //   );
        // }),
      ),
    );
  }

  // Widget _hour(BuildContext context) {
  //   return StreamBuilder(
  //     stream: Stream.periodic(const Duration(seconds: 1)),
  //     builder: (context, snapshot) {
  //       return Text(
  //         DateFormat.Hm().format(DateTime.now()),
  //         style: Theme.of(context).textTheme.bodySmall,
  //       );
  //     },
  //   );
  // }

Widget _hour(BuildContext context) {
  return StreamBuilder<int>(
    stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
    builder: (context, snapshot) {
      return Text(
        DateFormat('h:mm a').format(DateTime.now()),
        style: Theme.of(context).textTheme.bodySmall,
      );
    },
  );
}

  Widget _oneCard(BuildContext context, int type) {
    double newH = hidratacion + typesOfDrinks[type][4];
    double newVW = valueWater.toDouble() + typesOfDrinks[type][0];
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => StartScreen(
          hidratacion: newH,
              valueWater: newVW.toInt(),
            )), (route) => false);
      },
      child: Center(
        child: SizedBox(
          width: 100.0,
          //height: 60.0,
          child: Card(
            elevation: 10.0,
            color: typesOfDrinks[type][2],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: typesOfDrinks[type][2],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${typesOfDrinks[type][0]} ml',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: typesOfDrinks[type][3],
                    fontSize: 14,
                  ),
                ),
                Text(
                  typesOfDrinks[type][1],
                  style: TextStyle(
                    color: typesOfDrinks[type][3],
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}