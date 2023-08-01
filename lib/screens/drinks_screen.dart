import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16.0,
        leadingWidth: 100,
        leading: Text(
          'Cancelar',style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          _hour(context),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children:
        [
          _oneCard(context),
          _twoCard(context),
          _threeCard(context),
          _fourCard(context),
        ],
          // List.generate(6, (index) {
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

  Widget _oneCard(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const SizedBox(
        height: 5.0,
        child: Card(
          elevation: 5.0,
          color: Color.fromARGB(255, 27, 157, 205),
          child: Text(
            'Tome 50 ml de agua'
          ),
        ),
      ),
    );
  }

Widget _twoCard(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const SizedBox(
        height: 5.0,
        child: Card(
          elevation: 5.0,
          color: Color.fromARGB(255, 27, 157, 205),
          child: Text(
            'Tome 150 ml de agua'
          ),
        ),
      ),
    );
  }

  Widget _threeCard(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const SizedBox(
        height: 5.0,
        child: Card(
          elevation: 5.0,
          color: Color.fromARGB(255, 27, 157, 205),
          child: Text(
            'Tome 250 ml de agua'
          ),
        ),
      ),
    );
  }

    Widget _fourCard(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const SizedBox(
        height: 5.0,
        child: Card(
          elevation: 5.0,
          color: Color.fromARGB(255, 27, 157, 205),
          child: Text(
            'Tome 250 ml de agua'
          ),
        ),
      ),
    );
  }

  Widget _hour(BuildContext context){
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  return Text(
    formattedTime,
    style: Theme.of(context).textTheme.bodySmall,
  );
}

}