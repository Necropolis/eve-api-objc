#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"

@class CCPSkillTreeDelegate, CCPSkillDelegate, CCPSkillGroup;

@interface CCPSkillGroupDelegate : CCPXMLDelegate {
	CCPSkillDelegate *child;
	
	CCPSkillGroup *tempGroup;
	
	NSMutableArray *groups;
	NSMutableArray *skills;
	NSMutableArray *allSkills;
	
	NSMutableDictionary *skillsByGroup;
}

@property(readwrite, retain) CCPSkillGroup * tempGroup;

@property(readwrite, retain) NSMutableArray * groups;
@property(readwrite, retain) NSMutableArray * skills;
@property(readwrite, retain) NSMutableArray * allSkills;

@property(readwrite, retain) NSMutableDictionary * skillsByGroup;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
