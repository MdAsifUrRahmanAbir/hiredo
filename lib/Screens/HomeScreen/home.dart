// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Screens/CategoriesScreen/categories.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';
import 'package:myapp/Screens/FavoriteScreen/favourite.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';
import 'package:myapp/Screens/LocationScreen/locationpage.dart';

class Home extends StatefulWidget {
  static const String routename = '/homepage';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int search = 0;

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  List<String> _carouselImages = [
    "https://www.colorhexa.com/c8ced9.png",
    "https://www.colorhexa.com/c8ced9.png",
    "https://www.colorhexa.com/c8ced9.png"
  ];
  var _dotPosition = 0;
  bool changed = false;
  String _selectedGender = 'Top Categories';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: changed
              ? Text('')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover",
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Color(0xff2E2E2E)),
                    ),
                    Text(
                      "Find the best one",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                          color: Color(0xff2E2E2E)),
                    ),
                  ],
                ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: changed
                    ? EdgeInsets.only(left: 20, right: 20, top: 0)
                    : EdgeInsets.only(left: 20, right: 20, top: 20),
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
                              onTap: () {
                                pages[0] = SearchResult();
                                Navigator.pushReplacementNamed(
                                    context, BottomNavController.routename);
                              },
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
                              onTap: () {
                                pages[0] = LocationPage();
                                Navigator.pushReplacementNamed(
                                    context, BottomNavController.routename);
                              },
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
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 230,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 3,
                              child: CarouselSlider(
                                  items: _carouselImages
                                      .map((item) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3, right: 3),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(item),
                                                      fit: BoxFit.fitWidth)),
                                            ),
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                      viewportFraction: 1.2,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      onPageChanged:
                                          (val, carouselPageChangedReason) {
                                        setState(() {
                                          _dotPosition = val;
                                        });
                                      })),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 5,
                              child: DotsIndicator(
                                dotsCount: _carouselImages.length == 0
                                    ? 1
                                    : _carouselImages.length,
                                position: _dotPosition.toDouble(),
                                decorator: DotsDecorator(
                                  activeColor: Color(0xff187949),
                                  color: Color(0xff174E31),
                                  spacing: EdgeInsets.all(2),
                                  activeSize: Size(8, 8),
                                  size: Size(6, 6),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 20,
                                left: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "order any service,Anytime",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff555957)),
                                    ),
                                    Text(
                                      "We Provide High Quality",
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff555957),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Professional",
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff555957),
                                          ),
                                        ),
                                        Text(
                                          " Service",
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff187949),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Positioned(
                                left: 310,
                                top: 5,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                )),
                            Positioned(
                                left: 240,
                                top: 15,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                )),
                            Positioned(
                                left: 275,
                                top: 30,
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Our Categories",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff555957),
                                    letterSpacing: 1),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    pages[0] = CategoriesPage();
                                  });
                                  Navigator.pushReplacementNamed(
                                      context, BottomNavController.routename);
                                },
                                child: Text(
                                  "See All",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff187949),
                                      letterSpacing: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffD9F1E5),
                                    radius: 25,
                                    child: Icon(
                                      Icons.face,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Cleaning",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff555957),
                                        letterSpacing: 1),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fetured Service",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff555957),
                                    letterSpacing: 1),
                              ),
                              Text(
                                "See All",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff187949),
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              itemContainer(),
                              itemContainer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemContainer() {
    return Container(
      height: 240,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 111,
                width: 161,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    'images/servImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.favorite_border,
                    color: Color(0xFF187949),
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text('Commercial cleaning \nby expertise',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Color(0xFF272727),
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            '200+ Company work',
            style: GoogleFonts.roboto(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF848484)),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 30,
            width: 84,
            decoration: BoxDecoration(
                color: Color(0xFF187949),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                'Post a Job',
                style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
