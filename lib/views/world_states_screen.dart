import 'package:covid_tracker_app/utilis/my_button.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  final colorList = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            PieChart(
              dataMap: const {
                'Total': 50,
                'Recovered': 20,
                'Deaths': 10,
              },
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left,
              ),
              animationDuration: const Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .06,
              ),
              child: Card(
                child: Column(
                  children: const [
                    ReusableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReusableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReusableRow(
                      title: 'Total',
                      value: '200',
                    ),
                  ],
                ),
              ),
            ),
            MyButton(
              onTap: () {},
              title: 'Track Counteries',
            ),
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
