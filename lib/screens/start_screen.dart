import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_counter_app/assets/interval_progress_bar.dart';
import 'package:water_counter_app/screens/drinks_screen.dart';

class StartScreen extends StatefulWidget {
 const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class  _StartScreenState extends State <StartScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16.0,
        leadingWidth: 100,
        leading: Text(
          'HI WATER',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          _hour(),
        ],
        ),
      body: SizedBox( 
        height: 155.0,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _totalMl(),
        _verticalGap(),
        _indicators(),
        _verticalGap(),
        _buttonReg(),

      ],
      ),
    ),
    backgroundColor: Colors.black, 
    );
  }
  Widget _hour(){
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  return Text(
    formattedTime,
    style: Theme.of(context).textTheme.bodySmall,
  );
  }
  Widget _verticalGap(){
    return const SizedBox(
      height: 4.0,
    );
  }
  Widget _totalMl(){
    
      return Column(
        children: [
          SizedBox(
            height: 25.0,
            child: Text(
              '0 mL',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Text(
            'Faltan 2500 mL',
            style: Theme.of(context). textTheme.bodyMedium,
          )
        ],
      );
  }
  Widget _indicators () {
    return IntrinsicHeight(
      child:
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _percentage(),
            const SizedBox(
              width: 10,
            ),
            _smallDividier(),
            const SizedBox(
              width: 10,
            ),
            _hydration(),
          ],
        ),
    );
  }
Widget _percentage(){
            return Column(
              children:[
                SizedBox(
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                children: [
                 const SizedBox(
                  width: 45,
                  height: 45,
                   child: CircularProgressIndicator(
                    strokeWidth: 6,
                    value: 0.3,
                    color: Color.fromARGB(255, 62, 139, 236),
                    backgroundColor: Color.fromARGB(255, 17, 50, 74),
                ),
                 ),
                Text(
              '0 %',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
            Text(
              'Hoy',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          ],
        );
            
}

Widget _smallDividier(){
  return const VerticalDivider(
    color: Color.fromARGB(255, 51, 51, 51),
    thickness: 2,
    width: 20,
    indent: 10,
    endIndent: 0,
  );

}

Widget _hydration(){
  return Column(
    children: [
      const IntervalProgressBar(value: 0),
      //_intervalBar(),
      Text(
        'Hidratación',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );
}

 //Widget _intervalBar(){
  //return Text(
    //          '1.0',
    //          style: Theme.of(context).textTheme.headlineSmall,
    //        );


Widget _buttonReg(){
      return  Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(
              width: 186.0,
              height: 25.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder:(context) => const DrinksScreen()),
                );
              },
              child: const Text('toma aguita',
              ),
            ),
            )
          );

}

}