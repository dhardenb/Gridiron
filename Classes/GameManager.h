
#import <Foundation/Foundation.h>
#import "Defines.h"
#import "RollManager.h"
#import "PassingYardageManager.h"
#import "ClockManager.h"
#import "RushingPlay.h"
#import "OffensiveFormationData.h"
#import "DefensiveFormationData.h"
#import "KickOffPlay.h"
#import "PassingPlay.h"
#import "PuntPlay.h"

@interface GameManager : NSObject
{
}

+ (void)resetGameState;
+ (void)initializeGameSettings;
+ (void)saveGameSettings;
+ (void)setupGameForTheDriveMode;

+ (void)updateLog;

+ (NSString *)getOffensivePlayerSelectedString:(int)player;
+ (NSString *)getAttackZoneSelectedString:(int)zone;
+ (NSString *)getDefensiveStanceSelectedString:(int)stance;
+ (void)buildCommentary:(NSString *)newText;
+ (NSString *)getCommentary;

+ (int)getPlayResult;
+ (void)setPlayResult:(int)newPlayResult;

+ (void)setWasSacked:(bool)wasSacked;

+ (int)getGameState;
+ (void)setGameState:(int)newGameState;
+ (int)getPreviousGameState;
+ (void)setPreviousGameState:(int)previousGameState;
+ (int)getNavFlag;
+ (void)setNavFlag:(int)NavFlag;
+ (int)getGameInProgress;
+ (void)setGameInProgress:(int)gameInProgress;

+ (int)getWonCoinToss;
+ (void)setWonCoinToss:(int)wonCoinToss;
+ (int)getKickedFirst;
+ (void)setKickedFirst:(int)kickedFirst;

+ (int)getAttemptingTwoPoints;
+ (void)setAttemptingTwoPoints:(int)attempting;

+ (int)getBasicPlayResult;
+ (void)setBasicPlayResult:(int)basicPlayResult;

+ (int)getOffensivePositionSelected;
+ (void)setOffensivePositionSelected:(int)newOffensivePositionSelected;
+ (int)getAttackZoneSelected;
+ (void)setAttackZoneSelected:(int)newAttackZoneSelected;
+ (int)getDefensiveStanceSelected;
+ (void)setDefensiveStanceSelected:(int)newDefensiveStanceSelected;
+ (int)getDefensiveFormation;
+ (void)setDefensiveFormation:(int)newDefensiveFormation;
+ (void)incrementDefensiveFormation;

+ (int)getHighlightedZone;
+ (void)setHighlightedZone:(int)zone;

+ (int)getQuarterLength;
+ (void)setQuarterLength:(int)quarterLength;
+ (int)getGameClockStatus;
+ (void)setGameClockStatus:(int)newStatus;
+ (int)getClock;
+ (void)setClock:(int)newClock;
+ (int)getQuarter;
+ (void)setQuarter:(int)newQuarter;
+ (void)incrementQuarter;
+ (int)getHomeScore;
+ (void)setHomeScore:(int)newScore;
+ (int)getVisitorScore;
+ (void)setVisitorScore:(int)newScore;
+ (int)getDown;
+ (void)setDown:(int)newDown;
+ (void)incrementDown;
+ (int)getYardsToGo;
+ (void)setYardsToGo:(int)newYardsToGo;
+ (NSString *)getSideOfField;
+ (int)getLineOfScrimmage;
+ (void)setLineOfScrimmage:(int)newLineOfScrimmage;
+ (int)getPossession;
+ (void)setPossession:(int)possession;
+ (void)changePossession;

+ (int)getHomeRushingPlays;

+ (int)getHomeTemType;
+ (void)setHomeTeamType:(int)homeTeamType;
+ (int)getAwayTemType;
+ (void)setAwayTeamType:(int)awayTeamType;

+ (int)getHomeTeamTimeOuts;
+ (void)useHomeTeamTimeOut;
+ (int)getAwayTeamTimeOuts;
+ (void)useAwayTeamTimeOut;

+ (bool)isOffenseHuman;
+ (bool)isDefenseHuman;
+ (bool)isHomeTeamOffense;
+ (bool)isAwayTeamOffense;

+ (int)getOffensiveScore;
+ (int)getDefensiveScore;

+ (void)runPlay;
+ (void)runRushingPlay;
+ (void)runEndOfPlay;
+ (void)runFieldGoalPlay;
+ (void)runExtraPointPlay;

+ (void)runEndOfFirstQuarter:(int)navFlag;
+ (void)runEndOfSecondQuarter;
+ (void)runEndOfThirdQuarter:(int)NavFlag;
+ (void)runEndOfFourthQuarter;
+ (void)runEndOfOvertime;
+ (void)prepareForOvertime;
+ (void)runTwoMinuteWarning;
+ (void)runTimeOut:(int)team;

+ (void)runVerifyNewGame;

@end
