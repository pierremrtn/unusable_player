extension DurationFormat on Duration {
  String get display {
    if (this.inDays >= 1) {
      return "${this.inDays}:${this.inHours % 60}:${this.inMinutes % 60}:${this.inSeconds % 60}";
    } else if (this.inHours >= 1) {
      return "${this.inHours % 60}:${this.inMinutes % 60}:${this.inSeconds % 60}";
    } else {
      return "${this.inMinutes}:${this.inSeconds % 60}";
    }
  }
}
