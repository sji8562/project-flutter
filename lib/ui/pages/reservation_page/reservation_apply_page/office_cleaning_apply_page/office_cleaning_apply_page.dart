import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/move.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/office_cleaning_apply_page/office_cleaning_apply_page_view_model.dart';
import 'package:toyproject/ui/pages/reservation_page/reservation_apply_page/office_cleaning_apply_page/widget/office_cleaning_apply_page_body.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';

class OfficeCleaningApplyPage extends ConsumerWidget {
  const OfficeCleaningApplyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: ArrowAppBar(leading: Icons.keyboard_backspace, title: '사무실 청소 예약', moveRoute: (){
          ref.read(officeCleaningApplyProvider.notifier).addServiceTime();
          Navigator.pushNamedAndRemoveUntil(context, Move.ReservationPage, (route) => false);
        },),
        body: const OfficeCleaningApplyPageBody()
    );
  }
}
