import 'package:bus_sit_layout/config/enum/bloc_api_state.dart';
import 'package:bus_sit_layout/features/ticket_layout/data/model/seat_data_model.dart';
import 'package:bus_sit_layout/features/ticket_layout/domain/entities/seat_data_entities.dart';
import 'package:equatable/equatable.dart';

class SeatDataState extends Equatable {
  final NormalApiState seatState;
  final SeatDataEntity seatDataEntity;
  final String errorMessage;

  const SeatDataState({
    required this.seatState,
    required this.seatDataEntity,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [seatState, seatDataEntity, errorMessage];

  factory SeatDataState.initial() {
    return SeatDataState(
      seatState: NormalApiState.initial,
      seatDataEntity: SeatDataEntity(
        record: SeatRowList(data: []),
        metadata: Metadata(id: "", isPrivate: false, createdAt: DateTime.now()),
      ),
      errorMessage: '',
    );
  }

  SeatDataState copyWith({
    NormalApiState? seatState,
    SeatDataEntity? seatDataEntity,
    String? errorMessage,
  }) {
    return SeatDataState(
      seatState: seatState ?? this.seatState,
      seatDataEntity: seatDataEntity ?? this.seatDataEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
