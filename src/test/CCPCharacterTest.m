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
		STAssertTrue([character race] != nil,
					 @"%@ race is nil!", [character name]);

		STAssertTrue([character bloodLine] != nil,
					 @"%@ apparently has no ancestors!", [character name]);

		STAssertTrue([character gender] != nil,
					 @"%@ is apparently a hermaphrodite!", [character name]);

		STAssertTrue([character corporationName] != nil,
					 @"%@ doesn't belong to any corporation!", [character name]);

		STAssertTrue([character cloneName] != nil,
					 @"%@ doesn't have a clone grade!", [character name]);

		STAssertTrue([character corporationID] > 0,
					 @"%@ belongs to a nonexistant corporation!", [character name]);

		STAssertTrue([character cloneSkillPoints] > 0,
					 @"%@ has worse than the free clone grade!", [character name]);

		STAssertTrue([character balance] >= 0.00,
					 @"%@ has less than no money!", [character name]);

		STAssertTrue([character baseIntelligence] > 0,
					 @"%@ is really stupid.", [character name]);

		STAssertTrue([character basePerception] > 0,
					 @"%@ can't perceive worth a darn.", [character name]);

		STAssertTrue([character baseMemory] > 0,
					 @"%@ can't remember squat.", [character name]);

		STAssertTrue([character baseWillpower] > 0,
					 @"%@ must be lethargic", [character name]);

		STAssertTrue([character baseCharisma] > 0,
					 @"%@ must be a misanthrope.", [character name]);
		
		NSLog(@"Character %@:", [character name]);
		NSLog(@"   lastUpdate:        %@",	 [[character lastUpdate] description]);
		NSLog(@"   race:              %@",   [character race]				);
		NSLog(@"   bloodLine:         %@",   [character bloodLine]			);
		NSLog(@"   gender:            %@",   [character gender]				);
		NSLog(@"   corporationName:   %@",   [character corporationName]	);
		NSLog(@"   cloneName:         %@",   [character cloneName]			);
		NSLog(@"   corporationID:     %d",   [character corporationID]		);
		NSLog(@"   cloneSkillPoints:  %d",   [character cloneSkillPoints]	);
		NSLog(@"   balance:           %.2f", [character balance]			);
		NSLog(@"   baseIntelligence:  %02d", [character baseIntelligence]	);
		NSLog(@"   basePerception:    %02d", [character basePerception]		);
		NSLog(@"   baseMemory:        %02d", [character baseMemory]			);
		NSLog(@"   baseWillpower:     %02d", [character baseWillpower]		);
		NSLog(@"   baseCharisma:      %02d", [character baseCharisma]		);
	}
}

-(void)tearDown {
	[testAcct release];
}

@end
