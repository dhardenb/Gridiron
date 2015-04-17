// Boolean Values
#define GAME_CLOCK_RUNNING 0
#define GAME_CLOCK_STOPPED 1

// Defensive Formations
#define CUSTOM_DEFENSIVE_FORMATION 1
#define FIVE_THREE_THREE_DEFENSIVE_FORMATION 2
#define FOUR_THREE_FOUR_DEFENSIVE_FORMATION 3
#define THREE_FOUR_FOUR_DEFENSIVE_FORMATION 4

// Quarter Length
#define QUARTER_LENGTH_5_MINUTES 0
#define QUARTER_LENGTH_10_MINUTES 1
#define QUARTER_LENGTH_15_MINUTES 2
#define QUARTER_LENGTH_2_HALF_MINUTES 3

// Navigation Flags
#define NO_NAV_FLAG 0
#define NEED_KICKOFF_NAV_FLAG 1
#define EXTRA_POINT_NAV_FLAG 2
#define TWO_MINUTE_WARNING_NAV_FLAG 3
#define END_OF_FIRST_QUARTER_NAV_FLAG 4
#define END_OF_SECOND_QUARTER_NAV_FLAG 5
#define END_OF_THIRD_QUARTER_NAV_FLAG 6
#define END_OF_FOURTH_QUARTER_NAV_FLAG 7
#define END_OF_FIFTH_QUARTER_NAV_FLAG 8
#define OVERTIME_NAV_FLAG 9
#define END_OF_OVERTIME_NAV_FLAG 10
#define END_OF_GAME_NAV_FLAG 11
#define HOME_TEAM_TIME_OUT_NAV_FLAG 12
#define AWAY_TEAM_TIME_OUT_NAV_FLAG 13
#define END_OF_FIRST_QUARTER_NEED_KICK_OFF_NAV_FLAG 14
#define END_OF_THIRD_QUARTER_NEED_KICK_OFF_NAV_FLAG 15

// Coin Toss
#define SLECTED_NOTHING 0
#define SELECTED_HEADS 1
#define SELECTED_TAILS 2
#define SELECTED_KICK_FIRST 3
#define SELECTED_RECEIVE_FIRST 4

// Teams
#define HOME_TEAM 0
#define AWAY_TEAM 1
#define REF_TEAM 2

// Colors
#define TURF_COLOR [UIColor colorWithRed:0.305f green:0.395f blue:0.098f alpha:1.0f]

// Offensive Player Positions
#define NO_POSITION_SELECTED 0
#define LEFT_WIDE_RECEIVER 1
#define LEFT_TACKLE 2
#define LEFT_GAURD 3
#define CENTER 4
#define RIGHT_GAURD 5
#define RIGHT_TACKLE 6
#define RIGHT_TIGHT_END 7
#define RIGHT_WIDE_RECEIVER 8
#define QUARTER_BACK 9
#define FULL_BACK 10
#define TAIL_BACK 11
#define KICKER 12
#define PUNTER 13
#define LEFT_SPLIT_END 14
#define LEFT_TIGHT_END 15
#define RIGHT_SPLIT_END 16
#define LEFT_HALF_BACK 17
#define RIGHT_HALF_BACK 18
#define FOOTBALL 19

// Defensive Players Positions
#define LEFT_SWEEP_LEFT_DEFENDER 19
#define LEFT_SWEEP_MIDDLE_DEFENDER 20
#define LEFT_SWEEP_RIGHT_DEFENDER 21

#define LEFT_OFF_TACKLE_LEFT_DEFENDER 22
#define LEFT_OFF_TACKLE_MIDDLE_DEFENDER 23
#define LEFT_OFF_TACKLE_RIGHT_DEFENDER 24

#define INSIDE_LEFT_DEFENDER 25
#define INSIDE_MIDDLE_DEFENDER 26
#define INSIDE_RIGHT_DEFENDER 27

#define RIGHT_OFF_TACKLE_LEFT_DEFENDER 28
#define RIGHT_OFF_TACKLE_MIDDLE_DEFENDER 29
#define RIGHT_OFF_TACKLE_RIGHT_DEFENDER 30

#define RIGHT_SWEEP_LEFT_DEFENDER 31
#define RIGHT_SWEEP_MIDDLE_DEFENDER 32
#define RIGHT_SWEEP_RIGHT_DEFENDER 33

#define SHORT_LEFT_FLANK_LEFT_DEFENDER 34
#define SHORT_LEFT_FLANK_MIDDLE_DEFENDER 35
#define SHORT_LEFT_FLANK_RIGHT_DEFENDER 36

#define SHORT_MIDDLE_FLANK_LEFT_DEFENDER 37
#define SHORT_MIDDLE_FLANK_MIDDLE_DEFENDER 38
#define SHORT_MIDDLE_FLANK_RIGHT_DEFENDER 39

#define SHORT_RIGHT_FLANK_LEFT_DEFENDER 40
#define SHORT_RIGHT_FLANK_MIDDLE_DEFENDER 41
#define SHORT_RIGHT_FLANK_RIGHT_DEFENDER 42

#define MEDIUM_LEFT_SIDE_LINE_LEFT_DEFENDER 43
#define MEDIUM_LEFT_SIDE_LINE_MIDDLE_DEFENDER 44
#define MEDIUM_LEFT_SIDE_LINE_RIGHT_DEFENDER 45

#define MEDIUM_RIGHT_SIDE_LINE_LEFT_DEFENDER 46
#define MEDIUM_RIGHT_SIDE_LINE_MIDDLE_DEFENDER 47
#define MEDIUM_RIGHT_SIDE_LINE_RIGHT_DEFENDER 48

#define LONG_LEFT_DEFENDER 49
#define LONG_MIDDLE_DEFENDER 50
#define LONG_RIGHT_DEFENDER 51

// Attack Zones (also used for offensive play selections)
#define LEFT_SWEEP_RUSHING_LANE 1
#define LEFT_OFFTACKLE_RUSHING_LANE 2
#define LEFT_INSIDE_RUSHING_LANE 3
#define RIGHT_OFFTACKLE_RUSHING_LANE 4
#define RIGHT_SWEEP_RUSHING_LANE 5
#define SHORT_LEFT_PASSING_ZONE 6
#define SHORT_MIDDLE_PASSING_ZONE 7
#define SHORT_RIGHT_PASSING_ZONE 8
#define MIDDLE_LEFT_PASSING_ZONE 9
#define MIDDLE_RIGHT_PASSING_ZONE 10
#define DEEP_PASSING_ZONE 11

#define DEFENSIVE_FORMATION_ZONE 12
#define DEFENSIVE_STANCE_ZONE 13

#define NORMAL_KICK_OFF 14
#define SQUIB_KICK_OFF 15
#define ONSIDE_KICK_OFF 16
#define NORMAL_PUNT 17
#define FAKE_PUNT 18
#define NORMAL_FIELD_GOAL 19
#define FAKE_FIELD_GOAL 20
#define EXTRA_POINT 21
#define TWO_POINT_CONVERSION 22

// Attack Zone Types
#define RUSHING_ZONE 0
#define PASSING_ZONE 1
#define PLAY_CALLING_ZONE 2

// Game States
#define SPLASH_SCREEN_STATE 1
#define MAIN_MENU 2
#define GAME_MENU_STATE 3
#define GAME_SETUP_STATE 4
#define MAIN_HELP_STATE 5
#define ABOUT_STATE 6
#define WAITING_TO_SELECT_COIN_TOSS 7
#define WAITING_TO_REVIEW_COIN_TOSS 8
#define WAITING_TO_SELECT_KICK_OR_RECEIVE 9
#define WAITING_TO_REVIEW_KICK_OR_RECEIVE 10
#define WAITING_TO_PICK_OFFENSIVE_PLAYER 11
#define WAITING_TO_PICK_ATTACK_ZONE 12
#define WAITING_TO_PICK_DEFENSIVE_STANCE 13
#define WAITING_TO_HIKE_BALL 14
#define ANIMATION_STATE 15
#define WAITING_TO_CLEAR_PLAY_RESULTS 16
#define WAITING_TO_PICK_SPECIAL_TEAMS 17
#define KICKOFF_STATE 18
#define KICKOFF_RETURN_STATE 19
#define PUNT_STATE 20
#define PUNT_RETURN_STATE 21
#define FIELD_GOAL_STATE 22
#define FIELD_GOAL_BLOCK_STATE 23
#define POINT_AFTER_STATE 24
#define POINT_AFTER_STOP_STATE 25
#define DISPLAY_EVENT_STATE 26
#define VERIFY_NEW_GAME_STATE 27
#define VERIFY_THE_DRIVE_MODE_STATE 28

// Buttons
#define CLEAR_PLAY_RESULTS_BUTTON 1
#define PLAY_BUTTON 2
#define SETTINGS_BUTTON 3
#define MAIN_HELP_BUTTON 4
#define ABOUT_BUTTON 5
#define MAIN_MENU_BUTTON 6
#define OFFENSE_READY_BUTTON 7
#define DEFENSE_READY_BUTTON 8
#define RETURN_FROM_MAIN_HELP_BUTTON 9
#define RETURN_FROM_ABOUT_BUTTON 10
#define DONE_SETTING_UP_GAME_BUTTON 11
#define RESUME_CURRENT_GAME_BUTTON 12
#define START_NEW_GAME_BUTTON 13
#define HIKE_BUTTON 14
#define KICKOFF_READY_BUTTON 15
#define KICKOFF_RETURN_READY_BUTTON 16
#define PUNT_READY_BUTTON 17
#define PUNT_RETURN_READY_BUTTON 18
#define FIELD_GOAL_READY_BUTTON 19
#define FIELD_GOAL_BLOCK_READY_BUTTON 20
#define POINT_AFTER_READY_BUTTON 21
#define POINT_AFTER_STOP_READY_BUTTON 22
#define NORMAL_KICK_OFF_BUTTON 23
#define SQUIB_KICK_OFF_BUTTON 24
#define ONSIDE_KICK_OFF_BUTTON 25
#define NORMAL_KICK_OFF_RETURN_BUTTON 26
#define REVERSE_KICK_OFF_RETURN_BUTTON 27
#define SPECIAL_TEAMS_BUTTON 28
#define PUNT_MENU_BUTTON 29
#define FIELD_GOAL_MENU_BUTTON 30
#define SPIKE_THE_BALL_BUTTON 31
#define CANCEL_SPECIAL_TEAMS_MENU_BUTTON 32
#define NORMAL_PUNT_BUTTON 33
#define FAKE_PUNT_BUTTON 34
#define NORMAL_PUNT_RETURN_BUTTON 35
#define BLOCK_PUNT_BUTTON 36
#define NORMAL_FIELD_GOAL_BUTTON 37
#define FAKE_FIELD_GOAL_BUTTON 38
#define NEXT_BUTTON 39
#define HOME_TEAM_PLAYER_SELECTION_BUTTON 40
#define AWAY_TEAM_PLAYER_SELECTION_BUTTON 41
#define FIELD_GOAL_BLOCK_BUTTON 42
#define ANIMATION_DONE_BUTTON 43
#define ONE_POINT_CONVERSION_BUTTON 43
#define TWO_POINT_CONVERSION_BUTTON 44
#define POINT_AFTER_STOP_BUTTON 45
#define QUARTER_LENGTH_BUTTON 46
#define GAME_MENU_BUTTON 47
#define END_GAME_BUTTON 48
#define TIME_OUT_BUTTON 49
#define SELECT_HEADS_BUTTON 50
#define SELECT_TAILS_BUTTON 51
#define DONE_REVIEWING_HEADS_OR_TAILS_BUTTON 52
#define SELECT_KICK_FIRST_BUTTON 53
#define SELECT_RECEIVE_FIRST_BUTTON 54
#define DONE_REVIEWING_KICK_OR_RECEIVE_BUTTON 55
#define CANCEL_NEW_GAME_BUTTON 56
#define VERIFY_NEW_GAME_BUTTON 57
#define THE_DRIVE_BUTTON 58
#define MOVE_BACK_BUTTON 59
#define MOVE_FORWARD_BUTTON 60
#define CLEAR_POP_UP_BUTTON 61
#define FORMATION_BUTTON 62

// Defensive Stances
#define ALL_RUN_DEFENSIVE_STANCE 1
#define RUN_DEFENSIVE_STANCE 2
#define BALANCED_DEFENSIVE_STANCE 3
#define PASS_DEFENSIVE_STANCE 4
#define ALL_PASS_DEFENSIVE_STANCE 5
#define NORMAL_KICK_OFF_RETURN 6
#define REVERSE_KICK_OFF_RETURN 7
#define NORMAL_PUNT_RETURN 8
#define BLOCK_PUNT 9
#define FIELD_GOAL_BLOCK 10
#define EXTRA_POINT_BLOCK 11

// Button States
#define CURRENTLY_SELECTED 0
#define CURRENTLY_NOT_SELECTED 1

// Basic Play Results
#define BAD_PLAY_RESULT 1
#define AVERAGE_PLAY_RESULT 2
#define GOOD_PLAY_RESULT 3

// Coach Types
#define HUMAN_COACH 0
#define COMPUTER_COACH 1

#define FOOTBALL_X 235
#define FOOTBALL_Y 200

// #define LEFT_WIDE_RECEIVER_X FOOTBALL_X - 235
// #define LEFT_WIDE_RECEIVER_Y FOOTBALL_Y + 10

// #define LEFT_SPLIT_END_X FOOTBALL_X - 185
// #define LEFT_SPLIT_END_Y FOOTBALL_Y + 20

// #define LEFT_TIGHT_END_X FOOTBALL_X - 135
// #define LEFT_TIGHT_END_Y FOOTBALL_Y + 10

// #define LEFT_TACKLE_X FOOTBALL_X - 95
// #define LEFT_TACKLE_Y FOOTBALL_Y + 10

// #define LEFT_GUARD_X FOOTBALL_X - 55
// #define LEFT_GUARD_Y FOOTBALL_Y + 10

// #define CENTER_X FOOTBALL_X - 15
// #define CENTER_Y FOOTBALL_Y + 10

// #define RIGHT_GUARD_X FOOTBALL_X + 25
// #define RIGHT_GUARD_Y FOOTBALL_Y + 10

// #define RIGHT_TACKLE_X FOOTBALL_X + 65
// #define RIGHT_TACKLE_Y FOOTBALL_Y + 10

// #define RIGHT_TIGHT_END_X FOOTBALL_X + 105
// #define RIGHT_TIGHT_END_Y FOOTBALL_Y + 10

// #define RIGHT_SPLIT_END_X FOOTBALL_X + 155
// #define RIGHT_SPLIT_END_Y FOOTBALL_Y + 20

// #define RIGHT_WIDE_RECEIVER_X FOOTBALL_X + 205
// #define RIGHT_WIDE_RECEIVER_Y FOOTBALL_Y + 10

// #define QUARTER_BACK_X FOOTBALL_X - 15
// #define QUARTER_BACK_Y FOOTBALL_Y + 30

// #define LEFT_HALF_BACK_X FOOTBALL_X - 75
// #define LEFT_HALF_BACK_Y FOOTBALL_Y + 60

// #define RIGHT_HALF_BACK_X FOOTBALL_X + 45
// #define RIGHT_HALF_BACK_Y FOOTBALL_Y + 60

// #define FULL_BACK_X FOOTBALL_X - 15
// #define FULL_BACK_Y FOOTBALL_Y + 60

// #define TAIL_BACK_X FOOTBALL_X - 15
// #define TAIL_BACK_Y FOOTBALL_Y + 90