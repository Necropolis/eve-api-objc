#import "CCPCharacterTest.h"

@implementation CCPCharacterTest

@synthesize testAcct;

-(void)setUp {
	TestInfoGetter *tg = [[TestInfoGetter alloc] init];
	testAcct = [[tg getTestAcct] retain];
	[tg release];
}

-(void)testCharacterSheetRetrieval {
	for(CCPCharacter *character in [testAcct characters]) {
		STAssertTrue([character name] != nil,
					 @"Character name is nil!");
		NSLog(@"Character %@:", [character name]);
		STAssertTrue([character race] != nil,
					 @"%@ race is nil!", [character name]);
		NSLog(@"   race:             %@", [character race]);
		STAssertTrue([character bloodLine] != nil,
					 @"%@ apparently has no ancestors!", [character name]);
		NSLog(@"   bloodLine:        %@", [character bloodLine]);
		STAssertTrue([character gender] != nil,
					 @"%@ is apparently a hermaphrodite!", [character name]);
		NSLog(@"   gender:           %@", [character gender]);
		STAssertTrue([character corporationName] != nil,
					 @"%@ doesn't belong to any corporation!", [character name]);
		NSLog(@"   corporationName:  %@", [character corporationName]);
		STAssertTrue([character cloneName] != nil,
					 @"%@ doesn't have a clone grade!", [character name]);
		NSLog(@"   cloneName:        %@", [character cloneName]);
		STAssertTrue([character corporationID] > 0,
					 @"%@ belongs to a nonexistant corporation!", [character name]);
		NSLog(@"   corporationID:    %d", [character corporationID]);
		STAssertTrue([character cloneSkillPoints] > 0,
					 @"%@ has worse than the free clone grade!", [character name]);
		NSLog(@"   cloneSkillPoints: %d", [character cloneSkillPoints]);
		STAssertTrue([character balance] >= 0.00,
					 @"%@ has less than no money!", [character name]);
		NSLog(@"   balance:          %.2f", [character balance]);
	}
}

-(void)tearDown {
	[testAcct release];
}

@end
