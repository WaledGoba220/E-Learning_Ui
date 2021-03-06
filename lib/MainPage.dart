import 'package:elearning_ui/CoursePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const mainPage(),
      routes: {
        '/coursePage': (context) => const CoursePage(),
      },
    );
  }
}

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fd),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Hello Developers",
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/image/profilePic.png'))),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'What do you \nwant to \nlearn today?',
              style: TextStyle(
                  fontSize: 35, height: 1.3, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget('Multimedia', 'Animation Course', 'img1',
                              const Color(0xffff6a65), const Color(0xffff5954)),
                          const SizedBox(
                            height: 20,
                          ),
                          courseWidget(
                              'Social Media',
                              'Social Media Monitoring',
                              'img2',
                              const Color(0xffe9eefa),
                              Colors.white),
                        ],
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          courseWidget('Programming', 'Python for everybody',
                              'img3', const Color(0xffe9eefa), Colors.white),
                          const SizedBox(
                            height: 20,
                          ),
                          // ignore: use_full_hex_values_for_flutter_colors
                          courseWidget(
                              'Graphic Design',
                              'Fundamentals of Design',
                              'img4',
                              const Color(0xffbdcddfa),
                              const Color(0xffcedaff)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.subscriptions,
                      color: Color(0xff2657ce),
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: const Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: const Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container courseWidget(String category, String title, String img,
      Color categoryColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        // ignore: unnecessary_const
        borderRadius: const BorderRadius.all(const Radius.circular(30)),
      ),
      child: InkWell(
        // ignore: unnecessary_string_interpolations
        onTap: () {
          openCoursePage('$img', '$title');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                // ignore: unnecessary_const
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
              ),
              // ignore: unnecessary_string_interpolations
              child: Text(
                '$category',
                style: TextStyle(
                    color: (categoryColor == const Color(0xffe9eefa)
                        ? const Color(0xff2657ce)
                        : Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: unnecessary_string_interpolations
            Text(
              '$title',
              style: TextStyle(
                color: (bgColor == const Color(0xffff5954))
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == const Color(0xffff5954))
                      ? Colors.red
                      : const Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == const Color(0xffff5954))
                        ? Colors.white.withOpacity(0.5)
                        : const Color(0xff2657ce).withOpacity(0.5),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
              // ignore: unnecessary_string_interpolations
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/image/$img.png'),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openCoursePage(String img, String title) {
    // ignore: unnecessary_string_interpolations
    Navigator.pushNamed(context, '/coursePage',
        arguments: {'img': '$img', 'title': '$title'});
  }
}
