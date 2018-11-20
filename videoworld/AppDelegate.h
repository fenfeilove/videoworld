//
//  AppDelegate.h
//  videoworld
//
//  Created by francis zhuo on 2018/11/17.
//  Copyright © 2018 fenfeilove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

