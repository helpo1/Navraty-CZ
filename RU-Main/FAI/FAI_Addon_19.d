
instance FA_ENEMY_PREHIT_27(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_ATTACK;
};

instance FA_ENEMY_STORMPREHIT_27(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
};

instance FA_MY_W_RUNTO_27(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_27(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_FOCUS_27(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_27(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_27(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_27(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_G_FOCUS_27(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_ATTACK;
};

instance FA_MY_FK_FOCUS_27(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
};

instance FA_MY_G_FK_NOFOCUS_27(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

