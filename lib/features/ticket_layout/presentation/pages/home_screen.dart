import 'dart:math' as math;

import 'package:bus_sit_layout/config/enum/bloc_api_state.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/cubit/seat_cubit.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/cubit/seat_state.dart';
import 'package:bus_sit_layout/features/ticket_layout/presentation/widgets/cell_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<String> _selectedApiVN;

  @override
  void initState() {
    super.initState();
    _selectedApiVN = ValueNotifier<String>('API 1');
    context.read<SeatDataCubit>().getSeatData(api: 1);
  }

  @override
  void dispose() {
    _selectedApiVN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seat Layout", style: TextStyle(fontSize: 18.sp)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: ValueListenableBuilder<String>(
              valueListenable: _selectedApiVN,
              builder: (context, selectedApi, _) {
                return DropdownButtonFormField<String>(
                  value: selectedApi,
                  decoration: InputDecoration(
                    labelText: 'Select API',
                    labelStyle: TextStyle(fontSize: 14.sp),
                    border: const OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'API 1', child: Text('API 1')),
                    DropdownMenuItem(value: 'API 2', child: Text('API 2')),
                  ],
                  onChanged: _onApiChanged,
                );
              },
            ),
          ),
          12.verticalSpace,
          Expanded(
            child: BlocBuilder<SeatDataCubit, SeatDataState>(
              builder: (context, state) {
                if (state.seatState == NormalApiState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.seatState == NormalApiState.failure) {
                  return Center(
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: TextStyle(fontSize: 16.sp, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state.seatState == NormalApiState.loaded) {
                  final rows = state.seatDataEntity.record.data;
                  final maxCols = _maxColumns(rows);

                  return Padding(
                    padding: EdgeInsets.all(12.w),
                    child: ListView.builder(
                      itemCount: rows.length,
                      itemBuilder: (context, rowIndex) {
                        final normalized = _normalizeRowToWidth(
                          rows[rowIndex],
                          maxCols,
                        );
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: normalized.map((cellJson) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: CellBuilder(
                                  cellJson: cellJson,
                                  maxRowCount: maxCols,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  );
                }

                return Center(
                  child: Text(
                    'Select an API to fetch data',
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onApiChanged(String? value) {
    if (value == null) return;

    _selectedApiVN.value = value;

    if (value == 'API 1') {
      context.read<SeatDataCubit>().getSeatData(api: 1);
    } else {
      context.read<SeatDataCubit>().getSeatData(api: 2);
    }
  }

  int _rowWidth(dynamic row) {
    if (row is List) return row.length;
    if (row is Map) {
      int maxKey = -1;
      for (final k in row.keys) {
        final idx = int.tryParse(k.toString());
        if (idx != null) maxKey = math.max(maxKey, idx);
      }
      return maxKey + 1;
    }
    return 0;
  }

  int _maxColumns(List<dynamic> rows) {
    var maxCols = 0;
    for (final r in rows) {
      maxCols = math.max(maxCols, _rowWidth(r));
    }
    return maxCols;
  }

  List<Map<String, dynamic>?> _normalizeRowToWidth(dynamic row, int maxCols) {
    final out = List<Map<String, dynamic>?>.filled(
      maxCols,
      null,
      growable: false,
    );

    if (row is List) {
      for (var i = 0; i < row.length && i < maxCols; i++) {
        final v = row[i];
        if (v is Map) out[i] = Map<String, dynamic>.from(v);
      }
      return out;
    }

    if (row is Map) {
      row.forEach((k, v) {
        final idx = int.tryParse(k.toString());
        if (idx != null && idx >= 0 && idx < maxCols && v is Map) {
          out[idx] = Map<String, dynamic>.from(v);
        }
      });
      return out;
    }

    return out;
  }
}
