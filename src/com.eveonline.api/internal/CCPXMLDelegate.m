#import "CCPXMLDelegate.h"


@implementation CCPXMLDelegate

@synthesize mutator;
@synthesize parent;
@synthesize tempString;

-(id)initWithMutator:(id)_mutator
			  parent:(id)_parent {
	[super init];
	
	[self setMutator:_mutator];
	[self setParent:_parent];
	
	return self;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!tempString)
		tempString = [[NSMutableString alloc] init];
	
	[tempString appendString:string];
	
}

-(void)cleanTempString {
	
	int i; char c;
	for(i = 0; i < [tempString length]; ++i) {
		c = [tempString characterAtIndex:i];
		if(c != ' ' && c != '\t' && c != '\r' && c != '\n')
			break;
	}
	
	[self setTempString:
	 [NSMutableString stringWithString:
	  [tempString substringFromIndex:i]]];
	
}

-(void)dealloc {
	[mutator release];
	[parent release];
	[tempString release];
	
	[super dealloc];
}

@end
