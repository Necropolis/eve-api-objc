#import <Cocoa/Cocoa.h>

#import "CCPAccount.h"

@interface TestInfoGetter : NSObject {
	CCPAccount* acct;
}

@property(readwrite, retain) CCPAccount * acct;

-(CCPAccount*)getTestAcct;

-(void)dealloc;

@end
