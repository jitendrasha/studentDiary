import 'package:equatable/equatable.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();
}

class LoadResult extends ResultEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
