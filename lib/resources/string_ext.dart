extension StringExt on String {
  String splitCamelCase() {
    final input = this;

    final regEx = RegExp("(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])");

    List<String> words = input.split(regEx);
    return words.join(' ');
  }
}
