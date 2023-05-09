import 'package:flutter/material.dart';

const giconFamily = 'GIcons';

abstract class GIcons {
  static const IconData project =
      IconData(0xea42, fontFamily: giconFamily, matchTextDirection: true);
  static const IconData issues =
      IconData(0xe600, fontFamily: giconFamily, matchTextDirection: true);
}
