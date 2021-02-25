import 'package:connectivity/connectivity.dart';
import 'package:tesst/Core/Exceptions.dart';
import 'package:tesst/Core/Messages.dart';
import 'package:tesst/Features/Feature_Prototype/Data/Remote%20Data%20Source/Remote_data_source.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Entitys/Data.dart';
import 'package:tesst/Core/Params.dart';
import 'package:tesst/Core/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Repositories/Data_repository.dart';

class DataRepositoryImplementation implements DataRepository {
  final RemoteDataSource remoteDataSource;

  DataRepositoryImplementation({this.remoteDataSource});
  Future<void> checkConnection() async {
    if ((await Connectivity().checkConnectivity()) == ConnectivityResult.none)
      throw LoseConnectionException();
  }

  @override
  Future<Either<Failure, List<Data>>> getData(Params params) async {
    try {
      await checkConnection();
      var result = await remoteDataSource.getData(params);
      if (result is List<Data>) {
        if (result.length > 0)
          return Right(result);
        else
          return Left(NoDataFailure(message: NO_DATA_MESSAGE));
      }
    } on LoseConnectionException {
      return Left(ServerFailure(message: NO_CONNECTION_MESSAGE));
    } on ServerExeption {
      return Left(ServerFailure(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
