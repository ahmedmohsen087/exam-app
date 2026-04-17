import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/ui_strings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/values/arg_param.dart';

class ExamScorePage extends StatelessWidget {
  static String routeName = "exam score screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, int>;

    int totalN = args[ArgParam.totalN]!;
    int correctN = args[ArgParam.correctN]!;
    int inCorrectN = args[ArgParam.inCorrectN]!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Text(
          UiStrings.examScore,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              UiStrings.yourScore,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 8.0,
                    percent: correctN / totalN,
                    center: Text(
                      "${correctN * 100 / totalN}%",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    progressColor: AppColors.blue,
                    backgroundColor: AppColors.red,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
                SizedBox(width: 23),
                Expanded(
                  child: Column(
                    children: [
                      _buildCorrectWidget(context, correctN),
                      SizedBox(height: 11),
                      _buildInCorrectWidget(context, inCorrectN),
                    ],
                  ),
                ),
                SizedBox(width: 34),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                UiStrings.showResult,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.white),
              ),
              onPressed: () {},
              child: Text(
                UiStrings.startAgain,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.blue,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCorrectWidget(BuildContext context, int correctN) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Correct",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blue),
            shape: BoxShape.circle,
          ),
          child: Text(
            "$correctN",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildInCorrectWidget(BuildContext context, int inCorrectN) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "InCorrect",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.red),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            shape: BoxShape.circle,
          ),
          child: Text(
            "$inCorrectN",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
