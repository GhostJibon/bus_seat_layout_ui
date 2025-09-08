import 'package:bus_sit_layout/core/error/error.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/entities/seat_data_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {

  Future<Either<Failure, SeatDataEntity>> getSeatData({required int api});  
}
