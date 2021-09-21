import 'package:flutter/material.dart';
import 'package:shop_app_abdullah_mansour/modules/login_screen/login_screen.dart';
import 'package:shop_app_abdullah_mansour/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingData {
  String image;
  String title;
  String body;
  OnBoardingData({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  static bool isChange = false;
  final PageController controller = PageController();
  final List<OnBoardingData> onBoardingDataList = [
    OnBoardingData(
        image:
            "https://images.unsplash.com/photo-1445205170230-053b83016050?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFzaGlvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
        title: "Title1",
        body: "body1"),
    OnBoardingData(
        image:
            "https://c1.wallpaperflare.com/preview/883/776/931/women-s-clothing-gerderobe-dresses-garment-racks.jpg",
        title: "Title2",
        body: "body2"),
    OnBoardingData(
        image:
            "https://media.gettyimages.com/photos/interior-of-a-modern-menswear-shop-picture-id1042696216?s=612x612",
        title: "Title3",
        body: "body3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          defaultTextButton(
              text: "SKIP",
              function: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.black45)),
                      child: Image(
                          image: NetworkImage(onBoardingDataList[index].image)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      onBoardingDataList[index].title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      onBoardingDataList[index].body,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              onPageChanged: (value) {
           if (value == onBoardingDataList.length - 1) {
             isChange=true;
             }else{
             isChange=false;
           }
            } ,
              itemCount: 3,
              physics: BouncingScrollPhysics(),
              controller: controller,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: onBoardingDataList.length,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.blue,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 5,
              radius: 5,
              spacing: 5,
            ),
          ),  SizedBox(
            height: 30,
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.nextPage(duration: Duration(seconds: 2), curve: Curves.bounceOut);
          if (isChange==true) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
            return print("done");
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

