#import "CCPAccountTest.h"

@implementation CCPAccountTest
-(void)setUp {
	TestInfoGetter *tg = [[TestInfoGetter alloc] init];
	testAcct = [[tg getTestAcct] retain];
	[tg release];
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
