import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Facts extends StatefulWidget {
  final String facts;
  final String fishName;

  Facts(this.fishName, this.facts);

  _FactsState createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  final ScrollController _scrollController = ScrollController();
  int _scrollSpeed = 3;
  bool _displayUp = false;

  final borderRadius = BorderRadius.only(
      topRight: Radius.circular(70), bottomLeft: Radius.circular(86));

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 4 / 5,
      height: height * 1.3 / 5,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBackground(),
          _buildContent(),
          Positioned(bottom: 0, right: 5, child: _buildControl())
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      child: Container(
        color: Color.fromARGB(120, 255, 255, 255),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Facts about ${widget.fishName}',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 73,
            child: SingleChildScrollView(
                controller: _scrollController,
                child: Text(
                  widget.facts,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          )
        ],
      ),
    );
  }

  Widget _buildControl() {
    return IconButton(
      onPressed: _onPressed,
      iconSize: 40,
      icon: Icon(
          _displayUp ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
    );
  }

  void _onPressed() {
    double currentOffset = _scrollController.offset;
    double newOffset = currentOffset + _scrollSpeed;

    _scrollController.jumpTo(newOffset);

    if (newOffset >= _scrollController.position.maxScrollExtent) {
      _scrollSpeed *= -1;
      setState(() {
        _displayUp = !_displayUp;
      });
    }

    if (newOffset < 0) {
      _scrollSpeed *= -1;
      setState(() {
        _displayUp = !_displayUp;
      });
    }
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
