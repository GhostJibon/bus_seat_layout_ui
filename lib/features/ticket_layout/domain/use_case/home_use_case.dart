import 'package:bus_sit_layout/core/error/error.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/entities/seat_data_entities.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase({required this.repository});

  Future<Either<Failure, SeatDataEntity>> getSeatData({required int api}) {
    return repository.getSeatData(api:api);
  }
}
