import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NavigationRail',
      home: MyHomePage(title: 'NavigationRail'),
      debugShowCheckedModeBanner: false,
    );
  }
}

final List networkimages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIULTa-FIggV3SBqX0nIwCWvNdpcnF2Na5bQ&usqp=CAU',
  'https://wallpapersmug.com/large/4a2e46/spill-of-colors-abstract.jpg',
  'https://wallpapersmug.com/large/2fda8d/white-wall-lamp.jpg',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool extended = false;

  final List<Color> gradient = [
    const Color.fromARGB(255, 43, 33, 52),
    const Color.fromARGB(255, 43, 33, 52),
    const Color.fromARGB(163, 98, 63, 222),
    const Color.fromARGB(163, 98, 63, 222)
  ];
  final double fillPercent;
  late final double fillStop;
  List<double> stops;

  _MyHomePageState()
      : fillPercent = 56.23,
        stops = [] {
    fillStop = (100 - fillPercent) / 100;
    stops = [0.0, fillStop, fillStop, 1.0];
  }
  late CalendarController _calendarController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final years = [2015, 2016, 2017, 2018, 2019, 2020];

    if (years.contains(value.toInt())) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text(
          value.toInt().toString(),
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromARGB(255, 205, 7, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Home"),
        actions: [
          Container(
              margin: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * .4,
              child: const SearchBar(
                trailing: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
                hintText: "Search",
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 48, 18, 53),
                ),
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.white)),
              )),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.power_settings_new_rounded)),
          const SizedBox(
            width: 20,
          ),
          const CircleAvatar()
        ],
      ),
      body: Wrap(
        direction: Axis.vertical,
        children: [
          Drawer(
            width: MediaQuery.of(context).size.width > 600
                ? MediaQuery.of(context).size.width * 0.15
                : 0,
            backgroundColor: Colors.white,
            child: ListView(padding: EdgeInsets.zero, children: [
              Column(
                children: [
                  const Image(
                    height: 40,
                    width: 80,
                    image: NetworkImage(
                        'https://adstacks.in/wp-content/uploads/2020/08/Adstacks-w_o-bg.png'),
                  ),
                  const Divider(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 251, 255, 27))),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://c.vanceai.com/assets/images/image_enhancer/introduce_2_after-75583988d1.png'),
                    ),
                  ),
                  const Text("Pooja mishra"),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: const Text("Admin"),
                  ),
                  Divider(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: ListTile(
                      onTap: () {},
                      title: Text("Home"),
                      leading: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.only(left: 50),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Employee"),
                    leading: Icon(Icons.groups_2_outlined),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Attendence"),
                    leading: Icon(Icons.list_sharp),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Summary"),
                    leading: Icon(Icons.calendar_month_outlined),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Information"),
                    leading: Icon(Icons.error_outline),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("WORKSPACE"),
                    trailing: Icon(Icons.add),
                    tileColor: Color.fromARGB(113, 54, 68, 223),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Adstacks"),
                    trailing: Icon(Icons.arrow_drop_down_outlined),
                    contentPadding: EdgeInsets.only(left: 60),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Finance"),
                    trailing: Icon(Icons.arrow_drop_down_outlined),
                    contentPadding: EdgeInsets.only(left: 60),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    contentPadding: EdgeInsets.only(left: 50),
                  ),
                ],
              ),
            ]),
          ),
          mainpage()
        ],
      ),
    );
  }

  Widget mainpage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Wrap(
            direction: MediaQuery.of(context).size.width > 600
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      height: 230,
                      width: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.60
                          : MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 153, 0, 255),
                                Color.fromARGB(255, 158, 79, 113)
                              ],
                              tileMode: TileMode.decal,
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                          image: DecorationImage(
                              alignment: Alignment.centerRight,
                              image: NetworkImage(
                                  'https://adstacks.in/wp-content/uploads/2020/05/landing_img_04.png'))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ethirium 2.0",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "Top Rating \nProject",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            "Trending project and high rating \nproject Created by team",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(147, 0, 0, 0))),
                              onPressed: () {},
                              child: const Text(
                                "Learn More.",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Wrap(
                      direction: MediaQuery.of(context).size.width > 600
                          ? Axis.horizontal
                          : Axis.vertical,
                      spacing: 20,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width > 600
                              ? MediaQuery.of(context).size.width * 0.3
                              : MediaQuery.of(context).size.width,
                          height: 350,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 3, 4, 57),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 10),
                                child: Text(
                                  "All Projects",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemBuilder: (context, index) => Card(
                                          color: index == 0
                                              ? Colors.red
                                              : const Color.fromARGB(
                                                  255, 46, 18, 84),
                                          child: const ListTile(
                                              subtitle: Wrap(
                                                children: [
                                                  Text(
                                                    "Project #1",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "see project details",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            Colors.white),
                                                  )
                                                ],
                                              ),
                                              leading: CircleAvatar(),
                                              title: Text(
                                                "Technology behind the block chain",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                              trailing: Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              )),
                                        ),
                                    itemCount: 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width > 600
                              ? MediaQuery.of(context).size.width * 0.3
                              : MediaQuery.of(context).size.width,
                          height: 350,
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 3, 4, 57),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 10),
                                child: Text(
                                  "Top Creators",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Artwork",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Rating",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) => Card(
                                    child: ListTile(
                                        leading: const CircleAvatar(),
                                        title: const Text("data 349"),
                                        trailing: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            gradient: LinearGradient(
                                              colors: gradient,
                                              stops: stops,
                                              end: Alignment.centerLeft,
                                              begin: Alignment.centerRight,
                                            ),
                                          ),
                                        )),
                                  ),
                                  itemCount: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      height: 250,
                      width: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.59
                          : MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              barWidth: 2,
                              color: Colors.purple,
                              spots: [
                                const FlSpot(2015, 20),
                                const FlSpot(2016, 10),
                                const FlSpot(2017, 10),
                                const FlSpot(2018, 40),
                                const FlSpot(2019, 10),
                                const FlSpot(2020, 40),
                              ],
                              isCurved: true,
                            ),
                            LineChartBarData(
                              barWidth: 2,
                              color: const Color.fromARGB(255, 229, 65, 19),
                              spots: [
                                const FlSpot(2015, 30),
                                const FlSpot(2016, 5),
                                const FlSpot(2017, 10),
                                const FlSpot(2018, 40),
                                const FlSpot(2019, 10),
                                const FlSpot(2020, 50),
                              ],
                              isCurved: true,
                            )
                          ],
                          backgroundColor: Colors.white,
                          minX: 2015,
                          maxX: 2020,
                          minY: 0,
                          gridData: const FlGridData(
                            show: false,
                          ),
                          titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  interval: 1,
                                  showTitles: true,
                                  getTitlesWidget: bottomTitleWidgets,
                                ),
                              ),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  axisNameSize: 5,
                                  sideTitles: SideTitles(
                                    getTitlesWidget: (value, meta) {
                                      double text;

                                      switch (value.toInt()) {
                                        case 0:
                                          text = 0;
                                          break;
                                        case 1:
                                          text = 10;
                                          break;
                                        case 2:
                                          text = 20;
                                          break;
                                        case 3:
                                          text = 30;
                                          break;
                                        case 4:
                                          text = 40;
                                          break;
                                        case 5:
                                          text = 50;
                                          break;

                                        default:
                                          return Container();
                                      }
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        child: Text(
                                          text.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 152, 7, 255),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ))),
                          maxY: 50,
                        ),
                        curve: Curves.bounceInOut,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 90),
                width: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 3, 4, 57),
                child: Wrap(
                  direction: MediaQuery.of(context).size.width > 600
                      ? Axis.vertical
                      : Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "GENERAL 10:00 AM TO 7:00 PM",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value for more or less rounding
                        color: Colors.white,
                      ),
                      child: TableCalendar(
                        daysOfWeekHeight: 20,
                        rowHeight: 30,
                        focusedDay: DateTime.now(),
                        firstDay:
                            DateTime.now().subtract(const Duration(days: 365)),
                        lastDay: DateTime.now().add(const Duration(days: 365)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 240,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color.fromARGB(255, 38, 31, 47)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Today Birthday",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 32,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 32,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 187, 135, 232),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  width: 1,
                                  height: 23,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  width: 1,
                                  height: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width > 600
                                ? MediaQuery.of(context).size.width * 0.12
                                : MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 171, 96, 237))),
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "  Birthday Wishes",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, bottom: 40),
                      height: 250,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color.fromARGB(255, 38, 31, 47)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Today Birthday",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 32,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 32,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 187, 135, 232),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  width: 1,
                                  height: 23,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  width: 1,
                                  height: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width > 600
                                ? MediaQuery.of(context).size.width * 0.12
                                : MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 171, 96, 237))),
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "  Birthday Wishes",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
