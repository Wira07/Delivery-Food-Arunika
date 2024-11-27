import 'package:flutter/material.dart';
import 'package:fooddelivery/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Wallet
          Material(
            elevation: 4.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  "Wallet",
                  style: AppWidget.semiBooldTextFeildStyle().copyWith(
                    fontSize: 22.0,
                    shadows: [
                      Shadow(
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Konten Wallet
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Wallet Info
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/wallet.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        // Membungkus teks dengan Expanded untuk mencegah overflow
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Wallet",
                                style: AppWidget.LightTextFeildStyle(),
                                overflow: TextOverflow
                                    .ellipsis, // Tambahkan ini jika teks terlalu panjang
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\Rp" + "145.000",
                                style: AppWidget.boldTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Add Money Label
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Add Money",
                      style: AppWidget.semiBooldTextFeildStyle(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // Add Money Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Option 1
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE932E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "\Rp" + "500",
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                      ),
                      // Option 2
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE932E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "\Rp" + "500",
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                      ),
                      // Option 3
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE932E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "\Rp" + "500",
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                      ),
                      // Option 4
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE932E2)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "\Rp" + "500",
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf00080),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        "Add Money",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
