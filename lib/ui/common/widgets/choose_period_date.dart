import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:intl/intl.dart';
import 'package:relation/relation.dart';

class ChoosePeriodDate extends StatelessWidget {
  const ChoosePeriodDate({Key? key, required this.dateBeginState, required this.dateEndState, required this.onDateBegin, required this.onDateEnd}) : super(key: key);

  final StreamedStateNS dateBeginState;
  final StreamedStateNS dateEndState;

  final Action<void> onDateBegin;
  final Action<void> onDateEnd;

  @override
  Widget build(BuildContext context) {
    return       Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StreamedStateBuilderNS(
            streamedStateNS: dateBeginState,
            builder: (context, dateBegin) {
              return GestureDetector(
                onTap: (){
                  onDateBegin.accept(dateBegin);
                },
                child: Container(
                  color: mainColor,
                  width: MediaQuery.of(context).size.width/3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(DateFormat('dd MMMM yyyy', 'ru').format(dateBegin))),
                  ),
                ),
              );
            }
        ),
        const Text('-', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        StreamedStateBuilderNS(
            streamedStateNS: dateEndState,
            builder: (context, dateEnd) {
              return GestureDetector(
                onTap: (){
                  onDateEnd.accept(dateEnd);
                },
                child: Container(
                  color: mainColor,
                  width: MediaQuery.of(context).size.width/3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(DateFormat('dd MMMM yyyy', 'ru').format(dateEnd))),
                  ),
                ),
              );
            }
        ),
      ],);
  }
}
