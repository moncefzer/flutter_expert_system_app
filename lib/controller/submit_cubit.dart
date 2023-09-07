import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:expert_system_app/models/question_model.dart';
import 'package:expert_system_app/models/result_model.dart';
import 'package:expert_system_app/models/submit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'submit_state.dart';

class SubmitCubit extends Cubit<SubmitState> {
  SubmitCubit() : super(SubmitInitial());

  List<SubmitData> submitData = [];

  static SubmitCubit get(context) => BlocProvider.of(context);

  void submitPage(Question question, List<String> answers,
      [bool isLastPage = false]) {
    submitData.add(SubmitData(question: question, answers: answers));
    if (isLastPage) {
      _submitAllForm();
    }
  }

  void _submitAllForm() async {
    emit(SubmitLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final Result result = await _getResult(submitData);
      emit(SubmitLoaded(result));
      _reset();
    } catch (err) {
      print(err);
      emit(const SubmitError('Unknown Error'));
    }
  }

  Future<Result> _getResult(List<SubmitData> submitData) async {
    Dio dio = Dio();

    print('Getting result');

    final response = await dio.get(
      'http://192.168.60.181:8000/submit',
      data: SubmitModel(submitData).toMap(),
    );

    return Result.fromMap(response.data);
  }

  void cancelAllData() {
    _reset();
  }

  void _reset() {
    submitData = [];
  }
}
