extension DurationFormat on Duration {
  String get display {
    String days = inDays >= 1 ? "${inDays..toString().padLeft(2, "0")}:" : "";
    String hours =
        inHours >= 1 ? "${(inHours % 60).toString().padLeft(2, "0")}:" : "";
    String minutes = "${(inMinutes % 60).toString().padLeft(2, "0")}:";
    String seconds = (inSeconds % 60).toString().padLeft(2, "0");
    return "$days$hours$minutes$seconds";
  }
}
