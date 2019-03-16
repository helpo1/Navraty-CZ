
const string PAL_199_CHECKPOINT = "NW_FORESTFORT_01";

instance DIA_PAL_199_RITTER_EXIT(C_Info)
{
	npc = pal_199_ritter;
	nr = 999;
	condition = dia_pal_199_ritter_exit_condition;
	information = dia_pal_199_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_199_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_199_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_FIRSTWARN(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_firstwarn_condition;
	information = dia_pal_199_ritter_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_firstwarn_condition()
{
	if(GRANTTOFORT == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (PYROKARSENTTOHAGEN == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(self,"NW_FORESTFORT_01") < 500) && (GRANTTOFORT == FALSE) && (Npc_HasItems(hero,itwr_hagenorderfort) < 1) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_199_Ritter_FirstWarn_01_00");	//СТОЙ! Куда это ты собрался, парень?
	AI_Output(other,self,"DIA_PAL_199_Ritter_FirstWarn_01_01");	//Эээ... туда! А что?
	AI_Output(self,other,"DIA_PAL_199_Ritter_FirstWarn_01_02");	//Только люди, которые состоят на службе короля, имеют доступ в крепость. И только по личному распоряжению самого лорда Хагена!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_199_CHECKPOINT);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_199_RITTER_ATTACK(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_attack_condition;
	information = dia_pal_199_ritter_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_attack_condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (PYROKARSENTTOHAGEN == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (GRANTTOFORT == FALSE) && (Npc_HasItems(hero,itwr_hagenorderfort) < 1) && (Kapitel < 6) && (Npc_GetDistToWP(other,PAL_199_CHECKPOINT) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_attack_info()
{
	AI_Output(self,other,"DIA_PAL_199_Ritter_Attack_01_00");	//Кажется, я тебя предупреждал!
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_199_RITTER_HAGEN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_hagen_condition;
	information = dia_pal_199_ritter_hagen_info;
	permanent = FALSE;
	description = "Что это за место?";
};


func int dia_pal_199_ritter_hagen_condition()
{
	if((GRANTTOFORT == FALSE) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_hagen_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_00");	//Что это за место?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_01");	//А что, не видно? Это крепость!
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_02");	//И что вы тут охраняете?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_03");	//Проход в южные земли Хориниса. Там располагается военный королевский форт Азган.
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_04");	//А я думал, что все паладины расместились в городе.
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_05");	//Небольшая часть паладинов вместе с лордом Хагеном так и сделала. Остальные же ушли через проход в форт.
	AI_Output(other,self,"DIA_PAL_199_Ritter_Hagen_01_06");	//А как мне попасть в этот форт?
	AI_Output(self,other,"DIA_PAL_199_Ritter_Hagen_01_07");	//Только если лорд Хаген самостоятельно отдаст такой приказ. Без него ты просто попусту тратишь свое и мое время.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_MAGE(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_mage_condition;
	information = dia_pal_199_ritter_mage_info;
	permanent = FALSE;
	description = "Я - маг Огня!";
};


func int dia_pal_199_ritter_mage_condition()
{
	if((GRANTTOFORT == FALSE) && (other.guild == GIL_KDF) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_mage_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Mage_01_00");	//Я - маг Огня!
	AI_Output(self,other,"DIA_PAL_199_Ritter_Mage_01_03");	//Меня это не волнует. Если у тебя нет разрешения лорда Хагена, в крепость тебе не попасть.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PALADIN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_paladin_condition;
	information = dia_pal_199_ritter_paladin_info;
	permanent = FALSE;
	description = "Я же паладин!";
};


func int dia_pal_199_ritter_paladin_condition()
{
	if((GRANTTOFORT == FALSE) && (other.guild == GIL_PAL) && !Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_paladin_info()
{
	AI_Output(other,self,"DIA_PAL_199_Ritter_Paladin_01_00");	//Я же паладин!
	AI_Output(self,other,"DIA_PAL_199_Ritter_Paladin_01_03");	//Меня это не волнует. Если у тебя нет разрешения лорда Хагена, в крепость тебе не попасть.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSASMIL(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_passasmil_condition;
	information = dia_pal_199_ritter_passasmil_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passasmil_condition()
{
	if((GRANTTOFORT == FALSE) && (Npc_HasItems(other,itwr_hagenorderfort) >= 1) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passasmil_info()
{
	var C_Npc gatekeeper;
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_00");	//СТОЙ!
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_01");	//Только люди, которые состоят на службе короля, имеют доступ в крепость. И только по личному распоряжению самого лорда Хагена.
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_03");	//У меня есть приказ от лорда Хагена.
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_05");	//Вот, держи.

	if(B_GiveInvItems(other,self,itwr_hagenorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_hagenorderfort,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_06");	//(удивленно) Да, действительно. Хорошо, ты можешь войти.
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_08");	//Только не создавай проблем. Понял?
	self.aivar[AIV_PASSGATE] = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_09");	//(кричит) Эй, там, наверху! Опускайте ворота!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_10");	//Проходи.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSEVER(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_passever_condition;
	information = dia_pal_199_ritter_passever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passever_condition()
{
	if((GRANTTOFORT == FALSE) && (Kapitel >= 6) && (Npc_HasItems(other,itwr_pyrorderfort) >= 1) && (PYROKARSENTTOHAGEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passever_info()
{
	var C_Npc gatekeeper;
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_00");		//Стой! Что ты тут делаешь?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassEver_01_01");		//Мне нужно попасть в форт. У меня срочное сообщение для паладинов.
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_02");		//Срочное сообщение? И от кого же?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassEver_01_03");		//От Пирокара, верховного мага Огня. Или тебе этого недостаточно?
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_04");		//Сообщение от магов Огня?
	AI_Output(other,self,"DIA_PAL_199_Ritter_PassAsMil_01_05");	//Вот, держи.

	if(B_GiveInvItems(other,self,itwr_pyrorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_pyrorderfort,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_06");	//(удивленно) Да, действительно. Хорошо, ты можешь войти.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_07");		//Только не создавай проблем. Понял?
	self.aivar[AIV_PASSGATE] = TRUE;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_08");	//(кричит) Эй, там, наверху! Опускайте ворота!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_09");	//Проходи.
	AI_StopProcessInfos(self);
};