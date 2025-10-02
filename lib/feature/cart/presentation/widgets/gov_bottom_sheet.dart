import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/data/source/governorate_list.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:flutter/material.dart';

Future<dynamic> showGovList(BuildContext context, CartCubit cubit) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return GovBottomSheetWidget(cubit: cubit);
    },
  );
}

class GovBottomSheetWidget extends StatelessWidget {
  const GovBottomSheetWidget({super.key, required this.cubit});
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Select Governorate",
                  style: TextStyles.getText20(color: Colors.black),
                ),

                IconButton(
                  onPressed: () {
                    popTo(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: governorates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(governorates[index].governorateNameEn),
                    onTap: () {
                      cubit.governoratecontroller.text =
                          governorates[index].governorateNameEn;
                      cubit.selectedGovernorateId = governorates[index].id;
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
