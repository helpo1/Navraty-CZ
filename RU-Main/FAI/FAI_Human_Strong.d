
instance FA_ENEMY_PREHIT_3(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_PARADE;
};

instance FA_ENEMY_STORMPREHIT_3(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
};

instance FA_MY_W_COMBO_3(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_3(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_TURN;
	move[2] = MOVE_WAIT;
};

instance FA_MY_W_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_FRONTATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_JUMPBACK;
};

instance FA_MY_W_NOFOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_3(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_3(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_3(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_TURN;
	move[2] = MOVE_WAIT;
};

instance FA_MY_G_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_RUN;
	move[2] = MOVE_WAIT;
};

instance FA_MY_FK_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
};

instance FA_MY_FK_NOFOCUS_MAG_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

