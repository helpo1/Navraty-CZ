
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	if(RavenDoorClosed == FALSE)
	{
		Wld_SendTrigger("EVT_ADANOS_ROOM_RAVENPRAY");
		RavenDoorClosed = TRUE;
	};

	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Посмотрите, кто пришел.

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(other,ItMi_TempelTorKey) >= 1)
	{
		Npc_RemoveInvItems(other,ItMi_TempelTorKey,1);
	};

	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//Повелитель предупредил меня, что Иннос пошлет своего слугу.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//Но я не думал, что ты придешь так быстро.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Что ж, раз ты так спешил, (смеется) то и смерть твоя будет быстрой.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ты прав, один из нас умрет. И это будешь ты!",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ты продал душу Белиару!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//Ты прав, один из нас умрет. И это будешь ты!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//Тебе со мной не справиться. У меня меч Белиара!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//Я поведу армию драконов на континент. Вместе мы погрузим мир людей в вечную тьму!
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//Ты продал душу Белиару!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//Да, и за хорошую цену. Я стану генералом его армий.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//А как насчет тебя? Тебе известно, сколько стоит ТВОЯ душа?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Достаточно! Приступим к делу.",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Я лишь делаю то, что должно быть исполнено.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//Я лишь делаю то, что должно быть исполнено.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//Вы только послушайте! Ты прислал мне покорного раба, Иннос!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Достаточно! Приступим к делу.",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Ты уверен, что я служу Инносу?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Ты уверен, что я служу Инносу?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//Что? О чем ты говоришь?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//Ты не думал, что я могу быть и исполнителем воли Аданоса?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//Чепуха!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//А может, я тоже служу Белиару? Или лишь самому себе?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//Что ж, в таком случае ты мне даже не противник!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"Достаточно! Приступим к делу.",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//Достаточно! Приступим к делу.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//Ты так торопишься умереть?...(усмехается) Ну, раз ты настаиваешь!
	AI_StopProcessInfos(self);
	RavenCanAway = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


//---------------Равен на плато------------------------------

instance DIA_BDT_2090_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 999;
	condition = DIA_BDT_2090_Addon_Raven_EXIT_Condition;
	information = DIA_BDT_2090_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_BDT_2090_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

instance DIA_BDT_2090_Addon_Raven_Hi(C_Info)
{
	npc = BDT_2090_Addon_Raven;
	nr = 1;
	condition = DIA_BDT_2090_Addon_Raven_Hi_Condition;
	information = DIA_BDT_2090_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_BDT_2090_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_BDT_2090_Addon_Raven_Hi_Info()
{
	B_GivePlayerXP(1000);
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_MAIN_01");

	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};

	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_00");	//Итак. Значит, ты и есть тот, кого Аданос выбрал в качестве своего избранника!
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_01");	//Признаться, я немного разочарован увиденным. Даже учитывая то, что ты смог добраться сюда.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_03");	//Ворон?! Так ты и есть то зло, о котором говорил страж перед храмом?
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_04");	//Мне кажется, или ты действительно немного изменился с момента нашей последней встречи?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_05");	//У меня много имен, и все они мало что значат для меня. Как и моя внешность.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_06");	//Но ты носишь Коготь Белиара! А его последним хозяином был рудный барон Ворон.
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_01_07");	//Да и выглядишь ты почти как он. Только немного изменился в лице.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_08");	//Мой повелитель даровал мне знак его силы и душу того ничтожества, которое посмело носить этот могущественный артефакт.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_01_09");	//Остальное можешь узнать у него самого, когда окажешься в царстве мертвых.
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi,"Так кто же ты на самом деле?",DIA_BDT_2090_Addon_Raven_Hi_Who);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Who()
{
	AI_Output(other,self,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_00");	//Так кто же ты на самом деле?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_01");	//(смеется) Неужели ты так этого и не понял?
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_02");	//Взгляни на себя - и ты поймешь, в чем кроется ответ на твой вопрос.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_03");	//Издревле боги сражаются друг с другом за власть в этом мире...
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_04");	//Сражаются руками своих избранников. Таких, как ты или я.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_05");	//Наша с тобой встреча почти ничего не решит в той войне, которая бушует уже на протяжении многих тысячелетий.
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_06");	//Но чем меньше на моем пути будет подобных тебе, тем больше шансов, что мой повелитель одержит в ней окончательную победу!
	AI_Output(self,other,"DIA_BDT_2090_Addon_Raven_Hi_Who_01_07");	//Пришло время выяснить, кто сегодня достоин оказаться победителем, а кто будет навсегда предан забвению!
	Info_ClearChoices(DIA_BDT_2090_Addon_Raven_Hi);
	Info_AddChoice(DIA_BDT_2090_Addon_Raven_Hi,Dialog_Ende,DIA_BDT_2090_Addon_Raven_Hi_Exit);
};

func void DIA_BDT_2090_Addon_Raven_Hi_Exit()
{
	RavenCanKill = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Summon");
	Wld_InsertNpc(Raven_Mummy_01,"FP_ROAM_RAVENGUARD_01");
	Wld_InsertNpc(Raven_Mummy_02,"FP_ROAM_RAVENGUARD_02");
	Wld_InsertNpc(Raven_Mummy_03,"FP_ROAM_RAVENGUARD_03");
	Wld_InsertNpc(Raven_Mummy_04,"FP_ROAM_RAVENGUARD_04");
};