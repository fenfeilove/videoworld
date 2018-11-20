//
//  FFLoginMgr.h
//  videoworld
//
//  Created by francis zhuo on 2018/11/17.
//  Copyright © 2018 fenfeilove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFLoginMgr : NSObject
- (BOOL)loginWithAccount:(NSString*)account token:(NSString*)token;
- (BOOL)registWithAccount:(NSString*)account token:(NSString*)token;
- (BOOL)checkAccount:(NSString*)account;
@end
