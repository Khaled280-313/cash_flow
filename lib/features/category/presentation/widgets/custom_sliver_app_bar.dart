import 'package:flutter/material.dart';

import '../../../../core/function/custom_navigat.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(S.of(context).category),
      pinned: true,
      floating: true,
      backgroundColor: AppColor.background,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            customNavigatPush(context: context, path: "/Addcategory");
          },
        ),
      ],
    );
  }
}
