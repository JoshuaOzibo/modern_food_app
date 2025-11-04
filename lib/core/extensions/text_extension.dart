class TextExtension {
  String limitWords(String text, {int maxWords = 3}) {
    final words = text.split(" ");
    if (words.length <= maxWords) return text;
    return words.sublist(0, maxWords).join(" ") + "...";
  }
}
