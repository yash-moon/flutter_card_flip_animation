import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_4/custom_extensions.dart';

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
            backgroundColor: Colors.white.withOpacity(0.9),
            context: context,
            builder: (context) {
              return MyBottomSheet();
            });
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Checkout'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto Mono',
          ),
        ),
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 400,
      child: FlareActor(
        "lib/assets/check_anim.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'myAnim',
      ),
      // width: 400,
    );
  }
}
