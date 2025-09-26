import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({super.key, required this.products});

  final Product products;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              products.price ?? "",
              style: TextStyles.getText18(color: AppColor.darkColor),
            ),
            Gap(60),
            AppMainBottom(
              bottomColor: AppColor.darkColor,
              radias: 8,
              onPressed: () {},
              bottomHight: 56,
              text: "Add To Cart",
              bottomWidth: 190,
            ),
          ],
        ),
      ),
    );
  }
}
