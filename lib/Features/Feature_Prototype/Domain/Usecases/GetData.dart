import 'package:tesst/Core/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tesst/Core/Params.dart';
import 'package:tesst/Core/Usecase.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Repositories/Data_repository.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';

class GetData implements Usecase<List<Data>, Params> {
  final DataRepository dataRepositry;

  GetData({this.dataRepositry});

  @override
  Future<Either<Failure, List<Data>>> call(params) {
    return dataRepositry.getData(params);
  }
}
