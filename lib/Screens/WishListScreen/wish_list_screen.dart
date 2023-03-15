import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final List<Map<String, dynamic>> item = [
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        title: Text(
          'Wishlist',
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF272727)),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/kumar.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sub Category',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF272727)),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 86,
                    width: double.infinity,
                    color: Color(0xFFFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xFFE8F2ED),
                            child: Image.asset('images/housecleaner.png'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'House Cleaning',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF272727)),
                              ),
                              Text(
                                '100+ Company Work',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF272727)),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Color(0xFF174E31),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF187949)),
                              child: Text('Services'))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Services',
                style: GoogleFonts.roboto(
                    color: const Color(0xFF272727),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 270,
                  ),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item[index]['image'],
                                    height: 112,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    right: 15,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Color(0xFF174E31),
                                        )))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item[index]['title'],
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF272727)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item[index]['subTitle'],
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF848484)),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 40,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF187949),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Text(
                                  'Post a Job',
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 25,
              ),
              Text('Company',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727))),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/clean.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mr. CLEAN',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFEACA23),
                                    ),
                                    Text(
                                      '4.9 (200)',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF424242)),
                                    )
                                  ],
                                ),
                                Text(
                                  'Total 500 work complete',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color(0xFF174E31),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'There are many variations of passages of Lorem Ipsum available.',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF424242)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF187949),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Text(
                                  'Contact',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 171,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF187949)),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Text(
                                  'View Conpany Profile',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
