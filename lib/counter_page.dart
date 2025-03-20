import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  List<String> listcounter = [];
  int _counter = 0;

  void addData(){
    setState(() {
      _counter += 100;
      listcounter.add(_counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Page"),),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3),
        itemCount: listcounter.length, 
        itemBuilder: (context, index) {
          return CircleAvatar(child: Text('Data : ${listcounter[index]}'),
          backgroundColor: (index %2 == 0) ? const Color.fromARGB(255, 255, 2, 137) : const Color.fromARGB(255, 4, 247, 255),);
        },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if(_counter >= 0 && listcounter.isNotEmpty){
                    _counter --;
                    listcounter.removeLast();
                  }
                  //  _counter --;
                  //   listcounter.removeLast();
                });},
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {addData();},
              child: const Icon(Icons.add),
            ),
          ],
        ),
    );
  }
}