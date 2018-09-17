import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///grid delegate
class ISliverGridDelegate extends SliverGridDelegate {
  final double kSpacing;
  final double titleHeight;
  double titleWidth;
  final int dataCount;
  final int rowCount;
  final bool isSquare;

  ISliverGridDelegate({
    @required this.titleHeight,
    @required this.dataCount,
    @required this.rowCount,
    this.kSpacing,
    this.titleWidth,
    this.isSquare=false
  })  : assert(titleHeight != null),
        assert(dataCount != null),
        assert(rowCount != null);

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    ///宽度
    titleWidth = (constraints.crossAxisExtent - kSpacing) / rowCount;

    return _ISliverGridLayout(
        tileHeight: isSquare?titleWidth:titleHeight,
        tileWidth: titleWidth,
        rowStride: isSquare?titleWidth:titleHeight + kSpacing,
        columnStride: titleWidth + kSpacing,
        dataCount: dataCount,
        rowCount: rowCount);
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) => false;
}

class _ISliverGridLayout extends SliverGridLayout {
  const _ISliverGridLayout({
    @required this.rowStride,
    @required this.columnStride,
    @required this.tileHeight,
    @required this.tileWidth,
    @required this.dataCount,
    @required this.rowCount,
  });

  final double rowStride;
  final double columnStride;
  final double tileHeight;
  final double tileWidth;
  final int dataCount;
  final int rowCount;

  ///最少有多少偏移
  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return 0;
  }

  ///最多有多少偏移，测试只要大于Item个数就可以
  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    return dataCount;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final int row = index ~/ rowCount;
    final int column = index % rowCount;
    final int columnSpan = 1;
    return new SliverGridGeometry(
      ///行宽
      scrollOffset: row * rowStride,

      ///列宽
      crossAxisOffset: column * columnStride,

      ///与上一个控件的距离
      mainAxisExtent: tileHeight,
      crossAxisExtent: tileWidth + (columnSpan - 1) * columnStride,
    );
  }

  @override
  double computeMaxScrollOffset(int childCount) {
    if (childCount == 0) return 0.0;
    final int rowCount = childCount ~/ this.rowCount;
    final double rowSpacing = rowStride - tileHeight;
    return rowStride * rowCount - rowSpacing;
  }
}