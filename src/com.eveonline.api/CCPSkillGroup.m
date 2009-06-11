#import "CCPSkillGroup.h"


@implementation CCPSkillGroup

@synthesize groupId;

@synthesize name;

-(void)initWithCoder:(NSCoder*)coder {
	self = [super init];
	if([coder allowsKeyedCoding]) {
		groupId = [coder decodeIntForKey:@"CCPSkillGroup_groupId"];
		
		name = [[coder decodeObjectForKey:@"CCPSkillGroup_name"] retain];
	} else {
		[coder decodeValueOfObjCType:@encode(int) at:&groupId];
		
		name = [[coder decodeObject] retain];
	}
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeInt:groupId forKey:@"CCPSkillGroup_groupId"];
		
		[coder encodeObject:name forKey:@"CCPSkillGroup_name"];
	} else {
		[coder encodeValueOfObjCType:@encode(int) at:&groupId];
		
		[coder encodeObject:name];
	}
}

@end
