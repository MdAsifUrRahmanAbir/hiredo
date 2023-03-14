import 'package:flutter/material.dart';
import 'package:myapp/Screens/ReviewScreen/reviews_page.dart';

class SettingsPage extends StatefulWidget {
  static const String routename = '/settings';

  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map> myProfile = [
    {'icon': Icons.person_outline, 'title': 'My Profile'},
    {'icon': Icons.reviews_outlined, 'title': 'Reviews'},
    {'icon': Icons.badge, 'title': 'Elite pro'},
    {'icon': Icons.baby_changing_station, 'title': 'Badges'},
    {'icon': Icons.details, 'title': 'Account Details'},
  ];

  List<Map> communications = [
    {'icon': Icons.ads_click, 'title': 'One Click Responce'},
    {'icon': Icons.email, 'title': 'Email Templates'},
    {'icon': Icons.sms, 'title': 'SMS Templates'},
  ];

  List<Map> credits = [
    {'icon': Icons.credit_score, 'title': 'My Credits'},
    {
      'icon': Icons.directions_boat_filled_outlined,
      'title': 'Invoices and billing details'
    },
    {'icon': Icons.payment, 'title': 'My payment details'},
  ];

  List<Map> intergrations = [
    {'icon': Icons.email, 'title': 'Email'},
    {'icon': Icons.open_in_browser, 'title': 'Browser'},
  ];

  List pages = [
    Container(),
    ReviewsPage(),
    Container(),
    Container(),
    Container()
  ];
  int pageIndex = 0;
  var seletced = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'Settings',
          style: myStyle(20, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile',
                style: myStyle(18, FontWeight.bold, Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                seletced = index;
                                pageIndex = seletced;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => pages[pageIndex]));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(myProfile[index]['icon']),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    myProfile[index]['title'],
                                    style: myStyle(
                                        16, FontWeight.w500, Colors.black),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: myProfile.length)),
              SizedBox(
                height: 30,
              ),
              Text(
                'Communication',
                style: myStyle(18, FontWeight.bold, Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(communications[index]['icon']),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  communications[index]['title'],
                                  style: myStyle(
                                      16, FontWeight.w500, Colors.black),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: communications.length)),
              SizedBox(
                height: 30,
              ),
              Text(
                'Credits & Payments',
                style: myStyle(18, FontWeight.bold, Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(credits[index]['icon']),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  credits[index]['title'],
                                  style: myStyle(
                                      16, FontWeight.w500, Colors.black),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: credits.length)),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Intergrations',
                style: myStyle(18, FontWeight.bold, Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(intergrations[index]['icon']),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  intergrations[index]['title'],
                                  style: myStyle(
                                      16, FontWeight.w500, Colors.black),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: intergrations.length)),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: Text('Save'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDF2929)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}
