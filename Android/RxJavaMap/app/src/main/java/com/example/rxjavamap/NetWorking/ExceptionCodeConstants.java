package com.example.rxjavamap.NetWorking;

/**
 * 约定异常
 */
public class ExceptionCodeConstants {
    /**
     * 未知错误
     */
    public static final int UNKNOWN = 1000;
    /**
     * 解析错误
     */
    public static final int PARSE_ERROR = UNKNOWN + 1;
    /**
     * 网络错误
     */
    public static final int NETWORD_ERROR = PARSE_ERROR + 1;
    /**
     * 协议出错
     */
    public static final int HTTP_ERROR = NETWORD_ERROR + 1;

    /**
     * 证书出错
     */
    public static final int SSL_ERROR = HTTP_ERROR + 1;

    /**
     * 连接超时
     */
    public static final int TIMEOUT_ERROR = SSL_ERROR + 1;

    /**
     * 调用错误
     */
    public static final int INVOKE_ERROR = TIMEOUT_ERROR + 1;
    /**
     * 类转换错误
     */
    public static final int CAST_ERROR = INVOKE_ERROR + 1;
    /**
     * 请求取消
     */
    public static final int REQUEST_CANCEL = CAST_ERROR + 1;
    /**
     * 未知主机错误
     */
    public static final int UNKNOWN_HOST_ERROR = REQUEST_CANCEL + 1;

    /**
     * 空指针错误
     */
    public static final int NULLPOINTER_EXCEPTION = UNKNOWN_HOST_ERROR + 1;
}
