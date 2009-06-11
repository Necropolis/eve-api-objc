#import <Cocoa/Cocoa.h>

/*
 <row typeName="CFO Training" groupID="266" typeID="3369">
	 <description>Skill at managing corp finances. 5% discount on all fees at non-hostile NPC station if acting as CFO of a corp. </description>
	 <rank>3</rank>
	 <rowset name="requiredSkills" key="typeID" columns="typeID,skillLevel">
		 <row typeID="3363" skillLevel="2" />
		 <row typeID="3444" skillLevel="3" />
	 </rowset>
	 <requiredAttributes>
		 <primaryAttribute>memory</primaryAttribute>
		 <secondaryAttribute>charisma</secondaryAttribute>
	 </requiredAttributes>
	 <rowset name="skillBonusCollection" key="bonusType" columns="bonusType,bonusValue" />
 </row>
 SkillPointsPerMinute = EffectivePrimaryAttribute+(EffectiveSecondaryAttribute/2)
 */
/**
 * Represents a skill in EVE Online.  These skills are not relative to any character, and are
 * part of the static skill tree held by CCPSkillTree.  There should only ever be one instance
 * of each skill with multiple references to it.  You should never need to create or destroy
 * these skill objects during the course of your application's lifecycle.
 */
@interface CCPSkill : NSObject<NSCoding> {
	int skillId;				//!< Unique integer identifier for this skill.
	int groupId;				//!< Unique integer identifying the skill group to which this skill belongs.
	
	NSString *name;				//!< Skill's given name as seen in the EVE client.
	NSString *description;		//!< Terse description of the skill as seen in the EVE client.
	
	int rank;					//!< Skill's rank which determines how many skill points are required to earn each level of this skill.
	
	NSArray *reqs;				//!< List of CCPSkills  that are the prerequisites to training this skill.
	
	NSString *primary;			//!< The primary attribute associated with training this skill.
	NSString *secondary;		//!< The secondary attribute associated with training this skill.
}

@property(readwrite, assign) int skillId;
@property(readwrite, assign) int groupId;

@property(readwrite, retain) NSString * name;
@property(readwrite, retain) NSString * description;

@property(readwrite, assign) int rank;

@property(readwrite, retain) NSArray * reqs;

@property(readwrite, retain) NSString * primary;
@property(readwrite, retain) NSString * secondary;

-(id)initWithCoder:(NSCoder*)coder;

/**
 * The number of skill points required for the skill to be at atLevel.
 */
-(int)skillPoints:(int)atLevel;

-(void)encodeWithCoder:(NSCoder*)coder;

-(void)dealloc;

@end
