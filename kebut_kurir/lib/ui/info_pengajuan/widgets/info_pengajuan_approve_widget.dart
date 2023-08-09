import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/features/info_pengajuan/presentation/info_pengajuan_controller.dart';
import 'package:kebut_kurir/ui/info_pengajuan/widgets/empty_state_pengajuan_widget.dart';

class InfoPengajuanApproveWidget extends GetView<InfoPengajuanController> {
  const InfoPengajuanApproveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: const EmptyStateInfoPengajuanWidget(
        title: "Belum ada pengajuan yang approve",
      ),
    );
  }
}
