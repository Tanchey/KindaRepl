//
//  TOConsoleController.h
//  Tosti
//
//  Created by Leo on 10/18/12.
//  Copyright (c) 2012 Tosti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Core/TOMem.h>

@interface RunCommand : NSObject <TODelegate>
+ (RunCommand *)sharedRunCommand;
- (NSString *)run:(NSString *)command;
@end

