class TextExtension {
  final int maxWords;
  TextExtension({ this.maxWords = 3});
  String limitWords(String text, { maxwords}) {
    final words = text.split(" ");
    if (words.length <= maxWords) return text;
    return words.sublist(0, maxWords).join(" ") + "...";
  }
}
