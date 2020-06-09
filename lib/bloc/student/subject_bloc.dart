import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp/services/user_repository.dart';
import './bloc.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final UserRepository repo;

  SubjectBloc(this.repo);
  @override
  SubjectState get initialState => InitialSubjectState();

  @override
  Stream<SubjectState> mapEventToState(
    SubjectEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadSubjects) {
      yield* _mapLoadSubjectsToState();
    }
  }

  Stream<SubjectState> _mapLoadSubjectsToState() async* {
    try {
      yield SubjectsLoading();
      final model = await repo.loadSubjects();
      yield SubjectsLoaded(model);
    } catch (e) {
      yield SubjectsLoadingFail(e.toString());
    }
  }
}
