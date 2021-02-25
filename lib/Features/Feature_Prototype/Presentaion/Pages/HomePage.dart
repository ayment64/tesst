import 'package:flutter/material.dart';
import 'package:tesst/Core/Routing.dart';
import 'package:tesst/Core/size_config.dart';
import 'package:tesst/Features/Feature_Prototype/Presentaion/Widgets/Dropdown_menu.dart';
import 'package:tesst/generated/l10n.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<Item>(
            hint: Text(
              "Select item",
              style: TextStyle(color: Colors.white),
            ),
            onChanged: (Item value) {
              setState(() {
                if (value.name == 'English') {
                  S.load(Locale("en", ""));
                } else if (value.name == 'French') {
                  S.load(Locale("fr", ""));
                }
              });
            },
            items: languages.map((Item item) {
              return DropdownMenuItem<Item>(
                value: item,
                child: Row(
                  children: <Widget>[
                    item.icon,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.name,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
        title: Text(S.of(context).next),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                "assets/flutter_icon.png",
                key: Key('Flutter Logo'),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.height / 5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: SizeConfig.screenWidth * 0.95,
              child: TextFormField(
                key: Key("Entertextsss"),
                decoration: InputDecoration(labelText: S.of(context).search),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, ToDataPage());
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
        ],
      ),
    );
  }
}
