import 'dart:ui';

import 'package:flutter/material.dart';

class StandingTier {
  String name;
  Color color;
  int rank;

  StandingTier(this.name, this.color, this.rank);
  StandingTier.empty()
      : this.color = Colors.transparent,
        this.name = '',
        this.rank = 0;
}
