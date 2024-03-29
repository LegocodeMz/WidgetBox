import 'package:widgetbox/models/codeString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuSample extends StatefulWidget {
  const CupertinoContextMenuSample({Key? key}) : super(key: key);

  @override
  _CupertinoContextMenuSampleState createState() =>
      _CupertinoContextMenuSampleState();
}

void showSnackBarMessage(
  var context,
  var message,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).backgroundColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).primaryColor,
        ),
      ),
      duration: const Duration(seconds: 2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    ),
  );
}

class _CupertinoContextMenuSampleState
    extends State<CupertinoContextMenuSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 30,
          child: CupertinoContextMenu(
            actions: <Widget>[
              CupertinoContextMenuAction(
                child: const Text('Action one'),
                onPressed: () {
                  Navigator.pop(context);
                  showSnackBarMessage(context, 'Action one chosen');
                },
              ),
              CupertinoContextMenuAction(
                child: const Text('Action two'),
                onPressed: () {
                  Navigator.pop(context);
                  showSnackBarMessage(context, 'Action two chosen');
                },
              ),
            ],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              // color: Colors.yellow,
              child: Text(
                'Long press me',
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoContextMenuDescription extends StatelessWidget {
  const CupertinoContextMenuDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              """
A full-screen modal route that opens when the child is long-pressed.

When open, the CupertinoContextMenu shows the child, or the widget returned by previewBuilder if given, in a large full-screen Overlay with a list of buttons specified by actions. The child/preview is placed in an Expanded widget so that it will grow to fill the Overlay if its size is unconstrained.

When closed, the CupertinoContextMenu simply displays the child as if the CupertinoContextMenu were not there. Sizing and positioning is unaffected. The menu can be closed like other PopupRoutes, such as by tapping the background or by calling Navigator.pop(context). Unlike PopupRoute, it can also be closed by swiping downwards.

The previewBuilder parameter is most commonly used to display a slight variation of child. See previewBuilder for an example of rounding the child's corners and allowing its aspect ratio to expand, similar to the Photos app on iOS.
        """,
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoContextMenuCode extends CodeString {
  const CupertinoContextMenuCode();
  @override
  String buildCodeString() {
    return """
 Center(
  child: SizedBox(
    width: 200,
    height: 30,
    child: CupertinoContextMenu(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.green, spreadRadius: 3),
          ],
        ),
        // color: Colors.yellow,
        child: Text(
          'Long press me',
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        CupertinoContextMenuAction(
          child: const Text('Action one'),
          onPressed: () {
            Navigator.pop(context);
            showSnackBarMessage(context, 'Action one chosen');
          },
        ),
        CupertinoContextMenuAction(
          child: const Text('Action two'),
          onPressed: () {
            Navigator.pop(context);
            showSnackBarMessage(context, 'Action two chosen');
          },
        ),
      ],
    ),
  ),
),
          """;
  }
}
