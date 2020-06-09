import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutterapp/bloc/result/bloc.dart';
import '../models/sessional_result_model.dart' show result;

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<ResultBloc>(context),
        builder: (context, state) {
          if (state is ResultLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResultLoadingFail) {
            return Center(
              child: Text("Some Error"),
            );
          } else if (state is ResultLoaded) {
            print(state.result.sessionalFirst);
            return state.result.sessionalFirst != null
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (state.result.sessionalFirst != null)
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Sessional 1",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        if (state.result.sessionalFirst != null)
                          ...state.result.sessionalFirst
                              .map((e) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 10),
                                    shadowColor:
                                        Colors.grey[200].withOpacity(.2),
                                    elevation: 12,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "${e.subjectName}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          AnimatedCircularChart(
//                        key: _chartKey,
                                            size: Size(100, 100),
                                            duration: Duration(seconds: 1),
                                            initialChartData: [
                                              CircularStackEntry(
                                                <CircularSegmentEntry>[
                                                  new CircularSegmentEntry(
                                                    ((e.obtainMarks /
                                                                e.totalMarks) *
                                                            100)
                                                        .toDouble(),
                                                    Colors.green,
                                                    rankKey: 'percentage',
                                                  ),
                                                ],
                                              ),
                                            ],
                                            chartType: CircularChartType.Radial,
                                            edgeStyle: SegmentEdgeStyle.round,
                                            percentageValues: true,
                                            holeLabel:
                                                '${e.obtainMarks} / ${e.totalMarks}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        if (state.result.sessionalSecond != null)
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Sessional 2",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        if (state.result.sessionalSecond != null)
                          ...state.result.sessionalSecond
                              .map((e) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 10),
                                    shadowColor:
                                        Colors.grey[200].withOpacity(.2),
                                    elevation: 12,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "${e.subjectName}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          AnimatedCircularChart(
//                        key: _chartKey,
                                            size: Size(100, 100),
                                            duration: Duration(seconds: 1),
                                            initialChartData: [
                                              CircularStackEntry(
                                                <CircularSegmentEntry>[
                                                  new CircularSegmentEntry(
                                                    ((e.obtainMarks /
                                                                e.totalMarks) *
                                                            100)
                                                        .toDouble(),
                                                    Colors.green,
                                                    rankKey: 'percentage',
                                                  ),
                                                ],
                                              ),
                                            ],
                                            chartType: CircularChartType.Radial,
                                            edgeStyle: SegmentEdgeStyle.round,
                                            percentageValues: true,
                                            holeLabel:
                                                '${e.obtainMarks} / ${e.totalMarks}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        if (state.result.sessionalThird != null)
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Sessional 3",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        if (state.result.sessionalThird != null)
                          ...state.result.sessionalThird
                              .map((e) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 10),
                                    shadowColor:
                                        Colors.grey[200].withOpacity(.2),
                                    elevation: 12,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "${e.subjectName}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          AnimatedCircularChart(
//                        key: _chartKey,
                                            size: Size(100, 100),
                                            duration: Duration(seconds: 1),
                                            initialChartData: [
                                              CircularStackEntry(
                                                <CircularSegmentEntry>[
                                                  new CircularSegmentEntry(
                                                    ((e.obtainMarks /
                                                                e.totalMarks) *
                                                            100)
                                                        .toDouble(),
                                                    Colors.green,
                                                    rankKey: 'percentage',
                                                  ),
                                                ],
                                              ),
                                            ],
                                            chartType: CircularChartType.Radial,
                                            edgeStyle: SegmentEdgeStyle.round,
                                            percentageValues: true,
                                            holeLabel:
                                                '${e.obtainMarks} / ${e.totalMarks}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                      ],
                    ),
                  )
                : Center(child: Text("No Result Found"));
          }
          return Container();
        },
      ),
    );
  }
}
