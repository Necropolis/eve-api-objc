//
//  TestInfoGetter.m
//  eveapi
//
//  Created by Chris Miller on 5/31/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestInfoGetter.h"


@implementation TestInfoGetter

@synthesize acct;

-(CCPAccount*)getTestAcct {
	int acctId;
	NSString *ltdApiKey;
	NSString *ultdApiKey;
	NSString *testAcctFile = [[NSString alloc] initWithContentsOfFile:@"testAcct"];
	NSRange r;
	r.location=0;
	NSMutableArray *tokenizedString = [[NSMutableArray alloc] init];
	
	for(int idx=0;idx<[testAcctFile length];++idx) {
		if([testAcctFile characterAtIndex:idx]=='\n') {
			r.length = idx - r.location;
			[tokenizedString addObject:[testAcctFile substringWithRange:r]];
			r.location = idx+1;
		}
	}
	
	for(NSMutableString *ln in tokenizedString) {
		if([ln characterAtIndex:0]=='#')
			continue;
		
		if([ln length]<4)
			continue;
		if([[ln substringToIndex:4] isEqualToString:@"uid:"]) {
			acctId = [[ln substringFromIndex:3] intValue];
		}
		
		if([ln length]<10)
			continue;
		if([[ln substringToIndex:10] isEqualToString:@"ltdApiKey:"]) {
			ltdApiKey = [ln substringFromIndex:9];
			if([ltdApiKey characterAtIndex:0]==' ')
				ltdApiKey = [ltdApiKey substringFromIndex:1];
		}
		
		if([ln length]<11)
			continue;
		if([[ln substringToIndex:11] isEqualToString:@"ultdApiKey:"]) {
			ultdApiKey = [ln substringFromIndex:10];
			if([ultdApiKey characterAtIndex:0]==' ')
				ultdApiKey = [ultdApiKey substringFromIndex:1];
		}
	}
	
	acct = [[CCPAccount alloc] initWithAcctId:acctId
									ltdApiKey:ltdApiKey
								   ultdApiKey:ultdApiKey];
	
	[tokenizedString release];
	[testAcctFile release];
	
	return acct;
}

-(void)dealloc {
	[acct release];
	[super dealloc];
}

@end
