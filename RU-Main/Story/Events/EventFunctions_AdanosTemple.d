
var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_01()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime == FALSE)
	{
		b_awake_stoneguardian(Stoneguardian_ADANOSTEMPELENTRANCE_01);
		b_awake_stoneguardian(Stoneguardian_ADANOSTEMPELENTRANCE_02);
		b_awake_stoneguardian(Stoneguardian_ADANOSTEMPELENTRANCE_03);
		b_awake_stoneguardian(Stoneguardian_ADANOSTEMPELENTRANCE_04);
		if((Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_01) == FALSE) || (Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_02) == FALSE) || (Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_03) == FALSE) || (Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_04) == FALSE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		B_KillNpc(BDT_10400_Addon_DeadBandit);
		B_KillNpc(BDT_10401_Addon_DeadBandit);
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime = TRUE;
	};
};

var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_02()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime == FALSE)
	{
		b_awake_stoneguardian(Stoneguardian_RHADEMES_14A);
		b_awake_stoneguardian(Stoneguardian_RHADEMES_14D);
		b_awake_stoneguardian(Stoneguardian_RHADEMES_14F);
		SC_TookRhademesTrap = TRUE;
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime = TRUE;
	};
};


var int EVT_RAVEN_AWAKE_FUNC_OneTime;

func void evt_raven_awake_func()
{
};

