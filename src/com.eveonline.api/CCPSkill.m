#import "CCPSkill.h"

#include<math.h>

@implementation CCPSkill

@synthesize skillId;
@synthesize groupId;

@synthesize name;
@synthesize description;

@synthesize rank;

@synthesize reqs;

@synthesize primary;
@synthesize secondary;

-(id)initWithCoder:(NSCoder*)coder {
	self = [super init];
	if([coder allowsKeyedCoding]) {
		skillId = [coder decodeIntForKey:@"CCPSkill_skillId"];
		groupId = [coder decodeIntForKey:@"CCPSkill_groupId"];
		
		name = [[coder decodeObjectForKey:@"CCPSkill_name"] retain];
		description = [[coder decodeObjectForKey:@"CCPSkill_description"] retain];
		
		rank = [coder decodeIntForKey:@"CCPSkill_rank"];
		
		reqs = [[coder decodeObjectForKey:@"CCPSkill_reqs"] retain];
		
		primary = [[coder decodeObjectForKey:@"CCPSkill_primary"] retain];
		secondary = [[coder decodeObjectForKey:@"CCPSkill_secondary"] retain];
	} else {
		[coder decodeValueOfObjCType:@encode(int) at:&skillId];
		[coder decodeValueOfObjCType:@encode(int) at:&groupId];
		
		name = [[coder decodeObject] retain];
		description = [[coder decodeObject] retain];
		
		[coder decodeValueOfObjCType:@encode(int) at:&rank];
		
		reqs = [[coder decodeObject] retain];
		
		primary = [[coder decodeObject] retain];
		secondary = [[coder decodeObject] retain];
	}
}

//  SkillPointsAtLevel = 2^((2.5 * SkillLevel) - 2.5) * 250 * SkillRank
-(int)skillPoints:(int)atLevel {
	return (int)round(pow(2.0f, (2.5f * (double)atLevel) - 2.5f) * 250.0f * (double)[self rank]);
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeInt:skillId forKey:@"CCPSkill_skillId"];
		[coder encodeInt:groupId forKey:@"CCPSkill_groupId"];
		
		[coder encodeObject:name forKey:@"CCPSkill_name"];
		[coder encodeObject:description forKey:@"CCPSkill_description"];
		
		[coder encodeInt:rank forKey:@"CCPSkill_rank"];
		
		[coder encodeObject:reqs forKey:@"CCPSkill_reqs"];
		
		[coder encodeObject:primary forKey:@"CCPSkill_primary"];
		[coder encodeObject:secondary forKey:@"CCPSkill_secondary"];
	} else {
		[coder encodeValueOfObjCType:@encode(int) at:&skillId];
		[coder encodeValueOfObjCType:@encode(int) at:&groupId];
		
		[coder encodeObject:name];
		[coder encodeObject:description];
		
		[coder encodeValueOfObjCType:@encode(int) at:&rank];
		
		[coder encodeObject:reqs];
		
		[coder encodeObject:primary];
		[coder encodeObject:secondary];
	}
}

-(void)dealloc {
	[name release];
	[description release];
	
	[reqs release];
	
	[primary release];
	[secondary release];
	
	[super dealloc];
}

@end
