import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesst/Core/Messages.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';
import 'package:tesst/Features/Feature_Prototype/Presentaion/Data_view_model.dart';
import 'package:tesst/Injection_Container.dart';
import 'package:tesst/generated/l10n.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DataViewModel dataViewModel;
  int page = 1;
  var _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent)
        dataViewModel.paginate();
      if (_controller.position.pixels == _controller.position.minScrollExtent)
        getdatafromviewmodel(dataViewModel);
    });
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getdatafromviewmodel(dataViewModel));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataViewModel>(
      create: (context) => sl<DataViewModel>(),
      child: Consumer<DataViewModel>(builder: (context, value, child) {
        dataViewModel = value;
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  value.state == ViewState.Loading
                      ? CircularProgressIndicator()
                      : value.state == ViewState.Loaded
                          ? Selector<DataViewModel, List<Data>>(
                              builder: (context, value, child) {
                                return Expanded(
                                  child: ListView.builder(
                                      controller: _controller,
                                      scrollDirection: Axis.vertical,
                                      itemCount: value.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Text(value[index]
                                                        .positive
                                                        .toString() ??
                                                    "aaaaa")
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              },
                              selector: (_, dataViewModel) =>
                                  dataViewModel.pagination)
                          : value.state == ViewState.Failed
                              ? Center(
                                  child: Text(NO_DATA_MESSAGE),
                                )
                              : Container()
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (search) => value.search(search),
                    decoration: InputDecoration(labelText: S.of(context).next),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget itemWidget(Data data) {
    return new Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Card(
        child: Column(
          children: [Text(data.positive.toString())],
        ),
      ),
    );
  }

  void getdatafromviewmodel(DataViewModel viewModel) async {
    viewModel.getData();
  }
}
