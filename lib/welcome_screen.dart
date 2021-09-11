// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'models/result_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState

    checkApi();
    super.initState();
  }
  Future<Result?> checkApi()async{
    var url =
    Uri.parse('http://3.1.180.10/api/product-core/suzuki-gsx-r150-fi-dual-channel-abs-yvj2/0/');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
          // print(response.body);
          // var result = jsonDecode(response.body)as Map<String, dynamic>;
          return productFromJson(response.body);
    } else {
      // print('Request failed with status: ${response.statusCode}.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeef3f9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        titleSpacing: 0,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Result?>(
          future: checkApi(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 250.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),

                          child:FancyShimmerImage(
                            imageUrl: snapshot.data!.bannerImage,
                            boxFit: BoxFit.cover,
                            height: 150.h,
                            width: MediaQuery.of(context).size.width,
                            errorWidget: Image.network(
                                'https://i.stack.imgur.com/y9DpT.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem ipsum dolor sit',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                'amet,consectetur adipiscing elit. Non purus,odio ornare nam eleifend amet ',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'BDT ${snapshot.data!.productPrice}',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Color(0xffdd3935),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'BDT 2,000,000',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xffdd3935),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      '50% Off',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              RatingBar.builder(
                                initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                unratedColor: Colors.white,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                itemSize: 18.sp,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Select Color',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        // color: Colors.red,
                                        border: Border.all(color: Colors.black)),
                                    child: Text(
                                      'Black',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    height: 25.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff2c94c),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text(
                                      'Yellow',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    height: 25.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        // color: Colors.red,
                                        border: Border.all(color: Color(0xffdd3935),)),
                                    child: Text(
                                      'Red',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffdd3935),),
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    height: 25.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Colors.red,
                                      border: Border.all(color: Color(0xff408aef),),),
                                    child: Text(
                                      'Blue',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:Color(0xff408aef),),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Information',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.car),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  // text: '${snapshotSubscription.data!['amount']}',
                                    text: 'Sent from ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp)),
                                TextSpan(
                                  text: 'Dhaka ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'will arrive in ',
                                  style:
                                  TextStyle(fontSize: 15.sp, color: Colors.black),
                                ),
                                TextSpan(
                                  text: '7/10',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' workdays',
                                  style:
                                  TextStyle(fontSize: 15.sp, color: Colors.black),
                                ),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Payment Method (Supported)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Bkash',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 250.w,
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.xmark_circle,
                                    color: Color(0xffdd3935),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Cash on Delivery not available',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Bkash',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Bkash',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Bkash',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            childrenPadding: EdgeInsets.only(left: 15.sp),
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Soft-touch Jersy',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Lose Fabric',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'High Sensitive',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Soft-touch Jersy',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Lose Fabric',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'High Sensitive',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Text(
                              'Additional Information',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            childrenPadding: EdgeInsets.only(left: 15.sp),
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Size: L,M,S,XL',
                                    style: TextStyle(fontSize: 15.sp),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Colors: Black, Blue, Red',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }else{
              return(Container());
            }

          }
        ),
      ),
    );
  }
}
