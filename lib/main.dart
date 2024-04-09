import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeSc(),
    );
  }
}

class HomeSc extends StatefulWidget {

  HomeSc({super.key});

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {

  List<String> fruits = ['mango', 'banana','orange','apple'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fruits.length,
          itemBuilder: (context,index){
          final fruit = fruits[index];
          return Dismissible(
              onDismissed: (direction){
                if(direction == DismissDirection.startToEnd){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fruits[index]),
                  backgroundColor: Colors.red,));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fruits[index]),
                  backgroundColor: Colors.green,),
                  );
                  }
              },
              key: Key(fruit),
              child: Card(
                child: ListTile(
                  title: Text(fruits[index]),
                ),
              ));
          })
    );
  }
}

