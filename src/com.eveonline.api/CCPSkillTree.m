#import "CCPSkillTree.h"

#import "CCPSkillTreeDelegate.h"

@implementation CCPSkillTree

@synthesize skills;
@synthesize groups;

@synthesize skillsByGroup;

@synthesize lastUpdate;
@synthesize cachedUntil;

static CCPSkillTree *tree;

+(id)tree {
	if(!tree)
		tree = [[CCPSkillTree alloc] init];
	return tree;
}

-(id)initWithCoder:(NSCoder*)coder {
	self = [super init];
	if([coder allowsKeyedCoding]) {
		skills = [[coder decodeObjectForKey:@"CCPSkillTree_skills"] retain];
		groups = [[coder decodeObjectForKey:@"CCPSkillTree_groups"] retain];
		
		skillsByGroup = [[coder decodeObjectForKey:@"CCPSkillTree_skillsByGroup"] retain];
		
		lastUpdate = [[coder decodeObjectForKey:@"CCPSkillTree_lastUpdate"] retain];
		cachedUntil = [[coder decodeObjectForKey:@"CCPSkillTree_cachedUntil"] retain];		
	} else {
		skills = [[coder decodeObject] retain];
		groups = [[coder decodeObject] retain];
		
		skillsByGroup = [[coder decodeObject] retain];
		
		lastUpdate = [[coder decodeObject] retain];
		cachedUntil = [[coder decodeObject] retain];
	}
	return self;
}

-(NSArray*)skills {
	if(!skills)
		[self update];
	return skills;
}

-(NSArray*)groups {
	if(!groups)
		[self update];
	return groups;
}

-(NSDictionary*)skillsByGroup {
	if(!skillsByGroup)
		[self update];
	return skillsByGroup;
}

-(NSDate*)lastUpdate {
	if(!lastUpdate)
		[self update];
	return lastUpdate;
}

-(NSDate*)cachedUntil {
	if(!cachedUntil)
		[self update];
	return cachedUntil;
}

-(void)update {
	NSURL *skillTreeUrl = [[NSURL alloc]
						   initWithString:@"http://api.eve-online.com/eve/SkillTree.xml.aspx"];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:skillTreeUrl];
	
	delegate = [[CCPSkillTreeDelegate alloc] initWithMutator:self
													  parent:nil];
	[parser setDelegate:delegate];
	
	[parser parse];
	
	[delegate release];
	[parser release];
	[skillTreeUrl release];
}

-(void)encodeWithCoder:(NSCoder*)coder {
	if([coder allowsKeyedCoding]) {
		[coder encodeObject:skills forKey:@"CCPSkillTree_skills"];
		[coder encodeObject:groups forKey:@"CCPSkillTree_groups"];
		
		[coder encodeObject:skillsByGroup forKey:@"CCPSkillTree_skillByGroup"];
		
		[coder encodeObject:lastUpdate forKey:@"CCPSkillTree_lastUpdate"];
		[coder encodeObject:cachedUntil forKey:@"CCPSkillTree_cachedUntil"];
	} else {
		[coder encodeObject:skills];
		[coder encodeObject:groups];
		
		[coder encodeObject:skillsByGroup];
		
		[coder encodeObject:lastUpdate];
		[coder encodeObject:cachedUntil];
	}
}

-(void)dealloc {
	[skills release];
	
	[lastUpdate release];
	[cachedUntil release];
	
	[super dealloc];
}

@end
