extension DurationFormat on Duration {
  String get display {
    if (inDays >= 1) {
      return "${inDays}:${inHours % 60}:${inMinutes % 60}:${inSeconds % 60}";
    } else if (inHours >= 1) {
      return "${inHours % 60}:${inMinutes % 60}:${inSeconds % 60}";
    } else {
      return "${inMinutes}:${inSeconds % 60}";
    }
  }
}
