import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({Key? key}) : super(key: key);

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {


  List<Map> downloads = [
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice And Billing',
                style: myStyle(20, FontWeight.w500, Colors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                color: containerClr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: themeColorGreenbright,
                      size: 27,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: RichText(
                            text: TextSpan(
                                text:
                                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet',
                                style: myStyle(14, FontWeight.w400, textClr),
                                children: <TextSpan>[
                              TextSpan(
                                  text: '\nMy Profile',
                                  style: myStyle(
                                      14, FontWeight.w400, themeColorGreen))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1, color: offWhite.withOpacity(0.3),),
              SizedBox(height: 20,),
              Text(
                'Billing Details',
                style: myStyle(16, FontWeight.w500, textClr),
              ),
              Text(
                'Your business address for billing & invoicing',
                style: myStyle(14, FontWeight.w400, textClr),
              ),
              SizedBox(height: 20,),
              Text(
                'Contact name',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555957)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: themeColorGreen.withOpacity(0.1),
                    //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Build Wright'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Address line 1',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555957)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: themeColorGreen.withOpacity(0.1),
                    //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '2464 Royal Ln. Jersey 45463'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Address line 2',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555957)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: themeColorGreen.withOpacity(0.1),
                    //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '2464 Royal Ln. Jersey 45463'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff555957)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: themeColorGreen.withOpacity(0.1),
                            //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Oshawa'),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Postal Code',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff555957)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: themeColorGreen.withOpacity(0.1),
                            //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'L1K0B5'),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Phone Number',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555957)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: themeColorGreen.withOpacity(0.1),
                    //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '01888888888'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Address line 2',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555957)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: themeColorGreen.withOpacity(0.1),
                    //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '01888888888'),
              ),
              SizedBox(height: 20,),
              Divider(thickness: 1, color: offWhite.withOpacity(0.3),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(8),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), color: textformback),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Invoice#',
                      style: myStyle(14, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Date',
                      style: myStyle(14, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Total',
                      style: myStyle(14, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Invoice',
                      style: myStyle(14, FontWeight.w500, textClr),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: downloads[index]['color']
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          downloads[index]['invoice'],
                          style: myStyle(12, FontWeight.w400, offWhite),
                        ),
                        Text(
                          downloads[index]['date'],
                          style: myStyle(12, FontWeight.w400, offWhite),
                        ),
                        Text(
                          downloads[index]['total'],
                          style: myStyle(12, FontWeight.w400, offWhite),
                        ),
                       Container(
                         alignment: Alignment.center,
                         height: 30,
                         width: 82,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(4),
                           color: themeColorGreen
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Icon(Icons.arrow_circle_down, color: scaffoldClr, size: 12,),
                             Text('Download',style: myStyle(12, FontWeight.w400, scaffoldClr),)
                           ],
                         ),
                       )
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 0,
                  ),
                  itemCount: downloads.length),
            ],
          ),
        ),
      ),
    );
  }
}
