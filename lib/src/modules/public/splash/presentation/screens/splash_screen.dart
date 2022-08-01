import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/domain/constants/screen_dimension_constant.dart';
import 'package:sei_services/src/shared/domain/usecases/is_logged_usecase.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final IsLoggedUsecase _isLoggedUsecase = Modular.get<IsLoggedUsecase>();

  @override
  initState(){
    super.initState();
    _navigateByLoggedState();
  }

  _navigateByLoggedState() async {
    bool isLogged = await _isLoggedUsecase.isLogged();
    await Future.delayed(const Duration(seconds: 2));
    if(isLogged){
      Modular.to.navigate('/private/');
    }else{
      Modular.to.navigate('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(
        ScreenDimensionConstant.pixelXLWidth,
        ScreenDimensionConstant.pixelXLHeight)
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300.r,
              width: 300.r,
              child: Image.asset('assets/images/home_logo.png'),
            ),
            SizedBox(height: 20.h),
            const CircularProgressIndicator(color: Colors.blueAccent,),
          ],
        ),
      ),
    );
  }
}
