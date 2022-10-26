extension ConversionMathOperationsExtensions on double {

  double get makeLastDigitDropped {
    return (this / 10).floorToDouble();
  }
}
