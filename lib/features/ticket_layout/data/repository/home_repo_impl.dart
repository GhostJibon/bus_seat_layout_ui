import 'package:bus_sit_layout/core/error/error.dart';
import 'package:bus_sit_layout/features/ticket_layout/data/data_source/home_remote_source.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/entities/seat_data_entities.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepository {
  final HomeRemoteSource source;

  HomeRepoImpl({required this.source});

  @override
  Future<Either<Failure, SeatDataEntity>> getSeatData({required int api}) {
    return source.getSeatData(api:api);
  }
}
