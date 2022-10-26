import 'package:calculator_converter/Config/colors.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BottomBarItem extends StatelessWidget {
  final int index;
  final IconData icon;

  const BottomBarItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        final isActive = homeCubit.isActive(index);

        return GestureDetector(
          onTap: () {
            homeCubit.jumpToTab(index);
          },
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              color: isActive ? AppColors.mainBlueColor : AppColors.whiteColor,
            ),
            child: Icon(
              icon,
              color: isActive
                  ? AppColors.whiteColor
                  : AppColors.bottomNavBarDeActiveColor,
              size: 4.h,
            ),
          ),
        );
      },
    );
  }
}
