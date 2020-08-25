import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_challenge_4/custom_extensions.dart';

class CardRear extends StatelessWidget {
  final String cvvNumber;
  CardRear({this.cvvNumber});
  @override
  Widget build(BuildContext context) {
    //variables
    //
    Size scrSize = MediaQuery.of(context).size;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(pi * 1),
      origin: Offset(MediaQuery.of(context).size.width / 2, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: (scrSize.height / scrSize.width) + 250,
        width: scrSize.width,
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            color: Colors.white.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  // width: 40,
                  color: Colors.black.withOpacity(0.5),
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      // width: 40,
                      color: Colors.grey[400],
                    ).expanded(),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 90,
                      color: Colors.white.withOpacity(0.6),
                      child: Text(
                        cvvNumber == '' ? '***' : cvvNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: 'Roboto Mono',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'lib/assets/card-chip.png',
                      scale: 3,
                    ),
                  ],
                ).padding(EdgeInsets.only(right: 20)),
              ],
            ) //
            // .padding(EdgeInsets.symmetric(horizontal: 20)),
            ),
      ),
    );
  }
}
