import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 94.0,
        ),
        // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
         
        ),
        child: RichText(
          text: TextSpan(
            text: 'Nike',
            style: TextStyle(
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontSize: 50,
              fontFamily: 'Anton',
              fontWeight: FontWeight.normal,
            ),
            children: const <TextSpan>[
              TextSpan(
                 ),
             
            ],
          ),
        ));
  }
}
