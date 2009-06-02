#import "CCPAccountTest.h"

@implementation CCPAccountTest
-(void)setUp {
	TestInfoGetter *tg = [[TestInfoGetter alloc] init];
	testAcct = [[tg getTestAcct] retain];
	[tg release];
}

-(void)testCharListRetrieval {
	NSLog(@"Beginning character list retrieval test");
	NSLog(@"  User ID:           %d", [testAcct acctId]);
	NSLog(@"  Limited API Key:   %@", [testAcct ltdApiKey]);
	NSLog(@"  Unlimited API Key: %@", [testAcct ultdApiKey]);
	NSMutableArray *characters = [testAcct characters];
	STAssertTrue([characters count]>0,
				 @"Given account has no characters!");
	[characters release];
}
-(void)testCoderSupport {
	NSLog(@"Beginning coder support test");
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
}

-(void)tearDown {
	[testAcct release];
}
@end
