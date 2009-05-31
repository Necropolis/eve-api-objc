#import <SenTestingKit/SenTestingKit.h>

#import "CCPAccount.h"
#import "TestInfoGetter.h"

@interface CCPAccountTest : SenTestCase {
	CCPAccount *testAcct;
}
-(void)setUp;

-(void)testCharListRetrieval;
-(void)testCoderSupport;

-(void)tearDown;
@end
