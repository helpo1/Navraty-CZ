
instance FA_ENEMY_PREHIT_20(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_ATTACK;
};

instance FA_ENEMY_STORMPREHIT_20(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_ATTACK;
};

instance FA_MY_W_COMBO_20(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_20(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_20(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_20(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_20(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_20(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_20(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_RUN;
	move[2] = MOVE_ATTACK;
};

instance FA_MY_FK_FOCUS_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_20(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_20(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_ATTACK;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_20(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_TURN;
};

