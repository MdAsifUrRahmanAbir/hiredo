// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, avoid_unnecessary_containers

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';
import 'package:myapp/utils/colors.dart';

class CategoriesPage extends StatefulWidget {
  static const String routename = '/categorypage';
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final List<String> items = [
    'All Categories',
    'Most Popular',
    'Sub Categories',
  ];
  String? selectedValue;
  String selectedcat = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(
              //     context, BottomNavController.routename);
              Get.back();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xff187949),
            )),
        title: Text(
          "Category",
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 1, 20, 1),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/img2.png"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Sub Categories',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  color: Color(0xffF2F2F2),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                onTap: () {
                                  setState(() {
                                    selectedcat = item;
                                  });
                                },
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    color: Color(0xffF2F2F2),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Color(0xffF2F2F2),
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 36,
                      buttonWidth: 207,
                      buttonPadding: EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff187949),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff187949),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(4),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: Offset(-20, 0),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xff187949)),
                    child: Center(
                      child: Text(
                        "Filter",
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffF2F2F2),
                            letterSpacing: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.green)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintText: "Search ",
                              hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: Color(0xffB7B7B7)),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: locationController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintText: "Location",
                              prefix: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: Color(0xffB7B7B7)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Color(0xff187949),
                          height: 50,
                          width: 45,
                          child: Icon(
                            Icons.search,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 6,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                        color: Color(0xffFFFFFF),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 94,
                        width: 376,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Color(0xffE8F2ED),
                              child: Icon(
                                Icons.face,
                                color: Color(0xff187949),
                              ),
                            ),
                            title: Text(
                              "Business",
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff187949)),
                            ),
                            subtitle: Text(
                              selectedcat == 'Sub Categories'
                                  ? "100+ sub categories"
                                  : "100+ sub categories \n 400+ company work",
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242)),
                            ),
                            trailing: Wrap(
                              //spacing: 10,
                              alignment: WrapAlignment.center,
                              children: [
                                selectedcat == 'Sub Categories'
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: themeColorGreen,
                                        ))
                                    : Text(''),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: themeColorGreen,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            3), // <-- Radius
                                      ),
                                    ),
                                    child: Text(
                                      selectedcat == 'Sub Categories'
                                          ? "Survices"
                                          : "view",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF),
                                          letterSpacing: 1),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
    ));
  }
}
