#import <Cocoa/Cocoa.h>

@interface CCPSkillGroup : NSObject<NSCoding> {
	int groupId;		//!< Unique numeric identifier representing this group.
	
	NSString *name;		//!< Given HL indentifier representing this group.
}

@property(readwrite, assign) int groupId;

@property(readwrite, retain) NSString * name;

-(void)initWithCoder:(NSCoder*)coder;

-(void)encodeWithCoder:(NSCoder*)coder;

@end
