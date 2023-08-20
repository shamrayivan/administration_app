import 'package:administration_app/di/di.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';

final _scaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();

void showSnackBarListError({required String stringError}) {


  _scaffoldMessengerKey.currentState
    ?..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(stringError.toString()),
        action: SnackBarAction(
          label: 'Закрыть',
          textColor: Colors.yellow,
          onPressed: () {},
        ),
      ),
    );
}

void showSnackBarError({required String error}) {
  _scaffoldMessengerKey.currentState
    ?..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.amberAccent,
        content: Text(error, style: const TextStyle(color: blackColor, fontWeight: FontWeight.w600),),
        action: SnackBarAction(
          label: 'Закрыть',
          textColor: blackColor,
          onPressed: () {},
        ),
      ),
    );
}
