//
//  LCGetWiFiSSID.m
//  WiFi-SSID
//
//  Created by MoGo on 16/3/24.
//  Copyright © 2016年 李策--MoGo--. All rights reserved.
//

#import "LCGetWiFiSSID.h"
#import <CFNetwork/CFNetwork.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#include <sys/types.h>
#include <sys/sysctl.h>
@implementation LCGetWiFiSSID
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

+ (NSString *)localIPAddress
{
    NSString *localIP = nil;
    struct ifaddrs *addrs;
    if (getifaddrs(&addrs)==0) {
        const struct ifaddrs *cursor = addrs;
        while (cursor != NULL) {
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])
                    // Wi-Fi adapter
                {
                    localIP = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
                    break;
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return localIP;
}

@end
