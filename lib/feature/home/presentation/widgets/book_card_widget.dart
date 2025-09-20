import 'package:bookia/components/app_main_bottom.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 280,
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.network(
                  product.image ?? "",
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
            ),
            Gap(5),
            Text(
              product.name ?? "",
              style: TextStyles.getText20(color: AppColor.darkColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price ?? ""),
                AppMainBottom(
                  bottomColor: AppColor.darkColor,
                  radias: 4,
                  onPressed: () {},
                  bottomHight: 27.90,
                  text: "buy",
                  bottomWidth: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
