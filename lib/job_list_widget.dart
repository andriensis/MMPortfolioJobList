library mmjoblist;

import 'package:flutter/material.dart';

import 'components/timeline_element.dart';
import 'model/timeline_model.dart';

class MMJobListWidget extends StatefulWidget {

  final List<TimelineJobModel> jobList;

  const MMJobListWidget({super.key, required this.jobList});

  @override
  State<StatefulWidget> createState() {
    return MMJobListWidgetState();
  }
}

class MMJobListWidgetState extends State<MMJobListWidget> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jobList.length,
      itemBuilder: (_, index) {
        return TimelineElement(
          model: widget.jobList[index],
          firstElement: index == 0,
          lastElement: widget.jobList.length==index+1,
          controller: controller,
        );
      },
    );
  }
}
