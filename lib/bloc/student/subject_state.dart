import 'package:equatable/equatable.dart';
import 'package:flutterapp/models/subjects_model.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();
}

class InitialSubjectState extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectsLoading extends SubjectState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SubjectsLoadingFail extends SubjectState {
  final String reason;

  SubjectsLoadingFail(this.reason);
  @override
  // TODO: implement props
  List<Object> get props => [reason];
}

class SubjectsLoaded extends SubjectState {
  final SubjectsModel model;

  SubjectsLoaded(this.model);
  @override
  // TODO: implement props
  List<Object> get props => [model];
}
