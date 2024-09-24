package com.singsmiya.hellok8s.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @author singsmiya
 * @date 2024/9/24 09:57
 */
@RestController
public class HelloController {
    @RequestMapping("/hello")
    public String hello() {
        try {
            // 获取本地主机名
            InetAddress localhost = InetAddress.getLocalHost();

            // 获取本地 IP 地址
            String ipAddress = localhost.getHostAddress();
            return "hello k8s：" + ipAddress;
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return "hello k8s";
    }
}
