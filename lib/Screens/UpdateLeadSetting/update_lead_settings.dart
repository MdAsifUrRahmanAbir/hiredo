import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/ProfileScreen/profile.dart';

class UpdateLeadSettings extends StatelessWidget {
  static const String routename = '/updateleadsettings';
  const UpdateLeadSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Lead settings',
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
          leading: IconButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, Profile.routename);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF187949),
              )),
          centerTitle: true,
          actions: [Image.asset('images/notification.png')],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          children: [
            Text(
              'Leads you can choose to contact.',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF187949)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Your services',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Fine tune the leads you want to be alerted about.',
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            const SizedBox(
              height: 25,
            ),
            itemListTile(
                title: 'Wedding Photography',
                subTitle: 'All leads',
                location: '1 location'),
            const SizedBox(
              height: 30,
            ),
            itemListTile(
                title: 'Web Design',
                subTitle: 'All leads',
                location: '1 location'),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 57,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF187949))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF187949),
                      )),
                  Text(
                    'Add a Service',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF187949)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Your locations',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Choose where you want to find new customers.',
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset('images/location.png'),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4517 Washington',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF272727))),
                    Text('20 miles of K0A 0A1',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF424242))),
                  ],
                ),
                const SizedBox(
                  width: 150,
                ),
                Image.asset('images/edit.png'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 57,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF187949))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF187949),
                      )),
                  Text(
                    'Add a New Location',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF187949)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Online/remote leads',
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF424242)),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Customers tell us if they’re happy to receive services online or remotely.",
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF187949),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  'Save',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF2F2F2)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget itemListTile(
      {required String title,
      required String subTitle,
      required String location}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 14,
            color: const Color(0xFF272727),
            fontWeight: FontWeight.w400),
      ),
      subtitle: Row(
        children: [
          Text(
            subTitle,
            style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 4,
            width: 4,
            color: const Color(0xFF272727),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            location,
            style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_back_ios,
        color: Color(0xFF272727),
        size: 15,
      ),
    );
  }
}
