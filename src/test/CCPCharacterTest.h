#import <SenTestingKit/SenTestingKit.h>

#import "CCPAccount.h"
#import "CCPCharacter.h"
#import "TestInfoGetter.h"

@interface CCPCharacterTest : SenTestCase {
	CCPAccount *testAcct;
}

@property(readwrite, retain) CCPAccount * testAcct;

-(void)setUp;

-(void)testCharacterSheetRetrieval;

-(void)tearDown;

@end
