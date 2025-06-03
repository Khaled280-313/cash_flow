import 'package:cash_flow/features/home/presentation/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';

class CustumRowAcount extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? amount;
  final IconData? icon;
  final List data;
  const CustumRowAcount({
    super.key,
    this.color,
    this.title,
    this.amount,
    this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColor.black,
      splashColor: AppColor.black,
      onLongPress: () {},
      onTap: () {
        showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          backgroundColor: AppColor.white,
          useRootNavigator: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 40,
          useSafeArea: true,
          enableDrag: true,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 1, 1, 10),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(icon, color: AppColor.white),
                          ),
                          Text(
                            title!,
                            style: AppTextStyle.montserratBoldStyle12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 260),
                            child: IconButton(
                                iconSize: 30,
                                onPressed: () {},
                                icon: Icon(Icons.draw_outlined)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(color: AppColor.white),
                      child: CustomLineChart(
                        data: data,
                      ),
                    ),
                  ],
                ));
          },
        );
      },
      child: Container(
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColor.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: AppTextStyle.montserratBoldStyle12,
                ),
                Text(
                  amount!,
                  style: AppTextStyle.montserratBoldStyle12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
