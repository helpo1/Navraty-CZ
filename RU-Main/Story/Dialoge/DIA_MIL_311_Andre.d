
instance DIA_Andre_EXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Andre_EXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Andre_FIRSTEXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Andre_FIRSTEXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Wulfgar,"START");
};


var int Andre_Steckbrief;

func void B_Andre_Steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//Один из моих людей сказал мне, что бандиты распространяют объявление о розыске с твоим изображением.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//Он также сказал, что поначалу ты это отрицал.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//Так что все это значит?
	if(DEXTERSAYABOUTKILL == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_04");	//Эти парни просто хотят меня убить.
		AI_Output(self,other,"DIA_Andre_Add_08_13");	//Почти все бандиты - бывшие каторжники с рудников.
		AI_Output(self,other,"DIA_Andre_Add_08_14");	//Так откуда они тебя знают?
		AI_Output(other,self,"DIA_Andre_Add_15_05");	//Я думаю, Ватрас, маг Воды, сможет за меня поручиться.
		AI_Output(self,other,"DIA_Andre_Add_08_15");	//Хорошо, если так.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Add_15_03");	//Я не знаю, почему эти парни меня преследуют...
		AI_Output(self,other,"DIA_Andre_Add_08_04");	//Надеюсь ради твоего же блага, что ты говоришь мне правду.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Andre_Add_08_05");	//Мне не нужны в ополчении люди с запятнанной репутацией.
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_Add_08_12");	//Я не доверяю горожанам с запятнанной репутацией.
		};

		AI_Output(self,other,"DIA_Andre_Add_08_06");	//Большинство из этих бандитов - бывшие каторжники из колонии.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//Я надеюсь, что ты никак не связан с этими головорезами.
	Andre_Steckbrief = TRUE;
};


var int Andre_CantharFalle;

func void B_Andre_CantharFalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//Ко мне приходил торговец Кантар! Он сказал, что ты - беглый каторжник из колонии.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//Я не знаю, правда ли это, и предпочитаю не спрашивать тебя об этом. Но ты должен уладить этот вопрос.
	if(SARAKNOWSABOUTCANTHAR == TRUE)
	{
		B_StartOtherRoutine(Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
		SARAFLEE = TRUE;
	}
	else
	{
		b_clearjunktradeinvsarah(VLK_470_Sarah);
		B_StartOtherRoutine(Sarah,"Killed");
		AI_Teleport(Sarah,"NW_SARA_KILLED");
		b_killnpc_now(VLK_470_Sarah);
		SARAISDEAD = TRUE;
	};
	B_StartOtherRoutine(Canthar,"MARKTSTAND");
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	if((Canthar_Sperre == FALSE) && (Canthar_Pay == FALSE))
	{
		Canthar_Sperre = TRUE;
	};
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	Andre_CantharFalle = TRUE;
};


instance DIA_Andre_CantharFalle(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_CantharFalle_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func int DIA_Andre_CantharFalle_Info()
{
	if(Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
		return TRUE;
	};
	if((Andre_CantharFalle == FALSE) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)))
	{
		B_Andre_CantharFalle();
		return TRUE;
	};
	return FALSE;
};


var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;

instance DIA_Andre_PMSchulden(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Andre_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Городские власти объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_andre_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Хоринис объявил вас вне закона!";
	AI_Print(concatText);
};

func void DIA_Andre_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Ты пришел заплатить штраф?
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_36");	//Твои убийства переполнили чашу терпения людей на этой земле и Инноса на небе.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_37");	//Таким кровожадным ублюдкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_38");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_39");	//Умри с миром!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_40");	//Твои постоянные нападения на людей не могут больше оставаться безнаказанными.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_41");	//Таким подонкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_42");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_43");	//Умри с миром!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_44");	//Воровство - не самое страшное преступление, но все имеет границы, и ты свою уже перешел.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_45");	//Таким грязным ворам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_46");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_47");	//Умри с миром!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с городской стражей и паладинами, из-за постоянных моих бесчинств в городе. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PMSchulden,"Постой!...(пора сматываться)",dia_andre_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//Я даже задавался вопросом, осмелишьлся ли ты появиться здесь!
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Обвинения против тебя только множатся.
			if(Andre_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Я предупреждал тебя! Теперь штраф, который тебе придется заплатить, только увеличился.
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//Ты глубоко разочаровал меня.
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Выяснились новые подробности.
			if(Andre_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Неожиданно не осталось никого, кто бы мог обвинить тебя в убийстве.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_THEFT) || ((Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//Никто больше не помнит, чтобы ты что-то крал.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_ATTACK) || ((Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//Больше нет свидетелей того, как ты принимал участие в драке.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Похоже, все обвинения против тебя оказались несостоятельными.
			};
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Я не знаю, что произошло, но я предупреждаю тебя - не пытайся провести меня!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Как бы то ни было, я решил снять с тебя все обвинения.
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Смотри, чтобы больше не было никаких проблем!
				Andre_Schulden = 0;
				Andre_LastPetzCounter = 0;
				Andre_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Я хочу, чтобы тебе было понятно - тебе все равно придется заплатить полную сумму штрафа!
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00B");	//Сколько?
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Что скажешь?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Andre_PMSchulden);
			Info_ClearChoices(DIA_Andre_PETZMASTER);
			Info_AddChoice(DIA_Andre_PMSchulden,"У меня недостаточно золота!",DIA_Andre_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Andre_PMSchulden,"Сколько я должен заплатить?",DIA_Andre_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
			{
				Info_AddChoice(DIA_Andre_PMSchulden,"Я хочу заплатить штраф.",DIA_Andre_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Сколько там еще?
	if(Andre_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Andre_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PMSchulden,"У меня недостаточно золота!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Andre_PMSchulden,"Сколько я должен заплатить?",DIA_Andre_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PMSchulden,"Я хочу заплатить штраф.",DIA_Andre_PETZMASTER_PayNow);
	};
};


instance DIA_Andre_PETZMASTER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Andre_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ты тот новичок, что баламутит город.
	};
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_21");	//Ты осмелился прийти сюда - очень глупо с твоей стороны.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_22");	//Твои убийства переполнили чашу терпения людей на этой земле и Инноса на небе.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_23");	//Таким кровожадным ублюдкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_24");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_25");	//Умри с миром!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_26");	//Ты осмелился прийти сюда - очень глупо с твоей стороны.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_27");	//Твои постоянные нападения на людей не могут больше оставаться безнаказанными.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_28");	//Таким подонкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_29");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_30");	//Умри с миром!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_31");	//Ты осмелился прийти сюда - очень глупо с твоей стороны.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_32");	//Воровство - не самое страшное преступление, но все имеет границы, и ты свою уже перешел.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_33");	//Таким грязным ворам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_34");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_35");	//Умри с миром!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с городской стражей и паладинами, из-за постоянных моих бесчинств в городе. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER,"Постой!...(пора сматываться)",dia_andre_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//Хорошо, что ты пришел ко мне, пока все еще можно уладить!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Убийство - серьезное преступление!
			Andre_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//Не говоря уже о других делах, что ты натворил.
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//Страже приказано казнить убийц на месте.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//И большинство горожан не потерпят убийц в городе!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//Но я не заинтересован в том, чтобы повесить тебя. Идет война, и нам нужен каждый солдат!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//Но будет не так то просто успокоить народ.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//Ты мог бы подтвердить свое раскаяние, заплатив штраф! Естественно, он должен быть довольно значительным.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//Хорошо, что ты пришел. Тебя обвиняют в воровстве! Есть свидетели!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//Не говоря уже о других твоих прегрешениях, о которых я слышал.
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//Я не потерплю такого поведения в моем городе!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//Ты должен заплатить штраф, чтобы искупить свою вину.
			Andre_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//Если ты дерешься со всяким сбродом в гавани, это одно...
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//Но когда ты нападаешь на граждан или королевских солдат, я должен принять меры.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//А эту овцу было обязательно убивать?
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//Если я просто так отпущу тебя, скоро все будут делать то, что хотят.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//Так что тебе придется заплатить соответствующий штраф. И твои прегрешения будут забыты.
			Andre_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//Я слышал, что ты зарезал овцу.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//Ты же понимаешь, что я не могу оставить это дело просто так.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//Тебе придется заплатить компенсацию!
			Andre_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Сколько?
		if(Andre_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Andre_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER,"У меня недостаточно золота!",DIA_Andre_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
		{
			Info_AddChoice(DIA_Andre_PETZMASTER,"Я хочу заплатить штраф.",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Andre_Schulden);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Хорошо! Я позабочусь, чтобы все в городе узнали об этом - это хоть как-то восстановит твою репутацию.
	B_GrantAbsolution(LOC_CITY);
	Andre_Schulden = 0;
	Andre_LastPetzCounter = 0;
	Andre_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_ClearChoices(DIA_Andre_PMSchulden);
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Тогда постарайся собрать необходимую сумму как можно быстрее.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//Но должен предупредить тебя: если ты при этом усугубишь свою вину, то твой штраф только возрастет.
	Andre_LastPetzCounter = B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Hallo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Hallo_Condition;
	information = DIA_Andre_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Hallo_Info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Да пребудет с тобой Иннос, чужеземец! Что привело тебя ко мне?
	AndreTakkFT = TRUE;
};


instance DIA_ANDRE_KDFCANTHAR(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_kdfcanthar_condition;
	information = dia_andre_kdfcanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_kdfcanthar_condition()
{
	if((Canthar_WiederRaus == TRUE) && (Npc_IsDead(Canthar) == FALSE) && Npc_KnowsInfo(other,dia_daron_canthar) && (other.guild == GIL_KDF) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_kdfcanthar_info()
{
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_00");	//Почтенный маг, мастер Дарон сообщил мне о возмутительных слухах, распускаемых торговцем Кантаром.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_01");	//Я разобрался в этом и вынужден признать, что он был выпущен из тюрьмы незаконно.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_02");	//Однако в твоей воле решить его судьбу.
	Canthar_Sperre = FALSE;
	Info_ClearChoices(dia_andre_kdfcanthar);
	Info_AddChoice(dia_andre_kdfcanthar,"Думаю, что ему самое место за решеткой.",dia_andre_kdfcanthar_free);
	Info_AddChoice(dia_andre_kdfcanthar,"Пусть останется на свободе.",dia_andre_kdfcanthar_prison);
};

func void dia_andre_kdfcanthar_prison()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_03");	//Думаю, что ему самое место за решеткой.
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_04");	//Там он сможет поразмыслить, что важнее - человеческая жизнь или место на рынке.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_05");	//Я выполню твое решение.
	B_StartOtherRoutine(Canthar,"KNAST");
	CANTHAR_AUSGELIEFERT2 = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_andre_kdfcanthar_free()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_06");	//Пусть останется на свободе.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_07");	//Хорошо, будет по-твоему, хоть я и не одобряю это решение.
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Message(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_Message_Condition;
	information = DIA_Andre_Message_Info;
	permanent = FALSE;
	description = "У меня есть важное сообщение для лорда Хагена.";
};


func int DIA_Andre_Message_Condition()
{
	if((Kapitel < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void DIA_Andre_Message_Info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//У меня есть важное сообщение для лорда Хагена.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//Ну, ты стоишь перед его представителем. Так что там такое?
	Info_ClearChoices(DIA_Andre_Message);
	Info_AddChoice(DIA_Andre_Message,"Это я могу сказать только лорду Хагену.",DIA_Andre_Message_Personal);
	Info_AddChoice(DIA_Andre_Message,"Армию орков, возглавляют ДРАКОНЫ!",DIA_Andre_Message_Dragons);
	Info_AddChoice(DIA_Andre_Message,"Это насчет священного артефакта - Глаза Инноса.",DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Лорд Хаген принимает только паладинов и тех, кто служит паладинам.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Он считает ниже своего достоинства тратить время на простых людей.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//Это насчет священного артефакта - Глаза Инноса.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Глаз Инноса - никогда не слышал о таком. Но это еще ничего не значит.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Если действительно существует артефакт, носящий Его имя, только самые высокопоставленные члены нашего ордена могут знать о нем.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Вот почему мне нужно поговорить именно с лордом Хагеном.
	Andre_EyeInnos = TRUE;
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

func void DIA_Andre_Message_Dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Армия орков, возглавляемая ДРА...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(прерывает) Я знаю, что армия орков становится все сильнее!
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Ты же не хочешь мне сказать, что ты только ЭТО хочешь доложить лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Он оторвет тебе голову, если ты будешь попусту тратить его время, отвлекая его такими историями.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//Я уверен, что ты достаточно умен и понимаешь это сам.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Так все-таки, зачем тебе нужно увидеть его?
};

func void DIA_Andre_Message_Personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//Это я могу сказать только лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Как знаешь. Но ты должен понять одно:
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

instance DIA_Andre_Paladine(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_Paladine_Condition;
	information = DIA_Andre_Paladine_Info;
	permanent = FALSE;
	description = "Почему паладины прибыли в город?";
};


func int DIA_Andre_Paladine_Condition()
{
	if((other.guild != GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladine_Info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Почему паладины прибыли в город?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//Цели нашей операции являются тайной.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Я могу сказать тебе только, что гражданам города не грозит никакая опасность.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Тебе не о чем волноваться.
};


instance DIA_Andre_PaladineAgain(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_PaladineAgain_Condition;
	information = DIA_Andre_PaladineAgain_Info;
	permanent = FALSE;
	description = "Что паладины делают в городе?";
};


func int DIA_Andre_PaladineAgain_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_PaladineAgain_Info()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Так ты скажешь мне, зачем паладины прибыли в Хоринис?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Что паладины делают в городе?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Теперь, когда ты вступил в городскую стражу, ты подчиняешься паладинам.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//И теперь я могу доверять тебе.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//Мы прибыли по поручению короля Робара. С разрушением Барьера поставки руды прекратились.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Поэтому теперь мы добываем руду и доставляем ее на материк. При помощи этой руды мы выкуем новое оружие и победим орков.
	KnowsPaladins_Ore = TRUE;
};


instance DIA_Andre_AskToJoin(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_AskToJoin_Condition;
	information = DIA_Andre_AskToJoin_Info;
	permanent = FALSE;
	description = "Я хочу поступить на службу к паладинам!";
};


func int DIA_Andre_AskToJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_AskToJoin_Info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Я хочу поступить на службу к паладинам!
	if(Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Хорошо. Нам нужны люди. И меня не интересует, почему ты решил присоединиться к нам.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Если ты поступишь на службы к паладинам, я помогу тебе добиться аудиенции у лорда Хагена.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Достойное решение.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//Однако у меня есть приказ принимать в ополчение только граждан этого города.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//Мой командующий опасается, что в наши ряды могут проникнуть шпионы или диверсанты.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//Он хочет таким образом свести риск к минимуму.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Поэтому, ты сначала должен стать гражданином города. Не знаю, имеет это правило смысл или нет, но приказ есть приказ.
	Log_CreateTopic(TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_Running);
	B_LogEntry(TOPIC_BecomeMIL,"Прежде чем я смогу вступить в ряды городской стражи, я должен стать гражданином города.");
};


instance DIA_Andre_AboutMiliz(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Andre_AboutMiliz_Condition;
	information = DIA_Andre_AboutMiliz_Info;
	permanent = FALSE;
	description = "Что я получу от вступления в ополчение?";
};


func int DIA_Andre_AboutMiliz_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Что я получу от вступления в ополчение?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Позволь мне прояснить один момент. Обязанности солдата ополчения не ограничиваются расхаживанием по городу в униформе.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Это грязная и даже кровавая работа. Когда ты станешь одним из нас, тебя будет ждать целая гора работы.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Но это того стоит. Помимо жалования, у тебя появляется шанс однажды стать священным воином Инноса.
};


instance DIA_Addon_Andre_MartinEmpfehlung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information = DIA_Addon_Andre_MartinEmpfehlung_Info;
	description = "Я принес рекомендательное письмо от вашего интенданта.";
};


func int DIA_Addon_Andre_MartinEmpfehlung_Condition()
{
	if(Npc_HasItems(other,ItWr_Martin_MilizEmpfehlung_Addon) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//Я принес рекомендательное письмо от вашего интенданта.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(недоверчиво) Что? А ну-ка, покажи.
	B_GiveInvItems(other,self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(удивленно) Ну надо же!.. Тебе, должно быть, пришлось потрудиться! Не так-то просто получить нечто подобное от Мартина.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//Ладно, я убежден. Если Мартин за тебя ручается, я согласен тебя принять. Скажи мне, когда ты будешь готов.
	Andre_Knows_MartinEmpfehlung = TRUE;
};


instance DIA_Andre_Alternative(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Alternative_Condition;
	information = DIA_Andre_Alternative_Info;
	permanent = FALSE;
	description = "А нет более быстрого способа присоединиться к вам?";
};


func int DIA_Andre_Alternative_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_AskToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Alternative_Info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//А нет более быстрого способа присоединиться к вам?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Хммм...(задумчиво) У тебя действительно серьезные намерения, да?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Хорошо, cлушай! У меня есть проблема. Если ты решишь ее для меня, я обещаю, что ты будешь зачислен в ополчение.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//И самое главное: никому ни слова!
};


instance DIA_Andre_GuildOfThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_GuildOfThieves_Condition;
	information = DIA_Andre_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Что у тебя за проблемы?";
};

func int DIA_Andre_GuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};

func void DIA_Andre_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Что у тебя за проблемы?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Последнее время в городе развелось слишком много воров. И мы никак не можем поймать ни одного из них. Воры действуют очень осторожно.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Эти мерзавцы знают свое дело. Я уверен, что в городе действует организованная банда.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Я не удивлюсь, если в Хоринисе появилась гильдия воров. Найди главарей этой банды и ликвидируй их.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Тогда я смогу гарантировать, что ты будешь принят в ополчение - неважно, гражданин ты или нет.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Но ты никому не должен говорить о нашем соглашении!
	};
	MIS_Andre_GuildOfThieves = LOG_Running;
	B_LogEntry(TOPIC_BecomeMIL,"Есть также другой способ вступить в ряды городской стражи - найти и уничтожить гильдию воров Хориниса.");
};


instance DIA_Andre_WhereThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_WhereThieves_Condition;
	information = DIA_Andre_WhereThieves_Info;
	permanent = FALSE;
	description = "Где мне лучше начать искать этих воров?";
};


func int DIA_Andre_WhereThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhereThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Где мне лучше начать искать этих воров?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Если бы я знал это, я бы сделал это сам!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//Могу сказать одно: мы недавно перевернули вверх дном весь портовый квартал и ничего не нашли. Абсолютно ничего.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Люди, живущие там, не склонны к сотрудничеству, особенно, если на тебе доспехи паладина.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Но ты нездешний. Возможно, тебе они будут больше доверять.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Ты можешь поспрашивать в портовом квартале. Но будь осторожен. Если люди поймут, что ты работаешь на паладинов, ты не узнаешь НИЧЕГО!
	B_LogEntry(TOPIC_BecomeMIL,"Если я хочу найти гильдию воров, мне лучше начать прислушиваться к тому, что говорят в портовом квартале.");
};


instance DIA_Andre_WhatToDo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_WhatToDo_Condition;
	information = DIA_Andre_WhatToDo_Info;
	permanent = FALSE;
	description = "Что мне делать, когда я найду этих воров?";
};


func int DIA_Andre_WhatToDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhatToDo_Info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Что мне делать, когда я найду этих воров?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Если дело касается мелкой рыбешки - рядового вора или наводчика, лучше всего избежать схватки.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Просто приди ко мне и доложи. А я позабочусь, чтобы эта мразь оказалась за решеткой.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Городская стража может вмешаться в драку и у тебя не будет возможности объяснить им, что происходит.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Кроме того, за каждого преступника, который с твоей помощью будет засажен за решетку, тебе полагается награда.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Однако, если ты найдешь логово главарей - ну, тогда тебе, вероятно, не удастся избежать боя.
	B_LogEntry(TOPIC_BecomeMIL,"Если я поймаю какую-нибудь мелкую рыбешку гильдии воров, я должен привести его прямо к лорду Андрэ. А чтобы ликвидировать гильдию воров, я должен найти их логово.");
};


instance DIA_Andre_Auslieferung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 200;
	condition = DIA_Andre_Auslieferung_Condition;
	information = DIA_Andre_Auslieferung_Info;
	permanent = TRUE;
	description = "Я пришел получить награду за преступника.";
};

func int DIA_Andre_Auslieferung_Condition()
{
	if((Rengaru_Ausgeliefert == FALSE) || (Halvor_Ausgeliefert == FALSE) || (Nagur_Ausgeliefert == FALSE) || (MIS_Canthars_KomproBrief == LOG_Running) || (Npc_HasItems(hero,ItMi_DexterHead) >= 1) || (Npc_HasItems(hero,ItMi_NestorHead) >= 1) || (Npc_HasItems(hero,ItMi_KriksHead) >= 1) || (Npc_HasItems(hero,ItMi_BartHead) >= 1) || (Npc_HasItems(hero,ItMi_SkironHead) >= 1) || (Npc_HasItems(hero,ItMi_RocksHead) >= 1))
	{
		if(KAPITELORCATC == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_Auslieferung_Info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//Я пришел получить награду за преступника.
	Info_ClearChoices(DIA_Andre_Auslieferung);
	Info_AddChoice(DIA_Andre_Auslieferung,"Я зайду позже.",DIA_Andre_Auslieferung_Back);

	if((Rengaru_InKnast == TRUE) && (Rengaru_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Ренгару обокрал торговца Джору.",DIA_Andre_Auslieferung_Rengaru);
	};
	if((Betrayal_Halvor == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Халвор продает краденые вещи.",DIA_Andre_Auslieferung_Halvor);
	};
	if((MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Нагур убил посыльного Бальтрама.",DIA_Andre_Auslieferung_Nagur);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Торговец Кантар пытается избавиться от Сары!",DIA_Andre_Auslieferung_Canthar);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (Npc_HasItems(Sarah,ItWr_Canthars_KomproBrief_MIS) >= 1) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Сара продает оружие Онару.",DIA_Andre_Auslieferung_Sarah);
	};
	if((Npc_HasItems(hero,ItMi_DexterHead) >= 1) && (DexterIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Декстер мертв.",DIA_Andre_Auslieferung_Dexter);
	};
	if((Npc_HasItems(hero,ItMi_NestorHead) >= 1) && (NestorIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Нестор 'Ганибал' мертв.",DIA_Andre_Auslieferung_Nestor);
	};
	if((Npc_HasItems(hero,ItMi_KriksHead) >= 1) && (KriksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Крикс 'Бритва' мертв.",DIA_Andre_Auslieferung_Kriks);
	};
	if((Npc_HasItems(hero,ItMi_BartHead) >= 1) && (BartIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Барт 'Коротышка' мертв.",DIA_Andre_Auslieferung_Bart);
	};
	if((Npc_HasItems(hero,ItMi_SkironHead) >= 1) && (SkironIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Скирон 'Мясник' мертв.",DIA_Andre_Auslieferung_Skiron);
	};
	if((Npc_HasItems(hero,ItMi_RocksHead) >= 1) && (RocksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Рокс 'Шустрый' мертв.",DIA_Andre_Auslieferung_Rocks);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


func void DIA_Andre_Auslieferung_Dexter()
{
	B_GivePlayerXP(750);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Dexter_01_00");	//Разбойник по имени Декстер мертв.
	B_GiveInvItems(other,self,ItMi_DexterHead,1);
	Npc_RemoveInvItems(self,ItMi_DexterHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Dexter_01_01");	//Наконец-то! Этот бывший каторжник со своей шайкой держал в страхе весь Хоринис. Теперь люди смогут вздохнуть более свободно.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Ты заслужил это золото и мое уважение.
	B_GiveInvItems(self,other,ItMi_Gold,2500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nestor()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nestor_01_00");	//Нестор, более известный, как 'Ганнибал', отправился вслед за своими невинными жертвами. Надеюсь, они отомстят ему на том свете.
	B_GiveInvItems(other,self,ItMi_NestorHead,1);
	Npc_RemoveInvItems(self,ItMi_NestorHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nestor_01_01");	//О вопиющей жестокости и кровожадности 'Ганнибала' ходили легенды. Я рад, что этого чудовища больше нет среди живых.
	AI_Output(self,other,"DIA_Andre_Auslieferung_NestorGold_01_02");	//Не думаю, что столь благородный воин, как ты, шел на такую рискованную охоту только ради денег. Прежде всего, ты наверняка жаждал избавить жителей острова от опасности. Тем не менее, прими это скромное вознаграждение.
	B_GiveInvItems(self,other,ItMi_Gold,2000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Kriks()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Kriks_01_00");	//Крикс 'Бритва' больше никому не причинит зла.
	B_GiveInvItems(other,self,ItMi_KriksHead,1);
	Npc_RemoveInvItems(self,ItMi_KriksHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Kriks_01_01");	//Этот негодяй не заслужил никакой иной смерти, кроме самой мучительной. Уверен, ты проводил его достойно.
	AI_Output(self,other,"DIA_Andre_Auslieferung_KriksGold_01_02");	//Моя же обязанность - достойно тебя за это наградить!
	B_GiveInvItems(self,other,ItMi_Gold,1500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Bart()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Bart_01_00");	//Желание многих в Хоринисе исполнилось: Барт по прозвищу 'Коротышка' почил. Радует и то, что на гроб уйдет не так уж много дерева.
	B_GiveInvItems(other,self,ItMi_BartHead,1);
	Npc_RemoveInvItems(self,ItMi_BartHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Bart_01_01");	//Пышных похорон покойному недоростку все равно не дождаться! Его поделят волки с падальщиками! 
	AI_Output(self,other,"DIA_Andre_Auslieferung_BartGold_01_02");	//Тебе же не придется делить. Все золото за голову Барта теперь твое.
	B_GiveInvItems(self,other,ItMi_Gold,1250);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Skiron()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Skiron_01_00");	//Я разделал 'Мясника'.
	B_GiveInvItems(other,self,ItMi_SkironHead,1);
	Npc_RemoveInvItems(self,ItMi_SkironHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Skiron_01_01");	//Когда-то его звали Скирон. И когда-то он был человеком. Но после всех свершенных злодеяний он этого статуса лишился.
	AI_Output(self,other,"DIA_Andre_Auslieferung_SkironGold_01_01");	//Золото - лишь приятное дополнение к твоему чувству выполненного долга.
	AI_Output(self,other,"DIA_Andre_Auslieferung_SkironGold_01_02");	//А твой статус, похоже, куется из поступков и не зависит от состояния. Это похвально. Но золото за работу тебе в любом случае полагается.
	B_GiveInvItems(self,other,ItMi_Gold,1000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rocks()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rocks_01_00");	//Роксу не удалось от меня ускользнуть. Не представляю даже, кому взбрело в голову прозвать его 'Шустрым'.
	B_GiveInvItems(other,self,ItMi_RocksHead,1);
	Npc_RemoveInvItems(self,ItMi_RocksHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rocks_01_01");	//Хех, моим ребятам. Но, видать, он быстр и неуловим только для них.
	AI_Output(self,other,"DIA_Andre_Auslieferung_RocksGold_01_02");	//Пожалуй, я вычту это золото из жалования своих медлительных бездарей. А ты молодец!
	B_GiveInvItems(self,other,ItMi_Gold,750);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{
	AI_Teleport(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Ренгару украл у торговцы Джоры! Он пытался скрыться, но я поймал его.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Хорошо, мои люди уже схватили его. Больше он не сможет воровать у добропорядочных граждан.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Вот твои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
	B_StartOtherRoutine(Rengaru,"PRISON");
};

func void DIA_Andre_Auslieferung_Halvor()
{
	AI_Teleport(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Халвор торгует краденым! Он продает товары, украденные бандитами у торговцев.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Так вот, кто этим занимается. Мои люди немедленно схватят его.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//Я не думаю, что это будет сложно. Я готов вручить тебе твою награду прямо сейчас.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	AI_Teleport(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Нагур убил посыльного Бальтрама. Он пытался использовать меня в качестве нового посыльного, чтобы перехватить товар с фермы Акила.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//Он понесет заслуженное наказание. Я немедленно прикажу посадить его за решетку.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Вот, получи награду. Ты ее заслужил.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	MIS_Nagur_Bote = LOG_SUCCESS;
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	AI_Teleport(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Торговец Кантар пытается избавиться от Сары!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Сары? Торговки оружием с рыночной площади?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//Я должен был подсунуть Саре письмо, которое подтвердило бы, что она поставляет оружие Онару.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//Понимаю. Я с радостью заплачу награду за этого ублюдка. Можешь считать, что он уже за решеткой.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Canthar,"KNAST");
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Sarah()
{
	AI_Teleport(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Сара продает оружие Онару.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Сара? Торговка оружием с рыночной площади? У тебя есть доказательство?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//В ее кармане письмо, с деталями поставки оружия ему.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//Она поплатится за это. Я прикажу арестовать ее.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Sarah,"KNAST");
	B_StartOtherRoutine(Canthar,"MARKTSTAND");
	Sarah_Ausgeliefert = TRUE;
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


instance DIA_Andre_DGRunning(C_Info)
{
	npc = MIL_311_Andre;
	nr = 4;
	condition = DIA_Andre_DGRunning_Condition;
	information = DIA_Andre_DGRunning_Info;
	permanent = TRUE;
	description = "Насчет гильдии воров...";
};


func int DIA_Andre_DGRunning_Condition()
{
	if((MIS_Andre_GuildOfThieves == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//Насчет гильдии воров...
	if(Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//Ты можешь забыть об этом деле. Я послал своих людей в канализацию.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//Гильдия воров теперь не более чем перевернутая страница истории этого города.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		if(MIS_CassiaKelche == LOG_Running)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if(MIS_CASSIAGOLDCUP == LOG_Running)
		{
			MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
		};
		if(MIS_RamirezSextant == LOG_Running)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Да?
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning,"Я работаю над этим...",DIA_Andre_DGRunning_BACK);
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"Я всех их ликвидировал!",DIA_Andre_DGRunning_Success);
	};
	if(((Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE)) && (Diebesgilde_Verraten == FALSE))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"Я нашел логово гильдии воров!",DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Я работаю над этим...
	if(Diebesgilde_Verraten == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Хорошо. Я дам тебе еще немного времени на выполнение этого задания.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Хорошо! Держи меня в курсе.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Я нашел логово гильдии воров!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Где?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//В канализации под городом.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Что? Мы запечатали канализацию...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Похоже, это не помешало им проникнуть туда.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Ты ликвидировал этих преступников?
	Diebesgilde_Verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//Я всех их ликвидировал!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Ты оказал городу большую услугу.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP(XP_GuildOfThievesPlatt);
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	if(MIS_CASSIAGOLDCUP == LOG_Running)
	{
		MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Если ты все еще хочешь вступить в ополчение, дай мне знать.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Ты выполнил нашу работу, как настоящий слуга Инноса и солдат короля.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//Тебе полагается награда за этих бандитов. Вот, возьми.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld * 3);
	Info_ClearChoices(DIA_Andre_DGRunning);
};


instance DIA_Andre_JOIN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_JOIN_Condition;
	information = DIA_Andre_JOIN_Info;
	permanent = TRUE;
	description = "Я готов вступить в ополчение!";
};


func int DIA_Andre_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//Я готов вступить в ополчение!
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//Интендант Мартин ручается за тебя и даже рекомендует тебя мне. Этого мне достаточно.
	}
	else if((MIS_Andre_GuildOfThieves == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//Я сдержу свое слово и приму тебя в ополчение, даже хотя ты и не являешься гражданином этого города.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//Но никому об этом не говори! Чем меньше людей будут знать об этом исключении, тем меньше мне придется оправдываться.
	}
	else if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//А ты являешься гражданином Хориниса?
		if(Player_IsApprentice == APP_Harad)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//Кузнец взял меня в ученики.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Харад? Я знаю его. Он работает на нас. Он достойный человек.
		};
		if(Player_IsApprentice == APP_Constantino)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//Я ученик алхимика!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//У нас, в ополчении, не так уж много ученых мужей. Возможно, твои навыки весьма пригодятся нам.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//Я мало что знаю об алхимии. Но люди говорят, что он уважаемый человек.
		};
		if(Player_IsApprentice == APP_Bosper)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//Боспер, мастер-лучник, взял меня в ученики.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Тогда ты наверняка знаешь кое-что о том, как выжить в лесу? Это хорошо, потому что ополчению приходится выполнять задачи не только в городе.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//Нам, определенно, нужны люди, умеющие ориентироваться в дикой местности.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//И Боспер уважаемый человек в этом городе.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//Если он поручился за тебя, ничто не мешает твоему вступлению в ряды ополчения.
		if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Кроме того, тебе удалось избавить город от гильдии воров. Я бы принял тебя только за этот подвиг.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//Может быть - но ты все еще не гражданин этого города, а у меня есть приказ.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//Ты можешь вступить в наши ряды, если хочешь. Но твое решение должно быть окончательным.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//После того, как ты наденешь доспехи ополчения, ты уже не сможешь просто так снять его и выйти из наших рядов.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Ты готов сражаться вместе с нами за Инноса и короля?
	Info_ClearChoices(DIA_Andre_JOIN);
	Info_AddChoice(DIA_Andre_JOIN,"Я пока не уверен...",DIA_Andre_JOIN_No);
	Info_AddChoice(DIA_Andre_JOIN,"Я готов!",DIA_Andre_JOIN_Yes);
};

func void DIA_Andre_JOIN_Yes()
{	
	B_GivePlayerXP(XP_BecomeMiliz);
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Так тому и быть. Добро пожаловать в городское ополчение!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_MIL;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	CheckHeroGuild[0] = TRUE;
	Snd_Play("GUILD_INV");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Вот твои доспехи.
	B_GiveInvItems(self,other,ITAR_TOWNGUARD,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Носи их с гордостью и достоинством.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Lothar,"START");
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;

	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);


	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Wld_InsertNpc(Mil_362_Miliz,"NW_CITY_HABOUR_KASERN_JOHN_01");
	Wld_InsertNpc(Mil_363_Miliz,"NW_CITY_HABOUR_KASERN_JONNI_01");
	InsertJohnJonni = TRUE;
};

func void DIA_Andre_JOIN_No()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Я пока не уверен...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Если ты еще сомневаешься в своем решении, я не могу принять тебя в ополчение.
	Info_ClearChoices(DIA_Andre_JOIN);
};

instance DIA_Andre_PERMJOBPAY(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_permjobpay_condition;
	information = DIA_Andre_permjobpay_info;
	permanent = TRUE;
	description = "Как насчет моего жалования?";
};

func int DIA_Andre_permjobpay_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_permjobpay_info()
{
	var int daynow;
	var int sumpay;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Andre_PermJobPay_01_00");	//Как насчет моего жалования?

	if(AndrePAYDAY < daynow)
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_01");	//Конечно. Вот, возьми его.
	
		if(AndrePAYDAY > 0)
		{
			sumpay = 50 * (daynow - AndrePAYDAY);
			B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Gold,50);
		};

		AndrePAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_03");	//Ты его уже сегодня получал. Еще вопросы?
	};
};

instance DIA_Andre_LORDHAGEN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_LORDHAGEN_Condition;
	information = DIA_Andre_LORDHAGEN_Info;
	permanent = FALSE;
	description = "Могу я теперь увидеть лорда Хагена?";
};

func int DIA_Andre_LORDHAGEN_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3) && (HagenFTMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_LORDHAGEN_Info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Могу я теперь увидеть лорда Хагена?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Теперь ты состоишь нас службе у паладинов. Они пропустят тебя. Но твое сообщение должно быть действительно важным.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//Не волнуйся, это так и есть...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Помни, что ты встречаешься с главой паладинов. Веди себя соответствующе. Теперь ты представляешь не только себя, но все ополчение.
};


instance DIA_Andre_Waffe(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Waffe_Condition;
	information = DIA_Andre_Waffe_Info;
	permanent = FALSE;
	description = "А я получу оружие?";
};


func int DIA_Andre_Waffe_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Waffe_Info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//А я получу оружие?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Конечно. Обычно этим занимается Пек. Но что-то я давно его не видел.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Найди, где он скрывается, и приведи его сюда. Тогда он выдаст тебе оружие.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//А если ты хочешь поспать, можешь выбрать любую койку в наших казармах.
	MIS_Andre_Peck = LOG_Running;
	Log_CreateTopic(TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Peck,LOG_Running);
	B_LogEntry(TOPIC_Peck,"Пек где-то в городе. Если я приведу его назад, в казармы, я смогу получить от него оружие.");
	AI_StopProcessInfos(self);
};

instance DIA_Andre_FOUND_PECK(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_PECK_Condition;
	information = DIA_Andre_FOUND_PECK_Info;
	permanent = FALSE;
	description = "Мне удалось найти Пека.";
};


func int DIA_Andre_FOUND_PECK_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Peck_FOUND_PECK) && (MIS_Andre_Peck == LOG_Running) && (Npc_IsDead(Peck) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//Мне удалось найти Пека.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Да, он уже вернулся на свой пост и приступил к выполнению своих обязанностей. Где ты нашел его?
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
	Info_AddChoice(DIA_Andre_FOUND_PECK,"Наткнулся на него в городе... ",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice(DIA_Andre_FOUND_PECK,"Я обнаружил его в борделе...",DIA_Andre_FOUND_PECK_REDLIGHT);
};

func void DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//Я случайно наткнулся на него в городе.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//Хорошо, а теперь иди к нему и получи оружие.
	MIS_Andre_Peck = LOG_SUCCESS;
	B_GivePlayerXP(XP_FoundPeck);
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//Он был в 'Красном Фонаре'.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//То есть он развлекался с девочками вместо того, чтобы выполнять свои обязанности.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//Я думаю, мне нужно серьезно поговорить с ним.
	B_GivePlayerXP(XP_FoundPeck * 2);
	MIS_Andre_Peck = LOG_SUCCESS;
	PeckCatch = TRUE;
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void B_AndreSold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Вот твое жалование.
	B_GiveInvItems(self,other,ItMi_Gold,Andre_Sold);
};


instance DIA_Andre_FIRSTMISSION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIRSTMISSION_Condition;
	information = DIA_Andre_FIRSTMISSION_Info;
	permanent = FALSE;
	description = "У тебя есть задание для меня?";
};


func int DIA_Andre_FIRSTMISSION_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTMISSION_Info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//У тебя есть задание для меня?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//Последнее время в городе появилось очень много болотной травы.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//Мы не можем позволить, чтобы эта зараза расползлась по городу.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//В противном случае все будут только курить травку и не смогут работать, не говоря уже о том, чтобы держать оружие.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//Это недопустимо. Особенно сейчас, когда так велика опасность нападения орков или наемников.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//Я подозреваю, что к этому имеют отношение наемники. Ручаюсь, это они принесли траву в город.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//Что я могу сделать?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Мортис, один из наших людей, слышал в портовом кабаке, что где-то в порту находится целый тюк этой травы.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Поищи там и принеси этот тюк мне.
	MIS_Andre_WAREHOUSE = LOG_Running;
	Log_CreateTopic(TOPIC_Warehouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Warehouse,LOG_Running);
	B_LogEntry(TOPIC_Warehouse,"Тюк болотной травы прибыл в гавань. Мортис прослышал об этом в местном пабе. Я должен найти этот тюк и принести его лорду Андрэ.");

	if(Nadja_GaveLuciaInfo == FALSE)
	{
		Bromor_Pay = FALSE;
		NadjaIsUp = FALSE;
		Nadja_Nacht = FALSE;
	};
};


instance DIA_Andre_FOUND_STUFF(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_STUFF_Condition;
	information = DIA_Andre_FOUND_STUFF_Info;
	permanent = TRUE;
	description = "Насчет тюка...";
};


func int DIA_Andre_FOUND_STUFF_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_STUFF_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//Насчет тюка...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Ты нашел его?
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) || (MIS_Cipher_Paket == LOG_SUCCESS))
	{
		Info_ClearChoices(DIA_Andre_FOUND_STUFF);
		if(Npc_HasItems(other,ItMi_HerbPaket) > 0)
		{
			Info_AddChoice(DIA_Andre_FOUND_STUFF,"Да, вот он.",DIA_Andre_FOUND_STUFF_Ja);
		};
		Info_AddChoice(DIA_Andre_FOUND_STUFF,"Я выбросил ее в море.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Пока нет.
	};
};

func void DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Да, вот он.
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Отлично! Мы будем охранять эту траву.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP(XP_Warehouse_Super * 2);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

func void DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//Я выбросил ее в море.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//Да? Ну, главное, что она теперь не сможет попасть в плохие руки.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP(XP_Warehouse_Super);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};


instance DIA_Andre_FIND_DEALER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIND_DEALER_Condition;
	information = DIA_Andre_FIND_DEALER_Info;
	permanent = FALSE;
	description = "У тебя есть еще работа для меня?";
};


func int DIA_Andre_FIND_DEALER_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(Borka) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FIND_DEALER_Info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//У тебя есть еще работа для меня?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//Ты вывел болотную траву из оборота - это хорошо.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//Но я хочу знать, кто распространяет ее среди горожан.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//Это, должно быть, кто-то в портовом квартале.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//Если бы этот человек часто приходил в город, он давно бы был пойман.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//Что именно мне нужно сделать?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Найди торговца и заставь его продать тебе этой травы. Это будет непросто, но иначе мы не сможем арестовать его.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Поговори с Мортисом. Он хорошо знает портовый квартал. Возможно, он сможет помочь тебе.
	MIS_Andre_REDLIGHT = LOG_Running;
	B_StartOtherRoutine(Nadja,"SMOKE");
	Log_CreateTopic(TOPIC_Redlight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Redlight,LOG_Running);
	B_LogEntry(TOPIC_Redlight,"Я должен найти человека, продающего болотную траву в портовом квартале. Я должен заставить его продать мне немного травы. Мортис может помочь мне в этом.");
};


instance DIA_Andre_REDLIGHT_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information = DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent = TRUE;
	description = "Насчет травы...";
};


func int DIA_Andre_REDLIGHT_SUCCESS_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_REDLIGHT_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//Насчет травы...
	if((Npc_IsDead(Borka) == TRUE) || (Undercover_Failed == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//Я не думаю, что мы теперь сможем что-то узнать в портовом квартале.
		if(Npc_IsDead(Borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Только не теперь, когда этот вышибала мертв.
		};
		if(Nadja_Victim == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//Эта девочка из Красного Фонаря, Надя, мертва. Возможно, это просто случайное совпадение.
			B_RemoveNpc(Nadja);
		};
		if(Undercover_Failed == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//Ты был недостаточно осторожен.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
	}
	else if(Borka_Deal == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//Я знаю, кто распространяет траву в городе. Это Борка, вышибала в Красном Фонаре.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//Точно? У тебя есть доказательства?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//Он продал мне болотной травы.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//Отлично, этого достаточно для нас. Я прикажу немедленно арестовать его.
		B_StartOtherRoutine(Borka,"PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP(XP_Redlight);
		B_AndreSold();
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_04");	//Тебя же, я от имени всего ополчения благодарю за помощь!
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_05");	//И в доказательство моих слов, вот - прими от меня эти доспехи.
		B_GiveInvItems(self,other,ItAr_MIL_L,1);
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_06");	//Ты их по праву заслужил, солдат!
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//...я все еще работаю над этим.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Хорошо. Помни, что ты должен заставить этого человека совершить сделку с тобой.
	};
};


instance DIA_Andre_HILFBAUERLOBART(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_HILFBAUERLOBART_Condition;
	information = DIA_Andre_HILFBAUERLOBART_Info;
	description = "У тебя есть еще задания для меня?";
};


func int DIA_Andre_HILFBAUERLOBART_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_HILFBAUERLOBART_Info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//У тебя есть еще задания для меня?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//У фермера Лобарта какие-то проблемы на его полях.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//Если мы поможем ему, это укрепит его отношения с городом. Так что отправляйся туда и посмотри, что там не так.
	Log_CreateTopic(TOPIC_Feldraeuber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber,LOG_Running);
	B_LogEntry(TOPIC_Feldraeuber,"Андрэ отправил меня на ферму Лобарта. Я опять должен помочь Лобарту восстановить порядок на ферме.");
	MIS_AndreHelpLobart = LOG_Running;
	Wld_InsertNpc(Lobarts_Giant_Bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug7,"NW_FARM1_FIELD_03");
	B_StartOtherRoutine(Vino,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer2,"BUGSTHERE");
	if(SNIPSGETNUGGETS == FALSE)
	{
		B_StartOtherRoutine(snipes,"BUGSTHERE");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Andre_LOBART_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_LOBART_SUCCESS_Condition;
	information = DIA_Andre_LOBART_SUCCESS_Info;
	description = "Я помог Лобарту.";
};


func int DIA_Andre_LOBART_SUCCESS_Condition()
{
	if(MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_LOBART_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//Я помог Лобарту.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//Превосходно. Если Лобарт будет счастлив, он продолжит продавать репу городу.
	B_GivePlayerXP(XP_LobartBugs);
	B_AndreSold();
};


instance DIA_Addon_Andre_MissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople_Condition;
	information = DIA_Addon_Andre_MissingPeople_Info;
	description = "Что насчет пропавших людей?";
};


func int DIA_Addon_Andre_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//Что насчет пропавших людей?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//А что насчет них?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//Разве мы не должны попытаться их найти?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//Лорд Хаген поручил мне защиту города и близлежащих ферм.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//Это значит, что мы заботимся о тех людях, которые все еще ЗДЕСЬ.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//Солдаты ополчения патрулируют по ночам улицы. Это все, что я могу сделать.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//А ТЫ будешь заниматься тем, чем я тебе прикажу. Понимаешь меня?
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_MissingPeople2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople2_Condition;
	information = DIA_Addon_Andre_MissingPeople2_Info;
	description = "По поводу пропавших людей...";
};


func int DIA_Addon_Andre_MissingPeople2_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild != GIL_MIL) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople2_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//По поводу пропавших людей...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//Оставь меня в покое! У меня полно других забот.
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_ReturnedMissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information = DIA_Addon_Andre_ReturnedMissingPeople_Info;
	description = "Мне удалось спасти часть пропавших людей.";
};


func int DIA_Addon_Andre_ReturnedMissingPeople_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (MIS_Addon_Andre_MissingPeople == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//Мне удалось спасти часть пропавших людей.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//А я-то думал, где ты был все это время!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//Ты - солдат ополчения! И ты не получал приказа заниматься поисками пропавших!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//Но...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//Как много людей ты спас?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//Всех тех, кто был еще жив...
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//Всех?! Я... Э-э-э...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//Я тобой горжусь! И я рад, что принял тебя в наши ряды.
		B_AndreSold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//Ты сделал великое дело!
	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Andre_MissingPeople);
};

func void B_Andre_GotoLordHagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//Тебе лучше отправиться прямо к нему.
};


instance DIA_Andre_BerichtDrachen(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachen_Condition;
	information = DIA_Andre_BerichtDrachen_Info;
	permanent = FALSE;
	description = "Я был в Долине Рудников и видел драконов!";
};


func int DIA_Andre_BerichtDrachen_Condition()
{
	if((EnterOW_Kapitel2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachen_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//Я был в Долине Рудников и видел драконов!
	if(Npc_HasItems(hero,ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//У меня есть письмо от командующего Гаронда, подтверждающее то, что я сказал.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//Это заинтересует лорда Хагена!
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BennetInPrison(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_BennetInPrison_Condition;
	information = DIA_Andre_BennetInPrison_Info;
	permanent = TRUE;
	description = "А что насчет Беннета, кузнеца?";
};


func int DIA_Andre_BennetInPrison_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BennetInPrison_Info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//А что насчет Беннета, кузнеца?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//Ты имеешь в виду этого наемника? Он сидит за решеткой, где ему самое место.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Могу я поговорить с ним?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Конечно. Но если ты попытаешься помочь ему бежать, ты окажешься за решеткой рядом с ним.
};

var int AndreCatchCorn;

instance DIA_Andre_Cornelius_Liar(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Cornelius_Liar_Condition;
	information = DIA_Andre_Cornelius_Liar_Info;
	permanent = TRUE;
	description = "Я думаю, Корнелиус лжет.";
};

func int DIA_Andre_Cornelius_Liar_Condition()
{
	if((Cornelius_ThreatenByMilSC == TRUE) && (CorneliusFlee != TRUE) && (AndreCatchCorn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Cornelius_Liar_Info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//Я думаю, Корнелиус лжет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Ты уверен?
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"Нет.",DIA_Andre_Cornelius_Liar_No);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"Да.",DIA_Andre_Cornelius_Liar_Yes);
};

func void DIA_Andre_Cornelius_Liar_No()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//Тогда не стоит заявлять о своих подозрениях во весь голос.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Корнелиус - влиятельный человек. Он может сделать твою жизнь адом, если захочет.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//Пока у тебя нет доказательств, я ничем не могу помочь тебе.
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

func void DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Да.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//Что за доказательства у тебя есть?

	if(Cornelius_IsLiar == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//Я прочел его дневник! Его подкупили. Все, что он сказал, было ложью.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//Если это действительно так, ты должен немедленно сообщить об этом лорду Хагену.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Покажи ему этот дневник. Он разберется в этом деле.
		AndreCatchCorn = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Э-э-э, ну, я думаю...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//Мне нужны доказательства, а не предположения. Принеси доказательства, и тогда я смогу что-нибудь сделать.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//А до того времени тебе стоит поосторожнее выбирать слова.
	};

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};


instance DIA_Andre_Paladin(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Paladin_Condition;
	information = DIA_Andre_Paladin_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Paladin_Condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladin_Info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//Теперь ты паладин! Поздравляю!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//Я с самого начала знал, что ты не задержишься долго в ополчении.
};


instance DIA_Andre_PERM(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_PERM_Condition;
	information = DIA_Andre_PERM_Info;
	permanent = TRUE;
	description = "Как обстановка в городе?";
};


func int DIA_Andre_PERM_Condition()
{
	if((other.guild != GIL_NONE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PERM_Info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//Как обстановка в городе?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//Все под контролем.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Выполняй свои задания.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//С этого времени ты должен докладывать непосредственно лорду Хагену. Иди, поговори с ним.
	};
};


instance DIA_Andre_BerichtDrachenTot(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachenTot_Condition;
	information = DIA_Andre_BerichtDrachenTot_Info;
	permanent = FALSE;
	description = "Я убил всех драконов в Долине Рудников!";
};


func int DIA_Andre_BerichtDrachenTot_Condition()
{
	if((Kapitel == 5) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachenTot_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//Я убил всех драконов в Долине Рудников!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//Если это правда, ты должен рассказать об этом лорду Хагену.
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BerichtTorAuf(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtTorAuf_Condition;
	information = DIA_Andre_BerichtTorAuf_Info;
	permanent = FALSE;
	description = "Замок в Долине Рудников штурмовали орки!";
};


func int DIA_Andre_BerichtTorAuf_Condition()
{
	if((Kapitel == 5) && (MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtTorAuf_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//Замок в Долине Рудников штурмовали орки!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//Лорд Хаген должен услышать об этом.
	B_Andre_GotoLordHagen();
};

instance DIA_ANDRE_GUILDKILL(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkill_condition;
	information = dia_andre_guildkill_info;
	permanent = FALSE;
	description = "Я могу что-нибудь еще сделать?";
};

func int dia_andre_guildkill_condition()
{
	if((other.guild == GIL_MIL) && (MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (STARTKILLERWAY == FALSE) && (CHIEFKILLERISDEAD == FALSE) && (CassiaIsDead == FALSE) && (RamirezIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_guildkill_info()
{
	AI_Output(other,self,"DIA_Andre_GuildKill_01_00");	//Я могу что-нибудь еще сделать?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_01");	//Да, есть еще одна проблема. Причем достаточно серьезная.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_03");	//В последнее время я очень обеспокоен слухами о появлении в городе гильдии наемных убийц.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_06");	//Нам как-то надо решить эту проблему. И чем быстрее мы разберемся с этим - тем лучше.
	AI_Output(other,self,"DIA_Andre_GuildKill_01_07");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_09");	//Нам почти ничего не известно про этих ребят. Ну, если не считать того, что мы знаем имя того, кто ее возглавляет.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_11");	//Его зовут Асмал. Говорят, что он очень опасный и кровожадный тип.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_12");	//Так что, если тебе удастся выйти на его след, - будь осторожнее!
	AI_Output(other,self,"DIA_Andre_GuildKill_01_13");	//Что мне предпринять, если я найду эту гильдию убийц?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_14");	//Постарайся завоевать их доверие, чтобы узнать о них побольше. Или можешь просто разобраться с этими парнями.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_15");	//Если же тебе покажется, что ты с этим не справишься - просто сообщи мне их имена и где они скрываются.
	STARTKILLERWAY_ANDRE = TRUE;
	MIS_GUILDKILL = LOG_Running;
	Log_CreateTopic(TOPIC_GUILDKILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_Running);
	B_LogEntry(TOPIC_GUILDKILL,"Лорд Андрэ обеспокоен слухами о появлении в Хоринисе гильдии наемных убийц. Чтобы избежать ненужных осложнений и успокоить горожан, он попросил меня расследовать это дело как можно быстрее. Лорд Андрэ не смог рассказать мне много об этой гильдии, но упомянул, что ее возглавляет некий Асмал - опасный и коварный тип. В любом случае, если я выйду на след этих ребят, лорд Аднрэ недвусмысленно приказал мне попробовать завоевать их доверие, чтобы узнать об этой гильдии больше, или же просто разобраться с ними.");
};


instance DIA_ANDRE_GUILDKILLNEWS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkillnews_condition;
	information = dia_andre_guildkillnews_info;
	permanent = TRUE;
	description = "По поводу гильдии убийц...";
};


func int dia_andre_guildkillnews_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_guildkillnews_info()
{
	AI_Output(other,self,"DIA_Andre_GuildKillNews_01_00");	//По поводу гильдии убийц...
	AI_Output(self,other,"DIA_Andre_GuildKillNews_01_01");	//Да? Тебе есть что сообщить?

	if((CHIEFKILLERISDEAD == TRUE) && (GUILDKILLISDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_02");	//Асмал мертв!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_03");	//Так тебе все-таки удалось выйти на его след и прикончить этого ублюдка. Это отличная новость!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_04");	//Думаю, этого вполне достаточно, чтобы успокоить жителей города.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_05");	//Без своего лидера эти парни будут не так опасны, как раньше.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_06");	//Ты хорошо поработал. Вот, возьми это золото - ты его заслужил!
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry(TOPIC_GUILDKILL,"Лорд Андрэ был рад узнать о том, что я прикончил главу гильдии убийц Асмала. Он считает, что этого будет достаточно, чтобы успокоить жителей города.");
	}
	else if(GUILDKILLISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_07");	//Я разобрался с этим парнями. Можешь забыть про эту проблему.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_08");	//(удивленно) Так тебе все-таки удалось это сделать? Это отличная новость!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_10");	//Ты хорошо поработал. Вот, возьми это золото - ты его заслужил!
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry(TOPIC_GUILDKILL,"Лорд Андрэ был рад узнать о том, что я покончил с гильдией убийц.");
	}
	else if(GUILDKILLKNOWNLOC == TRUE)
	{
		if(KILLFINISH == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_11");	//Я узнал, кем на самом деле являются эти люди!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_12");	//И?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_13");	//Бродячие музыканты, прибывшие пару недель назад в город. Они дают представления на торговой площади Хориниса.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_14");	//А человек по имени Гиллиан есть не кто иной, как сам Асмал!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_15");	//Хммм...(озадаченно) Вот уж никогда бы не подумал.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_17");	//Ну, раз так... Хорошо! Я немедленно прикажу страже схватить этих людей.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_18");	//С этим могут возникнуть проблемы.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_19");	//Что ты имеешь в виду?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_20");	//Асмал и его люди покинули город, и, думаю, они навряд ли вернутся сюда. Слишком опасно!
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_22");	//Теперь они ошиваются недалеко от фермы Онара.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_26");	//Ладно. Главное, что гильдия убийц больше не будет тревожить граждан Хориниса.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_27");	//Что касается тебя, то ты славно поработал. Вот, возьми это золото - ты его заслужил!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry(TOPIC_GUILDKILL,"Я сообщил лорду Андрэ имена людей, состоявших в гильдии убийц, а он в свою очередь поблагодарил меня за оказанную помощь. Правда, он был немного расстроен, что Асмал и его люди смогли ускользнуть из города. Теперь вариант разобраться с ними практически не представляется возможным.");
		}
		else
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_28");	//Я узнал, кем на самом деле являются эти люди!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_29");	//И?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_30");	//Бродячие музыканты, прибывшие пару недель назад в город. Они дают представления на торговой площади Хориниса.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_31");	//А человек по имени Гиллиан есть не кто иной, как сам Асмал!
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_34");	//Сейчас все они скрываются в заброшенном доме на пристани.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_35");	//Ну, раз так... Хорошо! Я немедленно прикажу страже схватить этих людей.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_36");	//Что касается тебя, то ты славно поработал. Вот, возьми это золото - ты его заслужил!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry(TOPIC_GUILDKILL,"Я сообщил лорду Андрэ имена тех людей, кто состоял в гильдии убийц, а он в свою очередь поблагодарил меня за оказанную помощь и добавил, что всем остальным уже займется городское ополчение.");
			B_KillNpc(PIR_1390_Addon_InExtremo_DrPymonte);
			B_KillNpc(PIR_1391_Addon_InExtremo_TheFlail);
			B_KillNpc(PIR_1395_Addon_InExtremo_Lutter);
			B_KillNpc(PIR_1396_Addon_InExtremo_Flex);
			B_KillNpc(pir_1397_addon_inextremo_charlotte);
			B_KillNpc(pir_1398_addon_inextremo_announcer);
		};
	}
	else if((MEETKILLLATE == TRUE) && (MEETKILLLATELOG == TRUE))
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_37");	//Думаю, я провалил дело.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_38");	//Что? Почему ты так решил?
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_39");	//Мне назначили встречу, на которую я опоздал. На ней я мог разузнать что-то о гильдии убийц.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_41");	//Как же ты допустил это?! Тебе вряд ли удастся выяснить еще что-либо.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_42");	//Ладно. Что ж теперь поделаешь. Может, мы еще найдем способ вычислить этих ублюдков. Хотя я в этом сомневаюсь.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_43");	//(с досадой) Черт!
		MIS_GUILDKILL = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_GUILDKILL);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_44");	//Пока нет.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_45");	//Тогда не отрывай меня от дел!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_46");	//Приходи только тогда, когда тебе станет что-нибудь известно об этом.	
	};
};


instance DIA_ANDRE_SARAHTOGUILD(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguild_condition;
	information = dia_andre_sarahtoguild_info;
	permanent = FALSE;
	description = "Я хочу заплатить штраф за заключенного.";
};


func int dia_andre_sarahtoguild_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (Sarah_Ausgeliefert == TRUE) && (MIS_SARAHTOGUILD == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_00");	//Я хочу заплатить штраф за заключенного.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_01");	//Хорошо. За кого ты хочешь заплатить штраф?
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_02");	//За торговку по имени Сара.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_03");	//Сара? Хммм...(задумчиво) Ее обвиняют в том, что она продавала оружие наемникам Онара.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_04");	//Это серьезное преступление!
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_05");	//Я знаю. И какова же цена ее свободы?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_06");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_07");	//...и тот факт, что за нее просит один из достопочтенных магов Огня...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_08");	//Думаю, трех сотен золотых монет должно хватить, чтобы снять с нее все обвинения.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере трехсот золотых монет.");
		SARASHULDEN = 300;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_09");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_10");	//...и тот факт, что за нее просит один из достопочтенных магов Воды...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_11");	//Думаю, четырех сотен золотых монет должно хватить, чтобы снять с нее все обвинения.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере четырехсот золотых монет.");
		SARASHULDEN = 400;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_12");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_13");	//...и тот факт, что за нее просит один из моих братьев паладинов...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_14");	//Думаю, трех сотен золотых монет должно хватить, чтобы снять с нее все обвинения.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере трехсот золотых монет.");
		SARASHULDEN = 300;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_15");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_16");	//...и тот факт, что за нее просит один из людей, состоящих в городском ополчении...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_17");	//Думаю, пяти сотен золотых монет должно хватить, чтобы снять с нее все обвинения.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере пятиста золотых монет.");
		SARASHULDEN = 500;
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_18");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_19");	//...и тот факт, что за нее просит один из наемников...(ухмыляется)
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_20");	//Думаю, полутора тысяч золотых монет должно хватить, чтобы снять с нее все обвинения.
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_21");	//Ого!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере полутора тысячи золотых монет.");
		SARASHULDEN = 1500;
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_22");	//Дай мне подумать...(задумчиво) Ну, если учитывать всю тяжесть ее вины...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_23");	//Думаю, тысячи золотых монет должно хватить, чтобы снять с нее все обвинения.
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_24");	//Ого!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лорд Андрэ назначил штраф за торговку Сару в размере тысячи золотых монет.");
		SARASHULDEN = 1000;
	};
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_25");	//Это мое решение.
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_26");	//Ясно.
};


instance DIA_ANDRE_SARAHTOGUILDPAY(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguildpay_condition;
	information = dia_andre_sarahtoguildpay_info;
	permanent = TRUE;
	description = "Освободи торговку Сару.";
};


func int dia_andre_sarahtoguildpay_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (Sarah_Ausgeliefert == TRUE) && (SARASHULDEN > 0) && (SARAISFREE == FALSE) && (MIS_SARAHTOGUILD == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_sarahtoguildpay_info()
{
	AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_00");	//Освободи торговку Сару.
	AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_01");	//А где деньги, которые ты должен заплатить в качестве компенсации за ее преступление?
	if(Npc_HasItems(other,ItMi_Gold) >= SARASHULDEN)
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,SARASHULDEN);
		AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_02");	//Вот твое золото.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_03");	//Отлично! Теперь я позабочусь о том, чтобы с торговки Сары были сняты все обвинения.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_04");	//Она свободна.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Я освободил Сару из тюрьмы. Теперь мне надо поговорить с ней.");
		SARAISFREE = TRUE;
		Npc_ExchangeRoutine(VLK_470_Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_06");	//У меня их пока нет.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_07");	//Тогда приходи, когда они у тебя будут.
	};
};


instance DIA_ANDRE_HANNAINPRISION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprision_condition;
	information = dia_andre_hannainprision_info;
	permanent = FALSE;
	description = "Почему арестовали Ханну?";
};


func int dia_andre_hannainprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISION == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hannainprision_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_00");	//Почему арестовали Ханну?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_01");	//Ее обвиняют в воровстве.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_02");	//Мне кажется, это какая-то ошибка!
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_03");	//(задумчиво) Я и сам бы не хотел в это верить, но, к сожалению, доказательства ее преступления неопровержимы.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_04");	//Какие еще доказательства?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_07");	//В ее сундуке нашли вещи торговца Хакона, а торговец по имени Гаспар видел, как она копалась в его сундуке.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_08");	//Гаспар?! Это и есть тот свидетель?
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_10");	//Теперь именно он заправляет всеми делами в гостинице Ханны.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_11");	//Уж очень это подозрительно!
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_13");	//Правосудию интересны только улики и факты, а пока они против Ханны.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_14");	//А если я достану доказательства ее невиновности?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_16");	//Но пока их у тебя нет.
	KNOWSHANNAINPRISIONHAKON = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Лорд Андрэ сказал мне, что торговца, которого обокрали, зовут Хакон. А главный свидетель этого дела - не кто иной, как Гаспар, новый хозяин гостиницы. Думаю, для начала надо подробно расспросить их обоих об этом.");
	Log_AddEntry(TOPIC_ABIGEILHELPHANNA,"Если я хочу вытащить Ханну из тюрьмы, мне надо предоставить лорду Андрэ доказательства ее невиновности.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HANNAINPRISIONDONE(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprisiondone_condition;
	information = dia_andre_hannainprisiondone_info;
	permanent = FALSE;
	description = "У меня есть улики против Гаспара!";
};


func int dia_andre_hannainprisiondone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (Npc_HasItems(other,itri_hakonmissring) >= 1) && (JOTELLSGASPAR == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hannainprisiondone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_00");	//У меня есть улики против Гаспара!
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_02");	//Вот кольцо, которое украли у торговца Хакона.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_04");	//Гаспар расплатился этим кольцом с одним человеком по имени Джо.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_05");	//Этот ублюдок нанял его, чтобы тот отвлек Ханну.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_07");	//Сам же Гаспар тем временем незаметно проник в гостиницу и обокрал торговца Хакона.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_08");	//А после этого подбросил украденные вещи Ханне, а кольцо отдал Джо в качестве оплаты.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_09");	//Это правда?
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_10");	//Джо может подтвердить мои слова.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_11");	//(серьезно) Хорошо. Ты убедил меня.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_12");	//Гаспар будет немедленно взят под стражу, а с Ханны снимут все обвинения в краже и освободят.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_15");	//Теперь можешь идти - я обо всем позабочусь.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Лорд Андрэ принял мои улики против Гаспара к рассмотрению и заключил, что именно он виновен в краже вещей торговца Хакона. Ханна теперь свободна.");
	GASPARPISSOFF = TRUE;
	HANNAISFREE = TRUE;
	Npc_ExchangeRoutine(VLK_414_Hanna,"Start");
	Npc_ExchangeRoutine(vlk_6137_gaspar,"InPrision");
	AI_Teleport(gaspar,"NW_CITY_HANNA_INPRISION");
	AI_Teleport(hanna,"NW_CITY_HANNA");
};


instance DIA_ANDRE_IGNAZDEAD(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazdead_condition;
	information = dia_andre_ignazdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_ignazdead_condition()
{
	if(KILLHAPPENSMADE == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_ignazdead_info()
{
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_00");	//Постой. Мне необходимо срочно поговорить с тобой.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_02");	//При непонятных пока для меня обстоятельствах произошло одно грязное убийство!
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_03");	//Убит Игнац - алхимик, который жил в портовом районе.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_05");	//Кажется, беднягу отравили. И мой священный долг - разобраться в этом преступлении.
	AI_Output(other,self,"DIA_Andre_IgnazDead_01_06");	//А что ты хочешь от меня?
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_10");	//Походи по городу, поспрашивай людей - может, кто-нибудь что-то видел, но просто боится об этом говорить.
	AI_Output(other,self,"DIA_Andre_IgnazDead_01_14");	//Хорошо! Если мне удастся что-нибудь выяснить - я сообщу тебе об этом.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_15");	//Вот и ладненько. Можешь идти.
	MIS_KILLIGNAZ = LOG_Running;
	Log_CreateTopic(TOPIC_KILLIGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_Running);
	B_LogEntry(TOPIC_KILLIGNAZ,"Лорду Андрэ вновь понадобилась моя помощь. На этот раз он попросил меня разобраться с убийством алхимика Игнаца. Похоже, его кто-то отравил. С чего же мне начать поиски?");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V1(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v1_condition;
	information = dia_andre_ignazfoundkill_v1_info;
	permanent = FALSE;
	description = "Я нашел убийцу.";
};


func int dia_andre_ignazfoundkill_v1_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (CONSTANTINOFUCKOFF == TRUE) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v1_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_00");	//Я нашел убийцу.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_01");	//И кто же он?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_02");	//Городской алхимик Константино.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_03");	//(удивленно) Константино?! Ты в этом уверен?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_04");	//Вот, я нашел в доме Игнаца этот пузырек с ядом, который принадлежал когда-то именно ему.
	B_GiveInvItems(other,self,itmi_poisonbottle,1);
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_07");	//Раз у тебя действительно есть доказательства его вины, то я немедленно велю взять его под стражу.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_08");	//Со своей стороны хочу поблагодарить тебя за помощь в этом деле.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_09");	//Прими это золото в знак моей признательности.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Я сообщил лорду Андрэ о своих подозрениях насчет Константино и отдал ему пузырек, так что у него не осталось сомнений в том, кто отравил Игнаца.");
	Npc_ExchangeRoutine(VLK_417_Constantino,"InPrision");
	AI_Teleport(VLK_417_Constantino,"NW_CITY_ALHIMIK_INPRISION");
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v2_condition;
	information = dia_andre_ignazfoundkill_v2_info;
	permanent = FALSE;
	description = "Я нашел убийцу.";
};


func int dia_andre_ignazfoundkill_v2_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (KARRASTELLABOUTIGNAZ == TRUE) && Npc_HasItems(hero,itwr_ortegoletter) && (READORTEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v2_info()
{
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_00");	//Я нашел убийцу.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_01");	//Если так, это хорошо. И кто же он?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_02");	//Один парень по имени Ортего.
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_06");	//Вот, я нашел у него это письмо. В нем все написано.
	B_GiveInvItems(other,self,itwr_ortegoletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_07");	//По всей видимости, ты прав.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_08");	//Однако, как я понял из этого письма, он действовал не по своей воле.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_09");	//Тебе, случайно, не удалось выяснить, кто стоял за ним?
	ConstForgiven = TRUE;
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
	Info_AddChoice(dia_andre_ignazfoundkill_v2,"Это был один из магов Огня.",dia_andre_ignazfoundkill_v2_yes);
	Info_AddChoice(dia_andre_ignazfoundkill_v2,"Этого я не знаю.",dia_andre_ignazfoundkill_v2_no);
};

func void dia_andre_ignazfoundkill_v2_yes()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_01");	//Это был один из магов Огня.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_02");	//(в недоумении) Маг Огня?! Что ты несешь! Как такое возможно?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_03");	//Я говорю лишь то, что узнал.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_04");	//Хммм...(недовольно) Ну хорошо. Допустим, ты прав.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_05");	//Однако ты должен понимать, что подобные речи могут привести к ужасным последствиям.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_06");	//Узнав об этом, люди могут попросту утратить веру в магов Огня и даже в самого Инноса!
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_12");	//Но все-таки скажи, кто из магов Огня виновен в убийстве Игнаца?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_13");	//Я говорил с Каррасом. Однако, по его словам, это решение поддержали многие из его братьев.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_15");	//Ладно. С этим я разберусь уже сам.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_16");	//Тебя же просто хочу поблагодарить за помощь в этом деле.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_17");	//Прими это золото в знак моей признательности.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	TELLANDRETRUTH = TRUE;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Я рассказал лорду Андрэ про Ортего и предъявил найденное у него письмо. Кроме того, я также упомянул и о причастности к этому убийству магов Огня, тем самым, очень расстроив его. Теперь лорд Андрэ оказался в очень щекотливой ситуации, но сказал, что сам как-нибудь разберется с этим.");
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};

func void dia_andre_ignazfoundkill_v2_no()
{
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_No_01_01");	//Этого я не знаю.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_02");	//Хммм...(разочарованно) Очень жаль.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_03");	//Хотя, с другой стороны, - главное, что тебе удалось найти убийцу.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_04");	//В любом случае хочу поблагодарить тебя за помощь в этом деле.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_05");	//Вот, прими это золото в знак моей признательности.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Я рассказал лорду Андрэ про Ортего и предъявил найденное у него письмо. Этого хватило, чтобы он закрыл это дело. Полагаю, что все остались довольны - и я в том числе.");
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};


instance DIA_ANDRE_TOCONVICTS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_toconvicts_condition;
	information = dia_andre_toconvicts_info;
	permanent = FALSE;
	description = "Мне нужно пройти к заключенным.";
};


func int dia_andre_toconvicts_condition()
{
	if((KAPITELORCATC == FALSE) && (PERMTOPRISON == FALSE) && ((hero.guild != GIL_PAL) || (hero.guild != GIL_MIL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_andre_toconvicts_info()
{
	AI_Output(other,self,"DIA_Andre_ToConvicts_01_00");	//Мне нужно пройти к заключенным.
	AI_Output(self,other,"DIA_Andre_ToConvicts_01_01");	//Хорошо! Можешь это сделать.
	AI_Output(self,other,"DIA_Andre_ToConvicts_01_02");	//Но помни...(грозно) Если ты попытаешься открыть решетку - я подниму тревогу!
	PERMTOPRISON = TRUE;
};