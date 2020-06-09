import 'package:equatable/equatable.dart';

abstract class SubjectEvent extends Equatable {
  const SubjectEvent();
}

class LoadSubjects extends SubjectEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadSubjectDetails extends SubjectEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
