// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            AntIcons.soundFilled,
            color: Colors.white,
          ),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 5),
  ));
}
