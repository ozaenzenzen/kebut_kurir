import 'package:flutter/cupertino.dart';
import 'package:freerasp/talsec_app.dart';

class FreeraspConfig {
  Future<void> initSecurity({
    String? expectedPackageName,
    String? expectedSigningCertificateHash,
    List<String>? supportedAlternativeStores,
    String? iosAppBundleId,
    String? iosAppTeamId,
    String? watcherMail,
  }) async {
    TalsecConfig config = TalsecConfig(
      // For Android
      androidConfig: AndroidConfig(
        expectedPackageName: expectedPackageName,
        expectedSigningCertificateHash: expectedSigningCertificateHash,
        supportedAlternativeStores: supportedAlternativeStores,
      ),

      // For iOS
      iosConfig: IOSconfig(
        appBundleId: iosAppBundleId,
        appTeamId: iosAppTeamId,
      ),

      // Common email for Alerts and Reports
      watcherMail: watcherMail,
    );

    // Talsec callback handler
    TalsecCallback callback = TalsecCallback(
      // For Android
      androidCallback: AndroidCallback(
        onRootDetected: () => debugPrint('onRootDetected'),//DialogUtils.showRootedPopup(),
        onEmulatorDetected: () => debugPrint('onEmulatorDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onHookDetected: () => debugPrint('onHookDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onTamperDetected: () => debugPrint('onTamperDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onDeviceBindingDetected: () => debugPrint('onDeviceBindingDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onUntrustedInstallationDetected: () => debugPrint('onUntrustedInstallationDetected'),//DialogUtils.showUntrustedInstallationPopup(),
      ),
      // For iOS
      iosCallback: IOSCallback(
        onSignatureDetected: () => debugPrint('onSignatureDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onRuntimeManipulationDetected: () => debugPrint('onRuntimeManipulationDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onPasscodeDetected: () => debugPrint('onPasscodeDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onJailbreakDetected: () => debugPrint('onJailbreakDetected'),//DialogUtils.showRootedPopup(),
        onSimulatorDetected: () => debugPrint('onSimulatorDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onMissingSecureEnclaveDetected: () => debugPrint('onMissingSecureEnclaveDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onDeviceChangeDetected: () => debugPrint('onDeviceChangeDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onDeviceIdDetected: () => debugPrint('onDeviceIdDetected'),//DialogUtils.showUnusualBehaviourPopup(),
        onUnofficialStoreDetected: () => debugPrint('onUnofficialStoreDetected'),//DialogUtils.showUntrustedInstallationPopup(),
      ),
      // Common for both platforms
      onDebuggerDetected: () => debugPrint('onDebuggerDetected'),
    );

    TalsecApp app = TalsecApp(
      config: config,
      callback: callback,
    );

    app.start();
  }
}