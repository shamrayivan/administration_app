// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_of_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOfVehicle _$TypeOfVehicleFromJson(Map<String, dynamic> json) =>
    TypeOfVehicle(
      itsGroup: json['ЭтоГруппа'] as bool,
      type: json['ЭлементНаименование'] as String,
      parentType: json['РодительНаименование'] as String,
    );

Map<String, dynamic> _$TypeOfVehicleToJson(TypeOfVehicle instance) =>
    <String, dynamic>{
      'ЭтоГруппа': instance.itsGroup,
      'ЭлементНаименование': instance.type,
      'РодительНаименование': instance.parentType,
    };
