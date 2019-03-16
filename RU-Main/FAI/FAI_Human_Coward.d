
instance FA_ENEMY_PREHIT_2(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
};

instance FA_ENEMY_STORMPREHIT_2(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
};

instance FA_MY_W_COMBO_2(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_2(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_2(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_TURN;
	move[2] = MOVE_WAIT;
};

instance FA_MY_W_FOCUS_2(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
};

instance FA_MY_W_NOFOCUS_2(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_2(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_2(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_G_STRAFE_2(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_TURN;
	move[2] = MOVE_WAIT;
};

instance FA_MY_G_FOCUS_2(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_WAIT;
};

instance FA_MY_FK_FOCUS_2(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_2(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_2(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_2(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_2(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
	move[3] = MOVE_WAIT_EXT;
	move[4] = MOVE_WAIT_EXT;
};

instance FA_MY_FK_NOFOCUS_MAG_2(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

