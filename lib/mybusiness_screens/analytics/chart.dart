import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}

List<PricePoint> get PricePoints {
  final data = <double>[2, 1, 4, 7, 5, 3, 3, 27, 8, 5];
  return data
      .mapIndexed(
        (index, element) => PricePoint(x: index.toDouble(), y: element),
      )
      .toList();
}
