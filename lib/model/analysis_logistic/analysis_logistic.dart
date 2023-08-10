import 'package:json_annotation/json_annotation.dart';

part 'analysis_logistic.g.dart';

@JsonSerializable(constructor: '_')
class AnalysisLogistic {

  @JsonKey(name: 'МесяцПрошлый')
  final int lastMonth;

  @JsonKey(name: 'ПрошлыйГод')
  final int lastYear;

  @JsonKey(name: 'МесяцТекущий')
  final int currentMonth;

  @JsonKey(name: 'ТекущийГод')
  final int currentYear;

  AnalysisLogistic._({
    required this.lastMonth,
    required this.lastYear,
    required this.currentMonth,
    required this.currentYear,
  });

  factory AnalysisLogistic.fromJson(Map<String, dynamic> json) => _$AnalysisLogisticFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnalysisLogisticToJson(this);

}
