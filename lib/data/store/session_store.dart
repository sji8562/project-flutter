import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../_core/constants/http.dart';
import '../../_core/constants/move.dart';
import '../../main.dart';
import '../dto/request_dto/user/user_request.dart';
import '../dto/response_dto/response_dto.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

// 1. 창고 데이터
class SessionUser {
  User? user;
  String? jwt;
  bool isLogin;
  SessionUser({this.user, this.jwt, this.isLogin = false});
}

// 2. 창고
class SessionStore extends SessionUser {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;


  Future<void> join(JoinReqDTO joinReqDTO) async {
    Logger().d("여기까지 실행됨");
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    Logger().d("여기까지 실행됨1");

    // 2. 비지니스 로직
    if (responseDTO.response == true) {
      Navigator.pushNamed(mContext!, Move.StartPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값 갱신
      Logger().d("세션값 갱신 진입");
      Logger().d(responseDTO.response);
      this.user = responseDTO.response as User;
      this.jwt = responseDTO.token;
      this.isLogin = true;
      Logger().d("세션값 갱신 완료");
      // 2. 디바이스에 JWT 저장 (자동 로그인)
      await secureStorage.write(key: "jwt", value: responseDTO.token);
      Logger().d("여기까지 실행됨");
      // 3. 페이지 이동
      Navigator.pushNamed(mContext!, Move.StartPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error!)));
    }
  }

  // JWT는 로그아웃할 때 서버측으로 요청할 필요가 없음.
  Future<void> logout() async {
    Logger().d("로그아웃 테스트10");

    this.jwt = null;
    this.isLogin = false;
    this.user = null;
    Logger().d("로그아웃 테스트11");

    await secureStorage.delete(key: "jwt");
    Logger().d("로그아웃 테스트12");
    Navigator.pushNamedAndRemoveUntil(
        mContext!, Move.StartPage, (route) => false);
  }
}

// 3. 창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
