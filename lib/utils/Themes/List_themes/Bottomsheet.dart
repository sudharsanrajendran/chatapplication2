import 'package:flutter/material.dart';
class bottomsheettheme{
  bottomsheettheme._();
  static BottomSheetThemeData bottomsheetlightmode=BottomSheetThemeData(

      showDragHandle: true,
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(minHeight:double.infinity ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  );
  static BottomSheetThemeData bottomsheetdarktmode=BottomSheetThemeData(

      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(minHeight:double.infinity ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  );

}