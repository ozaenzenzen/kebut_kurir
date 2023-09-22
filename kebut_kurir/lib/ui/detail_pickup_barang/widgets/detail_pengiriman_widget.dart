import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPengirimanLacakPesananWidget extends StatelessWidget {
  final String senderName, senderPhone, senderAddress;
  final String recipientName, recipientPhone, recipientAddress;
  const DetailPengirimanLacakPesananWidget({
    super.key,
    required this.senderAddress,
    required this.senderName,
    required this.senderPhone,
    required this.recipientAddress,
    required this.recipientName,
    required this.recipientPhone,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: 303,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Detail Pengiriman',
                      style: GoogleFonts.mukta(
                        color: const Color(0xFF1D2129),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            // height: 124,
            padding: const EdgeInsets.only(bottom: 12),
            /* decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Color(0xFFC2C7D0)),
                top: BorderSide(color: Color(0xFFC2C7D0)),
                right: BorderSide(color: Color(0xFFC2C7D0)),
                bottom: BorderSide(width: 0.50, color: Color(0xFFC2C7D0)),
              ),
            ), */
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/ic_send.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Detail Pengirim',
                            style: GoogleFonts.mukta(
                              color: const Color(0xFF9B9B9C),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  // height: 82,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        senderName,
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF121419),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        senderPhone,
                        style: GoogleFonts.mukta(
                          color: const Color(0xFF121419),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          senderAddress,
                          style: GoogleFonts.mukta(
                            color: const Color(0xFF7C7E83),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 8),
          const Divider(),
          Container(
            // height: 112,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  // height: 112,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 343,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_recieve.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Detail Penerima',
                                  style: GoogleFonts.mukta(
                                    color: const Color(0xFF9B9B9C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        // height: 82,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipientName,
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              recipientPhone,
                              style: GoogleFonts.mukta(
                                color: const Color(0xFF121419),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                recipientAddress,
                                style: GoogleFonts.mukta(
                                  color: const Color(0xFF7C7E83),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
