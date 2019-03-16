
instance FA_ENEMY_PREHIT_44(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_STRAFE;
};

instance FA_ENEMY_STORMPREHIT_44(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_RUNTO_44(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_44(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_FOCUS_44(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
};

instance FA_MY_W_NOFOCUS_44(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_44(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_G_STRAFE_44(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_G_FOCUS_44(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_44(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_44(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_44(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_44(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_44(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_44(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

