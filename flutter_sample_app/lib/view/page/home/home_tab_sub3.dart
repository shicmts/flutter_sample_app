import 'package:flutter/material.dart';

/// 여러 팝업 만들어보기~~
class HomeTabSub3 extends StatefulWidget {
  const HomeTabSub3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeTabSub3State();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _HomeTabSub3State extends State<HomeTabSub3> {
  @override
  void initState() {
    super.initState();
  }

  void AlertDialogPop() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('팝업 메시지'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Alet Dialog Test'),
                  Text('Ok 버튼 클릭하세요')
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('cancel')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[RaisedButton(onPressed: AlertDialogPop)],
      ),
    );
  }
}
