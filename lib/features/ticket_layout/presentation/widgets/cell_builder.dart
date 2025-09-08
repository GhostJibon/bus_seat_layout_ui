import 'package:bus_sit_layout/features/ticket_layout/presentation/widgets/door_widget.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/widgets/driver_widget.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/widgets/seat_widget.dart';

class CellBuilder extends StatelessWidget {
  final Map<String, dynamic>? cellJson;
  final int maxRowCount;

  const CellBuilder({
    super.key,
    required this.cellJson,
    required this.maxRowCount,
  });

  double _calculateWidgetSize(int maxRowCount) {
  const double baseSize = 60.0;
  const int baseRows = 5;
  return baseSize * (baseRows / maxRowCount);
}

  @override
  Widget build(BuildContext context) {
    final widgetSize = _calculateWidgetSize(maxRowCount);

    if (cellJson == null) return SpaceWidget(widgetSize: widgetSize);

    final type = (cellJson!['type'] as String?)?.toLowerCase();
    switch (type) {
      case 'seat':
        return SeatWidget(
          label: (cellJson!['name'] ?? '').toString(),
          widgetSize: widgetSize,
        );
      case 'driver':
        return DriverWidget(widgetSize: widgetSize);
      case 'door':
        return DoorWidget(widgetSize: widgetSize);
      case 'space':
        return SpaceWidget(widgetSize: widgetSize);
      default:
        return SpaceWidget(widgetSize: widgetSize);
    }
  }
}