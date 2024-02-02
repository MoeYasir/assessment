import 'package:assessment/bloc/prodct_state.dart';
import 'package:assessment/bloc/product_bloc.dart';
import 'package:assessment/bloc/product_event.dart';
import 'package:assessment/misc/colors.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/widgets/item_details_container.dart';
import 'package:assessment/widgets/listItem.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  final ProductBloc _productBloc = ProductBloc();
  @override
  void initState() {
    _productBloc.add(GetProductListEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5f5f5),
      body: BlocProvider(
        create: (context) => _productBloc,
        child:
            BlocBuilder<ProductBloc, ProductStates>(builder: (context, state) {
          if (state is ProductError) {
            return Center(
              child: Text(state.error!),
            );
          } else {
            if (state is ProductInitialState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (state is ProductLoaded) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          color: Color(0xff3f3d56),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                color: Color(0xff581845),
                                child: Center(
                                    child: Text(
                                  "HOVA STORE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              Gap(10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DrawerItem(text: "HOME"),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Color(0xff0000000),
                                    border:
                                        Border.all(color: Color(0xff8888888))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DrawerItem(
                                      icon: Icons.shopping_bag_outlined,
                                      text: "SELL"),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DrawerItem(text: "TRANSACTIONS"),
                              ),
                              Divider(
                                thickness: 1,
                                color: Color(0xff8888888),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DrawerItem(text: "EXPENSES"),
                              ),
                              Divider(
                                thickness: 1,
                                color: Color(0xff8888888),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DrawerItem(text: "SETTINGS"),
                              ),
                              Gap(30),
                              Text("powered by",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                              // Gap(5),
                              Text(
                                "HOVA AI",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // First column
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width - 200,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Container(
                                        width: 300,
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFEEE8EC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                    child: Icon(
                                                        Icons.store_rounded,
                                                        color: AppColors
                                                            .iconColor))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                "HOVA STORE LTD",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Color(0xFF3F3D56)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_outline_sharp,
                                            color: AppColors.iconColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Xavier N.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Gap(10),
                                          Container(
                                            width: 130,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: AppColors.iconColor,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.logout,
                                                  color: AppColors.iconColor,
                                                ),
                                                Gap(5),
                                                Text(
                                                  "Logout",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.iconColor),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: 700,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  hintText:
                                                      'Search by name / barcode',
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xFFCCCCCC),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Gap(10),
                                            GridView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    state.ProductList.length,
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 4 / 2,
                                                  crossAxisCount: 2,
                                                ),
                                                itemBuilder: (context, index) {
                                                  ProductModel productModel =
                                                      state.ProductList[index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ItemContainer(
                                                        isPhone: false,
                                                        quantity: productModel
                                                            .quantity!,
                                                        productPrice:
                                                            productModel
                                                                .productPrice!,
                                                        productname:
                                                            productModel.name!),
                                                  );
                                                })
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200),
                                          color: Color(0xff3f3d56),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Please review the selected products and the total amount to complete the transaction.. ",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Gap(20),
                                                Container(
                                                  height: 30,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: Center(
                                                    child: Text(
                                                      "CLEAR",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Gap(20),
                                                Expanded(
                                                  child: Container(
                                                    height: 800,
                                                    width: 700,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF5F5F5),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ListTile(
                                                              leading: Text(
                                                                "Phone Charger",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .more_horiz,
                                                                size: 40,
                                                                color: AppColors
                                                                    .iconColor,
                                                              ),
                                                            ),
                                                            ListTile(
                                                              leading: Text(
                                                                "QTY 1 X 1000",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              trailing: Text(
                                                                "1000",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ),
                                                            Divider(
                                                              color:
                                                                  Colors.white,
                                                              thickness: 2,
                                                            ),
                                                            ListTile(
                                                              leading: Text(
                                                                "Laptop Charger",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .more_horiz,
                                                                size: 40,
                                                                color: AppColors
                                                                    .iconColor,
                                                              ),
                                                            ),
                                                            ListTile(
                                                              leading: Text(
                                                                "QTY 1 X 1200",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              trailing: Text(
                                                                "1200",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 16.0,
                                                                top: 5,
                                                                right: 20,
                                                              ),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Discount (10%)",
                                                                      style: TextStyle(
                                                                          color: Colors.grey[
                                                                              400],
                                                                          fontWeight: FontWeight
                                                                              .w100,
                                                                          fontSize:
                                                                              17),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "- 120",
                                                                    style: TextStyle(
                                                                        color: Colors.grey[
                                                                            400],
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Gap(10),
                                                            Divider(
                                                              color:
                                                                  Colors.white,
                                                              thickness: 2,
                                                            ),
                                                            ListTile(
                                                              leading: Text(
                                                                "Before Disc.",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              trailing: Text(
                                                                "RF 2200",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            ListTile(
                                                              leading: Text(
                                                                "TAX (18%)",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              trailing: Text(
                                                                "RF 374.4",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .iconColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  height: 50,
                                                  child: ListTile(
                                                    leading: Text(
                                                      "After Disc.",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17),
                                                    ),
                                                    trailing: Text(
                                                      "RF 2080",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                ),
                                                Gap(20),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Icon(Icons.add),
                                                          Text(
                                                            "Customer",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Gap(20),
                                                    Expanded(
                                                      child: Container(
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black),
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Flexible(
                                                              fit:
                                                                  FlexFit.loose,
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 30,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Center(
                                                                child:
                                                                    AutoSizeText(
                                                                  "PAYMENT METHOD",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                                  maxLines: 3,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Gap(50),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 50,
                                                        width: 150,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xFFe74C3D))),
                                                        child: Center(
                                                          child: Text(
                                                            "CLEAR",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFFe74C3D)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Gap(30),
                                                    Expanded(
                                                      child: Container(
                                                          height: 50,
                                                          width: 150,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white),
                                                              color: AppColors
                                                                  .iconColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              "CONFIRM TRANSACTION",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // second column
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }
            }
          }
        }),
      ),
    );
  }
}
