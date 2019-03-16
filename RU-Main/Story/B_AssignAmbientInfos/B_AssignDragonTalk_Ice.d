
instance DIA_Dragon_Ice_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Ice_Exit_Condition;
	information = DIA_Dragon_Ice_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Ice_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Ice_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//Сила Глаза угасла, и твое время вышло.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_SpawnNpcRange(hero,IceGolem_Dragon,2,500);
};


instance DIA_Dragon_Ice_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Ice_Hello_Condition;
	information = DIA_Dragon_Ice_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Ice_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
	return 0;
};

func void DIA_Dragon_Ice_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Зачем ты потревожил мой сон? Мне что, закопаться еще глубже, чтобы вы, надоедливые мухи, наконец, оставили меня в покое?
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Говорящий дракон. Спасибо Глазу Инноса.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Вы, люди, забавные существа. Даже если вас всех сдуют ледяные ветра смерти, всегда найдется хотя бы один, кто поднимется из пепла, думая, что ему судьбой предназначено стать героем.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Но скоро все будет кончено. Я лично позабочусь, чтобы никто из вас больше не поднялся.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Молчать! Силой священного Глаза, что дарована мне свыше, я приказываю тебе отвечать на мои вопросы.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ха-ха-ха. Тогда спрашивай. Но твои знания не помогут тебе.
};


instance DIA_Dragon_Ice_WERBISTDU(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Ice_WERBISTDU_Condition;
	information = DIA_Dragon_Ice_WERBISTDU_Info;
	description = "Кто ты?";
};


func int DIA_Dragon_Ice_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Dragon_Ice_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Я - Финкрег, повелитель льда и снега, Страж Конгресса и твоя неминуемая смерть!
};

func void B_AssignDragonTalk_Ice(var C_Npc slf)
{
	DIA_Dragon_Ice_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

