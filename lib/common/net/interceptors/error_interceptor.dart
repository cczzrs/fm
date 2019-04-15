import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:fm/common/net/net_api_config.dart';

/// 是否需要弹提示
const NOT_TIP_KEY = "noTip";

/**
 * 错误拦截
 * Created by cczzrs
 * on 2019/4/15.
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    /// 网络检查
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(NetCode.errorHandleFunction(NetCode.NETWORK_ERROR, "", false), false, NetCode.NETWORK_ERROR));
    }
    return options;
  }
}
