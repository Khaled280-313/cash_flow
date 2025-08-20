import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/category_data.dart';
import '../cubit/home_cubit.dart';

class CustomChartCategory extends StatefulWidget {
  const CustomChartCategory({
    super.key,
  });

  @override
  State<CustomChartCategory> createState() => _CustomChartCategoryState();
}

class _CustomChartCategoryState extends State<CustomChartCategory> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategories();
  }

  bool check = false;
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
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(26),
                    blurRadius: 10,
                    offset: Offset(5, 5),
                    spreadRadius: 5)
              ]),
          child: Card.filled(
            elevation: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: AppColor.white,
            borderOnForeground: false,
            child: InkWell(
              onTap: () {
                setState(() {
                  check = !check;
                });
              },
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
                              title: Text(S.of(context).category),
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
                                child: Text(
                                    check
                                        ? S.of(context).expenses
                                        : S.of(context).income,
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
                                      sections: check
                                          ? List.generate(
                                              categoryExpensesData.length,
                                              (index) {
                                                return PieChartSectionData(
                                                  color: categoryExpensesData[
                                                          index]
                                                      .color,
                                                  value: categoryExpensesData[
                                                          index]
                                                      .value,
                                                  radius: categoryExpensesData[
                                                          index]
                                                      .radius,
                                                  title: categoryExpensesData[
                                                          index]
                                                      .title,
                                                );
                                              },
                                            )
                                          : List.generate(
                                              categoryIncomeData.length,
                                              (index) {
                                                return PieChartSectionData(
                                                  color:
                                                      categoryIncomeData[index]
                                                          .color,
                                                  value:
                                                      categoryIncomeData[index]
                                                          .value,
                                                  radius:
                                                      categoryIncomeData[index]
                                                          .radius,
                                                  title:
                                                      categoryIncomeData[index]
                                                          .title,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: check == true
                                  ? List.generate(categoryExpensesData.length,
                                      (index) {
                                      return Row(
                                        spacing: 10,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: categoryExpensesData[index]
                                                  .color,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          Text(categoryExpensesData[index].name,
                                              style: AppTextStyle
                                                  .montserratStyle14),
                                        ],
                                      );
                                    })
                                  : List.generate(categoryIncomeData.length,
                                      (index) {
                                      return Row(
                                        spacing: 10,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: categoryIncomeData[index]
                                                  .color,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          Text(categoryIncomeData[index].name,
                                              style: AppTextStyle
                                                  .montserratStyle14),
                                        ],
                                      );
                                    }),
                            ),
                            Column(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: check
                                  ? List.generate(
                                      categoryExpensesData.length,
                                      (index) => Text(
                                          "\$${categoryExpensesData[index].value}",
                                          style: AppTextStyle.montserratStyle14
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: AppColor.error)))
                                  : List.generate(
                                      categoryIncomeData.length,
                                      (index) => Text(
                                          "\$${categoryIncomeData[index].value}",
                                          style: AppTextStyle.montserratStyle14
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: AppColor.success))),
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
        ),
      ),
    );
  }
}
