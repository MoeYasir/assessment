import 'package:assessment/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MobileCheckout extends StatelessWidget {
  final int quantity;
  final int productPrice;
  final String productname;
  const MobileCheckout({
    Key? key,
    required this.quantity,
    required this.productPrice,
    required this.productname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: Text(
                "HOVA",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
        title: Text("CONFRIM TRANSACTION"),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.iconColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.iconColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: (MediaQuery.of(context).size.width - 200) / 2,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please review the selected products and the total amount to complete the transaction.. ",
                      softWrap: true,
                      style: TextStyle(
                        color: Color(0xFF545150),
                        fontSize: 20,
                      ),
                    ),
                    Gap(20),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.iconColor)),
                      child: Center(
                        child: Text(
                          "CLEAR",
                          style: TextStyle(
                            color: AppColors.iconColor,
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
                            color: Color(0xFFEbE6E9),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Text(
                                    productname,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  trailing: Icon(
                                    Icons.more_horiz,
                                    size: 40,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                                ListTile(
                                  leading: Text(
                                    "QTY 1 X $productPrice",
                                    style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17),
                                  ),
                                  trailing: Text(
                                    "RWF $productPrice",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                ListTile(
                                  leading: Text(
                                    "Juice",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  trailing: Icon(
                                    Icons.more_horiz,
                                    size: 40,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                                ListTile(
                                  leading: Text(
                                    "QTY 1 X 1200",
                                    style: TextStyle(
                                        color: Color(0xFF727272),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17),
                                  ),
                                  trailing: Text(
                                    "RWF 1000",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Gap(10),
                                Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                ListTile(
                                  leading: Text(
                                    "Sub-total",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  trailing: Text(
                                    "RWF 2000",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  leading: Text(
                                    "TAX (18%)",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  trailing: Text(
                                    "RWF 360",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
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
                          color: Color(0xFFD4C7D0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      height: 50,
                      width: 700,
                      child: ListTile(
                        leading: Text(
                          "Total",
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        trailing: Text(
                          "RWF 2000",
                          style: TextStyle(
                              color: AppColors.iconColor,
                              fontWeight: FontWeight.bold,
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
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.add),
                              Text(
                                "Customer",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            ],
                          ),
                        ),
                        Gap(30),
                        MediaQuery.of(context).size.width >= 850
                            ? Container(
                                height: 50,
                                width: 550,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Gap(20),
                                    Text(
                                      "PAYMENT METHOD",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.add),
                                      Text(
                                        "PAYMENT METHOD",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Gap(50),
                    Center(
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: AppColors.iconColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              Gap(5),
                              Text(
                                "CONFIRM TRANSACTION",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
