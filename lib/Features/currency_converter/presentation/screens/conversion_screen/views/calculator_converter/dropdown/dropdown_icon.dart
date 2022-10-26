import 'package:calculator_converter/Config/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DropdownIcon extends StatelessWidget {
  const DropdownIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsManager.dropdownFullIcon);
  }
}
