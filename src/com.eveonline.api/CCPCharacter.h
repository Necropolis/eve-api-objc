#import <Cocoa/Cocoa.h>

@class CCPAccount;

/*
 <currentTime>2007-06-18 22:49:01</currentTime>
 <result>
	 <name>corpslave</name>
	 <race>Minmatar</race>
	 <bloodLine>Brutor</bloodLine>
	 <gender>Female</gender>
	 <corporationName>corpexport Corp</corporationName>
	 <corporationID>150337746</corporationID>
	 <cloneName>Clone Grade Pi</cloneName>
	 <cloneSkillPoints>54600000</cloneSkillPoints>
	 <balance>190210393.87</balance>
	 <attributeEnhancers>
		 <intelligenceBonus>
			 <augmentatorName>Snake Delta</augmentatorName>
			 <augmentatorValue>3</augmentatorValue>
		 </intelligenceBonus>
		 <memoryBonus>
			 <augmentatorName>Halo Beta</augmentatorName>
			 <augmentatorValue>3</augmentatorValue>
		 </memoryBonus>
	 </attributeEnhancers>
	 <attributes>
		 <intelligence>6</intelligence>
		 <memory>4</memory>
		 <charisma>7</charisma>
		 <perception>12</perception>
		 <willpower>10</willpower>
	 </attributes>
	</result>
 */

@interface CCPCharacter : NSObject<NSCoding> {
	int characterId;
	CCPAccount *acct;
	
	// TODO: Add field for the date and time of which the character sheet was
	//		 retreived.
	NSDate* lastUpdate;
	
	NSString* name;
	NSString* race;
	NSString* bloodLine;
	NSString* gender;
	NSString* corporationName;
	NSString* cloneName;
	
	int corporationID;
	int cloneSkillPoints;
	
	double balance;
	
}

@property(readwrite, assign) int characterId;
@property(readwrite, retain) CCPAccount * acct;

@property(readwrite, retain) NSDate * lastUpdate;

@property(readwrite, retain) NSString * name;
@property(readwrite, retain) NSString * race;
@property(readwrite, retain) NSString * bloodLine;
@property(readwrite, retain) NSString * gender;
@property(readwrite, retain) NSString * corporationName;
@property(readwrite, retain) NSString * cloneName;

@property(readwrite, assign) int corporationID;
@property(readwrite, assign) int cloneSkillPoints;

@property(readwrite, assign) double balance;

-(id)initWithId:(int)_characterId
		   acct:(CCPAccount*)_acct;
-(id)initWithCoder:(NSCoder*)coder;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
