
instance DIA_ToughGuy_NEWS(C_Info)
{
	nr = 1;
	condition = DIA_ToughGuy_NEWS_Condition;
	information = DIA_ToughGuy_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_ToughGuy_NEWS_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE))
	{
		if(((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hun_741_falk)) && (HEROISHUNTER == FALSE)) || ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hun_743_nix)) && (KILLCLAWREVENGE == TRUE)))
		{
		}
		else
		{
			return TRUE;
		};
	};
};

func void DIA_ToughGuy_NEWS_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		B_Say(self,other,"$TOUGHGUY_ATTACKLOST");
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		B_Say(self,other,"$TOUGHGUY_ATTACKWON");
	}
	else
	{
		B_Say(self,other,"$TOUGHGUY_PLAYERATTACK");
	};
	self.aivar[AIV_LastFightComment] = TRUE;
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skinner)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_498_Ignaz)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4303_Addon_Erol)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)))
	{
		AI_Output(self,other,"DIA_Addon_Skinner_ToughguyNews_08_00");	//... nechci s tebou mluvit...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignToughGuyNEWS(var C_Npc slf)
{
	DIA_ToughGuy_NEWS.npc = Hlp_GetInstanceID(slf);
};

