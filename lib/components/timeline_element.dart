import 'package:flutter/material.dart';
import '../model/timeline_model.dart';
import 'timeline_painter.dart';

class TimelineElement extends StatelessWidget {
  final TimelineJobModel model;
  final bool firstElement;
  final bool lastElement;
  final Animation<double> controller;

  const TimelineElement({
    super.key,
    required this.model,
    this.firstElement = false,
    this.lastElement = false,
    required this.controller
  });

  Widget _buildLine(BuildContext context, Widget? child) {
    return Container(
      width: 40.0,
      child: CustomPaint(
        painter: TimelinePainter(
          lineColor: Colors.red,
          firstElement: firstElement,
          lastElement: lastElement,
          controller: controller,
          backgroundColor: Colors.transparent
        ),
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
            child: Text(
              model.companyName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(model.startDate.year.toString(), style: const TextStyle(
                  color: Colors.black54
              )),
              const Text(" - ", style: TextStyle(
                  color: Colors.black54
              )),
              Text(model.endDate?.year.toString() ?? "now", style: const TextStyle(
                  color: Colors.black54
              )),
            ],
          ),
          Expanded(
            child: Text(
              model.role
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      height: 120.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AnimatedBuilder(
            builder: _buildLine,
            animation: controller,
          ),
          Expanded(
            child: _buildContentColumn(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRow(context);
  }
}
