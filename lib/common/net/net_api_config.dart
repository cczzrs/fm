import 'package:event_bus/event_bus.dart';
import 'package:fm/common/local/config.dart';

/// 网络状态编码
class NetCode {
    /// 网络错误
    static const NETWORK_ERROR = -1;

    /// 网络超时
    static const NETWORK_TIMEOUT = -2;

    /// 网络返回数据格式化一次
    static const NETWORK_JSON_EXCEPTION = -3;

    static const SUCCESS = 200;

    static final EventBus eventBus = new EventBus();

    static errorHandleFunction(code, message, noTip) {
        if (noTip) {
            return message;
        }
        eventBus.fire(new HttpErrorEvent(code, message));
        return message;
    }
}

/// 网络结果模型 - 异常结果
class HttpErrorEvent {
    final int code;
    final String message;

    HttpErrorEvent(this.code, this.message);
}

/// 网络结果模型
class ResultData {
    var data;
    bool result;
    int code;
    var headers;

    ResultData(this.data, this.result, this.code, {this.headers});
}



/// 地址数据
class Address {
    /// APP service host
    static const String _host = "https://m.0-0.cc/";
    /// 用户基本信息
    static Map<String, dynamic> user = {"id": null, "name": ""};

    /// APP 版本信息
    static final String updateUrl = _host + "version/";
    /// 网络结果数据模型

    /// 验证并更新本地授权 token
    static final refreshToken = _host + "api-token-refresh/";
    /// 网络结果数据模型

    /// 获取用户信息
    static final myUserInfo = _host + "userInfo/1/";

    /// 获取短信验证码
    static final getVerifyCode = _host + "code/";

    /// 登录获取授权 token
    static final login = _host + "login/";

    ///处理分页参数
    static getPageParams(tab, page, [pageSize = Config.PAGE_SIZE]) {
        if (page != null) {
            if (pageSize != null) {
                return "${tab}page=$page&per_page=$pageSize";
            } else {
                return "${tab}page=$page";
            }
        } else {
            return "";
        }
    }
}
