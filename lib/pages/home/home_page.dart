import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/utils/app_text_field.dart';
import 'package:food_delivery_with_firebase/utils/dimensions.dart';
import 'package:food_delivery_with_firebase/utils/food_menu_icon.dart';
import 'package:persian_fonts/persian_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late TabController _tabController;
  var searchController = TextEditingController();
  final _controller = ScrollController();
  final _unselectedColor = Colors.grey[500];
  final _tabs = [
    Container(
      child: Text(
        'اطلاعات رستوران',
      )
    ),
    Container(
      child: Text(
        'منوی سفارش',
      ),
    ),
  ];

  var reserveTime = DateTime.now();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(reserveTime.hour);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                      right: Dimensions.width10,
                      left: Dimensions.width10,
                      bottom: Dimensions.height15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Dimensions.width45*3,
                        height: Dimensions.height15*3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: Colors.deepOrange)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: Dimensions.width10*0.05,),
                            Text("ورود / عضویت", style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            Icon(Icons.person_outline_outlined, color: Colors.white,),
                            SizedBox(width: Dimensions.width10*0.05,),
                          ],
                        ),
                      ),
                      Image.asset("assets/images/logo.png",
                        width: Dimensions.height45,),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: Dimensions.height45*5.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: 0.5,
                              image: AssetImage(
                                  "assets/images/headerImage.jpg"
                              )
                          )
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: Dimensions.height30,),
                          Text("شعبه ونک",
                            style: PersianFonts.Sahel.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 28),),
                          Text("آدرس: ضلع جنوب شرقی میدان ونک",
                            style: PersianFonts.Sahel.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),),
                          SizedBox(height: Dimensions.height10,),
                          Container(
                            width: Dimensions.width30*4,
                            height: Dimensions.height20*2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: Dimensions.width15,
                                left: Dimensions.width15,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black),
                                  Text("تغییر شعبه", style: TextStyle(color: Colors.black),),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height30,),
                          reserveTime.hour > 11
                              ? Text('')
                              : Text("شروع سفارش گیری از ساعت 11:00:00 امروز",
                              style: PersianFonts.Samim.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15))

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              Container(
                height: 45,
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[500],
                  indicatorColor: Colors.grey[500],
                  tabs: const [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      child: Text('اطلاعات رستوران',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                        fontSize: 18),
                      ),
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      child: Text('منوی سفارش',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                        fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // tab bar view here
              SizedBox(
                height: 2000,
                child: TabBarView(controller: _tabController, children: [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height10,
                            right: Dimensions.width20,
                            left: Dimensions.width20,
                            bottom: Dimensions.height10
                        ),
                        child: SingleChildScrollView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedDrink.png", iconName: "نوشیدنی",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedPutin.png", iconName: "پیش عذا",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedPutin.png", iconName: "پوتین",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedSokhari.png", iconName: "سوخاری",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedHotSandwich.png", iconName: "ساندویچ گرم",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedBerger.png", iconName: "برگر",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedHotdog.png", iconName: "هات داگ",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedCombo.png", iconName: "پیتزا",),
                                SizedBox(width: Dimensions.width45,),
                                FoodMenuIcon(controller: _controller, imagePath: "unselectedCombo.png", iconName: "کمبو",)
                              ]
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(height: Dimensions.height10/2,),
                      AppTextField(
                        textController: searchController,
                        hintText: "جستجوی سریع",
                        icon: Icons.search_sharp,
                        isObscure: false,
                      ),
                      SizedBox(height: Dimensions.height10/2,),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: Dimensions.width20
                              ),
                              child: Text("کمبو",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimensions.font26
                                ),),
                            ),
                          ),
                          SizedBox(height: Dimensions.height10/2,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.width20,
                                  right: Dimensions.width20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/comboFood/combo.png",
                                        alignment: Alignment.topCenter),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10,
                                        bottom: Dimensions.width10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('هپی کمبو',
                                            style: TextStyle(fontSize: Dimensions.font20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),),
                                          SizedBox(height: Dimensions.height10/2,),
                                          Text('پیتزا رست بیف 23 + سیب زمینی هان داگ فرایزر + 2 عدد نوشابه',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: Dimensions.font16,
                                                color: Colors.black),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: Dimensions.width45,
                                                height: Dimensions.width45,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.redAccent)
                                                ),
                                                child: Icon(Icons.add, color: Colors.black,),
                                              ),
                                              Text('245,000 تومان',
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: Dimensions.font16
                                                ),)
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: Dimensions.height10,),
                              Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.width20,
                                  right: Dimensions.width20,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/comboFood/comboCheese.png",
                                        alignment: Alignment.topCenter),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10,
                                        bottom: Dimensions.width10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('کمبو چیز',
                                            style: TextStyle(fontSize: Dimensions.font20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),),
                                          SizedBox(height: Dimensions.height10/2,),
                                          Text('فرش چیزبرگر +هات داگ با پنیر گودا + 2 عدد نوشابه',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: Dimensions.font16,
                                                color: Colors.black),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: Dimensions.width45,
                                                height: Dimensions.width45,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.redAccent)
                                                ),
                                                child: Icon(Icons.add, color: Colors.black,),
                                              ),
                                              Text('265,000 تومان',
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: Dimensions.font16
                                                ),)
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
