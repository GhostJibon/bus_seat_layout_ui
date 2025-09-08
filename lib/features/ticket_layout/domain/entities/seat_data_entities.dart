import 'package:bus_sit_layout/features/ticket_layout/data/model/seat_data_model.dart';
import 'package:equatable/equatable.dart';

class SeatDataEntity extends Equatable {
  final SeatRowList record;
  final Metadata metadata;

  const SeatDataEntity({
    required this.record,
    required this.metadata
  });

  @override
  // TODO: implement props
  List<Object?> get props => [metadata,record];
}
