import 'package:flutter/material.dart';
import 'package:ui_challenge_4/custom_extensions.dart';

class CardFront extends StatelessWidget {
  String cardNumber;
  String expiryDate;
  String holderName;
  String _formattedCardNumber;
  CardFront({
    this.cardNumber,
    this.holderName,
    this.expiryDate,
  }) {
    _formattedCardNumber = this.cardNumber.padRight(16, 'X');
    _formattedCardNumber = _formattedCardNumber.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }
  //
  @override
  Widget build(BuildContext context) {
    //variables
    //
    Size scrSize = MediaQuery.of(context).size;
    return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Infniteshop'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Image.asset(
                  'lib/assets/card-logo.png',
                  scale: 3,
                ),
              ],
            ),
            Text(
              _formattedCardNumber,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Roboto Mono',
              ),
            ),
            Text(
              'Expiry Date : ${expiryDate == '' ? 'MM/YY' : expiryDate}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  holderName == '' ? 'Card Holder Name' : holderName.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Image.asset(
                  'lib/assets/card-chip.png',
                  scale: 3.5,
                ),
              ],
            )
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 20)),
      ),
    );
  }
}
