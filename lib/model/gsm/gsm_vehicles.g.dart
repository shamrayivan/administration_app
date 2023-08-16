// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsm_vehicles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSMVehicles _$GSMVehiclesFromJson(Map<String, dynamic> json) => GSMVehicles(
      selected: json['Выбрать'] as bool,
      nameVehicle: json['Наименование'] as String,
    );

Map<String, dynamic> _$GSMVehiclesToJson(GSMVehicles instance) =>
    <String, dynamic>{
      'Наименование': instance.nameVehicle,
      'Выбрать': instance.selected,
    };
