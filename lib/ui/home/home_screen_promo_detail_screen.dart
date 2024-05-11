import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widgetV2.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';

class HomePromoDetailScreen extends StatelessWidget {
  final String expiredDateTime;
  final String minTrx;
  final String tnC;
  final String networkImage;
  const HomePromoDetailScreen({
    super.key,
    required this.expiredDateTime,
    required this.minTrx,
    required this.tnC,
    required this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidgetV2(title: 'Detail Promo'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: AssetImageWidget(assets: 'assets/promo_static.png', height: 200, width: size.width),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masa hingga',
                      style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 182),
                    Text(
                      '$expiredDateTime',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minimal Transaksi',
                      style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 155),
                    Text(
                      '$minTrx',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: List.generate(
                  150 ~/ 2,
                  (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0 ? Colors.transparent : const Color(0xFFDADADA),
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: size.width,
                child: Text(
                  'Syarat dan Ketentuan',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF009E48),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: size.width,
                child: Text(
                  '$tnC',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF43474D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
