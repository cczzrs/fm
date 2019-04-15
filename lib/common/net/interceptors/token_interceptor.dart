import 'package:dio/dio.dart';
import 'package:fm/common/local/config.dart';
import 'package:fm/common/local/local_storage.dart';

/**
 * 授权 token 拦截器
 * Created by cczzrs
 * on 2019-4-9.
 */
/// 授权 token 拦截器
class TokenInterceptors extends InterceptorsWrapper {
    /// 后台系统采用 jwt 认证
    final String _JWT = "JWT ";

    /// 每次请求添加本地授权 token 到头部 headers
    @override
    onRequest(RequestOptions options) async {
        return setAuthorization(options);
    }

    /// 保存授权 token 到本地
    @override
    onResponse(Response response) async{
        try {
            if ((response.statusCode == 200 || response.statusCode == 201) && response.data["token"] != null) {
                await LocalStorage.save(Config.TOKEN_KEY, response.data["token"]);
            }
        } catch (e) {
            print("++++TokenInterceptors.onResponse() ERROR:");
            print(e);
        }
        return response;
    }

    /// 添加本地授权 token 到头部 headers
    setAuthorization(RequestOptions options) async {
        String token = await LocalStorage.get(Config.TOKEN_KEY);
        if(token != null && token != "") {
            options.headers["Authorization"] = _JWT + token;
        }
        return options;
    }

}