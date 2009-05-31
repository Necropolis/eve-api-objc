#import "CCPAccountTest.h"

@implementation CCPAccountTest
-(void)setUp {
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
	
	testAcct = [[CCPAccount alloc] initWithAcctId:acctId
										ltdApiKey:ltdApiKey
									   ultdApiKey:ultdApiKey];
	
	[tokenizedString release];
	[testAcctFile release];
}

-(void)testCharListRetrieval {
	
}
-(void)testCoderSupport {
	NSString *archivePath = [NSTemporaryDirectory() 
							 stringByAppendingPathComponent:@"testAcct.archive"]; 
	[NSKeyedArchiver archiveRootObject:testAcct
								toFile:archivePath];
	
	CCPAccount *unarchivedAcct;
	unarchivedAcct = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	STAssertEquals([unarchivedAcct acctId], [testAcct acctId],
				   @"Account numbers differ after archiving");
	STAssertTrue([[unarchivedAcct ltdApiKey] isEqualToString:[testAcct ltdApiKey]],
				 @"Account limited API keys differ after archiving");
	STAssertTrue([[unarchivedAcct ultdApiKey] isEqualToString:[testAcct ultdApiKey]],
				 @"Account unlimited API keys differ after archiving");
	// TODO: Add tests for characters when CCPCharacter is NSCoding compliant
}

-(void)tearDown {
	[testAcct release];
}
@end
