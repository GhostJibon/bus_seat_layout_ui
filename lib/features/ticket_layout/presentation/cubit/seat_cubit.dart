import 'package:bloc/bloc.dart';
import 'package:bus_sit_layout/config/enum/bloc_api_state.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/use_case/home_use_case.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/cubit/seat_state.dart';

class SeatDataCubit extends Cubit<SeatDataState> {
  final HomeUseCase homeUseCase;

  SeatDataCubit({required this.homeUseCase})
    : super(SeatDataState.initial());

  Future<void> getSeatData({required int api}) async {
    emit(state.copyWith(seatState: NormalApiState.loading));
    await homeUseCase.getSeatData(api:api).then((response) {
      response.fold(
        (failed) {
          emit(state.copyWith(seatState: NormalApiState.failure));
        },
        (success) {
          try {
            emit(
              state.copyWith(
                seatState: NormalApiState.loaded,
                errorMessage: "worked",
                seatDataEntity: success,
              ),
            );
          } catch (e) {
            emit(
              state.copyWith(
                seatState: NormalApiState.failure,
                errorMessage: "failed",
              ),
            );
          }
        },
      );
    });
  }

}