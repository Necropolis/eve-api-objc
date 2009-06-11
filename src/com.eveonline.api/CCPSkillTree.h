#import <Cocoa/Cocoa.h>

@class CCPSkillTreeDelegate;

/**
 * Singleton-patterned collection of all the public skills in the game.  This object has full
 * NSCoding support, so you can store or stream it like any other object.  Use this in the
 * event that you do not wish to re-download and re-parse the skill tree from the EVE API server.
 */
@interface CCPSkillTree : NSObject<NSCoding> {
	NSArray *skills;					//!< List of all skills.
	NSArray *groups;					//!< List of all skill groups.
	
	NSDictionary *skillsByGroup;		//!< List of lists of skills, organised by group (specifically by group ID).
	
	NSDate *lastUpdate;					//!< When the skill tree was last updated from the server.
	NSDate *cachedUntil;				//!< When the server will next regenerate that skill tree.
	
	@private
	CCPSkillTreeDelegate *delegate;		//!< Internal delegate method, pay it no heed.
}

@property(readwrite, retain) NSArray * skills;
@property(readwrite, retain) NSArray * groups;

@property(readwrite, retain) NSDictionary * skillsByGroup;

@property(readwrite, retain) NSDate * lastUpdate;
@property(readwrite, retain) NSDate * cachedUntil;

/**
 * Obtains a reference to the static skill tree or creates it if it has not already been created.
 */
+(id)tree;

-(id)initWithCoder:(NSCoder*)coder;

-(void)update;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
