import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final List<String> results;

  const Result({required this.results});

  @override
  List<Object?> get props => [results];

  factory Result.fromMap(List<dynamic> results) {
    return Result(
      results: List.from(results),
    );
  }
}
