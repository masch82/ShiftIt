/*
 Copyright (c) 2010-2011 Filip Krikava

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "FMTNSError+Extras.h"

@implementation NSError (FMTNSErrorExtras)

- (NSString *) fullDescription {
    NSError *error = self;
    NSMutableString *desc = [NSMutableString stringWithCapacity:100];
    
    [desc appendString:@"\nNSError stack trace:\n"];
    do {
        [desc appendFormat:@"%@:%d - %@", [error domain], [error code], [error localizedDescription]];
        error = [[error userInfo] objectForKey:NSUnderlyingErrorKey];
        if (error != nil) {
            [desc appendString:@"\n  Caused-by: "];
        }
    } while (error != nil);
    
    return [NSString stringWithString:desc];
}

@end
