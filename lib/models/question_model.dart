import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final String text;
  final String value;
  final List<String> answers;

  const Question({
    required this.id,
    required this.text,
    required this.answers,
    required this.value,
  });

  @override
  List<Object?> get props => [id, text, answers, value];

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'answers': answers,
    };
  }

  Question copyWith({
    int? id,
    String? text,
    String? value,
    List<String>? answers,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      value: value ?? this.value,
      answers: answers ?? this.answers,
    );
  }
}
