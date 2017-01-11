//
//  AppDelegate.m
//  Loong Account Book
//
//  Created by 神龟网-梁梓龙 on 2016/12/24.
//  Copyright © 2016年 梁梓龙. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //应用打开的时候检测是否存在如果存在则把包内的数据库文件复制到documents目录内作为初始文件。
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *databaseDirectory = [documentsPath stringByAppendingPathComponent:@"Database"];
    NSLog(@"sandbox path : %@", databaseDirectory);
    if (![[NSFileManager defaultManager]fileExistsAtPath:[databaseDirectory stringByAppendingPathComponent:@"AccountBook.sql"]]) {
        NSLog(@"沙盒中不存在数据库文件！");
        //创建Database目录
        if ([[NSFileManager defaultManager]createDirectoryAtPath:databaseDirectory withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"Database目录已存在或创建成功！");
        } else {
            NSLog(@"Database目录创建失败！");
        }
        //复制数据库文件到沙盒中
        NSString *dbBundlePath = [[NSBundle mainBundle]pathForResource:@"DBFile/AccountBook" ofType:@"sql"];
        BOOL success = [[NSFileManager defaultManager]copyItemAtPath:dbBundlePath toPath:[databaseDirectory stringByAppendingPathComponent:@"AccountBook.sql"] error:nil];
        if (success) {
            NSLog(@"数据库文件复制成功！");
        } else {
            NSLog(@"数据库文件复制失败！");
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
