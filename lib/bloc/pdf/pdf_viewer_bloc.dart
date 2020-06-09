import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterapp/services/user_repository.dart';
import './bloc.dart';

class PdfViewerBloc extends Bloc<PdfViewerEvent, PdfViewerState> {
  final UserRepository repo;

  PdfViewerBloc(this.repo);
  @override
  PdfViewerState get initialState => InitialPdfViewerState();

  @override
  Stream<PdfViewerState> mapEventToState(
    PdfViewerEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadPdf) {
      yield* _mapLoadPdfToState(event);
    }
  }

  Stream<PdfViewerState> _mapLoadPdfToState(LoadPdf event) async* {
    try {
      yield PdfLoading();
      final file = await repo.createFileOfPdfUrl(event.url);
      yield PdfLoaded(file);
    } catch (e) {
      yield PdfLoadingFail(e.toString());
    }
  }
}
