import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_4/custom_extensions.dart';
import 'package:ui_challenge_4/color_styles.dart';
import 'package:ui_challenge_4/widgets/card_front.dart';
import 'package:ui_challenge_4/widgets/card_rear.dart';
import 'package:ui_challenge_4/widgets/checkout_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int dateValue = 0;
  int yearValue = 0;

  myCustomDatePicker() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 730),
      curve: Curves.fastLinearToSlowEaseIn,
      bottom: showDateWidget == true ? 0 : -(width * 0.65),
      // bottom: 0,
      child: Container(
        // height: 250,
        height: width * 0.6,
        width: MediaQuery.of(context).size.width,
        color: Colors.white.withOpacity(0.7),
        alignment: Alignment.center,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    showDateWidget = false;
                  });
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    showDateWidget = false;
                  });
                  // myobj.dateChanger(value: year[yearValue].toString());
                  _dateController.text = '${dateValue.toString()} / ${year[yearValue].toString()}';
                  print('date is : $dateValue and year is : ${year[yearValue]}');
                  // print('date and year is : ${expiryDate[0]}');
                },
                child: Text(
                  'Pick Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // left

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.center,
                child: SizedBox(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 35,
                    magnification: 1.5,
                    useMagnifier: true,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        dateValue = index + 1;
                        // print(dateValue);
                        // date[0] = index.toString();
                      });

                      // dateValue = index;
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 31,
                      builder: (context, index) {
                        return Text('${index + 1}');
                      },
                    ),
                  ),
                ),
              ).expanded(),
              Container(
                // right
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.center,

                child: SizedBox(
                  child: ListWheelScrollView.useDelegate(
                    magnification: 1.5,
                    useMagnifier: true,
                    onSelectedItemChanged: (index) {
                      // debugPrint(year[index].toString());
                      setState(() {
                        yearValue = index;
                        // print(year[yearValue]);
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: year.length,
                      builder: (context, index) {
                        return Text(
                          year[index].toString(),
                        );
                      },
                    ),
                    itemExtent: 35,
                  ),
                ),
              ).expanded(),
            ],
          ).expanded()
        ]),
      ).frosted(
          radius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
    );
  }

  //Card Animations Controllers
  AnimationController _animController;
  Animation<double> _flipAnim;
  FocusNode _cvvFocus;
  FocusNode _dateFocus;
  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 550),
    );
    _flipAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: _animController,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
    _cvvFocus.dispose();
    _dateFocus.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    _dateController.dispose();
  }

  //
  TextEditingController _cardNumberController, _cvvController, _nameController, _dateController;
  _HomePageState() {
    _cardNumberController = TextEditingController();
    _cvvController = TextEditingController();
    _nameController = TextEditingController();
    _dateController = TextEditingController();
    //
    _cvvFocus = FocusNode();
    _dateFocus = FocusNode();
    // adding listners for textfileds
    // for card number
    _cardNumberController.addListener(() {
      _cardNumber = _cardNumberController.text;
      setState(() {});
    });
    // for cvv
    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });
    // for use name
    _nameController.addListener(() {
      _name = _nameController.text;
      setState(() {});
    });
    // for focus of cvv field
    _cvvFocus.addListener(() {
      _cvvFocus.hasFocus ? _animController.forward() : _animController.reverse();
    });
    // for date picker
    _dateController.addListener(() {
      date = _dateController.text;
    }); //
    _dateFocus.addListener(() {
      setState(() {
        _dateFocus.hasFocus ? showDateWidget = true : showDateWidget = false;
      });
    });
    //
//
  }
  bool showDateWidget = false;
  List year = List<int>.generate(70, (int index) => (1970 + index));
  String _cardNumber = '';
  String _cvvNumber = '';
  String _name = '';
  String date = '';
  int selectedItem = 0;
  double width;

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    width = scrSize.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // bg color grad
              height: scrSize.height,
              width: scrSize.width,
              decoration: BoxDecoration(
                gradient: bgGrad,
              ),
              child: Column(children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * _flipAnim.value),
                  origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                  child: _flipAnim.value < 0.5
                      ? CardFront(
                          cardNumber: _cardNumber,
                          holderName: _name,
                          expiryDate: date,
                        )
                      : CardRear(cvvNumber: _cvvNumber),
                ).padding(EdgeInsets.symmetric(vertical: 30)),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: _cardNumberController,
                        hintText: 'Your Card Number',
                        maxLenghth: 16,
                        inputType: TextInputType.number,
                      ),
                      MyTextField(
                        hintText: 'CVV',
                        maxLenghth: 3,
                        controller: _cvvController,
                        focusNode: _cvvFocus,
                        inputType: TextInputType.number,
                      ),
                      MyTextField(
                        hintText: 'Expiry Date',
                        controller: _dateController,
                        focusNode: _dateFocus,
                      ),
                      MyTextField(
                        controller: _nameController,
                        hintText: 'Card Holder Name',
                        inputType: TextInputType.name,
                      ),
                    ],
                  ),
                ),

                // MyDatePicker(),
              ]),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: CheckoutButton(),
            ),
            myCustomDatePicker(),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  int maxLenghth;
  String hintText;
  FocusNode focusNode;
  TextInputType inputType;
  TextEditingController controller;
  MyTextField({
    this.maxLenghth,
    this.controller,
    this.hintText,
    this.inputType,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: inputType,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusColor: Colors.white,
        labelText: hintText,
        labelStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      maxLength: maxLenghth,
      controller: controller,
    ).padding(EdgeInsets.symmetric(
      vertical: 25,
      horizontal: 20,
    ));
  }
}
