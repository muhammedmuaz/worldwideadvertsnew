import 'package:carousel_slider/carousel_slider.dart';
import 'package:newapp/generic_widgets/screen_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../generic_widgets/screen_widgets/html_to_text_widget.dart';
import '../../models/listing_model.dart' as lsModel;

class ListingDetailPage extends StatefulWidget {
  final lsModel.Listing detail;
  const ListingDetailPage({required this.detail, super.key});

  @override
  State<ListingDetailPage> createState() => _ListingDetailPageState();
}

class _ListingDetailPageState extends State<ListingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight:
                350.0, // Increased height to accommodate the carousel
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(detail.title),
              background: CarouselSlider(
                options: CarouselOptions(
                  height: 350.0, // Adjust this to match the SliverAppBar height
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: widget.detail.images
                    .map((item) => Builder(
                          builder: (BuildContext context) {
                            return Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  item.imagePath,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.detail.title,
                      // style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 16.0),
                    HtmlToTextWidget(htmlContent: widget.detail.description

                        // style: Theme.of(context).textTheme.bodyText2,
                        ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(widget.detail.share);
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
