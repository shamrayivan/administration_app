// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_logistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisLogistic _$AnalysisLogisticFromJson(Map<String, dynamic> json) =>
    AnalysisLogistic._(
      lastMonth: json['МесяцПрошлый'] as int,
      lastYear: json['ПрошлыйГод'] as int,
      currentMonth: json['МесяцТекущий'] as int,
      currentYear: json['ТекущийГод'] as int,
    );

Map<String, dynamic> _$AnalysisLogisticToJson(AnalysisLogistic instance) =>
    <String, dynamic>{
      'МесяцПрошлый': instance.lastMonth,
      'ПрошлыйГод': instance.lastYear,
      'МесяцТекущий': instance.currentMonth,
      'ТекущийГод': instance.currentYear,
    };
