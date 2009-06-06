#import <SenTestingKit/SenTestingKit.h>

#import "CCPAccount.h"
#import "CCPCharacter.h"
#import "TestInfoGetter.h"

@interface CCPCharacterTest : SenTestCase {
	CCPAccount *testAcct;
}

@property(readwrite, retain) CCPAccount * testAcct;

-(void)setUp;

-(void)testCharacterArchiving;

-(void)archivingTestHelper:(CCPCharacter*)original
					 keyed:(CCPCharacter*)keyed
				   unkeyed:(CCPCharacter*)unkeyed
			   intSelector:(SEL)selector
			   description:(NSString*)description;

-(void)archivingTestHelper:(CCPCharacter*)original
					 keyed:(CCPCharacter*)keyed
				   unkeyed:(CCPCharacter*)unkeyed
			stringSelector:(SEL)selector
			   description:(NSString*)description;

-(void)testCharacterSheetRetrieval;

-(void)tearDown;

@end
