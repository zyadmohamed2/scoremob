extension IntConvert on int {
  String addOrdinal() {
    if (this == 1) {
      return '${this}st';
    } else if (this == 2) {
      return '${this}nd';
    } else if (this == 3) {
      return '${this}rd';
    } else {
      return '${this}th';
    }
  }
}
