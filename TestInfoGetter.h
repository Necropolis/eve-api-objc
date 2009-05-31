//
//  TestInfoGetter.h
//  eveapi
//
//  Created by Chris Miller on 5/31/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "CCPAccount.h"

@interface TestInfoGetter : NSObject {
	CCPAccount* acct;
}

@property(readwrite, retain) CCPAccount * acct;

-(CCPAccount*)getTestAcct;

-(void)dealloc;

@end
