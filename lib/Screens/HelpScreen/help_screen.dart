import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Map> popularItem = [
    {
      "title": "What is Ringknock  and how does it work?",
    },
    {
      "title": "What are Credit Pack Subscriptions?",
    },
    {
      "title": "How many responses can a customer receive?",
    },
    {
      "title": "What’s Elite Pro and what’s included?",
    },
    {
      "title": "Refer a friend!",
    },
  ];

  List<Map> guidesItem = [
    {
      "title": "Welcome to Ringknock ",
    },
    {
      "title": "Getting Started",
    },
    {
      "title": "How Ringknock works for professionals",
    },
    {
      "title": "Personalising your One-Click Response",
    },
    {
      "title": "How to use Email Templates",
    },
    {
      "title": "How does Ringknock Connect work?",
    },
    {
      "title": "How to use SMS templates?",
    },
    {
      "title": "How to use Ringknock: Everything you need to knowemplates",
    },
  ];

  List<Map> topicItem = [
    {
      "title": "Profile",
    },
    {
      "title": "How to get hired",
    },
    {
      "title": "For Customers",
    },
    {
      "title": "Managing Responses",
    },
    {
      "title": "Lead Preferences",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Help',
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
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'FAQs',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF187949)),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Colors.white,
                    suffixIcon: Container(
                      height: 50,
                      width: 52,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.3),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Popular',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                itemCount: popularItem.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            popularItem[index]['title'],
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF424242)),
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: const Color(0xFF848484).withOpacity(0.05),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Guides',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                itemCount: guidesItem.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              guidesItem[index]['title'],
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF424242),
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: const Color(0xFF848484).withOpacity(0.05),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Topics',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                itemCount: topicItem.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              topicItem[index]['title'],
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF424242),
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: const Color(0xFF848484).withOpacity(0.05),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Still need help?',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Drop us an email and we’ll get you back up and running.',
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF424242)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email*',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF555957)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Message',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF555957)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Message',
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF187949),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    'Send',
                    style: GoogleFonts.roboto(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
