import 'package:flutter/material.dart';
import 'package:travelveapp/travelcard.dart';
import 'package:travelveapp/upload.dart';

class BookPackagePage extends StatefulWidget {
  const BookPackagePage({super.key});

  @override
  State<BookPackagePage> createState() => _BookPackagePageState();
}

class _BookPackagePageState extends State<BookPackagePage> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list
  List<String> urls = [
    "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
    "https://lh3.googleusercontent.com/proxy/wTkD1USQGpbVXzZFNLCZBDCL1OQS1bFzSgPa44cHwiheaY9DpoqMdNjBgEJcCIZSQeSkCO-2q5gfuhtnuz4cDhtpansOcWos093YsGvogdQqWnpWlA",
    "https://images.squarespace-cdn.com/content/v1/57d5245815d5db80eadeef3b/1558864684068-1CX3SZ0SFYZA1DFJSCYD/ke17ZwdGBToddI8pDm48kIpXjvpiLxnd0TWe793Q1fcUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcZwk0euuUA52dtKj-h3u7rSTnusqQy-ueHttlzqk_avnQ5Fuy2HU38XIezBtUAeHK/Marataba+Safari+lodge",
    "https://lh3.googleusercontent.com/proxy/ovCSxeucYYoir_rZdSYq8FfCHPeot49lbYqlk7nXs7sXjqAfbZ2uw_1E9iivLT85LwIZiGSnXuqkdbQ_xKFhd91M7Y05G94d",
    "https://q-xx.bstatic.com/xdata/images/hotel/max500/216968639.jpg?k=a65c7ca7141416ffec244cbc1175bf3bae188d1b4919d5fb294fab5ec8ee2fd2&o=",
    "https://hubinstitute.com/sites/default/files/styles/1200x500_crop/public/2018-06/photo-1439130490301-25e322d88054.jpeg?h=f720410d&itok=HI5-oD_g",
    "https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg",
    "https://www.shieldsgazette.com/images-i.jpimedia.uk/imagefetch/https://jpgreatcontent.co.uk/wp-content/uploads/2020/04/spain.jpg",
    "https://www.telegraph.co.uk/content/dam/Travel/2017/November/tunisia-sidi-bou-GettyImages-575664325.jpg",
    "https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg"
  ];
  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(178, 172, 136, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            Text(
              "Welcome User,",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Pick your destination",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color.fromRGBO(178, 172, 136, 1),
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Color.fromRGBO(178, 172, 136, 1),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Trending",
                        ),
                        Tab(
                          text: "Promotion",
                        ),
                        Tab(
                          text: "Favorites",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Now let's add and test our first card
                                travelCard(context, urls[0], "Luxary Hotel",
                                    "Caroline", '\$100 / day', 3),
                                travelCard(context, urls[7], "Plaza Hotel",
                                    "Italy", '\$250 / day', 4),
                                travelCard(context, urls[2], "Safari Hotel",
                                    "Africa", '\$400 / day', 5),
                                travelCard(context, urls[7], "Deluxe Hotel",
                                    "Caroline", '\$100 / day', 3),
                                travelCard(context, urls[4], "Plaza Hotel",
                                    "Italy", '\$250 / day', 4),
                                travelCard(context, urls[5], "Sara Hotel",
                                    "Africa", '\$400 / day', 5),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Here you can add what ever you want
                                travelCard(context, urls[6], "Visit Rome",
                                    "Italy", '\$250 / day', 4),
                                travelCard(
                                    context,
                                    urls[8],
                                    "Visit Sidi bou Said",
                                    "Tunsia",
                                    '\$250 / day',
                                    4),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                travelCard(context, urls[6], "Visit Rome",
                                    "Italy", '\$250 / day', 4),
                                travelCard(
                                    context,
                                    urls[8],
                                    "Visit Sidi bou Said",
                                    "Tunsia",
                                    '\$250 / day',
                                    4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Upload your Medical Documents:',style: TextStyle(color: Colors.grey,fontSize: 20, ),),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(178, 172, 136, 1),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UploadPage()),
                      );
                    },
                    child: Text('Upload Now!'),
                  ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
