import 'package:administration_app/ui/common/bottom_sheet_select_standart/bottom_sheet_select_standart_page.dart';
import 'package:flutter/material.dart';

Future<List<T>?> bottomSheetSelectStandart<T>({
  required BuildContext context,
  required String title,
  required List<T> data,
  required List<T> currentListData,
  required bool isSeveral,
  double? initialChildSize,
  bool withoutConfirmation = false,
  bool isBarrierColor = true,
  bool isCancelSelect = false,
}) {
  return showModalBottomSheet<List<T>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: isBarrierColor ? null : Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    builder: (_) => BottomSheetSelectPageStandart<T>(
      title: title,
      data: data,
      currentListData: currentListData,
      isSeveral: isSeveral,
      initialChildSize: initialChildSize,
      withoutConfirmation: withoutConfirmation,
      isCancelSelect: isCancelSelect,
    ),
  );
}