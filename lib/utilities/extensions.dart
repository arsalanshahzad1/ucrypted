import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacerr on num {
  /// Adds vertical space
  Widget get vSpace => SizedBox(height: toDouble().h);

  /// Adds horizontal space
  Widget get hSpace => SizedBox(width: toDouble().w);
}