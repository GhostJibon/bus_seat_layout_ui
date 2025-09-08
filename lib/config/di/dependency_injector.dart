import 'package:bus_sit_layout/core/network/dio_client/dio_client.dart';
import 'package:bus_sit_layout/features/ticket_layout/data/data_source/home_remote_source.dart';
import 'package:bus_sit_layout/features/ticket_layout/data/repository/home_repo_impl.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/repository/home_repository.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/use_case/home_use_case.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/cubit/seat_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await _dioClient();
  await _seatCubit();
}

Future<void> _dioClient() async {
  sl.registerFactory(() => DioClient(
  ));
}

Future<void> _seatCubit() async {
  sl.registerFactory(() => SeatDataCubit(homeUseCase: sl()));
  sl.registerLazySingleton(() => HomeUseCase(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepoImpl(source: sl()),
  );
  sl.registerLazySingleton(() => HomeRemoteSource());
}


