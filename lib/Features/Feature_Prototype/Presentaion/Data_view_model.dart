import 'package:flutter/Foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:tesst/Core/Params.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Usecases/GetData.dart';
import 'package:tesst/Injection_Container.dart';

enum ViewState { Loading, Loaded, Failed, Initial }

class DataViewModel extends ChangeNotifier {
  GetData getdata = sl<GetData>();
  List<Data> _listofdata;
  List<Data> mainList;
  List<Data> pagination = List();
  ViewState _state = ViewState.Initial;
  int page = 1;
  DataViewModel({this.getdata});

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getData() async {
    setState(ViewState.Loading);
    page = 1;
    var response = await getdata(Params());
    response.fold((l) => null, (result) {
      _listofdata = result;
      for (int i = 0 + (50 * (page - 1)); i < 50 * page; i++)
        pagination.add(_listofdata[i]);
    });
    setState(ViewState.Loaded);
  }

  void paginate() {
    page++;

    for (int i = 0 + (50 * (page - 1)); i < 50 * page; i++)
      pagination.add(_listofdata[i]);
    notifyListeners();
  }

  void search(String search) {
    print('search :' + search);

    mainList = _listofdata;
    pagination.clear();
    for (Data d in _listofdata) {
      String s = "${d.positive}";
      if (search.length <= s.length) s = s.substring(0, search.length);
      if (s == search) {
        print('match');
        pagination.add(d);
      }
    }

    notifyListeners();
  }
}
