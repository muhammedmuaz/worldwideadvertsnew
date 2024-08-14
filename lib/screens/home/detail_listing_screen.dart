import 'package:newapp/const/design_const.dart';
import 'package:newapp/controllers/api.dart';
import 'package:newapp/generic_widgets/image/deaf_network_image.dart';
import 'package:newapp/generic_widgets/screen_widgets/custom_scaffold.dart';
import 'package:newapp/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:newapp/models/listing_model.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/screens/home/listing_detail_page.dart';
import 'package:newapp/utils/helper_widgets/add_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailListingScreen extends StatefulWidget {
  const DetailListingScreen({super.key});

  @override
  State<DetailListingScreen> createState() => _DetailListingScreenState();
}

class _DetailListingScreenState extends State<DetailListingScreen> {
  List<Listing> listings = [];
  Future<void> getListings() async {
    listings = await ApiCallbacks.getListings();
    setState(() {});
  }

  @override
  void initState() {
    getListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ScreenPadding(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddHeight(0.02),
            ScreenPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppNavigation.goBack();
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: DesignConstants.kButtonBg,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Adds",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            const AddHeight(0.015),
            const Divider(
              height: 1,
              color: DesignConstants.kAppBarDividerColor,
            ),
            const AddHeight(0.015),
            Text(
              "Classifieds Ads",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: listings.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListingDetailPage(
                                detail: listings[index],
                              )));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                            child: DeafHaulingNetworkImage(
                                fit: BoxFit.cover,
                                errorAndPlaceHolderFit: BoxFit.cover,
                                imagePath:
                                    listings[index].images.first.imagePath),
                          ),
                          const AddHeight(0.01),
                          Text(
                            listings[index].title,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          // AddHeight(0.01),

                          // const Divider(
                          //   height: 1,
                          //   color: DesignConstants.kAppBarDividerColor,
                          // ),
                          // AddHeight(0.01),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Icon(
                          //       Icons.location_on,
                          //       color: Colors.grey,
                          //     ),
                          //     Text(
                          //       listings[index].location.slug,
                          //       style: GoogleFonts.nunito(
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18,
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // const AddHeight(0.02),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )),

      ),
    );
  }
}
