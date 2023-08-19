import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class BottomSheetSelectStandartWM<T> extends WidgetModelStandard {
  BottomSheetSelectStandartWM({
    required this.title,
    required this.data,
    required this.currentListData,
    required this.isSeveral,
    required this.initialChildSize,
    required this.withoutConfirmation,
    required this.isCancelSelect,
  }) : dataListState = StreamedStateNS<List<T>>(currentListData);

  final _appRouter = getIt<AppRouter>();

  final double? initialChildSize;

  final String title;
  final List<T> data;
  final List<T> currentListData;
  final bool isSeveral;
  final bool withoutConfirmation;
  final bool isCancelSelect;

  final StreamedStateNS<List<T>> dataListState;

  final onSelect = Action<T>();
  final onOk = Action<void>();
  final onBack = Action<void>();

  @override
  void onBind() {
    subscribe<void>(onOk.stream, (_) => _appRouter.pop(dataListState.value));
    subscribe<void>(onBack.stream, (_) => _appRouter.pop());
    subscribe<T>(
      onSelect.stream,
          (val) {
        if (val == null) return;
        if (withoutConfirmation) {
          _appRouter.pop([val]);
          return;
        }

        if (isSeveral) {
          final dataList = dataListState.value;
          dataList.contains(val)
              ? dataListState.accept(dataList..remove(val))
              : dataListState.accept(dataList..add(val));
          return;
        }
        if (isCancelSelect) {
          final oldVal = dataListState.value;
          oldVal.contains(val) ? dataListState.accept([]) : dataListState.accept([val]);
        } else {
          dataListState.accept([val]);
        }
      },
    );
  }
}
