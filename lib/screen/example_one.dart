
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/example_one.dart';
class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return   Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val) {
               value.setValue(val);

            });
          }),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return    Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:  BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                Expanded(
                    child:Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text('Container 2'),
                      ),
                    ) )
              ],
            );
          }),


        ],
      ),
    );
  }
}
