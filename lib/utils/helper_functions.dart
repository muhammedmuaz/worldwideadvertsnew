import 'package:newapp/routing/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetsAndDialogs {
  static void showCupertinoPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    AppNavigation.goBack();
                  },
                  child: const Icon(Icons.cancel))
            ],
          ),
          content: SizedBox(
            height: 150,
            child: CupertinoPicker(
              itemExtent: 45.0,
              onSelectedItemChanged: (int newTime) {},
              children: List<Widget>.generate(10, (int index) {
                return Center(
                  child: Text('${index + 1} hour'),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
