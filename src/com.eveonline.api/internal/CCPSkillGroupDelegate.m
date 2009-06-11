#import "CCPSkillGroupDelegate.h"

#import "CCPSkillTree.h"
#import "CCPSkillGroup.h"
#import "CCPSkillDelegate.h"

@implementation CCPSkillGroupDelegate

@synthesize tempGroup;

@synthesize groups;
@synthesize skills;
@synthesize allSkills;

@synthesize skillsByGroup;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent {
	self = [super initWithMutator:_mutator
						   parent:_parent];
	
	groups = [[NSMutableArray alloc] init];
	skills = [[NSMutableArray alloc] init];
	allSkills = [[NSMutableArray alloc] init];
	
	skillsByGroup = [[NSMutableDictionary alloc] init];
	
	return self;
}

// <row groupName="Corporation Management" groupID="266">
-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"row"]) {
		[self setTempGroup:[[CCPSkillGroup alloc] init]];
		
		[tempGroup setName:[attributeDict objectForKey:@"groupName"]];
		[tempGroup setGroupId:[[attributeDict objectForKey:@"groupID"] intValue]];
		
		[groups addObject:tempGroup];
//		[mutator setGroups:[[mutator groups] arrayByAddingObject:tempGroup]];
//		[groups addObject:self.tempGroup];
		
	// <rowset name="skills" key="typeID" columns="typeName,groupID,typeID">
	} else if([elementName isEqualToString:@"rowset"]
			  &&[[attributeDict objectForKey:@"name"] isEqualToString:@"skills"]) {
		
		if(!child)
			child = [[CCPSkillDelegate alloc] initWithMutator:mutator
													   parent:self];
		[parser setDelegate:child];
	}
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"row"]) {
		// end of rowset
		
		[allSkills addObjectsFromArray:skills];
		[skillsByGroup setValue:[[NSArray alloc] initWithArray:skills]
						 forKey:[tempGroup name]];
		[self setSkills:[[NSMutableArray alloc] init]];
		
	} else if([elementName isEqualToString:@"rowset"]) {

		[mutator setGroups:[[NSArray alloc] initWithArray:groups]];
		[mutator setSkills:[[NSArray alloc] initWithArray:allSkills]];
		
		[mutator setSkillsByGroup:[[NSDictionary alloc] initWithDictionary:skillsByGroup]];
		
		[parser setDelegate:parent];
	}
	
}

-(void)dealloc {
	[parent release];
	[child release];
	
	[tempGroup release];
	
	[groups release];
	[skills release];
	
	[super dealloc];
}

@end
