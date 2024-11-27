class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});

  static List<UnboardingContent> contents = [
    UnboardingContent(
        description: "Pilih makanan favorit Anda dari menu kami\nLebih dari 35 pilihan",
        image: "images/screen1.png",
        title: "Pilih dari Menu\nTerbaik Kami"
    ),
    UnboardingContent(
        description: "Antarkan makanan Anda langsung\nke depan pintu Anda",
        image: "images/screen2.png",
        title: "Pembayaran Mudah dan Online"
    ),
    UnboardingContent(
        description: "Anda dapat membayar dengan uang tunai saat pengantaran\natau menggunakan kartu",
        image: "images/screen3.png",
        title: "Pengantaran Cepat ke Pintu Anda"
    ),
  ];
}
