String mainUrl = 'http://10.243.57.138/UAT20220420/hs/RMR/';
String subDomen = '/hs/RMR/';

abstract class Urls {
  static const typesOfVehicle = 'GetReference?ReferenceName=TypesOfVehicle';
  static String analysisLogisticWhithID ({required int modeID}) => 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=$modeID';
  static const vehicles = 'GetReference?ReferenceName=Vehicles';
  // static  analysisLogisticFirstMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=1';
  // static const analysisLogisticSecondMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=2';
  // static const analysisLogisticThirdMode = 'GetResult?FunctionName=AnalysisOfLogisticsWork&Company=Инфинити%20групп%20ООО&View=3';

}