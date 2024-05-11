import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final RenderObject? renderObject = currentContext?.findRenderObject();
    math.Vector3? translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return renderObject!.paintBounds.shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}
