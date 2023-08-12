// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicles _$VehiclesFromJson(Map<String, dynamic> json) => Vehicles(
      itsGroup: json['ЭтоГруппа'] as bool,
      dateRetired: json['ДатаВыбытия'] as int,
      vehicleName: json['ЭлементНаименование'] as String,
      parentType: json['РодительНаименование'] as String,
    );

Map<String, dynamic> _$VehiclesToJson(Vehicles instance) => <String, dynamic>{
      'ЭтоГруппа': instance.itsGroup,
      'ЭлементНаименование': instance.vehicleName,
      'РодительНаименование': instance.parentType,
      'ДатаВыбытия': instance.dateRetired,
    };
