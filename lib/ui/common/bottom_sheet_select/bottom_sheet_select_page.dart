import 'package:administration_app/ui/common/bottom_sheet_select/bottom_sheet_select_wm.dart';
import 'package:administration_app/ui/common/widgets/circle_button.dart';
import 'package:administration_app/ui/common/widgets/custom_text_input.dart';
import 'package:administration_app/ui/common/widgets/default_button.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

const _maxChildSize = 0.9;

class BottomSheetSelectPage<T> extends CoreMwwmWidget {
  BottomSheetSelectPage({
    required String title,
    required List<String> data,
    required List<String> currentListData,
    required bool isSeveral,
    required double? initialChildSize,
    required bool withoutConfirmation,
    required bool isCancelSelect,
    Key? key,
  }) : super(
    key: key,
    widgetModelBuilder: (_) => BottomSheetSelectWM(
      title: title,
      data: data,
      isSeveral: isSeveral,
      currentListData: currentListData,
      initialChildSize: initialChildSize,
      withoutConfirmation: withoutConfirmation,
      isCancelSelect: isCancelSelect,
    ),
  );

  @override
  State<StatefulWidget> createState() => _BottomSheetSelectPageState<T>();
}

class _BottomSheetSelectPageState<T> extends WidgetState<BottomSheetSelectWM> {
  @override
  Widget build(BuildContext context) {
    final size = ((wm.data.length + (wm.withoutConfirmation ? 0 : 1)) * 51 + 136) /
        MediaQuery.of(context).size.height;
    final initialChildSize = wm.initialChildSize ?? (size >= _maxChildSize ? 0.899 : size);
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: _maxChildSize,
      minChildSize: 0.2,
      expand: false,
      builder: (_, controller) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: blackColor,
              automaticallyImplyLeading: false,
              title: Text(wm.title, style: const TextStyle(color: mainColor, fontSize: 16)),
              actions: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                          keyboardType: TextInputType.text,
                          onChanged: (text) {
                            wm.onChangeController.accept(text);
                          },
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF828C98),
                            size: 24,
                          ),
                          hintText: 'Поиск...',
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: const Color(0xFF828C98).withOpacity(0.5),
                              fontFamily: 'Raleway',
                              fontSize: 12),
                          controller: wm.searchController,
                          enabled: true,
                          externalBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                          fillColor: const Color(0xFFEBECF0),
                        ),
                  )
                ),
                CircleButton<void>(
                  iconSize: 24,
                  onPressed: wm.onBack,
                  iconWidget: const Icon(Icons.close, color: whiteColor,),
                  color: Colors.transparent,
                  backGroundColor: Colors.transparent,
                  bodyColor: Colors.transparent,
                ),
                const SizedBox(width: 16),
              ],
            ),
            bottomSheet: wm.withoutConfirmation
                ? null
                : Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 8),
              child: DefaultButton<void>(
                height: 51,
                text: 'Готово',
                onPressed: wm.onOk,
              ),
            ),
            body: StreamedStateBuilderNS<List>(
              streamedStateNS: wm.dataListState,
              builder: (_, dataList) {
                return StreamedStateBuilderNS(
                  streamedStateNS: wm.dataState,
                  builder: (context, data) {
                    return ListView.separated(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      separatorBuilder: (_, __) => const Divider(height: 0, thickness: 1, color: greyColor,),
                      itemBuilder: (_, index) {
                        return DefaultButton<void>(
                          height: 51,
                          borderRadii: const [0, 0, 0, 0],
                          onCallback: () => wm.onSelect.accept(data[index]),
                          bgColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: data.first is Map ? MainAxisAlignment.center :MainAxisAlignment.spaceBetween,
                              children: [
                                  _Text(
                                    text: data[index].toString(),
                                    textColor: dataList.contains(data[index])
                                        ? mainColor
                                        : blackColor
                                  ),
                                if (dataList.contains(data[index]))
                                  const Icon(Icons.check,
                                      color: mainColor),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _Text extends StatelessWidget {
  final String text;
  final Color textColor;

  const _Text({
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
