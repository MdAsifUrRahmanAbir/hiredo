// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, avoid_unnecessary_containers

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/CategoriesScreen/subcategory.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/nav_bar_page/main_controller.dart';
import 'package:myapp/utils/colors.dart';

import '../HomeScreen/Model/lead_category_model.dart';

class CategoriesPage extends StatefulWidget {
  static const String routename = '/categorypage';
   CategoriesPage({super.key,required this.allCategories});
  List<LeadCategoriesModel> allCategories;

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
    //'Sub Categories',
  ];
  String? selectedValue;
  String selectedcat = '';

  String sortBy = "All Category";
  List<String> list = <String>['All Category', "Most Popular"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25.sp,
          color: Color(0xff187949),
        )),
    title: Text(
      "Category",
      style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff272727)),
    ),
    // actions: [
    //   Padding(
    //     padding: const EdgeInsets.fromLTRB(1, 1, 20, 1),
    //     child: InkWell(
    //       onTap: () {},
    //       child: Container(
    //         height: 40.h,
    //         width: 40.w,
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage("images/img2.png"),
    //                 fit: BoxFit.cover),
    //             shape: BoxShape.circle),
    //       ),
    //     ),
    //   )
    // ],
    automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        physics:BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // <----------------- all category  dropdown ------------>

        Padding(
          padding: EdgeInsets.all(18.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 36.h,
                width: 207.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: themeColorGreen),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: themeColorGreen,
                    elevation: 0,
                    value: sortBy,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 14.sp,
                      color: scaffoldClr,
                    ),
                    style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        sortBy = value!;
                      });
                    },
                    items:
                        list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 36.h,
                width: 68.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: Color(0xff187949)),
                child: Center(
                  child: Text(
                    "Filter",
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF2F2F2),
                        letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
        
        
        // <----------------- search bar ------------>
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Colors.green)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: "Search ",
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              color: Color(0xffB7B7B7)),
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 20.w,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 120.w,
                    child: Container(
                      padding: EdgeInsets.all(5.r),
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
                              size: 20.sp,
                            ),
                          ),
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 16.sp,
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
                      height: 50.h,
                      width: 45.w,
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
          height: 20.h,
        ),

// <----------------- all Categoris ------------>

        ListView.separated(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
              LeadCategoriesModel data =widget.allCategories[index];

              return Container(
                  
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1879490d).withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius:0,

                      )
                    ]
                  ),
                  margin: EdgeInsets.symmetric( horizontal:10.w),
                  height: 94.h,
                  width: 376.w,
                  padding: EdgeInsets.symmetric(horizontal: 14.sp,vertical: 14.sp),
                  child: Row(
                    children: [
                      data.image==null? CircleAvatar(
                      maxRadius: 35.r,
                      backgroundColor: Color(0xffE8F2ED),
                      child: Icon(
                        Icons.face,
                        color: Color(0xff187949),
                      ),
                    ):CircleAvatar(
                      maxRadius: 35.r,
                      backgroundColor: Color(0xffE8F2ED),
                      backgroundImage: NetworkImage(data.image!),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      data.name,
                     
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          
                          color: Color(0xff187949)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                    ),
                    Text(
                      "${data.children.length.toString()}${ data.children.isEmpty?"":"+"}  Sub categories",
                       style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff424242)),
                    ),

                      ],
                    )),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SubCategoryPage(categorieName:data.name,allSubCategories:data.children,)));
                      },
                      child: Container(
                        height: 34.h,
                        width: 67.w,
                       alignment: Alignment.center,
                        decoration: BoxDecoration(
                           color:themeColorGreen,
                          borderRadius: BorderRadius.circular(3.r)
                        ),
                        child: Text(
                                "view",
                                style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                    letterSpacing: 1),
                              ) ,),
                    )

                        


                    ],
                  ),
                  // child: ListTile(
                  //   dense: true,
                  //   minVerticalPadding: 0,
                  //   horizontalTitleGap: 0,
                  //   minLeadingWidth: 0,
                  //  contentPadding: EdgeInsets.symmetric(horizontal:16.w),
                  //   visualDensity: VisualDensity(horizontal:0,vertical:-4),

                  //   leading:data.image.isEmpty? CircleAvatar(
                  //     maxRadius: 35.r,
                  //     backgroundColor: Color(0xffE8F2ED),
                  //     child: Icon(
                  //       Icons.face,
                  //       color: Color(0xff187949),
                  //     ),
                  //   ):CircleAvatar(
                  //     maxRadius: 35.r,
                  //     backgroundColor: Color(0xffE8F2ED),
                  //     backgroundImage: NetworkImage(data.image),
                  //   ),
                  //   title: Text(
                  //     data.name,
                     
                  //     style: GoogleFonts.roboto(
                  //         fontSize: 18.sp,
                  //         fontWeight: FontWeight.w500,
                          
                  //         color: Color(0xff187949)),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //   ),
                  //   subtitle:Text(
                  //     "${data.children.length.toString()}${ data.children.isEmpty?"":"+"}  Sub categories",
                  //      style: GoogleFonts.roboto(
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w400,
                  //             color: Color(0xff424242)),
                  //   ),

                  //   trailing:Container(
                  //     height: 34.h,
                  //     width: 67.w,
                  //    alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //        color:themeColorGreen,
                  //       borderRadius: BorderRadius.circular(3.r)
                  //     ),
                  //     child: Text(
                  //             "view",
                  //             style: GoogleFonts.roboto(
                  //                 fontSize: 16.sp,
                  //                 fontWeight: FontWeight.w500,
                  //                 color: Color(0xffFFFFFF),
                  //                 letterSpacing: 1),
                  //           ) ,
                  //   ) ,
                  //   // trailing: Wrap(
                  //   //   //spacing: 10,
                  //   //   alignment: WrapAlignment.center,
                  //   //   children: [
                  //   //     selectedcat == 'Sub Categories'
                  //   //         ? IconButton(
                  //   //             onPressed: () {},
                  //   //             icon: Icon(
                  //   //               Icons.favorite_border,
                  //   //               color: themeColorGreen,
                  //   //             ))
                  //   //         :SizedBox(),
                  //   //     ElevatedButton(
                  //   //         onPressed: () {},
                  //   //         style: ElevatedButton.styleFrom(
                  //   //           primary: themeColorGreen,
                  //   //           shape: RoundedRectangleBorder(
                  //   //             borderRadius: BorderRadius.circular(
                  //   //                 3.r), // <-- Radius
                  //   //           ),
                  //   //         ),
                  //   //         child: Text(
                  //   //           selectedcat == 'Sub Categories'
                  //   //               ? "Survices"
                  //   //               : "view",
                  //   //           style: GoogleFonts.roboto(
                  //   //               fontSize: 16.sp,
                  //   //               fontWeight: FontWeight.w500,
                  //   //               color: Color(0xffFFFFFF),
                  //   //               letterSpacing: 1),
                  //   //         ))
                  //   //   ],
                  //   // ),
                  // ),
              
              
              
                );
        
            } ,
        
        
            separatorBuilder: (_, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount:widget.allCategories.length)
      ],
    ),
      ),
    );
  }
}
