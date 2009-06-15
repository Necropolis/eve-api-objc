#import "CCPSkillDelegate.h"

#import "CCPSkill.h"
#import "CCPSkillGroupDelegate.h"
/*
 <rowset name="skills" key="typeID" columns="typeName,groupID,typeID">
	 <row typeName="Anchoring" groupID="266" typeID="11584">
		 <rowset name="requiredSkills" key="typeID" columns="typeID,skillLevel" />
		 <rowset name="skillBonusCollection" key="bonusType" columns="bonusType,bonusValue">
			 <row bonusType="canNotBeTrainedOnTrial" bonusValue="1" />
		 </rowset>
	 </row>
 */
@implementation CCPSkillDelegate

@synthesize tempSkill;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent {
	self = [super initWithMutator:_mutator
						   parent:_parent];
	
	rowsets = 0;
	
	return self;
}

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"rowset"])
		rowsets++;
	// <row typeName="Anchoring" groupID="266" typeID="11584">
	else if([elementName isEqualToString:@"row"]&&rowsets<1) {
		[self setTempSkill:[[CCPSkill alloc] init]];
		
		[tempSkill setName:[attributeDict objectForKey:@"typeName"]];
		[tempSkill setGroupId:[[attributeDict objectForKey:@"groupID"] intValue]];
		[tempSkill setSkillId:[[attributeDict objectForKey:@"typeID"] intValue]];
		
	}
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	[self cleanTempString];
	
	if([elementName isEqualToString:@"row"]&&rowsets<1) {
		[[parent skills] addObject:tempSkill];
	} else if([elementName isEqualToString:@"rowset"]) {
		if(rowsets<1)
			[parser setDelegate:parent];
		else
			rowsets--;
		return;
	// <description>Skill at Anchoring Deployables. Can not be trained on Trial Accounts.</description>
	} else if([elementName isEqualToString:@"description"]) {
		[tempSkill setDescription:tempString];
	// <rank>3</rank>
	} else if([elementName isEqualToString:@"rank"]) {
		[tempSkill setRank:[tempString intValue]];
	// <primaryAttribute>memory</primaryAttribute>
	} else if([elementName isEqualToString:@"primaryAttribute"]) {
		[tempSkill setPrimary:tempString];
	// <secondaryAttribute>charisma</secondaryAttribute>
	} else if([elementName isEqualToString:@"secondaryAttribute"]) {
		[tempSkill setSecondary:tempString];
	}
	
	[self setTempString:nil];
	
}

-(void)dealloc {
	[tempSkill release];
	
	[super dealloc];
}

@end
