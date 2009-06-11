#import "CCPSkillTreeTest.h"

#import "CCPSkillTree.h"
#import "CCPSkillGroup.h"
#import "CCPSkill.h"

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
	
	for(CCPSkillGroup *grp in [tree groups]) {
		NSLog(@"Skill Group: %@ (%d)",
			  [grp name],
			  [grp groupId]);
		for(CCPSkill *sk in [[tree skillsByGroup] objectForKey:[grp name]]) {
			NSLog(@"    %@ (%d)",
				  [sk name],
				  [sk skillId]);
		}
	}
	
}

-(void)tearDown {
	[tree release];
}

@end
