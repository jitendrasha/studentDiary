import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp/services/user_repository.dart';
import './bloc.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final UserRepository repository;

  ResultBloc(this.repository);
  @override
  ResultState get initialState => InitialResultState();

  @override
  Stream<ResultState> mapEventToState(
    ResultEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadResult) {
      yield* _mapLoadResultToState();
    }
  }

  Stream<ResultState> _mapLoadResultToState() async* {
    try {
      yield ResultLoading();
      final result = await repository.loadResult();
      yield ResultLoaded(result);
    } catch (e) {
      print(e);
      yield ResultLoadingFail(e.toString());
    }
  }
}
