import 'package:bus_sit_layout/config/di/dependency_injector.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/cubit/seat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class StateManagementProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => sl<SeatDataCubit>()),
  ];
}
