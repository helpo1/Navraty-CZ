
instance FA_ENEMY_PREHIT_19(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_19(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_MY_W_RUNTO_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_FOCUS_19(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_G_FOCUS_19(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_19(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_19(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

