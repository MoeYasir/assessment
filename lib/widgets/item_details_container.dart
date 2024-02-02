import 'package:assessment/misc/colors.dart';
import 'package:assessment/pages/dimensions.dart';
import 'package:assessment/pages/mobile/mobile_and_tab_checkout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemContainer extends StatelessWidget {
  final int quantity;
  final int productPrice;
  final String productname;
  final bool isPhone;
  const ItemContainer({
    Key? key,
    required this.quantity,
    required this.productPrice,
    required this.productname,
    required this.isPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width > mobileWidth ? 200 : 170,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFECECEC),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Center(
                            child: Text(
                          quantity.toString(),
                          style: TextStyle(
                              color: quantity == 0
                                  ? Colors.red
                                  : quantity < 5
                                      ? Colors.yellow
                                      : Color(0xFF1B9C6C),
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 20,
                              // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: quantity == 0
                                ? Colors.red
                                : quantity < 5
                                    ? Colors.yellow
                                    : Color(0xFF1B9C6C),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Gap(10),
                      Text(
                        productname,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.iconColor),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: AppColors.iconColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xFFECECEC),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RWF $productPrice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  quantity == 0
                      ? Text(
                          "Out of stock",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      : InkWell(
                          onTap: isPhone == true
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MobileCheckout(
                                                productPrice: productPrice,
                                                quantity: quantity,
                                                productname: productname,
                                              )));
                                }
                              : () {},
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.iconColor),
                            child: Center(
                                child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                ],
              ),
            ),
          ],
        ));
  }
}
