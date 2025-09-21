import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/feature/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: TextFormField(
          controller: cubit.searchNameControllar,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            prefixIcon: SvgPicture.asset(
              AppAssets.searchSvg,
              height: 20,
              width: 20,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            filled: true,
            fillColor: const Color(0xffF2F3F2),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
