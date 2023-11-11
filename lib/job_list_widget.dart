library mmjoblist;

import 'package:flutter/material.dart';

import 'model/job_model.dart';

class MMJobListWidget extends StatefulWidget {

  final List<JobModel> jobList;

  const MMJobListWidget({super.key, required this.jobList});

  @override
  State<StatefulWidget> createState() {
    return MMJobListWidgetState();
  }
}

class MMJobListWidgetState extends State<MMJobListWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox(
        height: double.infinity,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCarouselItem(context);
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
