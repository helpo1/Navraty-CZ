
instance FA_ENEMY_PREHIT_45(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_45(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_MY_W_COMBO_45(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_45(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_STRAFE_45(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_45(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_45(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_45(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_45(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_G_STRAFE_45(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_45(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_45(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_45(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_45(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_45(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_45(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_45(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

