//
//  TOConsoleController.m
//  Tosti
//
//  Created by Leo on 10/18/12.
//  Copyright (c) 2012 Tosti. All rights reserved.
//

#import "RunCommand.h"
#import <Core/TOMem.h>
#import <Core/TOEval.h>
#import <Core/TORead.h>
#import <SynthesizeSingleton.h>

@interface RunCommand ()
@property (nonatomic, copy) NSString *logBuffer;
@end

@implementation RunCommand {
    TOEval *_eval;
    TOMem *_mem;
    NSString *_logBuffer;
}

SYNTHESIZE_SINGLETON_FOR_CLASS(RunCommand)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    TOMem *mem = [TOMem eval:@"[[TOMem alloc] init]"];
    [mem eval:@"TO.load(_mem,TO)"];
    [mem eval:@"load(_mem,TOMath)"];
    [mem eval:@"load(_mem,TOCocoa)"];
    [mem set:self name:@"self"];
    _mem = mem;

    self.logBuffer = @"";
}

- (NSString *)run:(NSString *)command
{
    [self log:[[NSString alloc] initWithFormat:@"run: %@", command]];
    TORead *read = [[TORead alloc] initWithCode:command];
    read.delegate = self;
    id statement = [read read];
    if (!read.warnings) {
        TOEval *eval = [[TOEval alloc] initWithStatement:statement mem:_mem];
        eval.source = command;
        eval.delegate = self;
        [_eval abort]; _eval = eval;
        id result = [eval eval];
        NSString *res = [self.logBuffer stringByAppendingFormat:@"%@\n", result];
        self.logBuffer = @"";
        return res;
    } else {
        return @"break";
    }
}

- (void)log:(NSString *)string
{
    self.logBuffer = [self.logBuffer stringByAppendingFormat:@"%@\n", string];
}

@end
