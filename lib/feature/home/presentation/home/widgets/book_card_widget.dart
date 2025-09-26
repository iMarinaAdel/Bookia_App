import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({super.key, required this.products});
  final Product products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: products);
      },
      child: Container(
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
                child: Hero(
                  tag: products.key ?? "",
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 150,
                      imageUrl: products.image ?? "",
                    ),
                  ),
                ),
              ),
              Gap(5),
              SizedBox(
                height: 45,
                child: Text(
                  products.name ?? "",
                  style: TextStyles.getText18(color: AppColor.darkColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products.price ?? "",
                    style: TextStyles.getText14(color: AppColor.darkColor),
                  ),
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
      ),
    );
  }
}
