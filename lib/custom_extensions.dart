import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

//
class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -1.5 * pow(t, 2) + 1.5 * t + 1;
  }
}

extension TextExtension on String {
  makeTextH1({Color color = Colors.white, bool centered = false}) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'SF Mono',
      ),
    );
  }
}

// extensions
extension WidgetModifier on Widget {
  // all extensions here
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(20)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  //
  Widget expanded() {
    return Expanded(
      child: this,
    );
  }

  //
  Widget borderRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  //
  Widget align(Alignment alignment) {
    return Align(
      child: this,
      alignment: alignment,
    );
  }

  //
  Widget hero(String tag) {
    return Hero(
      transitionOnUserGestures: false,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        final Hero toHero = toHeroContext.widget;
        return ScaleTransition(
          scale: animation.drive(
            Tween<double>(begin: 0.0, end: 1.0).chain(
              CurveTween(
                curve: Interval(0.0, 1.0, curve: PeakQuadraticCurve()),
              ),
            ),
          ),
          child: toHero.child,
        );
      },
      tag: tag,
      child: this,
    );
  }

  //
  Widget centered() {
    return Center(
      child: this,
    );
  }
  //

  //
  Widget frosted({double sigX, double sigY, BorderRadiusGeometry radius}) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigX ?? 15,
          sigmaY: sigY ?? 15,
        ),
        child: this,
      ),
    );
  }
  //

  Widget text(String text) {
    return Text(text);
  }
//

}
