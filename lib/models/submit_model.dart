import 'package:equatable/equatable.dart';

import 'package:expert_system_app/models/question_model.dart';

class SubmitModel extends Equatable {
  final List<SubmitData> data;
  const SubmitModel(this.data);

  @override
  List<Object?> get props => [data];

  Map<String, dynamic> toMap() {
    final map = {};
    for (var question in data) {
      map[question.question.value] = question.answers;
    }
    return {
      'data': map,
    };
  }
}

class SubmitData extends Equatable {
  final Question question;
  final List<String> answers;

  const SubmitData({required this.question, required this.answers});

  @override
  List<Object?> get props => [question, answers];

  Map<String, dynamic> toMap() {
    return {
      question.value: answers,
    };
  }
}
