#import "CCPSkillTreeTest.h"

#include "CCPSkillTree.h"

@implementation CCPSkillTreeTest

-(void)setUp {
	tree = [CCPSkillTree tree];
}

-(void)testSkillTree {
	STAssertNotNil([tree lastUpdate],
				   @"Last update for skill tree is nil.");
	STAssertNotNil([tree cachedUntil],
				   @"Cached until for skill tree is nil.");
	
	NSLog(@"SkillTree: Last Update: %@", [[tree lastUpdate] description]);
	NSLog(@"          Cached Until: %@", [[tree cachedUntil] description]);
}

-(void)tearDown {
	[tree release];
}

@end
