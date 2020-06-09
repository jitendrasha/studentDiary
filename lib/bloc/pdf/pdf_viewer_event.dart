import 'package:equatable/equatable.dart';

abstract class PdfViewerEvent extends Equatable {
  const PdfViewerEvent();
}

class LoadPdf extends PdfViewerEvent {
  final String url;

  LoadPdf(this.url);
  @override
  // TODO: implement props
  List<Object> get props => [];
}
