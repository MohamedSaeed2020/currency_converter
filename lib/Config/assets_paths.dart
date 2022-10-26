class AssetsManager {
  AssetsManager._();
  static const notifyIcon = 'assets/images/notify_icon.svg';
  static const dropdownFullIcon = 'assets/icons/dropdown_full_icon.svg';
  static const errorIcon = 'assets/icons/error_icon.svg';
  static const noDataIcon = 'assets/icons/no_data_icon.svg';
  static const swapIcon = 'assets/icons/swap_icon.png';
  static String getMaterialUrl(String? code) {
    return 'assets/icons/flags/${code?.toLowerCase()}.png';
  }
}
