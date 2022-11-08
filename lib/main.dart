import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/application_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<ApplicationColor>(
          create: (context) => ApplicationColor(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => Text(
                  'Provider State Management',
                  style: TextStyle(color: applicationColor.color),
                ),
              ),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.all(10), child: Text('AB')),
                    SizedBox(height: 20),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                        value: applicationColor.isLightBlue,
                        onChanged: (newValue) {
                          applicationColor.isLightBlue = newValue;
                        },
                      ),
                    ),
                    Container(margin: EdgeInsets.all(5), child: Text('LB'))
                  ],
                )
              ],
            )),
          ),
        ));
  }
}
