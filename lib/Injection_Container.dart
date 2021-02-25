import 'package:get_it/get_it.dart';
import 'package:tesst/Features/Feature_Prototype/Data/Remote%20Data%20Source/Remote_data_source.dart';
import 'package:tesst/Features/Feature_Prototype/Data/Remote%20Data%20Source/implementation/Remote_data_source_implementation.dart';
import 'package:tesst/Features/Feature_Prototype/Data/Repositories/Data_repository_implementtation.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Repositories/Data_repository.dart';
import 'package:tesst/Features/Feature_Prototype/Domain/Usecases/GetData.dart';
import 'package:tesst/Features/Feature_Prototype/Presentaion/Data_view_model.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
void initstate() {
  //  ? ----------------------------get data dependency tree ------------------------------
  sl.registerFactory(() => DataViewModel(getdata: sl()));
  sl.registerLazySingleton(() => GetData(dataRepositry: sl()));
  sl.registerLazySingleton<DataRepository>(
      () => DataRepositoryImplementation(remoteDataSource: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation(client: sl()));
  sl.registerLazySingleton(() => http.Client());
}
