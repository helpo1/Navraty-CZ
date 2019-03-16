
instance FA_ENEMY_PREHIT_9(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_STRAFE;
};

instance FA_ENEMY_STORMPREHIT_9(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_COMBO_9(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_9(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_9(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_9(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_9(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_9(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_9(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_9(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_9(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_FK_FOCUS_9(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_9(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_9(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_9(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_9(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_9(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

