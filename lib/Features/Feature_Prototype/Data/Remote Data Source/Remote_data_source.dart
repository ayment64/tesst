import 'package:tesst/Core/Params.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';

abstract class RemoteDataSource {
  Future<List<Data>> getData(Params params);
}
