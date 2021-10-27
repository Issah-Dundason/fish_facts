import 'package:flutter/material.dart';

class Fish extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool selected;

  Fish(this.name, this.imageUrl, this.selected);

  Widget build(BuildContext context) {
    return Container(
      width: 114,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
          alignment: Alignment.center,
          children: [buildBackground(), buildTitle(context)]),
    );
  }

  Widget buildBackground() {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: selected ? 200 : 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Positioned(
      bottom: 40,
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
