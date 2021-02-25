import 'package:flutter/material.dart';
import 'package:tesst/Features/Feature_Prototype/Presentaion/Pages/DataPage.dart';

class ToDataPage extends MaterialPageRoute<Null> {
  ToDataPage()
      : super(builder: (BuildContext ctx) {
          return new DataPage();
        });
}
