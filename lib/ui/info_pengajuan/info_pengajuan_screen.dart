import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_controller.dart';
import 'package:kebut_kurir/ui/info_pengajuan/widgets/info_pengajuan_approve_widget.dart';
import 'package:kebut_kurir/ui/info_pengajuan/widgets/info_pengajuan_pending_widget.dart';

class InfoPengajuanScreen extends GetView<InfoPengajuanController> {
  const InfoPengajuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: AppTheme.colors.whiteColor1,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.whiteColor1,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Info Pengajuan',
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.nl,
              fontWeight: AppTheme.textConfig.weight.semiBold,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppTheme.colors.blackColor1,
            ),
          ),
          bottom: TabBar(
            labelColor: AppTheme.colors.blackColor1,
            labelStyle: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.n,
              fontWeight: AppTheme.textConfig.weight.semiBold,
              color: AppTheme.colors.blackColor1,
            ),
            unselectedLabelStyle: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.n,
              fontWeight: AppTheme.textConfig.weight.semiBold,
              color: const Color(0xff7C7E83),
            ),
            unselectedLabelColor: const Color(0xff7C7E83),
            indicatorColor: const Color(0xff00B050),
            tabs: const <Widget>[
              Tab(
                // icon: Icon(Icons.home),
                text: 'Approve',
              ),
              Tab(
                // icon: Icon(Icons.favorite),
                text: 'Pending',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            InfoPengajuanApproveWidget(),
            InfoPengajuanPendingWidget(),
          ],
        ),
      ),
    );
  }
}
