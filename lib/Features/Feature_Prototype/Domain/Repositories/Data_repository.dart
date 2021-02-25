import 'package:dartz/dartz.dart';
import 'package:tesst/Core/Failure.dart';
import 'package:tesst/Core/Params.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';

abstract class DataRepository {
  Future<Either<Failure, List<Data>>> getData(Params params);
}
