import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsivetutorial/misc/colors.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
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
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
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
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Center(
                                              child: Text(
                                            "111",
                                            style: TextStyle(
                                                color: Color(0xFF1B9C6C),
                                                fontWeight: FontWeight.bold),
                                          )),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 0.5,
                                                blurRadius: 20,
                                                // changes position of shadow
                                              ),
                                            ],
                                            border: Border.all(
                                              color: Color(0xFF1B9C6C),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Gap(10),
                                        Text(
                                          "Laptop charger",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors.iconColor),
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
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "RWF 1200",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.iconColor),
                                      child: Center(
                                          child: Text(
                                        "ADD TO CART",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
