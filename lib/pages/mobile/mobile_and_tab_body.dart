import 'package:assessment/bloc/prodct_state.dart';
import 'package:assessment/bloc/product_bloc.dart';
import 'package:assessment/bloc/product_event.dart';
import 'package:assessment/misc/colors.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/widgets/item_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class MyMobileAndTabBody extends StatefulWidget {
  const MyMobileAndTabBody({Key? key}) : super(key: key);

  @override
  State<MyMobileAndTabBody> createState() => _MyMobileAndTabBodyState();
}

class _MyMobileAndTabBodyState extends State<MyMobileAndTabBody> {
  final ProductBloc _productBloc = ProductBloc();
  @override
  void initState() {
    _productBloc.add(GetProductListEvent());
    super.initState();
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(),
      badgeContent: Text(
        "2",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      child: Icon(Icons.shopping_cart),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Center(child: _shoppingCartBadge())),
          ),
        ],
        title: Text("NEW TRANSACTION"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: AppColors.iconColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.iconColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFCCCCCC), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => _productBloc,
              child: BlocBuilder<ProductBloc, ProductStates>(
                  builder: (context, state) {
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
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.ProductList.length,
                                itemBuilder: ((context, index) {
                                  ProductModel productModel =
                                      state.ProductList[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: ItemContainer(
                                      isPhone: true,
                                      productPrice: productModel.productPrice!,
                                      productname: productModel.name!,
                                      quantity: productModel.quantity!,
                                    ),
                                  );
                                })),
                          ),
                        );
                      } else {
                        return Expanded(child: Container());
                      }
                    }
                  }
                }
              }),
            ),
            Container(
              height: 80,
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.home_work_outlined,
                          color: Color(0xff888888),
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text("Home"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xFFE8E0E5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.library_books_rounded,
                            size: 27,
                            color: AppColors.iconColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text("Transactions"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.view_list_outlined,
                          size: 30,
                          color: Color(0xff888888),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text("Inventory"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.account_box_outlined,
                          size: 30,
                          color: Color(0xff888888),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text("Profile"),
                        )
                      ],
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
