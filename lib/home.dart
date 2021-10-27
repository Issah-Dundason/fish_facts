import 'package:fish_facts/Widgets/Fish.dart' as FishWidget;
import 'package:flutter/material.dart';
import 'Widgets/Facts.dart';
import 'model.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = fishes.length ~/ 2;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildBackground(),
          getBigPicture(),
          Positioned(
              left: 0,
              top: height * 2 / 5,
              child: Facts(fishes[selected].name, fishes[selected].facts)),
          buildList(),
          buildName()
        ],
      ),
    );
  }

  Widget buildBackground() {
    return Container(
        decoration: BoxDecoration(
      color: Colors.blue.shade200,
    ));
  }

  Widget buildList() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 10,
      child: Container(
        height: height * 1 / 5,
        width: width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fishes.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                  onTap: () => _onSelect(i),
                  child: FishWidget.Fish(
                      fishes[i].name, fishes[i].imageUrl, selected == i));
            }),
      ),
    );
  }

  void _onSelect(int position) {
    setState(() {
      selected = position;
    });
  }

  Widget buildName() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 1 / 6,
      right: 0,
      child: Container(
        width: 141,
        height: 52,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26))),
        child: Center(
          child: Text(fishes[selected].name),
        ),
      ),
    );
  }

  Widget getBigPicture() {
    double height = MediaQuery.of(context).size.height;
    return Positioned(
        top: height * 1 / 5, child: Image.asset(fishes[selected].bigPicture));
  }
}
