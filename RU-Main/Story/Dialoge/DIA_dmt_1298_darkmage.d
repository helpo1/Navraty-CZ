
instance DIA_DMT1298_HELLO(C_Info)
{
	npc = dmt_1298_darkmage;
	nr = 5;
	condition = dia_dmt1298_hello_condition;
	information = dia_dmt1298_hello_info;
	important = TRUE;
};

func int dia_dmt1298_hello_condition()
{
	return TRUE;
};

func void dia_dmt1298_hello_info()
{
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_01_00");	//Так-так. Кто это тут?
	AI_Output(self,other,"DIA_DMT1298_Hello_01_02");	//Всего лишь жалкое порождение Инноса. Мой Хозяин следит за тобой каждый день.
	AI_Output(other,self,"DIA_DMT1298_Hello_01_03");	//Что тебе от меня нужно?
	AI_Output(self,other,"DIA_DMT1298_Hello_01_04");	//Жалкий червяк! Будто ты не понимаешь, с кем имеешь дело.
	MeetDarkTempleMage = TRUE;
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Еще один вопросик.",dia_dmt1298_hello_one);
};

func void dia_dmt1298_hello_battle()
{
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	AI_Output(other,self,"DIA_DMT1298_Hello_Battle_01_90");	//Ну, укуси меня!
	AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_00");	//(злобно) Я легко разделаюсь с тобой, ничтожество!
	AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_01");	//А после твоей смерти я воскрешу твое тело и присоединю его к своей армии зла.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_02");	//Из тебя получится отличный маг-скелет!
	}
	else
	{
		AI_Output(self,other,"DIA_DMT1298_Hello_Battle_01_03");	//Из тебя получится отличный скелет-воин!
	};

	if(SBMODE == 1)
	{
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_01,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_02,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_03,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_04,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_05,"FP_ROAM_NOVIZE_52");
	}
	else if(SBMODE == 2)
	{
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	}
	else 	if(SBMODE == 4)
	{
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	};

	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"...(пора его прикончить!)",dia_dmt1298_hello_End);
};

func void dia_dmt1298_hello_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};

func void dia_dmt1298_hello_one()
{
	AI_Output(other,self,"DIA_DMT1298_Hello_One_01_00");	//Подожди, у меня есть еще вопрос.
	AI_Output(other,self,"DIA_DMT1298_Hello_One_01_01");	//Скажи, ты случайно не находил тут один меч - такой большой с синим мерцающим камнем в основании клинка?
	AI_Output(self,other,"DIA_DMT1298_Hello_One_01_03");	//(задумчиво) Если ты задаешь этот вопрос - значит, именно от твоей руки пал Спящий.
	AI_Output(self,other,"DIA_DMT1298_Hello_One_01_04");	//Мой хозяин предупреждал меня о нашей возможной встрече.
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Боюсь, для тебя эта встреча закончится так же плохо, как и для Спящего...",dia_dmt1298_hello_video);
};

func void dia_dmt1298_hello_video()
{
	PlayVideo("RET2_Sleeper.bik");
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_00");	//Ты имеешь в виду это оружие... Уризель отличный клинок, оружие, достойное самого Белиара! Этот меч - одна из тех причин, по которой мой хозяин велел мне появиться тут.
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_01");	//И, естественно, хозяин также велел мне хранить этот меч - как я хранил бы его священный покой!
	AI_Output(self,other,"DIA_DMT1298_Hello_Video_01_02");	//И будь уверен - он в надежных руках, и такому жалкому псу, как ты, никогда его не заполучить...(смеется)
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Что же на самом деле заставило тебя появится здесь?",dia_dmt1298_hello_sleeper);
};

func void dia_dmt1298_hello_sleeper()
{
	AI_Output(other,self,"DIA_DMT1298_Hello_sleeper_01_00");	//Что же на самом деле заставило тебя появится здесь?
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_01");	//А ты даже не догадываешься, да? (насмешливо) Глупец!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_02");	//Ведь именно ты тогда помешал явиться этому миру одному из самых могущественных демонов мироздания!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_03");	//Но благодаря моим усилиям, он в скором времени вновь вернется в своды этого Храма.
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_04");	//И тогда вы все еще пожалеете, что вообще родились на свет!
	AI_Output(other,self,"DIA_DMT1298_Hello_sleeper_01_05");	//Ты что, снова вызвал Спящего?!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_06");	//Наконец-то до тебя дошло это, болван...(насмешливо)
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_07");	//Я уже свершил ритуал призыва, и теперь мне осталось только дождаться его появления!
	AI_Output(self,other,"DIA_DMT1298_Hello_sleeper_01_08");	//А пока что я разделаюсь с тобой, червь! Дабы ты больше не путался под ногами моего повелителя.
	MIS_SleeperBack = LOG_Running;
	Log_CreateTopic(TOPIC_SleeperBack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Running);
	B_LogEntry(TOPIC_SleeperBack,"Этот проклятый некромант сказал, что вновь призвал Спящего в этот мир! Возможно ли такое? Поживем - увидим...");
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello,"Ну, укуси меня!",dia_dmt1298_hello_battle);
};

//-------------------Итузельд---------------------------------------------

instance DMT_12987_Ituseld_EXIT(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 999;
	condition = DMT_12987_Ituseld_EXIT_Condition;
	information = DMT_12987_Ituseld_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DMT_12987_Ituseld_EXIT_Condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DMT_12987_Ituseld_HELLO(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 5;
	condition = DMT_12987_Ituseld_HELLO_condition;
	information = DMT_12987_Ituseld_HELLO_info;
	important = TRUE;
};

func int DMT_12987_Ituseld_HELLO_condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_HELLO_info()
{
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_00");	//Ты кто такой?! И что делаешь в моей башне?
	AI_Output(other,self,"DMT_12987_Ituseld_HELLO_01_01");	//Я тот, кто пришел снести тебе голову за убийство паладина Лотара.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_02");	//Ааа...(скучающе) Очередной фанатик, возомнивший себя героем.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_03");	//Что же, тогда тебя постигнет та же участь, что и того глупого паладина.
	AI_Output(self,other,"DMT_12987_Ituseld_HELLO_01_04");	//Я сокрушу тебя одним ударом, червь!
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};