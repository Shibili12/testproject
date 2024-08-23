import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/travel%20log/bloc/travellog_bloc.dart';
import 'package:testproject/travel%20log/model/data.dart';
import 'package:testproject/travel%20log/model/travellogmodel.dart';
import 'package:testproject/travel%20log/root.dart';

class TravelLog extends StatefulWidget {
  TravelLog({super.key});

  @override
  State<TravelLog> createState() => _TravelLogState();
}

class _TravelLogState extends State<TravelLog> {
  late List<TravelLogModel> travelLogs;
  @override
  void initState() {
    context.read<TravellogBloc>().add(GetTravellogs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.indigo[400],
          leading: const Icon(Icons.arrow_back),
          title: const Text("ABC signature"),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 45),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2 * .86,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: .5, color: Colors.white),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Row(
                              children: [
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  "Vishnu",
                                  style: TextStyle(color: Colors.white),
                                ))),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 * .86,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: .5, color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Center(
                                      child: Text(
                                "20 AUG",
                                style: TextStyle(color: Colors.white),
                              ))),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ))),
      body:
          BlocBuilder<TravellogBloc, TravellogState>(builder: (context, state) {
        switch (state.runtimeType) {
          case Travellogloading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case TravellogLoaded:
            final newstate = state as TravellogLoaded;
            return ListView.builder(
                itemCount: newstate.travellogs.length,
                itemBuilder: (context, index) {
                  return CustomPaint(
                    size: const Size(double.infinity, 160),
                    painter: CombinedPainter(
                        possition: index % 2,
                        startTime: newstate.travellogs[index].startTime,
                        endTime: newstate.travellogs[index].endTime),
                    child: _Buildlogdetails(newstate.travellogs[index]),
                  );
                });
          default:
            return const SizedBox();
        }
      }),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: travelLogs.asMap().entries.map((entry) {
      //       int index = entry.key;
      //       TravelLogModel log = entry.value;
      //       return CustomPaint(
      //         size: const Size(double.infinity, 160),
      //         painter: CombinedPainter(
      //             possition: index % 2,
      //             startTime: log.startTime,
      //             endTime: log.endTime),
      //         child: _Buildlogdetails(log),
      //       );
      //     }).toList(),
      //   ),
      // ),
    );
  }

  Widget _Buildlogdetails(TravelLogModel log) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              log.log,
              style: TextStyle(
                color: Colors.indigo[400],
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              log.logId,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(width: .2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        log.phone,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(),
                        const Icon(
                          Icons.battery_charging_full,
                          color: Colors.green,
                          size: 10,
                        ),
                        Text(
                          log.battery,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
