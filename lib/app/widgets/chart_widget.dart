import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class ChartWidget extends StatelessWidget {
  final String title;
  final String number;
  final int? pieValue1;
  final int? pieValue2;
  final Color primaryColor;
  final Color secondColor;

  const ChartWidget({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondColor,
    required this.number,
    this.pieValue1,
    this.pieValue2,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.only(top: 16),
      color: secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: primaryColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontsStyle(
                  text: number,
                  color: primaryColor,
                  weight: FontWeight.bold,
                  size: 26,
                ),
                FontsStyle(
                    text: title, color: Colors.black, weight: FontWeight.w400),
              ],
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (pieValue1 != null && pieValue2 != null)
                  SizedBox(
                    width: 50,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(PieChartData(
                          centerSpaceRadius: 20,
                          sectionsSpace: 0,
                          sections: [
                            PieChartSectionData(
                                radius: 30,
                                showTitle: true,
                                value: pieValue1?.toDouble(),
                                title: "${pieValue1.toString()}%",
                                titleStyle: const TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                    height: 1.5,
                                    color: Colors.white),
                                color: primaryColor),
                            PieChartSectionData(
                                radius: 30,
                                titleStyle: const TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    letterSpacing: 0.2,
                                    height: 1.5,
                                    color: AppColor.lightGreyColor),
                                showTitle: true,
                                value: pieValue2?.toDouble(),
                                title: "${pieValue2.toString()}%",
                                color: Colors.white)
                          ])),
                    ),
                  )
                else
                  const SizedBox(
                    width: 40,
                    child: Text(""),
                  )
              ],
            )),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
