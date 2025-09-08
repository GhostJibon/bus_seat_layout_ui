import 'package:bus_sit_layout/config/di/dependency_injector.dart';
import 'package:bus_sit_layout/core/error/api_error_generator.dart';
import 'package:bus_sit_layout/core/error/error.dart';
import 'package:bus_sit_layout/core/network/dio_client/dio_client.dart';
import 'package:bus_sit_layout/core/network/dio_client/request_params.dart';
import 'package:bus_sit_layout/features/ticket_layout/data/model/seat_data_model.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteSource {
  final DioClient client = sl<DioClient>();

  Future<Either<Failure, SeatDataModel>> getSeatData({required int api}) async {
    final APIRequestParam param = APIRequestParam(
      path: api == 1
          ? "https://api.jsonbin.io/v3/b/68b7cce7d0ea881f407010d6"
          : "https://api.jsonbin.io/v3/b/68bd5016ae596e708fe58eb1",
      isRequiredAuth: true,
    );
    return await client.get(param).then((response) {
      return response.fold(
        (left) {
          return Left(ApiErrorGenerator.apiError(left));
        },
        (right) {
          try {
            SeatDataModel response = SeatDataModel.fromJson(
              right.data,
            );
            return Right(response);
          } catch (e) {
            return Left(InvalidFormatFailure(message: e.toString()));
          }
        },
      );
    });
  }
}
