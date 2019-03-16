
func void zs_mm_rtn_standdrinking()
{
	zs_orc_stand_drinking();
};

func int zs_mm_rtn_standdrinking_loop()
{
	b_staminainvent_monster(self);
	return zs_orc_stand_drinking_loop();
};

func void zs_mm_rtn_standdrinking_end()
{
	zs_orc_stand_drinking_end();
};

