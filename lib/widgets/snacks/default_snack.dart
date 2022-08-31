import 'package:flutter/material.dart';
import 'package:widgetbox/utils/constants/colors.dart';

class DefaultSnackBar extends StatelessWidget {

  void defaultSnackBar(BuildContext context, String message) {
     ScaffoldMessenger.of(context)
        .showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'OK',
            onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
            textColor: BLUE,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning,
                color: WHITE,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: WHITE,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
              ),
            ],
          ),
          backgroundColor: RED,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}