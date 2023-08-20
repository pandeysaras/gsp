import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';
import 'package:gujarati_samaj_paris/view_model/events_view_model.dart';
import 'package:gujarati_samaj_paris/widgets/event_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../utils/color_constant.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){

      context.read<EventsViewModel>().fetchEventsAPi();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Events'),
        foregroundColor: ColorConstant.whiteColor,
        backgroundColor: ColorConstant.defaultColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ListTile(
            //   title: Text('My Events'),
            //   trailing: IconButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, RoutesName.myEventScreen);
            //       },
            //       icon: Icon(Icons.arrow_forward_outlined)),
            // ),
            SizedBox(height: 20,),
            Consumer<EventsViewModel>(builder: (context, value, _) {
              switch (value.eventsList.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  return Center(
                    child: Text('Sorry for the inconvenience!'),
                  );
                case Status.completed:
                  return Expanded(
                    child: ListView.builder(
                        itemCount: value.eventsList.data!.data!.length,
                        itemBuilder: (context, index) {
                              return EventWidget(
                            width: mediaQuery.width * 0.95,
                            text1: DateFormat('d').format(DateTime.parse(value.eventsList.data!.data![index].festDate.toString())).toString() + " "+
                                DateFormat('MMM').format(DateTime.parse(value.eventsList.data!.data![index].festDate.toString())).toString() + " "+
                                DateFormat('y').format(DateTime.parse(value.eventsList.data!.data![index].festDate.toString())).toString() + " ",
                            text2: DateFormat('EEEE').format(DateTime.parse(value.eventsList.data!.data![index].festDate.toString())),
                            height1: 150,
                            height2: 40,
                            title: value.eventsList.data!.data![index].festiName.toString(),
                            height3: 30,
                            textStyle1: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            textStyle2: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xffA5DEFF))),
                          );
                        }),
                  );

                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
