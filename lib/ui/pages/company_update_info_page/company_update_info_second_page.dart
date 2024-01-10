import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyproject/_core/constants/color.dart';
import 'package:toyproject/_core/constants/style.dart';
import 'package:toyproject/ui/pages/company_update_info_page/company_update_info_pages_view_model.dart';
import 'package:toyproject/ui/widget/arrow_app_bar.dart';
import 'package:toyproject/ui/widget/button/color_button.dart';

import '../../../_core/constants/move.dart';
import 'company_code_table/company_code_table.dart';

class CompanyUpdateInfoSecondPage extends ConsumerStatefulWidget {
  const CompanyUpdateInfoSecondPage({super.key});

  @override
  ConsumerState<CompanyUpdateInfoSecondPage> createState() => _CompanyUpdateInfoSecondPageState();
}

class _CompanyUpdateInfoSecondPageState extends ConsumerState<CompanyUpdateInfoSecondPage> {
  @override
  Widget build(BuildContext context) {

    CompanyUpdateInfoPagesModel? companyUpdateInfoPagesModel = ref.watch(companyUpdateInfoProvider);
    List<ServiceType> serviceType = companyUpdateInfoPagesModel!.serviceType;

    return Stack(
      children: [
        Scaffold(
        appBar: ArrowAppBar(leading: Icons.arrow_back, title: "",),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("원하시는 일자리를 모두 선택해주세요", style: titleStyle1(),),
            ),
            SizedBox(height: 15,),
            Container(child:
              Divider(thickness: 8, color: disableColor,),),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: serviceType.length,
                itemBuilder: (context, index) {
                  return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(serviceType[index].service, style: subTitleStyle1(),), InkWell(onTap: (){
                              ref.read(companyUpdateInfoProvider.notifier).toggleServiceType(serviceType[index].service);
                          },child: serviceType[index].isChecked ? Icon(CupertinoIcons.checkmark_alt_circle_fill, color:primaryColor) : Icon(CupertinoIcons.checkmark_alt_circle, color: disableColor,))]),
                        )]
                  );
                },
              ),
            ),
            Divider(),
          ],
        ),
      ),
      Positioned(
        bottom: 20,
        child: ColorButton(text: "${ref.read(companyUpdateInfoProvider.notifier).selectedServiceTypes().length}개 선택", funPageRoute: (){
              Navigator.pushNamed(context, Move.CompanyUpdateInfoThirdPage);
        }),
      )]
    );
  }
}
