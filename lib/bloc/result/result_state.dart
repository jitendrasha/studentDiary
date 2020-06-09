import 'package:equatable/equatable.dart';
import 'package:flutterapp/models/sessional_result_model.dart';

abstract class ResultState extends Equatable {
  const ResultState();
}

class InitialResultState extends ResultState {
  @override
  List<Object> get props => [];
}

class ResultLoading extends ResultState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResultLoadingFail extends ResultState {
  final String reason;

  ResultLoadingFail(this.reason);
  @override
  // TODO: implement props
  List<Object> get props => [reason];
}

class ResultLoaded extends ResultState {
  final SessionalResult result;

  ResultLoaded(this.result);
  @override
  // TODO: implement props
  List<Object> get props => [result];
}
