class Utils {
  static String toPriceString(double price) =>
      price.toStringAsFixed(2).replaceFirst(".00", "").replaceAll(".", ",");
}
