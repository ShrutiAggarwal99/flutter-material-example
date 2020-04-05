import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Demo in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class Kitten {
  Kitten({this.name, this.age, this.description, this.imagePath});

  final String name;
  final int age;
  final String description;
  final String imagePath;
}

List<Kitten> _kittens = <Kitten>[
  Kitten(
      name: 'Mitten',
      age: 10,
      description: 'I am a cute Mitten',
      imagePath: 'assets/img1.jpg'),
  Kitten(
      name: 'Fluffy',
      age: 13,
      description: 'I am a happy Fluffy',
      imagePath: 'assets/img2.jpg'),
  Kitten(
      name: 'Steve',
      age: 15,
      description: 'I am a peaceful Steve',
      imagePath: 'assets/img3.jpg'),
  Kitten(
      name: 'Scooter',
      age: 11,
      description: 'I am a powerful Scooter',
      imagePath: 'assets/img4.jpg')
];

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.asset(kitten.imagePath),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(kitten.name),
              Text('${kitten.age} years old!'),
              Text(kitten.description),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => _dialogBuilder(context, _kittens[index]));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _kittens[index].name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitten Adoption App'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}