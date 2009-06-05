#import <Cocoa/Cocoa.h>


@interface CCPXMLDelegate : NSObject {
	id mutator;
	id parent;
	NSMutableString *tempString;
}

@property(readwrite, retain) id mutator;
@property(readwrite, retain) id parent;
@property(readwrite, retain) NSMutableString * tempString;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent;

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

-(void)cleanTempString;

-(void)dealloc;

@end
