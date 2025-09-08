import 'dart:convert';

import 'package:bus_sit_layout/features/ticket_layout/domain/entities/seat_data_entities.dart';

class SeatDataModel extends SeatDataEntity{
  final SeatRowList record;
  final Metadata metadata;

  SeatDataModel({
    required this.record,
    required this.metadata,
  }) : super(record: record, metadata: metadata);

  factory SeatDataModel.fromJson(Map<String, dynamic> json) {
    return SeatDataModel(
      record: SeatRowList.fromJson(json['record']),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() => {
        'record': record.toJson(),
        'metadata': metadata.toJson(),
      };

  static SeatDataModel fromRawJson(String str) =>
      SeatDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

class SeatRowList {
  final List<dynamic> data;

  SeatRowList({required this.data});

  factory SeatRowList.fromJson(Map<String, dynamic> json) {
    return SeatRowList(
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}

class Metadata {
  final String id;
  final bool isPrivate;
  final DateTime createdAt;

  Metadata({
    required this.id,
    required this.isPrivate,
    required this.createdAt,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      id: json['id'],
      isPrivate: json['private'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'private': isPrivate,
        'createdAt': createdAt.toIso8601String(),
      };
}
