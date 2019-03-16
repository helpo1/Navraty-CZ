
const int MOVE_RUN = 1;
const int MOVE_RUNBACK = 2;
const int MOVE_JUMPBACK = 3;
const int MOVE_TURN = 4;
const int MOVE_STRAFE = 5;
const int MOVE_ATTACK = 6;
const int MOVE_SIDEATTACK = 7;
const int MOVE_FRONTATTACK = 8;
const int MOVE_TRIPLEATTACK = 9;
const int MOVE_WHIRLATTACK = 10;
const int MOVE_MASTERATTACK = 11;
const int MOVE_TURNTOHIT = 15;
const int MOVE_PARADE = 17;
const int MOVE_STANDUP = 18;
const int MOVE_WAIT = 19;
const int MOVE_WAIT_LONGER = 23;
const int MOVE_WAIT_EXT = 24;
const int MAX_MOVE = 6;
const int MAX_FIGHTAI = 50;

class C_FIGHTAI
{
	var int move[6];
};

