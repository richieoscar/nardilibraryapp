import 'package:nardilibraryapp/model/auth/user_info.dart';

class UserResponse {
  String? status;
  String? message;
  UserInfo? userInfo;

  UserResponse(this.status, this.message, this.userInfo);

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if(json['data']!=null){
         userInfo = UserInfo.fromJson(json['data']);
    }
   
  }

  @override
  String toString() {
    return super.toString();
  }
}
