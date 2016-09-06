//
//  AppDelegate.m
//  TestAIBaseFramework
//
//  Created by wuyoujian on 16/7/18.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import "AppDelegate.h"
#import <AIShare/SharedManager.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WXApi.h"


// 分享相关
#define QQSDKAppKey                 @"alkvsxWc7Eh7GwGk"
#define QQSDKAppId                  @"1105106734"

#define WeiXinSDKAppSecret          @"dce5699086e990df3104052ce298f573"
#define WeiXinSDKAppId              @"wx7a296d05150143e5"

#define WeiboAppKey                 @"2045436852"

@interface AppDelegate ()
@end



@implementation AppDelegate

- (void)registerSharedSDK {
    
    SharedPlatformSDKInfo *sdk1 = [SharedPlatformSDKInfo platform:AISharedPlatformWechat appId:WeiXinSDKAppId secret:WeiXinSDKAppSecret];
    SharedPlatformSDKInfo *sdk2 = [SharedPlatformSDKInfo platform:AISharedPlatformQQ appId:QQSDKAppId secret:QQSDKAppKey];
    SharedPlatformSDKInfo *sdk3 = [SharedPlatformSDKInfo platform:AISharedPlatformWeibo appId:WeiboAppKey secret:WeiboAppKey];
    [[SharedManager sharedSharedManager] registerSharedPlatform:[NSArray arrayWithObjects:sdk1,sdk2,sdk3, nil]];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if ([[url absoluteString] hasPrefix:WeiXinSDKAppId]) {
        //
        return [WXApi handleOpenURL:url delegate:[SharedManager sharedSharedManager].wxCallback];
    } else if ([[url absoluteString] hasPrefix:QQSDKAppId]) {
        return [QQApiInterface handleOpenURL:url delegate:[SharedManager sharedSharedManager].qqCallback];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([[url absoluteString] hasPrefix:WeiXinSDKAppId]) {
        //
        return [WXApi handleOpenURL:url delegate:[SharedManager sharedSharedManager].wxCallback];
    } else if ([[url absoluteString] hasPrefix:QQSDKAppId]) {
        return [QQApiInterface handleOpenURL:url delegate:[SharedManager sharedSharedManager].qqCallback];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    if ([[url absoluteString] hasPrefix:WeiXinSDKAppId]) {
        //
        return [WXApi handleOpenURL:url delegate:[SharedManager sharedSharedManager].wxCallback];
    } else if ([[url absoluteString] hasPrefix:QQSDKAppId]) {
        return [QQApiInterface handleOpenURL:url delegate:[SharedManager sharedSharedManager].qqCallback];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self registerSharedSDK];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
