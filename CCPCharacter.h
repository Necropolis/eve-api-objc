#import <Cocoa/Cocoa.h>

@interface CCPCharacter : NSObject {
	int characterId;
	int userId;
	NSString *ltdApiKey;
	NSString *ultdApiKey;
}

@property(readwrite, assign) int characterId;
@property(readwrite, assign) int userId;
@property(readwrite, retain) NSString * ltdApiKey;
@property(readwrite, retain) NSString * ultdApiKey;

-(id)initWithId:(int)_characterId
		 userId:(int)_userId
	  ltdapiKey:(NSString*)_ltdApiKey
	 ultdApiKey:(NSString*)_ultdApiKey
		  error:(NSError**)err;

-(void)dealloc;

@end
