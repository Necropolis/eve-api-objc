#import <Cocoa/Cocoa.h>

#import "CCPXMLDelegate.h"

@class CCPSkill;

@interface CCPSkillDelegate : CCPXMLDelegate {
	int rowsets;
	
	CCPSkill *tempSkill;
}

@property(readwrite, retain) CCPSkill * tempSkill;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent;

-(void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
   attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)dealloc;

@end
