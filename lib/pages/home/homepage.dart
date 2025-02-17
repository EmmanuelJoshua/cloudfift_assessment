import 'dart:ui';

import 'package:cloudfift_assessment/pages/home/viewmodels/homepage_viewmodel.dart';
import 'package:cloudfift_assessment/utils/colors.dart';
import 'package:cloudfift_assessment/utils/size_config.dart';
import 'package:cloudfift_assessment/utils/theme.dart';
import 'package:cloudfift_assessment/widgets/buttons.dart';
import 'package:cloudfift_assessment/widgets/homepage_cards.dart';
import 'package:cloudfift_assessment/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectors = ['Restaurant', 'Catering', 'Restaurant', 'Catering'];
  List<String> foodList1 = ['Jollof rice and chicken', 'Grilled fish'];
  List<String> foodList2 = ['Jollof rice', 'Fried rice and chicken'];
  List<String> foodList3 = ['Spaghetti with meat sauce', 'Rice and Stew'];
  List<String> restaurantList = ['Chicken Republic', 'Sweet Sensation', 'BBT'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<HomePageViewModel>.reactive(
      disposeViewModel: true,
      builder: (context, model, child) {
        return CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            child: SvgPicture.asset(
                              'assets/icon_images/profile_icon.svg',
                              height: 23,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Delivering To',
                              ).applyStyle(
                                  color: primaryColor,
                                  fontSize: getProportionateResponsiveSize(12),
                                  fontWeight: FontWeight.w700),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '170, Apata street, Somolu',
                                  ).applyStyle(
                                      color: textColor,
                                      fontSize:
                                          getProportionateResponsiveSize(15),
                                      fontWeight: FontWeight.w700),
                                  Container(
                                    padding: EdgeInsets.only(top: 4),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: SvgPicture.asset(
                                        'assets/icon_images/chevron_left_icon.svg',
                                        color: textColor2,
                                        height:
                                            getProportionateResponsiveSize(14),
                                        width:
                                            getProportionateResponsiveSize(14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            child: SvgPicture.asset(
                              'assets/icon_images/notification_icon.svg',
                              height: 23,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xFFE0E0E0),
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // bottom: PreferredSize(
              //     preferredSize: Size.fromHeight(140.0),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 19),
              //           child: SearchTextfield(),
              //         ),
              //         SizedBox(
              //           height: 18,
              //         ),
              //         //For building the categories selection widget
              //         _buildCategories(model),
              //         SizedBox(
              //           height: 10,
              //         ),
              //       ],
              //     )),
            ),
            SliverFillRemaining(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Search textfield and Categories selection
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: SearchTextfield(),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          //For building the categories selection widget
                          _buildCategories(model),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      //For building the first banner widget
                      _buildBanner(),
                      ...[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 12,
                          color: authBgColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                      _buildNewFoodToTry(),
                      ...[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 12,
                          color: authBgColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                      _buildClosestFood(),
                      ...[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 12,
                          color: authBgColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                      _buildSpecialOffers(),
                      ...[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 12,
                          color: authBgColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                      //For building the list of restaurants
                      _buildRestaurantList()
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
      viewModelBuilder: () => HomePageViewModel(),
    );
  }

  Widget _buildCategories(HomePageViewModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 19),
      height: 46,
      child: ListView.builder(
        itemCount: selectors.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: DefaultButtonIcon(
              text: selectors[index],
              onPress: () {
                model.setCurrentIndex = index;
              },
              iconAsset: index % 2 == 1
                  ? 'assets/icon_images/dish2_icon.svg'
                  : 'assets/icon_images/dish1_icon.svg',
              color: model.currentIndex == index ? Colors.red : buttonTwoColor,
              isLight: model.currentIndex == index ? true : false,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: getProportionateScreenHeight(140),
      width: double.infinity,
      margin: const EdgeInsets.only(left: 19, right: 19, top: 10),
      padding: const EdgeInsets.only(left: 15, top: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: new DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          image: AssetImage(
            'assets/images/home_image1.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get 10% off your first order!',
          ).applyStyle(
            color: Colors.white,
            fontSize: getProportionateResponsiveSize(17),
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          SizedBox(
            width: 240,
            child: Text(
              'Use code code URSXVN on orders above ₦5000',
            ).applyStyle(
              color: Colors.white,
              fontSize: getProportionateResponsiveSize(14),
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 105,
            child: DefaultButton(
              text: 'Order now',
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildNewFoodToTry() {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Try Something New',
              ).applyStyle(
                color: textColor2,
                fontSize: getProportionateResponsiveSize(18),
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                'assets/icon_images/arrow_right_icon.svg',
                height: getProportionateResponsiveSize(20),
                width: getProportionateResponsiveSize(20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Container(
            padding: const EdgeInsets.only(left: 19),
            height: getProportionateScreenHeight(188),
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodCard(
                    imageAsset: 'assets/images/home_image2.png',
                    foodName: foodList1[index]);
              },
            ))
      ]),
    );
  }

  Widget _buildClosestFood() {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Closest to you',
              ).applyStyle(
                color: textColor2,
                fontSize: getProportionateResponsiveSize(18),
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                'assets/icon_images/arrow_right_icon.svg',
                height: getProportionateResponsiveSize(20),
                width: getProportionateResponsiveSize(20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Container(
            padding: const EdgeInsets.only(left: 19),
            height: getProportionateScreenHeight(188),
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodCard(
                    imageAsset: 'assets/images/home_image${index + 3}.jpg',
                    foodName: foodList2[index]);
              },
            ))
      ]),
    );
  }

  Widget _buildSpecialOffers() {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special offers',
              ).applyStyle(
                color: textColor2,
                fontSize: getProportionateResponsiveSize(18),
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                'assets/icon_images/arrow_right_icon.svg',
                height: getProportionateResponsiveSize(20),
                width: getProportionateResponsiveSize(20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            padding: const EdgeInsets.only(left: 19),
            height: getProportionateScreenHeight(188),
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodCard(
                  imageAsset: 'assets/images/home_image${index + 4}.jpg',
                  foodName: foodList3[index],
                  isSpecialOffer: true,
                );
              },
            ))
      ]),
    );
  }

  Widget _buildRestaurantList() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Restuarants',
              ).applyStyle(
                color: textColor2,
                fontSize: getProportionateResponsiveSize(18),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return RestaurantCard(
              imageAsset: 'assets/images/home_image${index + 4}.jpg',
              restaurantName: restaurantList[index],
            );
          },
        ))
      ]),
    );
  }
}
