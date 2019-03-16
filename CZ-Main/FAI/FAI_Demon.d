
instance FA_ENEMY_PREHIT_6(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_ENEMY_STORMPREHIT_6(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_COMBO_6(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_6(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_6(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_6(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_6(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_6(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_6(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_RUN;
	move[2] = MOVE_RUN;
	move[3] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_6(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_6(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_RUN;
	move[2] = MOVE_STRAFE;
};

instance FA_MY_FK_FOCUS_6(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_6(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_6(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_6(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_6(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_6(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

