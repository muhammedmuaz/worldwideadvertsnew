import 'package:carousel_slider/carousel_slider.dart';
import 'package:newapp/controllers/api.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/generic_widgets/image/deaf_network_image.dart';
import 'package:newapp/generic_widgets/screen_widgets/custom_scaffold.dart';
import 'package:newapp/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:newapp/models/affiliates_model.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/app_images.dart';
import 'package:newapp/utils/helper_widgets/add_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/design_const.dart';
import '../../models/listing_model.dart' as lsModel;
import '../../utils/screen_helper.dart';
import 'detail_listing_screen.dart';
import 'listing_detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = false;
  List<Affiliates> affiliates = [];
  List<lsModel.Listing> listings = [];
  Future<void> getAffiliates() async {
    affiliates = await ApiCallbacks.getAffiliates();
    setState(() {});
  }

  Future<void> getListings() async {
    listings = await ApiCallbacks.getListings();
    setState(() {});
  }
  @override
  void initState() {
    getListings();
    getAffiliates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return CustomScaffold(
        body: ScreenPadding(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AddHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => const MenuScreen()));
                    AppNavigation.navigateTo(AppRoutesNames.menuScreen);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: DesignConstants.kSecondaryTextColor,
                    ),
                    child: const Icon(Icons.menu),
                  ),
                ),
                // Container(
                //   height: 48,
                //   width: 48,
                //   padding: const EdgeInsets.all(14.0),
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: DesignConstants.kSecondaryTextColor,
                //   ),
                //   child: DeafAssetImage(imagePath: AppImages.notificationIcon),
                // ),
              ],
            ),
            const AddHeight(0.03),
            Text(
              "Welcome to",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const AddHeight(0.004),
            Text(
              "World Wide Adverts",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            const AddHeight(0.03),
            Text(
              "Promoted Adds",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const AddHeight(0.02),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0, // Adjust the height according to your need
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: listings.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ListingDetailPage(
                                  detail: item,
                                )));
                      },
                      child: Card(
                        elevation: 5.0, // Adjust elevation to give depth
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Rounded corners
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            item.images.first.imagePath,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const AddHeight(0.02),
            Text(
              "Top Affiliates",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const AddHeight(0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  affiliates.length,
                  (i) => Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: height * 0.12,
                            width: width * 0.39,
                            child: DeafHaulingNetworkImage(
                                errorAndPlaceHolderFit: BoxFit.cover,
                                fit: BoxFit.cover,
                                imagePath: affiliates[i].imageUrl)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 4),
                          child: Text(
                            affiliates[i].title,
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                        const AddHeight(0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const AddHeight(0.02),
            Text(
              "Nearby Services",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const AddHeight(0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: height * 0.12,
                              width: width * 0.39,
                              child: const DeafHaulingNetworkImage(
                                  errorAndPlaceHolderFit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                  imagePath:
                                      "https://static.vecteezy.com/system/resources/previews/023/803/036/non_2x/atm-concept-banking-terminal-tiny-people-waiting-in-line-near-atm-machine-holding-credit-card-and-money-online-payment-modern-flat-cartoon-style-illustration-on-white-background-vector.jpg")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Text(
                              "Bakery",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: height * 0.12,
                              width: width * 0.39,
                              child: const DeafHaulingNetworkImage(
                                  errorAndPlaceHolderFit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                  imagePath:
                                      "https://c8.alamy.com/comp/WJPHJD/bakery-shop-bake-with-love-cartoon-vector-illustration-WJPHJD.jpg")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Text(
                              "Atm Machines",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: height * 0.12,
                              width: width * 0.39,
                              child: const DeafHaulingNetworkImage(
                                  errorAndPlaceHolderFit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                  imagePath:
                                      "https://media.istockphoto.com/id/1313487665/vector/cartoon-hairdresser-washing-client-hair-flat-vector-illustration.jpg?s=612x612&w=0&k=20&c=q7J3LF7wA_YdkAKz54Bpph6D9S6rfzwQ6NoRiNXFmjY=")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Text(
                              "Beauty Salon",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: height * 0.12,
                              width: width * 0.39,
                              child: const DeafHaulingNetworkImage(
                                  errorAndPlaceHolderFit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                  imagePath:
                                      "https://static.vecteezy.com/system/resources/previews/012/251/706/original/bike-shop-with-shoppers-people-choosing-cycles-accessories-or-gear-equipment-for-riding-in-template-hand-drawn-cartoon-flat-illustration-vector.jpg")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Text(
                              "Bicycle Store",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: height * 0.12,
                              width: width * 0.39,
                              child: const DeafHaulingNetworkImage(
                                  errorAndPlaceHolderFit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                  imagePath:
                                      "https://i.pinimg.com/originals/79/a2/6c/79a26c942e0b561b1c59621be1bfc22f.jpg")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Text(
                              "Book Store",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ]),
            ),
            const AddHeight(0.02),
            Text(
              "Other Adds",
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const AddHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.bannerAdd),
                          Text(
                            "Sponsored Ads",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.classifiedAdd),
                          Text(
                            "Classifieds Ads",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 4),
                          //   child: Text(
                          //     "Classifieds ads content can be an effective way for businesses to reach their target audience in a less intrusive manner.",
                          //     style: GoogleFonts.nunito(
                          //         fontWeight: FontWeight.w400, fontSize: 14),
                          //     textAlign: TextAlign.center,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const AddHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.affiliatesAdd),
                          Text(
                            "Affiliate Ads",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.featuredAdds),
                          Text(
                            "Featured Ads",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const AddHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.promotedAdds),
                          Text(
                            "Promoted Ads",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailListingScreen()));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DeafAssetImage(
                              fit: BoxFit.cover,
                              imagePath: AppImages.bannerAdds),
                          Text(
                            "Banner Adverts",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const AddHeight(0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
