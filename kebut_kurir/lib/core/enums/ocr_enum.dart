enum OcrEnum {
  EMPLOYEE,
  KTP;


  int get code {
    switch (this) {
      case OcrEnum.KTP:
        return 0;
      case OcrEnum.EMPLOYEE:
        return 1;
      default:
        return 0;
    }
  }
}
