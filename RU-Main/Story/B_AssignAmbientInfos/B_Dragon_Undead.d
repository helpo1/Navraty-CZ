instance DIA_Dragon_Undead_Hello(C_Info)
{
	npc = Dragon_Undead;
	nr = 5;
	condition = DIA_Dragon_Undead_Hello_Condition;
	information = DIA_Dragon_Undead_Hello_Info;
	important = TRUE;
};

func int DIA_Dragon_Undead_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//Тебе все-таки удалось найти меня! Я долго ждал твоего прихода.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//Да ладно! Не ври, что ты все это планировал.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//Что ты знаешь о моих намерениях?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//Разве я не послал к тебе своих слуг, чтобы навести тебя на мой след?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//Разве я не оставлял знаки о моем присутствии, столь явные, что ты не мог не заметить их?

	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//А разве драконьи яйца, из которых сделаны твои доспехи, не помогли тебе добраться до меня?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//Разве обращенные паладины были недостаточной причиной для тебя, чтобы искать силу, управляющую ими?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//Разве одержимые из твоего племени были недостаточной причиной для тебя, чтобы искать силу, управляющую ими?
	};

	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//Хочешь ты того или нет, у тебя не получиться обмануть самого себя.
	B_LogEntry(TOPIC_HallenVonIrdorath,"Мой главный враг - дракон-нежить, который является избранным самого Белиара! Я должен убить его, чтобы покинуть этот проклятый остров.");

	if(ItarIsDead == FALSE)
	{
		Wld_InsertNpc(ItarMinion,"DRT_BOSS_01");
		B_KillNpc(Draconian_Elite_Boss);
	};
	if(YelaIsDead == FALSE)
	{
		Wld_InsertNpc(YelaMinion,"DRT_BOSS_02");
		B_KillNpc(UndeadWolf);
	};
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);

		if(ItarIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",ItarMinion,ItarMinion,0,0,0,FALSE);
		};
		if(YelaIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",YelaMinion,YelaMinion,0,0,0,FALSE);
		};
	};

	Info_ClearChoices(DIA_Dragon_Undead_Hello);
	Info_AddChoice(DIA_Dragon_Undead_Hello,Dialog_Ende,DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"По какому приказу ты ведешь своих подчиненных на войну против людей?",DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Почему ты здесь? ",DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"Кто ты такой? ",DIA_Dragon_Undead_Hello_wer);
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//Ты еще не устал задавать этот вопрос? Поищи внутри себя, глупец. Ты поймешь, кто я.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//Моим создателем мне дана божественная сила. Также как ты владеешь силой, данной тебе твоим богом.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//Моя судьба - уничтожение этого мира.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//Так же, как твоя судьба определяется прямотой и добродетелями паладина.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//Так же, как твоя рука несет смерть определенным созданиям, охотник на драконов.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//Так же, как твоя судьба - проповедовать веру в Инноса, Маг Огня.
	};

	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//Разве ты не ощущаешь связь, которая соединяет нас? Да. Ты знаешь кто я.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//Нет. Этого не может быть. Ксардас всегда говорил...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//Ксардас слаб, и не представляет угрозы для меня! Ты один достоин противостоять мне.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//Так предопределено. Пришло время принять свою судьбу.
};

func void DIA_Dragon_Undead_Hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//Зачем ты здесь?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//Божественность, дарованная мне, вдохновляет меня погрузить этот мир в море жестокости.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//Только когда последний оплот праведности падет, смогу я, наконец, найти покой.
};

func void DIA_Dragon_Undead_Hello_Auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//По чьему повелению ты ведешь своих прихвостней на войну против человечества?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//Мой хозяин - Владыка Ночи. Ты знаешь его. Ты можешь слышать его зов.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//Мои армии поднимутся из-под земли с его именем на устах и накроют этот мир покровом тьмы.
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//Твои кости помогут мне выпустить ветра смерти в этот мир!

	if(ItarIsDead == FALSE)
	{
		B_KillNpc_Fire(ItarMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(YelaIsDead == FALSE)
	{
		B_KillNpc_Fire(YelaMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};	
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//Ты еще не готов победить меня! Какое-то мгновение отделяет меня от достижения моей цели.
	};

	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};