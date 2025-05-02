import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/repositories/category_data.dart';

class CustomChartCategory extends StatefulWidget {
  const CustomChartCategory({
    super.key,
  });

  @override
  State<CustomChartCategory> createState() => _CustomChartCategoryState();
}

class _CustomChartCategoryState extends State<CustomChartCategory> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(AppStrings.category),
                          subtitle: Text(
                              "${DateTime.parse(DateTime.now().toString()).day} / ${DateTime.parse(DateTime.now().toString()).month} / ${DateTime.parse(DateTime.now().toString()).year}"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_outlined),
                      ),
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 180,
                    child: Row(
                      children: [
                        Stack(children: [
                          Positioned(
                            bottom: 80,
                            left: 39,
                            child: Text(AppStrings.expenses,
                                style: AppTextStyle.montserrat500Style16
                                    .copyWith(color: AppColor.primary)),
                          ),
                          SizedBox(
                            height: 180,
                            width: 150,
                            child: PieChart(
                              curve: Curves.linear,
                              duration: const Duration(milliseconds: 150),
                              PieChartData(
                                  titleSunbeamLayout: true,
                                  sectionsSpace: 1.4,
                                  centerSpaceRadius: 40,
                                  sections: List.generate(
                                    categoryData.length,
                                    (index) {
                                      return PieChartSectionData(
                                        color: categoryData[index].color,
                                        value: categoryData[index].value,
                                        radius: categoryData[index].radius,
                                        title: categoryData[index].title,
                                      );
                                    },
                                  )),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    // padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(categoryData.length, (index) {
                            return Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: categoryData[index].color,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Text(categoryData[index].name,
                                    style: AppTextStyle.montserratStyle12),
                              ],
                            );
                          }),
                        ),
                        Column(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              categoryData.length,
                              (index) => Text("\$${categoryData[index].value}",
                                  style: AppTextStyle.montserratStyle12
                                      .copyWith(
                                          fontSize: 12,
                                          color: AppColor.error))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


