import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/EmailNotification/Model/email_model.dart';

class EmailNotification extends StatefulWidget {
  const EmailNotification({super.key});

  @override
  State<EmailNotification> createState() => _EmailNotificationState();
}

class _EmailNotificationState extends State<EmailNotification> {
  bool isSwitch = false;

  List<EmailModel> items = [
    EmailModel(title: 'New leads I receive'),
    EmailModel(title: "Customers closing leads I've responded to"),
    EmailModel(title: 'Customers dismissing my response'),
    EmailModel(title: 'Customers hiring me'),
    EmailModel(title: 'Customers reading a message I sent'),
    EmailModel(title: 'Customers requesting a call from me'),
    EmailModel(title: 'Customers dismissing my response'),
    EmailModel(title: 'Customers requesting me to contact them'),
    EmailModel(title: 'Customers viewing my profile'),
    EmailModel(title: 'Customers viewing my website'),
    EmailModel(title: 'Customers viewing contact details on my profile'),
    EmailModel(title: "A summary of leads I'm matched to each day"),
    EmailModel(title: 'Customers sending me a message'),
    EmailModel(title: 'New reviews on my profile'),
    EmailModel(title: 'New reviews from other sources'),
    EmailModel(title: 'Services similar to mine I can get more leads from'),
    EmailModel(title: 'Promotional emails'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        actions: [Image.asset('images/notification.png')],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Email notifications',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFF9F9FA)),
                child: Row(
                  children: [
                    Image.asset('images/mark.png'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Control what youd like us to email you about. Not getting our e-mails? ',
                          style: GoogleFonts.roboto(fontSize: 16.sp),
                          children: const [
                            TextSpan(
                                text: 'Click Here',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Email me about:',
                style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6E6874)),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        items[index].title,
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF272727)),
                      ),
                      trailing: Switch(
                          onChanged: (value) {
                            setState(() {
                              items[index].isSwitched = value;
                            });
                          },
                          value: items[index].isSwitched,
                          activeColor: Colors.white,
                          activeTrackColor: const Color(0xFF47BF9C),
                          inactiveThumbColor: Colors.pink,
                          inactiveTrackColor: Colors.green));
                },
                itemCount: items.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                  ),
                  Text(
                    'Cancel',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF272727)),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 45.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFF187949),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/tick_mark.png'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Save',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
