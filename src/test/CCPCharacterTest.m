#import "CCPCharacterTest.h"

@implementation CCPCharacterTest

@synthesize testAcct;

-(void)setUp {
	TestInfoGetter *tg = [[TestInfoGetter alloc] init];
	testAcct = [[tg getTestAcct] retain];
	[tg release];
}

-(void)testCharacterArchiving {
	NSLog(@"Beginning coder support test");
	
	for(CCPCharacter *character in [testAcct characters]) {
		NSString *keyedArchivePath = [NSTemporaryDirectory()
								 stringByAppendingPathComponent:@"testCharacter.keyedarchive"];
		NSString *unkeyedArchivePath = [NSTemporaryDirectory()
										stringByAppendingPathComponent:@"testCharacter.unkeyedarchive"];
		[character update];
		[NSKeyedArchiver archiveRootObject:character toFile:keyedArchivePath];
		[NSArchiver archiveRootObject:character	toFile:unkeyedArchivePath];
		
		CCPCharacter *unArchivedCharacter_keyed;
		CCPCharacter *unArchivedCharacter_unkeyed;
		
		unArchivedCharacter_keyed = [NSKeyedUnarchiver unarchiveObjectWithFile:keyedArchivePath];
		unArchivedCharacter_unkeyed = [NSUnarchiver unarchiveObjectWithFile:unkeyedArchivePath];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(name)
					  description:@"Name"];

		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(race)
					  description:@"Race"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(bloodLine)
					  description:@"Bloodline"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(gender)
					  description:@"Gender"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(corporationName)
					  description:@"Corporation name"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
				   stringSelector:@selector(cloneName)
					  description:@"Clone name"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(corporationID)
					  description:@"Corporation ID"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(cloneSkillPoints)
					  description:@"Clone skill points"];

		STAssertTrue([character balance] == [unArchivedCharacter_keyed balance],
					 @"Balance does not match - keyed archive.  Original: %f, unarchived: %f",
					 [character balance], [unArchivedCharacter_keyed balance]);
		STAssertTrue([character balance] == [unArchivedCharacter_unkeyed balance],
					 @"Balance does not match - unkeyed archive.  Original: %d, unarchived: %d",
					 [character balance], [unArchivedCharacter_unkeyed balance]);
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(baseIntelligence)
					  description:@"Base intelligence"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(basePerception)
					  description:@"Base perception"];
		
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(baseMemory)
					  description:@"Base memory"];
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(baseWillpower)
					  description:@"Base willpower"];
		[self archivingTestHelper:character
							keyed:unArchivedCharacter_keyed
						  unkeyed:unArchivedCharacter_unkeyed
					  intSelector:@selector(baseCharisma)
					  description:@"Base charisma"];
		
		// lastUpdate cachedUntil
	}
	
}

-(void)archivingTestHelper:(CCPCharacter*)original
					 keyed:(CCPCharacter*)keyed
				   unkeyed:(CCPCharacter*)unkeyed
			   intSelector:(SEL)selector
			   description:(NSString*)description {
	
	STAssertTrue([original performSelector:selector] == [keyed performSelector:selector],
				 @"%@ does not match - keyed archive.  Original: %d, unarchived: %d",
				 description, [original performSelector:selector], [keyed performSelector:selector]);
	STAssertTrue([original performSelector:selector] == [unkeyed performSelector:selector],
				 @"%@ does not match - unkeyed archive.  Original: %d, unarchived: %d",
				 description, [original performSelector:selector], [unkeyed performSelector:selector]);
	
}

-(void)archivingTestHelper:(CCPCharacter*)original
					 keyed:(CCPCharacter*)keyed
				   unkeyed:(CCPCharacter*)unkeyed
			stringSelector:(SEL)selector
			   description:(NSString*)description {
	
	STAssertTrue([[original performSelector:selector] isEqualToString:[keyed performSelector:selector]],
				 @"%@ does not match - keyed archive.  Original: %@, unarchived: %@",
				 description, [original performSelector:selector], [keyed performSelector:selector]);
	STAssertTrue([[original performSelector:selector] isEqualToString:[unkeyed performSelector:selector]],
				 @"%@ does not match - unkeyed archive.  Original: %@, unarchived: %@",
				 description, [original performSelector:selector], [unkeyed performSelector:selector]);
	
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
		NSLog(@"   lastUpdate:        %@",	 [[character lastUpdate] description]	);
		NSLog(@"   cachedUntil:       %@",	 [[character cachedUntil] description]	);
		NSLog(@"   race:              %@",   [character race]						);
		NSLog(@"   bloodLine:         %@",   [character bloodLine]					);
		NSLog(@"   gender:            %@",   [character gender]						);
		NSLog(@"   corporationName:   %@",   [character corporationName]			);
		NSLog(@"   cloneName:         %@",   [character cloneName]					);
		NSLog(@"   corporationID:     %d",   [character corporationID]				);
		NSLog(@"   cloneSkillPoints:  %d",   [character cloneSkillPoints]			);
		NSLog(@"   balance:           %.2f", [character balance]					);
		NSLog(@"   baseIntelligence:  %02d", [character baseIntelligence]			);
		NSLog(@"   basePerception:    %02d", [character basePerception]				);
		NSLog(@"   baseMemory:        %02d", [character baseMemory]					);
		NSLog(@"   baseWillpower:     %02d", [character baseWillpower]				);
		NSLog(@"   baseCharisma:      %02d", [character baseCharisma]				);
	}
}

-(void)tearDown {
	[testAcct release];
}

@end
