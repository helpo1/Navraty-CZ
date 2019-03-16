
instance DIA_Lee_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_EXIT_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

instance DIA_Lee_PMSchulden(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lee_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "Наемники объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_lee_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "Наемники объявили вас вне закона!";
	AI_Print(concatText);
};

func void DIA_Lee_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Ты пришел, чтобы отдать деньги для Онара?
	temp1 = 0;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_36");	//Не слишком ли поздно?
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_37");	//Тебе надо было думать раньше, прежде чем совершать эти бессмысленные убийства.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_38");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_39");	//Я тебя прикончу, прямо здесь и сейчас!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_40");	//Не слишком ли поздно...
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_41");	//Тебе надо бы думать раньше, прежде чем совершать эти бессмысленные нападения на крестьян.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_42");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_43");	//Я тебя прикончу, прямо здесь и сейчас!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_44");	//Не слишком ли поздно...
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_45");	//Тебе надо бы думать раньше, прежде чем заниматься тут воровством.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_46");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_47");	//Я тебя прикончу, прямо здесь и сейчас!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Своими постоянными бесчинствами на ферме Онара, я испортил свои отношения с наемниками. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden,"Постой!!!...(пора сматываться)",dia_lee_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Я уже сказал тебе, что не надо творить глупости здесь.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Онар узнал, что ты успел заслужить себе дурную славу здесь.
			if(Lee_Schulden < 1000)
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Schulden = Lee_Schulden + (diff * 250);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Ну и, естественно, он теперь хочет больше денег.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Сколько?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Schulden = Lee_Schulden + (diff * 250);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Я думал, ты умнее.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00A");	//Сколько?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//Теперь хорошие новости для тебя.
			if(Lee_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Неожиданно не осталось никого, кто видел, как ты совершил убийство.
				GLOBAL_FARM_MURDER = GLOBAL_FARM_MURDER - 1;
				if(GLOBAL_FARM_MURDER < 0)
				{
					GLOBAL_FARM_MURDER = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_THEFT) || ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Никто теперь не может подтвердить, что видел, как ты воруешь.
				GLOBAL_FARM_THEFT = GLOBAL_FARM_THEFT - 1;
				if(GLOBAL_FARM_THEFT < 0)
				{
					GLOBAL_FARM_THEFT = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_ATTACK) || ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Не осталось никого, кто видел бы, как ты избил одного из фермеров.
				GLOBAL_FARM_ATTACK = GLOBAL_FARM_ATTACK - 1;
				if(GLOBAL_FARM_ATTACK < 0)
				{
					GLOBAL_FARM_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Похоже, что все обвинения против тебя расстворились в воздухе.
			};
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Да уж, скажу тебе, это способ избавиться от подобных проблем.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Как бы то ни было, тебе больше не нужно платить.
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Но будь осторожнее в будущем.
				Lee_Schulden = 0;
				Lee_LastPetzCounter = 0;
				Lee_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Ясно одно: ты должен, тем не менее, заплатить штраф полностью.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00B");	//Сколько?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//Итак, что?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Lee_PMSchulden);
			Info_ClearChoices(DIA_Lee_PETZMASTER);
			Info_AddChoice(DIA_Lee_PMSchulden,"У меня недостаточно золота!",DIA_Lee_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Lee_PMSchulden,"Сколько я должен заплатить?",DIA_Lee_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
			{
				Info_AddChoice(DIA_Lee_PMSchulden,"Я хочу заплатить штраф.",DIA_Lee_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Сколько я должен заплатить?
	if(Lee_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Lee_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden,"Сколько там нужно?",DIA_Lee_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
	};
};


instance DIA_Lee_PETZMASTER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	Lee_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Кто же впустил ТЕБЯ сюда? (удивленно) Это ты новичок, от которого одни проблемы?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Я слышал от Горна, что ты все еще жив, но что ты придешь сюда... Ах, ладно.
	};
	temp1 = 0;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_48");	//Не слишком ли поздно...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_49");	//Тебе надо бы думать раньше, прежде чем совершать эти бессмысленные убийства.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_50");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_51");	//Я тебя прикончу, прямо здесь и сейчас!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_52");	//Не слишком ли поздно...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_53");	//Тебе надо бы думать раньше, прежде чем совершать эти бессмысленные нападения на крестьян.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_54");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_55");	//Я тебя прикончу, прямо здесь и сейчас!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_56");	//Не слишком ли поздно...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_57");	//Тебе надо бы думать раньше, прежде чем заниматься тут воровством.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_58");	//Все мои парни и Онар хотят твоей смерти, и поэтому...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_59");	//Я тебя прикончу, прямо здесь и сейчас!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Своими постоянными бесчинствами на ферме Онара, я испортил свои отношения с наемниками. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER,"Постой!!!...(пора сматываться)",dia_lee_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Хорошо, что ты все же пришел ко мне, пока твои дела не стали совсем паршивыми.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Наемники крутые парни, и фермеры здесь тоже могут постоять за себя, но ты не можешь просто так убивать людей.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Не говоря уже о других твоих преступлениях здесь.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Я могу помочь тебе выбраться из этого дерьма.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Это обойдется тебе в кругленькую сумму, впрочем. Онар - жадный человек, и только если он закроет на все это глаза, вопрос можно будет считать улаженным.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Хорошо, что ты пришел! Я слышал, что ты что-то украл.
			if(PETZCOUNTER_Farm_Attack > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//И подрался с крестьянами.
			};
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//И убил несколько овец.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Ты не можешь просто так творить подобное здесь. В таких случаях Онар настаивает, чтобы я наказывал преступников деньгами.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//Это означает: ты платишь, он прячет деньги - и на этом дело заканчивается.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Если ты принимаешь участие в дуэли с наемниками, это одно дело...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Но если ты избиваешь крестьян, они сразу же бегут к Онару. А он ждет, что я предприму что-нибудь.
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Не говоря уже о том, что он не радуется тому, что убивают его овец.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Тебе нужно будет заплатить штраф. Как правило, Онар сам забирает деньги - но это единственный путь уладить дело.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Онар ждет от меня, что я защищу его усадьбу. Это распространяется и на овец.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Ты должен должен заплатить ему компенсацию!
			Lee_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Сколько?
		if(Lee_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Lee_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER,"У меня недостаточно золота!",DIA_Lee_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PETZMASTER,"Я хочу заплатить.",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Lee_Schulden);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Хорошо! Я прослежу, чтобы эти деньги дошли до Онара. Можешь считать эту проблему забытой.
	B_GrantAbsolution(LOC_FARM);
	Lee_Schulden = 0;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden);
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//Тогда добудь его и поскорее.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Но я не думаю, что ты сможешь украсть его здесь, на ферме. Если тебя поймают, тебе так просто не отвертеться.
	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lee_Hallo(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lee_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Какого дьявола тебя позволили пустить сюда?...(удивленно) Что ты делаешь здесь? Я думал, ты мертв!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//С чего ты так думал?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Горн сказал мне, что это ты разрушил Барьер.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Да, это действительно был я.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Никогда бы не подумал, что человек может выжить после всего этого. Что привело тебя сюда? Ты же здесь не просто так...
	LeeMeet = TRUE;
};

instance DIA_Lee_BreakBarrier(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BreakBarrier_Condition;
	information = DIA_Lee_BreakBarrier_Info;
	permanent = FALSE;
	description = "А что произошло с вами после того, как пал Барьер?";
};

func int DIA_Lee_BreakBarrier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_BreakBarrier_Info()
{
	AI_Output(other,self,"DIA_Lee_BreakBarrier_01_00");	//А что произошло с вами после того, как пал Барьер?
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_01");	//Большинство воров и наемников осталось со мной, поскольку я смог предложить им путь к свободе.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_02");	//Остальные же рассыпались по окрестностям и занялись разбоем!
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_03");	//Маги Воды, закончив свои дела, отправились сразу в Хоринис. Где они сейчас, мне неизвестно.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_04");	//Но Ларес должен быть в курсе происходящего.
	AI_Output(other,self,"DIA_Lee_BreakBarrier_01_05");	//А потом?
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_06");	//Потом мы набрели на эту ферму.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_07");	//Незадолго до нас тут как раз побывало городское ополчение и перевернуло всю усадьбу вверх дном в поисках золота.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_08");	//Собственно, это и стало причиной, по которой Онар восстал против короля! После мы заключили с ним сделку.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_09");	//Мои люди охраняют его земли от королевских приставов, а мы получаем от него продовольствие и немного золота.
};

instance DIA_Lee_Paladine(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent = FALSE;
	description = "Мне крайне необходимо поговорить с паладинами в городе.";
};

func int DIA_Lee_Paladine_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Мне крайне необходимо поговорить с паладинами в городе. Ты не мог бы помочь мне добраться до них?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//Какие у тебя могут быть дела с паладинами?...(недоверчиво) 
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//Это долгая история!
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//У меня есть время.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//Ксардас дал мне задание...(вздыхая) Он хочет, чтобы я заполучил мощный амулет, Глаз Инноса!
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Значит, ты все еще в союзе с этим некромантом. Понятно! А этот амулет находится у паладинов, да?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Насколько я знаю, да.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Я могу помочь тебе добраться до паладинов! Но сначала ты должен стать одним из нас.
};

instance DIA_Lee_PaladineHOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent = FALSE;
	description = "Как ты можешь помочь мне добраться до паладинов?";
};


func int DIA_Lee_PaladineHOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Как ты можешь помочь мне добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Доверяй мне. У меня есть план. Я думаю, ты как раз подходишь для него...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Я сведу тебя с паладинами, а ты окажешь мне услугу. Но сначала присоединись к нам!
};


instance DIA_Lee_LeesPlan(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent = FALSE;
	description = "А чем ты здесь занимаешься?";
};


func int DIA_Lee_LeesPlan_Condition()
{
	if(Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//А чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Это просто: я делаю все возможное, чтобы мы все смогли убраться с этого острова.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Онар нанял нас для защиты его фермы, и именно этим мы и намерены заниматься.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Но наша награда - нечто большее, чем просто плата за работу. Помогая фермерам, мы отрезаем город от провизии.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//А чем меньше паладины едят, тем скорее они прислушаются, когда, наконец, я сделаю им предложение о мире.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Плохо только, что тебе пришлось присоединиться именно к ним.
	};

	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Что за предложение ты хочешь сделать?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Естественно, условием будет наше помилование и свободный путь на материк. Ты все узнаешь, когда придет время.
};


instance DIA_Lee_WannaJoin(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам!";
};

func int DIA_Lee_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Я надеялся, что ты скажешь это! Нам здесь нужны каждые надежные руки.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//От последних наемников, что я нанял, не было никакого толку, одни проблемы!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//В принципе, ты можешь приступать прямо сейчас. Ну, правда есть парочка вопросов, которые нужно урегулировать, но, я думаю, это не будет проблемой...
};


instance DIA_Lee_ClearWhat(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent = FALSE;
	description = "Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?";
};

func int DIA_Lee_ClearWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Нас нанимает Онар! Ты можешь находиться на ферме только с его одобрения.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//Также, дело еще в наших парнях. Я смогу принять тебя, только если большинство наемников согласится, что ты можешь присоединиться к нам.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Но не ходи к Онару пока все не будет улажено. Он очень раздражительный тип...
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен получить одобрение Онара, после того, как заручусь одобрением наемников.");
};


instance DIA_Lee_OtherSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 7;
	condition = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent = FALSE;
	description = "Как мне убедить наемников проголосовать за меня?";
};


func int DIA_Lee_OtherSld_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Как мне убедить наемников проголосовать за меня?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Делая то, что ожидается от тебя, когда ты будешь наемником, я бы сказал.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Поговори с Торлофом. Он обычно находится перед домом. Он даст тебе испытание.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Если ты сможешь пройти его, ты завоюешь большую часть необходимого уважения.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Он расскажет тебе обо всем, что тебе нужно знать.
	B_LogEntry(TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
};


instance DIA_Addon_Lee_Ranger(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Addon_Lee_Ranger_Condition;
	information = DIA_Addon_Lee_Ranger_Info;
	description = "Что ты знаешь о Кольце Воды?";
};


func int DIA_Addon_Lee_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (SC_KnowsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Что ты знаешь о Кольце Воды?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//Я так и знал! Тебе просто необходимо всюду сунуть свой нос.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ну давай, говори.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Сказать я могу немного. Я знаю, что это тайное общество существует и что управляют им маги воды.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Я больше не связан соглашением с магами воды, которое мы заключили с ними в те времена, когда еще стоял Барьер.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Конечно, если я могу чем-то им помочь, я это делаю. Но большую часть времени я занят своими делами. Ни на что другое времени не остается.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Если ты хочешь узнать об этом обществе больше, поговори с Кордом. Насколько я знаю, он один из них.
	RangerHelp_gildeSLD = TRUE;
	SC_KnowsCordAsRangerFromLee = TRUE;
};


var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

instance DIA_Lee_JoinNOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 8;
	condition = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent = TRUE;
	description = "Я готов присоединиться к вам!";
};


func int DIA_Lee_JoinNOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (Lee_OnarOK == FALSE) && (SLD_Aufnahme != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Я готов присоединиться к вам!

	if(Lee_ProbeOK == FALSE)
	{
		if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Сначала ты должен пройти испытание Торлофа.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Так ты прошел испытание Торлофа?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Да.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//Это хорошо.
			Lee_ProbeOK = TRUE;
		};
	};
	if((Lee_ProbeOK == TRUE) && (Lee_StimmenOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//А что говорят другие наемники?

		if(Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Я не уверен, достаточно ли наемников на моей стороне.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//Тогда поговори с Торлофом, он знает обо всем, о чем говорят на этой ферме.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Большинство из них на моей стороне.
			Lee_StimmenOK = TRUE;
		};
	};
	if((Lee_StimmenOK == TRUE) && (Lee_OnarOK == FALSE))
	{
		if(Onar_Approved == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Хорошо, тогда иди прямо к Онару. Я уже переговорил с ним.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Но ты должен договориться о своем жаловании сам.
			Lee_SendToOnar = TRUE;
			B_LogEntry(TOPIC_BecomeSLD,"Все, что мне нужно теперь - это одобрение Онара.");
		}
		else
		{
			Lee_OnarOK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Ты беседовал с Онаром?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Он согласился.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Добро пожаловать на борт, дружище!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Вот, возьми себе, для начала, нормальные доспехи.
			CreateInvItems(other,ItAr_Sld_L,1);

			if(CanTeachTownMaster == FALSE)
			{
				MIS_PathFromDown = LOG_SUCCESS;
				Log_SetTopicStatus(Topic_PathFromDown,LOG_SUCCESS);
				CanTeachTownMaster = TRUE;
			};

			hero.guild = GIL_SLD;
			CheckHeroGuild[0] = TRUE;
			Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
			Npc_ExchangeRoutine(Lothar,"START");
			Snd_Play("GUILD_INV");
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			MIS_BECOMEKDW = LOG_OBSOLETE;
			MIS_BECOMEKDM = LOG_OBSOLETE;
			MIS_PSICAMPJOIN = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);

			Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Я рад, что ты с нами.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//У меня уже есть первое поручение для тебя.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Оно имеет отношение к паладинам. Пришло время тебе увидеться с ними.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Ты все равно хотел туда идти.
		};
	};
};


instance DIA_Lee_KeinSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_KeinSld_Condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW) || (other.guild == GIL_NDM) || (other.guild == GIL_KDM) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)) && (Lee_IsOnBoard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Я вижу, ты поступил на службу к паладинам.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Ты ушел в монастырь? (смеется) Я ожидал всего, но только не этого.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0A");	//Я вижу, ты выбрал путь Мага Воды. Что ж, поздравляю - совсем неплохой выбор!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0B");	//(удивленно) Ты решил послужить Белиару?
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0C");	//Как я вижу - ты вновь присоединился к Братству! Да, парень - ты не исправим.
	};

	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//Что ж, теперь ты не сможешь стать наемником.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Но кто знает, может ты сможешь сделать что-то для меня или я для тебя.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Посмотрим. Но, как бы то ни было, я желаю тебе всего наилучшего.
};


instance DIA_Lee_ToHagen(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent = FALSE;
	description = "И как мне теперь добраться до паладинов?";
};


func int DIA_Lee_ToHagen_Condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//И как мне теперь добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Очень просто. Ты отнесешь им наше предложение о мире.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Я знаю лорда Хагена, командующего паладинов, со времен моей службы в королевской армии.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Я знаю, о чем он думает - у него недостаточно людей. Он примет это предложение. По крайней мере, он выслушает тебя.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Я написал ему письмо - держи.
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//В любом случае, это должно тебе позволить получить аудиенцию у командующего паладинов.
	MIS_Lee_Friedensangebot = LOG_Running;
	Log_CreateTopic(TOPIC_Frieden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Frieden,LOG_Running);
	B_LogEntry(TOPIC_Frieden,"Ли отправляет меня к лорду Хагену с предложением мира. Так я могу добиться аудиенции у паладинов.");
};

instance DIA_Lee_Fort(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Fort_Condition;
	information = DIA_Lee_Fort_Info;
	permanent = FALSE;
	description = "Что тебе известно о форте паладинов?";
};

func int DIA_Lee_Fort_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ToHagen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Fort_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_Fort_01_00");	//Что тебе известно о форте паладинов?
	AI_Output(self,other,"DIA_Lee_Fort_01_01");	//Он находится недалеко от Хориниса, и, с военной точки зрения, занимает очень важное стратегическое положение.
	AI_Output(self,other,"DIA_Lee_Fort_01_02");	//Насколько мне известно, основные силы паладинов сейчас находятся именно там!
	AI_Output(other,self,"DIA_Lee_Fort_01_03");	//А есть способ туда добраться, минуя стражу?
	AI_Output(self,other,"DIA_Lee_Fort_01_04");	//Не знаю. Раньше туда вела дорога из самого Хориниса.
	AI_Output(self,other,"DIA_Lee_Fort_01_05");	//Но ею уже очень давно перестали пользоваться, поскольку почти все перевозки осуществляются морем.
};

instance DIA_Lee_AngebotSuccess(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent = FALSE;
	description = "Я отнес лорду Хагену твое предложение о мире.";
};

func int DIA_Lee_AngebotSuccess_Condition()
{
	if(Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_AngebotSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Я отнес лорду Хагену твое предложение о мире.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Что он сказал?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Он сказал, что он готов даровать помилование тебе, но не твоим людям.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Вот упрямый дурак! Большинство людей в королевской армии большие головорезы, чем мои парни.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Что ты собираешься делать теперь?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Я должен найти другой способ вытащить нас отсюда. Если понадобится, мы захватим корабль. Мне нужно подумать об этом.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Вытащить свою голову из петли и бросить моих людей - это даже не обсуждается.
	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};


instance DIA_Lee_Background(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent = FALSE;
	description = "Почему ты так рвешься на материк?";
};


func int DIA_Lee_Background_Condition()
{
	if((MIS_Lee_Friedensangebot == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Почему ты так рвешься на материк?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Как ты знаешь, я был генералом в армии короля.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Но его лизоблюды предали меня, потому что я знал кое-что, чего не должен был знать.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Они засунули меня в эту колонию, и король позволил это.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//У меня было много свободного времени, чтобы все обдумать.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Я должен отомстить.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//Королю?!
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//Королю...(решительно) И его прихвостням! Они все горько пожалеют о том, что сделали со мной.
};


instance DIA_Lee_RescueGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent = FALSE;
	description = "Я собираюсь отправиться в Долину Рудников.";
};


func int DIA_Lee_RescueGorn_Condition()
{
	if((Hagen_BringProof == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Я собираюсь отправиться в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Я и не надеялся, что ты долго задержишься на этой ферме.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Если ты возвращаешься в колонию, поищи там Горна. Паладины держат его там за решеткой.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Горн хороший человек, и он бы очень пригодился мне здесь, так что если у тебя появится шанс освободить парня, не упускай его.
	KnowsAboutGorn = TRUE;
};

instance DIA_Lee_RescueDarius(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Condition;
	information = DIA_Lee_RescueDarius_Info;
	permanent = FALSE;
	description = "Еще будут какие-нибудь просьбы?";
};

func int DIA_Lee_RescueDarius_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lee_RescueGorn) == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_00");	//Еще будут какие-нибудь просьбы?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_01");	//(задумчиво) Да, есть одна. Но я даже не знаю, стоит ли просить тебя об этом.
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_02");	//Давай, выкладывай уже. В чем дело?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_03");	//Помнишь, перед самым падением Барьера, люди Гомеза захватили рудную шахту в Новом лагере?
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_04");	//Конечно.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_05");	//В то время я знал, что собирается предпринять этот ублюдок и заблаговременно принял все необходимые меры предосторожности.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_06");	//Именно поэтому мной был отправлен туда небольшой отряд наемников во главе с моим старым другом - Дариусом!
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_07");	//Он со своими людьми должен был усилить охрану шахты и подготовить ее к возможной обороне.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_08");	//Однако, как видишь, даже этих сил и приготовлений не хватило, чтобы сдержать атаку Гомеза.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_09");	//Скорее всего, нас тогда предали. И из-за этого предательства в тот день погибло много хороших людей!
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_12");	//Но меня до сих пор мучает один непонятный вопрос.
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_13");	//Какой именно?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_14");	//После того, как нам удалось отбить шахту обратно, мы хорошенько ее обыскали.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_15");	//Мы шли и собирали по ней тела наших павших товарищей, однако тела Дариуса так никто и не нашел! 
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_16");	//Может быть он попросту сбежал?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_17");	//Не говори так! Я знал этого человека еще с тех времен, когда лично командовал королевскими войсками.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_18");	//Дариус не был трусом и на него всегда можно было положиться.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_19");	//К тому же выжившие в тот день утверждали, что видели, как он сражался со стражниками Гомеза.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_20");	//А значит, он бился до конца! Как и положено настоящему воину.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_21");	//Возможно, мы тогда что-то упустили, но разбираться уже не было времени.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_22");	//Магический барьер пал, и нам надо было как-то выбираться из этой проклятой долины.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_23");	//Естественно, об этом уже все давным-давно позабыли. Но только не я!
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_24");	//Я чувствую, что мне надо до конца разобраться в той ситуации и отыскать своего старого друга. 
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_25");	//Ну, или, по крайней мере то, что от него осталось.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_26");	//Поэтому я и хочу попросить тебя об одолжении. Если тебе вдруг удастся попасть в Новую шахту, поищи там ответ на мой вопрос.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_28");	//Может быть, тебе повезет больше, чем нам. Хорошо?
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_29");	//Я постараюсь.
	MIS_MissOldFriend = LOG_Running;
	Log_CreateTopic(TOPIC_MissOldFriend,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_Running);
	B_LogEntry(TOPIC_MissOldFriend,"Ли рассказал мне о том, что в свое время он отправил отряд наемников во главе со своим другом Дариусом на защиту Новой шахты. Всем известно, что нападение удалось отбить, но что стало с Дариусом так никто и не знает. Ли попросил меня заглянуть в Новую шахту и попытаться найти в ней ответы на интересующий его вопрос.");
};

instance DIA_Lee_RescueDarius_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Done_Condition;
	information = DIA_Lee_RescueDarius_Done_Info;
	permanent = FALSE;
	description = "Твой старый друг Дариус скоро присоединится к вам.";
};

func int DIA_Lee_RescueDarius_Done_Condition()
{
	if((MIS_MissOldFriend == LOG_Running) && (DariusNWIns == TRUE) && (DariusIsFree == TRUE) && (DariusNWIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Done_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Lee_RescueDarius_Done_01_00");	//Твой старый друг Дариус скоро присоединится к вам.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_01");	//Я знаю, приятель. Он появился тут пару дней назад.
	AI_Output(other,self,"DIA_Lee_RescueDarius_Done_01_02");	//Все хорошо?
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_03");	//С ним все в порядке! Правда ему нужно время, чтобы восстановить свои силы после изнурительного перехода через горы.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_04");	//Кстати, он уже успел рассказать мне о том, что ему пришлось пережить за все это время. И как ты помог ему выбраться из этой непростой ситуации.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_06");	//Поэтому от имени всех парней и от себя лично я благодарю тебя!
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_07");	//И в знак моей признательности, я хочу подарить тебе одну вещь.
	B_GiveInvItems(self,other,ItBe_NordmarBelt,1);
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_08");	//Вот этот пояс! Он сделан из прочной шкуры нордмарского снежного льва. Поверь, такого ты больше нигде не найдешь.
	MIS_MissOldFriend = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_SUCCESS);
	B_LogEntry(TOPIC_MissOldFriend,"Дариус вновь присоединился к отряду Ли, чему он был крайне рад. Тот в свою очередь подарил мне настоящий нордмарский пояс из шкуры снежного льва.");
};

instance DIA_Lee_Success(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int DIA_Lee_Success_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Я освободил Горна.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Да, он уже рассказал мне об этом. Отлично сработано!
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Он стоит больше, чем Сильвио и все его парни вместе взятые.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_AboutGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent = FALSE;
	description = "Горн сказал тебе обо мне? Что произошло с ним?";
};


func int DIA_Lee_AboutGorn_Condition()
{
	if((Kapitel < 3) && (Npc_KnowsInfo(other,DIA_Lee_RescueGorn) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Горн сказал тебе обо мне? Что произошло с ним?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Ты ведь помнишь его, да?
	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn,"Дай попытаюсь вспомнить...",DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn,"Конечно.",DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Ясно дело.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Он позволил Паладинам схватить себя, и был отослан с конвоем обратно в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Если бы дорога в Долину Рудников не была вымощена Паладинами и орками, я бы отправился с парой ребят, чтобы освободить его.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Но это не имеет смысла. Бедняга.
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Дай попытаюсь вспомнить...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Большой, черноволосый, плохой парень с большим топором, он отбил нашу шахту с твоей помощью. Это было в колонии.
};


instance DIA_Lee_WegenBullco(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent = FALSE;
	description = "У Онара теперь на несколько овец меньше благодаря Булко...";
};


func int DIA_Lee_WegenBullco_Condition()
{
	if((Kapitel < 4) && (MIS_Pepe_KillWolves == LOG_SUCCESS) && (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//У Онара теперь на несколько овец меньше благодаря Булко...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Ох, не приставай ко мне с такой чепухой! У меня и без этого проблем хватает.
	if((Bullco_scharf == TRUE) && !Npc_IsDead(Bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//У меня тоже. Булко, похоже, видит проблему во мне. Он хочет, чтобы я покинул ферму...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//Да, и что? Постой за себя.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Ты можешь сказать ему, что он должен вести себя сдержаннее, или я вычту пропавших овец из его жалования...
	};
};


instance DIA_Lee_Report(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Report_Condition;
	information = DIA_Lee_Report_Info;
	permanent = FALSE;
	description = "Я пришел из Долины Рудников.";
};


func int DIA_Lee_Report_Condition()
{
	if((EnterOW_Kapitel2 == TRUE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Я пришел из Долины Рудников. Замок, находящийся там, был атакован драконами!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Так это правда! Ларес говорил, что в городе циркулируют слухи о драконах... Я не поверил в это...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//А что насчет паладинов?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Они понесли большие потери.

	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Хорошо! Может теперь лорд Хаген более взвешенно подумает о моем предложении...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//А если нет... (жестко) Тогда мы найдем другой способ вырваться отсюда...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Хорошо! Может, это заставит лорда Хагена отправиться со своими людьми в Долину Рудников...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Чем меньше паладинов останется здесь, тем лучше.
	};
};

instance DIA_Lee_ArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorM_Condition;
	information = DIA_Lee_ArmorM_Info;
	permanent = TRUE;
	description = "А как насчет доспехов получше?";
};

func int DIA_Lee_ArmorM_Condition()
{
	if((Kapitel < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//А как насчет доспехов получше?
	AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//У меня есть достойные доспехи для тебя! Конечно, если у тебя есть золото.
	Info_ClearChoices(DIA_Lee_ArmorM);
	Info_AddChoice(DIA_Lee_ArmorM,Dialog_Back,DIA_Lee_ArmorM_back);

	if((Lee_SldMGiven == FALSE) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_Lee_ArmorM,"Доспехи наемника (Цена: 2000 монет)",DIA_Lee_BuyArmorM_Ok);
	};
	if((Lee_SldHGiven == FALSE) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Lee_ArmorM,"Тяжелые доспехи наемника (Цена: 8000 монет)",DIA_Lee_BuyArmorH_Ok);
	};
};

func void DIA_Lee_ArmorM_back()
{
	Info_ClearChoices(DIA_Lee_ArmorM);
};

func void DIA_Lee_BuyArmorM_Ok()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Дай мне доспехи.

	if(B_GiveInvItems(other,self,ItMi_Gold,2000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Держи! Это очень хорошие доспехи.
		CreateInvItems(other,itar_sld_M,1);
		AI_EquipArmor(other,itar_sld_M);
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Но это не подарок! Сначала я хочу увидеть золото!
	};
};

func void DIA_Lee_BuyArmorH_Ok()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Дай мне тяжелые доспехи.

	if(B_GiveInvItems(other,self,ItMi_Gold,8000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Держи! Это очень хорошие доспехи! Я сам такие ношу.
		CreateInvItems(other,ItAr_Sld_H,1);
		AI_EquipArmor(other,ItAr_Sld_H);
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Ты знаешь правила. Сначала золото!
	};
};


instance DIA_Lee_Richter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Richter_Condition;
	information = DIA_Lee_Richter_Info;
	permanent = FALSE;
	description = "У тебя нет еще для меня работы?";
};


func int DIA_Lee_Richter_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(Richter) == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//У тебя нет еще для меня работы?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Тебе все мало, да? По-моему, у тебя и без того проблем хватает. Чего же еще тебе нужно?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Еще задание. Я же наемник, помнишь?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Хорошо. У меня есть кое-что. Как раз для тебя.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Я должен поквитаться с судьей в городе. Я бы, конечно, предпочел сделать это сам.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Но паладины и на пушечный выстрел не подпустят меня к его дому.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Это дело очень деликатное. Так что слушай внимательно. Ты пойдешь к судье и предложишь ему свои услуги.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Ты должен попытаться завоевать его доверие и выполнять всякую грязную работу, пока не найдешь что-нибудь, дискредитирующее его.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Эта свинья провернула столько грязных делишек, что от него смердит за версту.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Дай мне что-нибудь, что я смогу использовать, чтобы запятнать его имя перед лицом ополчения. Я хочу, чтобы он провел остаток своих дней за решеткой.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Но я не хочу, чтобы ты убивал его. Это для него слишком мало. Я хочу, чтобы он страдал, понимаешь?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Как ты думаешь, справишься?
	Log_CreateTopic(TOPIC_RichterLakai,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai,LOG_Running);
	B_LogEntry(TOPIC_RichterLakai,"Ли хочет, чтобы я нашел доказательства, обвиняющие судью Хориниса. Для этого, я должен предложить свои услуги судье и должен держать ушки на макушке.");
	MIS_Lee_JudgeRichter = LOG_Running;
	Info_ClearChoices(DIA_Lee_Richter);
	Info_AddChoice(DIA_Lee_Richter,"Я не буду заниматься этим.",DIA_Lee_Richter_nein);
	Info_AddChoice(DIA_Lee_Richter,"Нет проблем. Сколько?",DIA_Lee_Richter_wieviel);
};

func void DIA_Lee_Richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Нет проблем. Сколько?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Твоя награда зависит от того, что ты сообщишь мне. Так что постарайся.
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Я не буду заниматься этим. Я не хочу прислуживать этой свинье.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Не нервничай так. Помни о том, что именно он засадил тебя за решетку и засунул за Барьер. Или ты забыл это?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Поступай, как знаешь, но я надеюсь, ты примешь правильное решение.
	Info_ClearChoices(DIA_Lee_Richter);
};


instance DIA_Lee_RichterBeweise(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_RichterBeweise_Condition;
	information = DIA_Lee_RichterBeweise_Info;
	description = "Я нашел кое-что, дискредитирующее судью.";
};


func int DIA_Lee_RichterBeweise_Condition()
{
	if((Kapitel >= 3) && (CAPITANORDERDIAWAY == FALSE) && (MIS_Lee_JudgeRichter == LOG_Running) && Npc_HasItems(other,ItWr_RichterKomproBrief_MIS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweise_Info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Я нашел кое-что, дискредитирующее судью.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Правда? И что же?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Он нанял головорезов, чтобы те ограбили губернатора Хориниса.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Вскоре после этого он арестовал их и забрал себе все золото.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Я принес тебе в качестве доказательства письменный приказ судьи этим головорезам.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Покажи.
	B_GiveInvItems(other,self,ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();
	if(Npc_IsDead(Richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Наконец-то. Этого должно быть достаточно, чтобы заставить его страдать. Я восхищен.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Я готов хорошо заплатить за это. Держи свою награду.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//И не говори об этом никому, хорошо?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//Класс. Но происшествие уже закончилось. Судья мертв.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Какой-то идиот убрал его из этого мира. Ну и ладно. Тоже хорошо.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Держи свои деньги. Больше бумажки не имеют значения для меня.
		CreateInvItems(self,ItMi_Gold,250);
		B_GiveInvItems(self,other,ItMi_Gold,250);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Lee_TalkAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_TalkAboutBennet_Condition;
	information = DIA_Lee_TalkAboutBennet_Info;
	permanent = FALSE;
	description = "Что насчет Беннета?";
};


func int DIA_Lee_TalkAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Что насчет Беннета?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Так ты уже знаешь. Эти ублюдки посадили его за решетку. Вот и все.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Как будто мне не хватает проблем с моими людьми - теперь я должен заботиться еще и о паладинах.
	};
};


instance DIA_Lee_DoAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_DoAboutBennet_Condition;
	information = DIA_Lee_DoAboutBennet_Info;
	permanent = FALSE;
	description = "Что ты собираешься сделать для Беннета?";
};


func int DIA_Lee_DoAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_TalkAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Что ты собираешься сделать для Беннета?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Я пока не знаю. Часть парней готовы хоть сейчас ворваться в город и вбить зубы лорду Хагену по самые гланды.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//К счастью, у нас недостаточно людей для такой операции, и, кроме того, это не в моем стиле.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//То есть ты собираешься сидеть сложа руки?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Конечно нет.
	B_LogEntry(TOPIC_RescueBennet,"Если я не смогу доказать невиновность Беннета достаточно быстро, Ли ничего не может гарантировать. Его люди могут не выдержать и напасть на город в любой момент, чтобы освободить Беннета.");

	if(!Npc_IsDead(Lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Ларес все еще в городе и пытается выяснить, как можно вытащить Беннета.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//А пока я попытаюсь успокоить моих парней. Остается надеяться, что Ларесу не понадобится слишком много времени на это.
	};
	if(!Npc_IsDead(Buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Ох, да. Чуть не забыл... Бастер хочет поболтать с тобой. Он не говорит мне, о чем. Может, тебе стоит найти его?
	};
};


instance DIA_Lee_CanHelpYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_CanHelpYou_Condition;
	information = DIA_Lee_CanHelpYou_Info;
	permanent = FALSE;
	description = "Могу я как-нибудь помочь с Беннетом?";
};


func int DIA_Lee_CanHelpYou_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Могу я как-нибудь помочь с Беннетом?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Конечно, но помни, что в таком деле нужен трезвый ум и холодный расчет.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Иннос свидетель, горячих идиотов здесь и так хватает.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Иди в город, может, тебе удастся найти способ вытащить Беннета оттуда.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Но не затягивай сильно с этим делом, я не знаю, как долго мне удастся удерживать парней под контролем.
};


var int DIA_Lee_AnyNews_OneTime;

instance DIA_Lee_AnyNews(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_AnyNews_Condition;
	information = DIA_Lee_AnyNews_Info;
	permanent = TRUE;
	description = "Есть новости о Беннете?";
};


func int DIA_Lee_AnyNews_Condition()
{
	if((MIS_RescueBennet != FALSE) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet) && (DIA_Lee_AnyNews_OneTime == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Есть новости о Беннете?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Ну, по крайней мере, тюрьма, похоже, не сильно сказалась на его здоровье.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Отличная работа.
		if(DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Нет, мы все еще знаем недостаточно.
	};
};


instance DIA_Lee_SYLVIO(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_SYLVIO_Condition;
	information = DIA_Lee_SYLVIO_Info;
	description = "Что произошло за последнее время?";
};


func int DIA_Lee_SYLVIO_Condition()
{
	if((MIS_ReadyforChapter4 == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Что произошло за последнее время?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Сильвио, ублюдок, прослышал о драконах в Долине Рудников и свел с ума всех здесь на ферме баснями о них.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Он пытался уговорить парней пойти с ним в Долину Рудников. Он обещал им славу, почет, золото и еще кучу всяческих благ.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Большинство не особенно воодушевилось идеей быть убитым ради Сильвио, но все же нашлось несколько идиотов, которые клюнули на его наживку.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Все закончилось тем, что они вооружились у Беннета, а затем свалили.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(облегченно) Ах. Откровенно говоря, я даже рад, что Сильвио наконец ушел с фермы.
};


instance DIA_Lee_KAP4_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP4_EXIT_Condition;
	information = DIA_Lee_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_CanTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_CanTeach_Condition;
	information = DIA_Lee_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Lee_CanTeach_Condition()
{
	if((Kapitel >= 4) && (Lee_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Ты можешь обучить меня?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Я могу показать тебе, как сражаться двуручным оружием.
	if(other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Но у меня нет времени на то, чтобы учить тебя основам.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Как только ты достигнешь определенного уровня, я в твоем распоряжении. А пока поищи другого учителя.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Я слышал, что ты очень хорош. Но готов поспорить, что я все же могу научить тебя парочке-другой приемов.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Так что, если хочешь, я могу потренировать тебя. Впрочем, не бесплатно.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Сколько?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 монет - и считай, что мы договорились.
			Info_ClearChoices(DIA_Lee_CanTeach);
			Info_AddChoice(DIA_Lee_CanTeach,"Это слишком дорого.",DIA_Lee_CanTeach_No);
			if(Npc_HasItems(other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice(DIA_Lee_CanTeach,"Согласен. здесь золото.",DIA_Lee_CanTeach_Yes);
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//Это слишком дорого для меня.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Подумай на досуге. Учителя моего калибра встречаются нечасто.
	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Договорились. Вот золото.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Хорошо, поверь мне: я стою этих денег.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
};


instance DIA_Lee_Teach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_Teach_Condition;
	information = DIA_Lee_Teach_Info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int DIA_Lee_Teach_Condition()
{
	if(Lee_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Начнем обучение.
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Ты больше не нуждаешься в учителях.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Ты больше не нуждаешься в учителях.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};


instance DIA_Lee_DRACHENEI(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_DRACHENEI_Condition;
	information = DIA_Lee_DRACHENEI_Info;
	description = "Люди-ящеры раскладывают драконьи яйца по всему острову.";
};


func int DIA_Lee_DRACHENEI_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Люди-ящеры раскладывают драконьи яйца по всему острову.
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Я мог понять это раньше. Пришло время убираться отсюда.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//А что мне делать с ними?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Разбей их. Что еще?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Может быть, из скорлупы можно будет сделать доспехи или еще что-нибудь.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Похоже, они очень крепкие. Поговори об этом с Беннетом.
		B_LogEntry(TOPIC_DRACHENEIER,"Ли не знает, что делать с драконьим яйцом. Он отправил меня к кузнецу Беннету.");
	};
};


instance DIA_Lee_KAP4_Perm(C_Info)
{
	npc = SLD_800_Lee;
	nr = 49;
	condition = DIA_Lee_KAP4_Perm_Condition;
	information = DIA_Lee_KAP4_Perm_Info;
	permanent = TRUE;
	description = "Как идут дела на ферме?";
};


func int DIA_Lee_KAP4_Perm_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Как идут дела на ферме?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Ну, с тех пор как Сильвио свалил, здесь стало довольно спокойно.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//По-моему, это тоже неплохо.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Но, к сожалению, у нас не стало меньше работы. Парни все чаще и чаще выражают недовольство, им теперь приходится работать еще и за людей Сильвио.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Но это мои проблемы. Я справлюсь.
};


instance DIA_Lee_KAP5_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP5_EXIT_Condition;
	information = DIA_Lee_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_GetShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GetShip_Condition;
	information = DIA_Lee_GetShip_Info;
	description = "Ты не знаешь, как мне захватить корабль паладинов?";
};


func int DIA_Lee_GetShip_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Ты не знаешь, как мне захватить корабль паладинов?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Ты думаешь, я все еще сидел бы здесь, если б знал? Этот корабль охраняют сильнее, чем транспорты с рудой в старой колонии.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Должен же быть способ попасть на корабль.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Конечно. Попасть на борт просто.
	Log_CreateTopic(Topic_Ship,LOG_MISSION);
	Log_SetTopicStatus(Topic_Ship,LOG_Running);
	if((MIS_Lee_JudgeRichter == LOG_SUCCESS) && (Npc_IsDead(Richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Ты же знаешь, у нас судья под каблуком. Ты должен пойти к нему и вытянуть из него официальное письмо, которое позволит нам попасть на корабль.
		MIS_RichtersPermissionForShip = LOG_Running;
		B_LogEntry(Topic_Ship,"Ли полагает, что лучший способ попасть на корабль паладинов - получить письмо о соответствующих полномочиях от судьи. Но ряд ли он даст такое письмо по своей доброй воле.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//У меня есть поддельное письмо о предоставлении полномочий. Увидев его, корабельная стража позволит тебе пройти.
		B_LogEntry(Topic_Ship,"Ох, старина Ли! Он раздобыл поддельное письмо, которое позволит мне попасть на корабль паладинов.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Но это не все. Чтобы управлять кораблем, тебе понадобится капитан, команда и много чего еще.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Нужно проделать очень большую работу.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip,Dialog_Back,DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip,"А кого мне взять в команду?",DIA_Lee_GetShip_crew);
	if(Npc_IsDead(Torlof) == FALSE)
	{
		Info_AddChoice(DIA_Lee_GetShip,"Ты знаешь кого-нибудь, кто мог бы управлять кораблем?",DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Ты знаешь кого-нибудь, кто может управлять кораблем?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Насколько я знаю, Торлоф ходил в море. Он разбирается морском деле.
	TORLOFCANBECAPITAN = TRUE;
	B_LogEntry(Topic_Captain,"Торлоф раньше был хорошим моряком. Возможно, он может стать моим капитаном.");
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//А кого мне взять в команду?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//Это ты должен решить сам. Но я бы взял только людей, которым доверяю. Ты много знаешь людей, которым можно доверять?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Если тебе нужен кузнец в команде, попробуй уговорить Беннета. Лучше него ты вряд ли найдешь.
	B_LogEntry(Topic_Crew,"Что касается моей команды, здесь Ли мало чем может помочь мне. Но все же он дал совет - набирать только людей, которым я могу доверять. Я, пожалуй, спрошу Беннета, может быть, ему это будет интересно.");
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};


instance DIA_Lee_GotRichtersPermissionForShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GotRichtersPermissionForShip_Condition;
	information = DIA_Lee_GotRichtersPermissionForShip_Info;
	description = "Письмо сработало.";
};


func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Письмо сработало. Корабль теперь мой. Судья оказался очень кстати.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Хорошо. Значит, все твои унижения перед этим ублюдком были не напрасными.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_StealShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StealShip_Condition;
	information = DIA_Lee_StealShip_Info;
	permanent = FALSE;
	description = "Я хочу украсть корабль.";
};


func int DIA_Lee_StealShip_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_GetShip) && (hero.guild == GIL_DJG) && (MIS_RichtersPermissionForShip == 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Я хочу украсть корабль.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//И как это должно произойти?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Очень просто! Я иду туда, показываю твои бумаги и забираю корабль.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Ладно, как скажешь! Вот, возьми их. Надеюсь ты знаешь, что делаешь.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
};


instance DIA_Lee_KnowWhereEnemy(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KnowWhereEnemy_Condition;
	information = DIA_Lee_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Ты пойдешь со мной на корабле?";
};


func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lee_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Ты пойдешь со мной на корабле?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Ты шутишь? Конечно. Мне не терпится поквитаться кое с кем на материке.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Кроме того, я могу обучить тебя искусству владения одноручным и двуручным оружием. Это может оказаться очень полезным.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Ли не терпится увидеть материк вновь. Он предложил мне свою поддержку. Мне будет сложно найти такого учителя боевых искусств где либо еще.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Все места на корабле сейчас заняты, но я вернусь, если появится какая-нибудь вакансия.
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Я дам тебе знать, если ты мне понадобишься.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Пакуй свои вещи!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Пакуй свои вещи!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Что? Прямо сейчас?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Да, я скоро отправляюсь в путь, и если ты плывешь со мной, приходи в гавань. Встретимся на корабле.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Я так долго ждал этого момента. Я буду там.
	B_GivePlayerXP(XP_Crewmember_Success);
	Lee_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, если ты мне понадобишься.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Надеюсь, ты знаешь, что делаешь. Но помни, что хороших бойцов никогда не бывает слишком много.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(ухмыляется) Если это только не полные кретины вроде Сильвио.
	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};


instance DIA_Lee_LeaveMyShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeaveMyShip_Condition;
	information = DIA_Lee_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я все-таки не могу взять тебя с собой!";
};


func int DIA_Lee_LeaveMyShip_Condition()
{
	if((Lee_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Я все-таки не могу взять тебя с собой!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Как скажешь. Ты знаешь, где меня найти, если что!
	Lee_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lee_StillNeedYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StillNeedYou_Condition;
	information = DIA_Lee_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int DIA_Lee_StillNeedYou_Condition()
{
	if(((Lee_IsOnBoard == LOG_OBSOLETE) || (Lee_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if(Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Я знал, что понадоблюсь тебе! Увидимся на корабле.
		Lee_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Знаешь, а не пошел бы ты! Сначала ты сказал, чтобы я пришел, затем отправил меня назад!
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Найди себе другого идиота!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lee_KAP6_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP6_EXIT_Condition;
	information = DIA_Lee_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_kapitelorcattack_condition;
	information = dia_lee_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Кажется у нас небольшая проблема.";
};


func int dia_lee_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (LEEBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_KapitelOrcAttack_01_00");	//Кажется, у нас небольшая проблема.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_01");	//Если ты по поводу орков... Пирокар уже рассказал мне о случившемся.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_03");	//И тут может быть только одно решение - пробиваться с боем через захваченный город.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_04");	//И не вздумай предлагать мне руну телепортации. (серьезно) Мне она ни к чему!
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_05");	//Не для того я долгие годы был генералом армии короля, чтобы сейчас бежать с поля боя, как последний трус.
	if(LARESBACKNW == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_09");	//Да, и еще. Не предлагай руну Ларесу - он все равно не бросит меня одного.
		LEEBATTLETHROUGTH = TRUE;
		LARESBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 2;
		B_LogEntry(TOPIC_HELPCREW,"Ли решил, что будет пробиваться с боем из захваченного города. Это же касается и Лареса. Думаю, оркам вскоре не поздоровится!");
	}
	else
	{
		LEEBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
		B_LogEntry(TOPIC_HELPCREW,"Ли решил, что будет пробиваться с боем из захваченного города. Думаю, оркам вскоре не поздоровится!");
	};
	AI_Output(other,self,"DIA_Lee_NW_KapitelOrcAttack_01_12");	//Хорошо. Тогда до скорой встречи! Надеюсь, мы еще увидимся.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_13");	//Так оно и будет, приятель. Можешь не переживать.
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_ESCAPE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_escape_condition;
	information = dia_lee_nw_escape_info;
	permanent = FALSE;
	description = "Рад тебя видеть живым и здоровым!";
};


func int dia_lee_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lee_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lee_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Lee_NW_Escape_01_01");	//Рад тебя видеть живым и здоровым!
	AI_Output(self,other,"DIA_Lee_NW_Escape_01_02");	//По правде говоря... (улыбаясь) я тебя тоже!
	AI_Output(other,self,"DIA_Lee_NW_Escape_01_03");	//Так значит, вам удалось прорваться через город?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_04");	//Мне, как видишь, удалось. Однако не всем так повезло.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Lee_NW_Escape_01_05");	//Многих из нас орки взяли в плен.
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я вновь повстречался с Ли - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Надеюсь они еще живы!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Lee_NW_Escape_01_06");	//Многих из нас орки взяли в плен. Есть и те, кто погиб, сражаясь с ними!
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я вновь повстречался с Ли - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Есть и те, кто погиб.");
		};
		AI_Output(other,self,"DIA_Lee_NW_Escape_01_07");	//Да, это не очень хорошие новости.
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_08");	//С этим ничего уже не поделаешь.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_10");	//Как видишь! И это удалось всем, кто был тогда на корабле.
		AI_Output(other,self,"DIA_Lee_NW_Escape_01_11");	//Да это просто отличные новости!
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_12");	//(улыбаясь) Я с тобой согласен.
		B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я вновь повстречался с Ли - живым и здоровым. Это хорошая новость! Как и то, что всем остальным парням удалось также выбраться из города.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LEE_NW_WHEREWOLF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_wherewolf_condition;
	information = dia_lee_nw_wherewolf_info;
	permanent = FALSE;
	description = "Где наемник по имени Вольф?";
};


func int dia_lee_nw_wherewolf_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFMEETINPRISON == FALSE) && (WOLFCAPTURED == TRUE) && !Npc_IsDead(SLD_811_Wolf))
	{
		return TRUE;
	};
};

func void dia_lee_nw_wherewolf_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhereWolf_01_01");	//Где наемник по имени Вольф?
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_02");	//Этого я не знаю.
	AI_Output(other,self,"DIA_Lee_NW_WhereWolf_01_03");	//Но он ведь тоже прорывался с вами через город. Не так ли?
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_04");	//Да. Но когда завязался бой, я потерял его из виду.
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_05");	//Так что больше о нем мне ничего неизвестно.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Однако на ферме Вольфа не оказалось. Ли тоже не знает, где он.");
};


instance DIA_LEE_NW_WHYORKNOT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whyorknot_condition;
	information = dia_lee_nw_whyorknot_info;
	permanent = FALSE;
	description = "Почему орки еще не напали на ферму?!";
};


func int dia_lee_nw_whyorknot_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whyorknot_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhyOrkNot_01_01");	//Почему орки еще не напали на ферму?
	AI_Output(self,other,"DIA_Lee_NW_WhyOrkNot_01_02");	//Я и сам этого пока не знаю. (задумчиво) Возможно, они чего-то ждут или что-то замышляют.
	AI_Output(self,other,"DIA_Lee_NW_WhyOrkNot_01_05");	//Наверняка в скором времени они пойдут на штурм, и я боюсь, что мы ничего не сможем этому противопоставить.
};


instance DIA_LEE_NW_WHATABOUTPAL(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whataboutpal_condition;
	information = dia_lee_nw_whataboutpal_info;
	permanent = FALSE;
	description = "Я пришел к тебе с предложением от самого лорда Хагена!";
};


func int dia_lee_nw_whataboutpal_condition()
{
	if(Npc_KnowsInfo(hero,dia_lee_nw_whyorknot))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whataboutpal_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_05");	//Я пришел к тебе с предложением от самого лорда Хагена!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_06");	//(удивленно) И что хочет от меня глава паладинов?
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_07");	//Он предлагает тебе объединить все наши силы, чтобы дать оркам открытый бой.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_08");	//Сейчас у него самого слишком мало для этого людей, но вместе, полагаю, у нас будет шанс на успех!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_11");	//Это все довольно неожиданно.
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_13");	//Что ж, в здравом смысле ему действительно сейчас вряд ли откажешь.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_15");	//Так ты согласен?
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_16");	//Думаю, да. (решительно) Полагаю, что в данной ситуации это единственное правильное решение!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_19");	//Но дело в том, что большинство моих людей не слишком хорошо вооружены. А в битве с орками это будет наиглавнейшим фактором.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_20");	//К чему ты клонишь?
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_21");	//Если бы лорд Хаген вооружил моих парней рудными клинками, от них было бы куда больше пользы.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_25");	//Хорошо! Я сообщу ему о твоем решении и передам эту просьбу.
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_26");	//Тогда я жду его ответа! И чем быстрее, тем лучше.
	SLD_JOINHAGEN = TRUE;
	MIS_OREWEAPONSLD = LOG_Running;
	Log_CreateTopic(TOPIC_OREWEAPONSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_Running);
	B_LogEntry(TOPIC_OREWEAPONSLD,"Ли хочет, чтобы лорд Хаген вооружил его людей рудными клинками! По его мнению это сделает наемников более боеспособными. Я согласился передать его просьбу главе паладинов.");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Я сообщил Ли о предложении паладинов объединиться перед угрозой со стороны орков и он с ним согласился. Уверен, это было правильным решением с его стороны!");
};


instance DIA_LEE_NW_HOWMUCHORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howmuchoresword_condition;
	information = dia_lee_nw_howmuchoresword_info;
	permanent = FALSE;
	description = "Сколько тебе нужно рудных клинков?";
};


func int dia_lee_nw_howmuchoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (KNOWNORESWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_howmuchoresword_info()
{
	AI_Output(other,self,"DIA_Lee_NW_HowMuchOreSword_01_01");	//Сколько тебе нужно рудных клинков?
	AI_Output(self,other,"DIA_Lee_NW_HowMuchOreSword_01_02");	//(задумчиво) Чтобы вооружить всех моих людей, мне нужно по меньшей мере штук тридцать.
	AI_Output(self,other,"DIA_Lee_NW_HowMuchOreSword_01_05");	//Поторопись, орки не будут ждать нас, приятель!
	B_LogEntry(TOPIC_OREWEAPONSLD,"Чтобы вооружить всех своих людей, Ли нужно по меньшей мере около тридцати рудных клинков.");
};


instance DIA_LEE_NW_GETORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_getoresword_condition;
	information = dia_lee_nw_getoresword_info;
	permanent = FALSE;
	description = "У меня есть нужное тебе оружие.";
};


func int dia_lee_nw_getoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Lee_NW_HowMuchOreSword) == TRUE) && (Npc_HasItems(hero,ItMw_1H_Blessed_01) >= 30))
	{
		return TRUE;
	};
};

func void dia_lee_nw_getoresword_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lee_NW_GetOreSword_01_01");	//У меня есть нужное тебе оружие.
	AI_Output(self,other,"DIA_Lee_NW_GetOreSword_01_02");	//Хорошо! Тогда давай сюда, чтобы я раздал его своим людям.
	AI_Output(other,self,"DIA_Lee_NW_GetOreSword_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItMw_1H_Blessed_01,30);
	Npc_RemoveInvItems(self,ItMw_1H_Blessed_01,30);
	AI_Output(self,other,"DIA_Lee_NW_GetOreSword_01_04");	//Что ж, отлично. Теперь мы готовы к сражению с орками!
	MIS_OREWEAPONSLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_OREWEAPONSLD,"Я принес Ли рудное оружие. Теперь его люди готовы к сражению с орками!");
};


instance DIA_LEE_NW_GREATGATHER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_greatgather_condition;
	information = dia_lee_nw_greatgather_info;
	permanent = FALSE;
	description = "Как обстановка вокруг фермы?";
};


func int dia_lee_nw_greatgather_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_greatgather_info()
{
	AI_Output(other,self,"DIA_Lee_NW_GreatGather_01_01");	//Как обстановка вокруг фермы?
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_02");	//Пока все тихо.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_03");	//Но думаю, это лишь затишье перед бурей. Орки явно к чему-то готовятся.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_04");	//Каждый день в их лагерь прибывают все новые и новые подкрепления из города.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_07");	//Уверен, что не пройдет и нескольких дней, как они пойдут на штурм этой фермы.
};


instance DIA_LEE_NW_YOURLEADER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_yourleader_condition;
	information = dia_lee_nw_yourleader_info;
	permanent = FALSE;
	description = "Ты теперь здесь всем командуешь?";
};


func int dia_lee_nw_yourleader_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand))
	{
		return TRUE;
	};
};

func void dia_lee_nw_yourleader_info()
{
	AI_Output(other,self,"DIA_Lee_NW_YourLeader_01_01");	//Ты теперь здесь всем командуешь?
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_02");	//Я руковожу обороной нашей фермы и всеми теми людьми, которые изъявили желание сражаться против орков.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_05");	//Хотя я думал, что лорд Хаген возглавит нашу армию.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_06");	//Но парни доверили это мне.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_09");	//Когда я еще был генералом армии короля, мне действительно пришлось побывать на многих войнах.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_10");	//Я сражался с орками практически во всех уголках Миртаны - от холодных гор Нордмара до знойных пустынь Варанта!
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_13");	//Постараюсь и в этот раз не подвести своих людей!
};

instance DIA_LEE_NW_HOWDEFEND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howdefend_condition;
	information = dia_lee_nw_howdefend_info;
	permanent = FALSE;
	description = "Каков твой план обороны?";
};

func int dia_lee_nw_howdefend_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand) && Npc_KnowsInfo(hero,dia_lee_nw_yourleader))
	{
		return TRUE;
	};
};

func void dia_lee_nw_howdefend_info()
{
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_01");	//Каков ваш план обороны?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_04");	//Мы будем выжидать того момента, пока орки сами не решат атаковать нас.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_05");	//Я хорошо знаю их тактику! Наверняка они сразу же бросят в бой все свои силы, в надежде под своим безумным напором смять нашу оборону.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_06");	//Но я построю своих людей таким образом, что у них не будет шанса этого сделать!
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_07");	//И какова расстановка твоих отрядов?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_08");	//Первые ряды займут паладины лорда Хагена, поскольку это самые опытные воины в нашей армии. Они же и примут первый удар орков на себя!
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_10");	//Далее за паладинами я хочу разместить своих наемников. Их задача будет проста - любой ценой не дать оркам прорвать центр нашей обороны!
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_11");	//Если это случится - орки попросту зажмут нас в тиски с обеих сторон, и тогда нам всем придет конец.
	if((TPL_JOINHAGEN == TRUE) && (HUN_JOINHAGEN == TRUE))
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_13");	//По флангам же я выставлю стражей и лесных охотников.
	};
	if(PIR_JOINHAGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_26");	//Следующая линия нашей обороны будет состоять из командующего состава паладинов во главе с лордом Варусом и пиратов капитана Грэга.
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_27");	//От них и будет зависеть окончательный исход предстоящей битвы!
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_33");	//Следующая линия нашей обороны будет состоять из командующего состава паладинов во главе с лордом Варусом.
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_34");	//От них и будет зависеть окончательный исход предстоящей битвы!
	};
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_40");	//Что же касается остальных, то они займут место в последнем ряду нашей обороны.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_41");	//Среди них будет очень много новичков, так что это даст им хоть какой-то шанс выжить в этой резне.
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_42");	//А что насчет магов?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_43");	//Все маги будут находиться в тылу нашей обороны.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_44");	//Мы все очень сильно рассчитываем на их магическую поддержку. Поскольку она даст нам огромное преимущество в битве с орками!
};

instance DIA_LEE_NW_JOINBATTLE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_LEE_NW_JOINBATTLE_condition;
	information = DIA_LEE_NW_JOINBATTLE_info;
	permanent = FALSE;
	description = "А я могу поучаствовать в этой битве?";
};

func int DIA_LEE_NW_JOINBATTLE_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Lee_NW_HowDefend) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_LEE_NW_JOINBATTLE_info()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_01_01");	//А я могу поучаствовать в этой битве?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_01_02");	//Конечно. Хотя у меня были немного другие планы на твой счет.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_01_03");	//Но, конечно, ты можешь принять участие в битве, если сам этого захочешь.
	Info_ClearChoices(DIA_LEE_NW_JOINBATTLE);
	Info_AddChoice(DIA_LEE_NW_JOINBATTLE,"Нет, лучше поговорим о твоих планах.",DIA_LEE_NW_JOINBATTLE_No);
	Info_AddChoice(DIA_LEE_NW_JOINBATTLE,"Да, я приму участие в битве.",DIA_LEE_NW_JOINBATTLE_Yes);
};

func void DIA_LEE_NW_JOINBATTLE_Yes()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_01");	//Конечно, я приму участие в битве с орками.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_02");	//Ну хорошо, это твое решение. Тогда мне надо подумать, в каком отряде ты будешь сражаться.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_03");	//Но прежде нам надо обсудить с тобой одну небольшую проблему.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_05");	//Не сочти меня сумасшедшим, но, на мой взгляд, оркам помогает какая-то неведомая сила.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_06");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_07");	//Я не знаю, как и чем это объяснить, но у нас уже было пара стычек с этими тварями.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_08");	//И большинство из них было практически невозможно убить!
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_09");	//Как будто все они вдруг стали бессмертными.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_10");	//В свете предстоящего сражения этот факт меня очень сильно беспокоит.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_11");	//Поэтому я хочу, чтобы ты разобрался с этой проблемой. И как можно скорее.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_12");	//Хорошо. И с чего мне начать?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_13");	//Поговори с Пирокаром. Возможно, он подскажет, откуда стоит начать поиски.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_14");	//Ладно, я отправляюсь к нему немедленно.
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry(TOPIC_ORCSECRET,"Я принял решение участвовать в битве с орками. Однако есть небольшая проблемка. По словам Ли, орки имеют какого-то могущественного союзника. Он делает их практически бессмертными на поле боя и это очень сильно беспокоит генерала. Мне надо разобраться с этой проблемой и первым делом, Ли посоветовал поговорить с Пирокаром.");
	AI_StopProcessInfos(self);
};

func void DIA_LEE_NW_JOINBATTLE_No()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_01");	//Нет, лучше поговорим о твоих планах.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_02");	//Хорошо... (задумчиво) Тогда забудь о предстоящей битве. С этим мы разберемся и без твоей помощи.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_03");	//Сейчас же, нам надо обсудить с тобой одну небольшую проблему.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_05");	//Не сочти меня сумасшедшим, но, на мой взгляд, оркам помогает какая-то неведомая сила.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_06");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_07");	//Я не знаю, как и чем это объяснить, но у нас уже было пара стычек с этими тварями.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_08");	//И большинство из них было практически невозможно убить
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_09");	//Как будто все они вдруг стали бессмертными.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_10");	//В свете предстоящего сражения этот факт меня очень сильно беспокоит.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_11");	//Поэтому я хочу, чтобы ты разобрался с этой проблемой. И как можно скорее!
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_12");	//Хорошо. И с чего мне начать?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_13");	//Поговори с Пирокаром. Возможно, он подскажет, откуда стоит начать поиски.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_14");	//Ладно, я отправляюсь к нему немедленно.
	HERONOTJOINBIGBATTLE = TRUE;
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry(TOPIC_ORCSECRET,"Я отказался принять участие в предстоящей битве с орками. Однако есть другая небольшая проблемка! По словам Ли, орки имеют какого-то могущественного союзника. Он делает их практически бессмертными на поле боя и это очень сильно беспокоит генерала. Мне надо разобраться с этой проблемой и первым делом, Ли посоветовал поговорить с Пирокаром.");
	AI_StopProcessInfos(self);
};

instance DIA_Lee_NW_OrcSecret_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_OrcSecret_Done_condition;
	information = DIA_Lee_NW_OrcSecret_Done_info;
	permanent = FALSE;
	description = "Я уладил проблему с орками.";
};

func int DIA_Lee_NW_OrcSecret_Done_condition()
{
	if((MIS_ORCSECRET == LOG_Running) && (ALLGUARDMINIONSISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_OrcSecret_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_00");	//Я уладил проблему с орками.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_01");	//В каком смысле уладил? (удивленно) Ты что, убил их всех?!
	AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_02");	//Нет! Просто они более не бессмертны, как было раньше.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_03");	//Ну что ж, хорошие новости.(довольно) Хотя ситуация до сих пор остается тяжелой.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_04");	//Нам не хватает людей, а к оркам постоянно подходят все новые силы.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_05");	//Думаю, скоро они пойдут на штурм.

	if(HERONOTJOINBIGBATTLE == TRUE)
	{
		AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_06");	//Тогда расскажешь, как все прошло.
		AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_07");	//Если останусь в живых. (посмеивается)
	}
	else
	{
		AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_08");	//Ну, вот и поглядим, на что они способны!
		AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_09");	//Само собой.
	};

	MIS_ORCSECRET = LOG_Success;
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Success);
	B_LogEntry(TOPIC_ORCSECRET,"Ли был рад услышать новость о том, что орки лишились защищавшей их магии.");
};

instance DIA_LEE_NW_BIGFIGHTBEGIN(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightbegin_condition;
	information = dia_lee_nw_bigfightbegin_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightbegin_condition()
{
	if((KAPITELORCATC == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MOVEFORCESCOMPLETE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightbegin_info()
{
	AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_01");	//Хорошо, что ты здесь. (серьезно) Кажется, орки уже готовы нас атаковать.
	AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_02");	//Сколько там этих тварей?
	AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_03");	//Судя по всему, целая армия. Хватит на всех! (смеется)

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_04");	//Кстати, поскольку ты маг, то тебе будет лучше держаться подальше от основного фронта атаки орков.
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_05");	//Так что вставай слева от меня. Полагаю, сейчас уже все начнется!
		HEROPLACEISMAGE = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_08");	//Я готов к битве.
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_09");	//Отлично! Тогда иди и займи свое место в строю. Полагаю, сейчас уже все начнется!
		AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_10");	//Где мое место?
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_11");	//Во втором ряду по центру, рядом с Горном.
		HEROPLACEISWAR = TRUE;
		b_changename(pal_91220_ritter," ");
		b_changename(pal_91230_ritter," ");
		b_changename(pal_91210_ritter," ");
	};
	B_LogEntry(TOPIC_ORсGREATWAR,"Час решающей битвы с орками настал! Теперь все решит только наша храбрость, мужество и удача...");
	LEESENTTOTROOPS = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_BIGFIGHTRESULT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightresult_condition;
	information = dia_lee_nw_bigfightresult_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightresult_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightresult_info()
{
	if(ORCSWINSBB == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_01");	//Черт! (обреченно) Мы проиграли эту битву! Это был наш последний шанс.
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_02");	//Теперь в скором времени орки станут хозяевами этого острова, и нам на нем не найдется места.
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_03");	//Все кончено!
		LEEFUCKOFF = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(5000);
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_04");	//Отлично! Мы победили в этой битве...(сквозь зубы) У нас все получилось!
		AI_PlayAni(self,"T_STAND_2_SIT");
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_05");	//Что с тобой?! Ты ранен?!
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_06");	//Черт! Кажется, эти твари все-таки достали меня...(превозмагая боль) Проклятые орки!
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_07");	//Тебе нужно срочно на ферму! Иначе ты сейчас истечешь кровью.
		AI_PlayAni(self,"T_SIT_2_STAND");
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_08");	//Со мной все в порядке! Мне просто нужно немного отдохнуть...(теряя сознание)
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_09");	//Ли?!
		BIGBATTLEBACKPOSITION = TRUE;
		Npc_ExchangeRoutine(self,"DRAINED");
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_NW_FUCKOFF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = dia_lee_nw_fuckoff_condition;
	information = dia_lee_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_nw_fuckoff_condition()
{
	if((LEEFUCKOFF == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_LEE_NW_LEERECOVERED(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_leerecovered_condition;
	information = dia_lee_nw_leerecovered_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_leerecovered_condition()
{
	if((LEERECOVERED == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_leerecovered_info()
{
	AI_Output(other,self,"DIA_Lee_NW_LeeRecovered_01_01");	//Вижу, ты поправился?
	AI_Output(self,other,"DIA_Lee_NW_LeeRecovered_01_02");	//Да, со мной теперь все в полном порядке!
};

instance DIA_LEE_NW_ALLGREATVICTORY(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_allgreatvictory_condition;
	information = dia_lee_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Орки отступили в Долину Рудников.";
};

func int dia_lee_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_nw_allgreatvictory_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_00");	//Орки отступили в Долину Рудников!
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_01");	//Так что теперь эта часть острова полностью свободна.
	AI_Output(self,other,"DIA_Lee_NW_AllGreatVictory_01_02");	//Ты серьезно? Быть такого не может!
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_03");	//Я перебил все их отряды в этой долине.
	AI_Output(self,other,"DIA_Lee_NW_AllGreatVictory_01_08");	//Наконец-то все закончилось. Поверить не могу!
};


instance DIA_LEE_NW_WHATDONOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whatdonow_condition;
	information = dia_lee_nw_whatdonow_info;
	permanent = FALSE;
	description = "И что теперь подумываешь делать?";
};

func int dia_lee_nw_whatdonow_condition()
{
	if(Npc_KnowsInfo(hero,dia_lee_nw_leerecovered) && ((ALLGREATVICTORY == TRUE) || (HORINISISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhatDoNow_01_00");	//И что теперь думаешь делать?
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_01");	//(задумчиво) Здесь теперь есть чем заняться.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_02");	//Однако я все еще не отказался от своих намерений вернуться на материк.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_03");	//Ведь как ты знаешь, у меня там осталось одно незаконченное дело.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_04");	//Поэтому если вдруг соберешься плыть туда, то не забудь про старину Ли!
};


instance DIA_LEE_NW_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_travelonbigland_condition;
	information = dia_lee_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Я не забыл о твоей просьбе.";
};


func int dia_lee_nw_travelonbigland_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && Npc_KnowsInfo(hero,dia_lee_nw_whatdonow))
	{
		return TRUE;
	};
};

func void dia_lee_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_TravelOnBigLand_01_00");	//Я не забыл о твоей просьбе.
	AI_Output(self,other,"DIA_Lee_NW_TravelOnBigLand_01_01");	//(серьезно) Хочешь сказать, что ты отправляешься на материк?
	AI_Output(other,self,"DIA_Lee_NW_TravelOnBigLand_01_02");	//Да, именно так. Собирайся, мы скоро отчаливаем.
	AI_Output(self,other,"DIA_Lee_NW_TravelOnBigLand_01_03");	//Хорошо. Это не займет много времени.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LEETOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Естественно Ли плывет вместе со мной! Я не забыл про его просьбу.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_DarkOrder(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_DarkOrder_condition;
	information = dia_lee_nw_DarkOrder_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_DarkOrder_condition()
{
	if((Kapitel == 5) && (MIS_DarkOrden != LOG_Success))
	{
		return TRUE;
	};
};

func void dia_lee_nw_DarkOrder_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_00");	//Белиар бы тебя побрал! Где тебя вечно носит?
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_01");	//А чем ты собственно недоволен?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_02");	//Проклятье! Ты наверно уже заметил, что на ферму Онара напала нежить.
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_03");	//Да, я заметил. У тебя есть мысли на этот счет?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_04");	//Откуда? Я даже ума не приложу, откуда она тут взялась.
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_05");	//А нежить напала только на ферму Онара?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_06");	//Насколько мне известно, ею кишит весь Хоринис!

	if(MIS_DarkOrden == LOG_Running)
	{
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_07");	//Надо что-то делать! Я уже потерял нескольких человек.
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_08");	//Если так и дальше пойдет, вряд ли мы устоим.
	}
	else if(MIS_DarkOrden == FALSE)
	{
		AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_09");	//А что происходит в городе?
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_10");	//Не знаю. Но тебе стоит как можно скорее поговорить с лордом Хагеном.
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_11");	//Возможно, у паладинов есть какой-то план, чтобы остановить это вторжение.
	};
};

instance DIA_Lee_NW_LeeLetter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_LeeLetter_condition;
	information = DIA_Lee_NW_LeeLetter_info;
	permanent = FALSE;
	description = "У меня для тебя письмо от Ватраса.";
};

func int DIA_Lee_NW_LeeLetter_condition()
{
	if((MIS_LeeLetter == LOG_Running) && (Npc_HasItems(hero,ItWr_VatrasLee) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_LeeLetter_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Lee_NW_LeeLetter_01_00");	//У меня для тебя письмо от Ватраса.
	B_GiveInvItems(other,self,ItWr_VatrasLee,1);
	Npc_RemoveInvItems(self,ItWr_VatrasLee,1);
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_01");	//Хорошо. Давай посмотрим, что он пишет.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_02");	//(серьезно) Его просьба крайне неожиданна для меня.
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_03");	//Но ладно, так уж и быть, я подумаю на этим.
	MIS_LeeLetter = LOG_Success;
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Success);
	B_LogEntry(TOPIC_LeeLetter,"Я передал письмо Ли.");	
};

instance DIA_Lee_NW_VatrasBusines(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasBusines_condition;
	information = DIA_Lee_NW_VatrasBusines_info;
	permanent = FALSE;
	description = "Что у тебя за дела с Ватрасом?";
};

func int DIA_Lee_NW_VatrasBusines_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasBusines_info()
{
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_00");	//Что у тебя за дела с Ватрасом?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_01");	//Ничего особенного. Просто я просил его узнать у паладинов о ситуации в Миртане.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_02");	//Но его новости меня не слишком обрадовали. Похоже, что король на грани поражения в войне с орками.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_03");	//Правда, меня успокаивает то, что Нордмар им завоевать так и не удалось.
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_04");	//Почему?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_05");	//Я вырос там... Там моя родина!
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_06");	//Так значит, ты родом из Нордмара? Может, тогда расскажешь мне о нем?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_07");	//Эх, приятель. Это просто словами не описать.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_08");	//Если бы ты только видел эти величественные горы, покрытые снегом и льдом.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_09");	//Тебе бы обязательно захотелось остаться там навсегда. Виды там воистину завораживающие!
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_10");	//Правда, если говорить начистоту, то те края довольно-таки суровые.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_11");	//Кругом водятся опасные твари, и постоянно стоит пронизывающий до костей мороз.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_12");	//Но нам к нему не привыкать. Каждый нордмарец с рождения имеет в себе иммунитет к холоду.
};

instance DIA_Lee_NW_TeachMeCold(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_TeachMeCold_condition;
	information = DIA_Lee_NW_TeachMeCold_info;
	permanent = FALSE;
	description = "Может быть и меня научишь этому?";
};

func int DIA_Lee_NW_TeachMeCold_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_TeachMeCold_info()
{
	AI_Output(other,self,"DIA_Lee_NW_TeachMeCold_01_00");	//Может, и меня этому научишь?
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_01");	//Этому нельзя научиться, приятель. С этим надо родиться.
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_02");	//Но если на то пошло, я знаю несколько способов избежать обморожения, или как не дать себе просто замерзнуть. 
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_03");	//Однако тебе придется иметь некоторый опыт, чтобы освоить эти приемы.
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_04");	//Денег я с тебя не возьму. Это было бы не совсем правильно.
	AI_Output(other,self,"DIA_Lee_NW_TeachMeCold_01_05");	//Хорошо, договорились.
};

instance DIA_Lee_NW_ColdReduceTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 800;
	condition = DIA_Lee_NW_ColdReduceTeach_Condition;
	information = DIA_Lee_NW_ColdReduceTeach_Info;
	permanent = TRUE;
	description = "Научи меня переносить холод (Очки обучения: 10)";
};

func int DIA_Lee_NW_ColdReduceTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lee_NW_TeachMeCold) == TRUE) && (ColdReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_ColdReduceTeach_Info()
{
	var int kosten;

	AI_Output(other,self,"DIA_Lee_NW_ColdReduceTeach_01_00");	//Научи меня переносить холод.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_01");	//Извини, но для этого у тебя еще не хватает опыта!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_02");	//Больше двигайся. Это согревает тело.
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_03");	//Любое движение должно исходить от всего тела.
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_04");	//И всегда держи ноги в тепле!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		hero.protection[PROT_MAGIC] += 5;
		REALPROTMAGIC += 5;
		AI_Print(PRINT_LEARNPROTCOLD);
		ColdReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_Lee_NW_VatrasDeal(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasDeal_condition;
	information = DIA_Lee_NW_VatrasDeal_info;
	permanent = FALSE;
	description = "А что хотел от тебя Ватрас?";
};

func int DIA_Lee_NW_VatrasDeal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasDeal_info()
{
	AI_Output(other,self,"DIA_Lee_NW_VatrasDeal_01_00");	//А что от тебя хотел Ватрас?
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_01");	//(серьезно) Он написал о необходимости отправить небольший отряд в Долину Рудников. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_02");	//По его словам, это просьба самого Сатураса.
	AI_Output(other,self,"DIA_Lee_NW_VatrasDeal_01_03");	//Но зачем? Там же орки!
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_04");	//У магов Воды в Новом лагере остались какие-то важные документы, которые необходимо вернуть. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_05");	//Сатурас просил сделать это как можно быстрее, ибо ценность этих вещей очень велика. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_06");	//К тому же я не могу отказать ему в этом, учитывая, что нам всем пришлось когда-то пережить за Барьером.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_07");	//Однако есть небольшая проблема - проход в Долину Рудников охраняют паладины.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_08");	//Вряд ли люди лорда Хагена пропустят нас, учитывая сложившуюся ситуацию в Хоринисе. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_09");	//К тому же большой отряд людей наверняка привлечет к себе внимание орков.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_10");	//Да и надо еще поискать тех, кто согласится на это!
};

instance DIA_Lee_NW_WaterMageDocuments(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocuments_condition;
	information = DIA_Lee_NW_WaterMageDocuments_info;
	permanent = FALSE;
	description = "Я сам могу наведаться в Долину Рудников.";
};

func int DIA_Lee_NW_WaterMageDocuments_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasDeal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocuments_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_00");	//Я сам могу наведаться в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_01");	//В одиночку? (удивленно) Ты в своем уме?
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_03");	//Вполне! Просто лорд Хаген хочет знать о ситуации в Долине Рудников.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_04");	//Хочу я этого или нет, но мне придется отправиться туда.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_05");	//К тому же одному человеку будет намного проще проскочить меж толп орков, чем целому отряду.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_06");	//Хммм. В твоих словах действительно есть логика.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_07");	//Хорошо. Тогда я дам тебе ключ, который передал мне Ватрас вместе со своим письмом.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_08");	//Он откроет сундук, в котором хранятся нужные Сатурасу документы.
	B_GiveInvItems(self,other,ItKe_WaterMageDocuments,1);
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_09");	//Так что, при случае, можешь попробовать заглянуть в Новый лагерь. 
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_10");	//Но будь осторожен! Поговаривают, что там обосновал свое логово один из драконов.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_11");	//Я как-нибудь разберусь.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_12");	//Надеюсь.
	MIS_WaterMageDocuments = LOG_Running;
	Log_CreateTopic(TOPIC_WaterMageDocuments,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Running);
	B_LogEntry(TOPIC_WaterMageDocuments,"Сатурас попросил Ли отправить отряд в Долину Рудников, чтобы забрать оставшиеся там ценные документы. Я вызвался помочь ему в этом, поскольку сам собираюсь наведаться в Долину Рудников. Ли дал мне ключ от сундука, где хранятся записи магов Воды.");
};

instance DIA_Lee_NW_NewLager(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_NewLager_condition;
	information = DIA_Lee_NW_NewLager_info;
	permanent = FALSE;
	description = "Новый лагерь...";
};

func int DIA_Lee_NW_NewLager_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_WaterMageDocuments) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_NewLager_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lee_NW_NewLager_01_00");	//(задумчиво) Новый лагерь...
	AI_Output(other,self,"DIA_Lee_NW_NewLager_01_01");	//Мне всегда было интересно, как он вообще появился?
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_02");	//Сам лагерь основали маги Воды, решившие отделиться от всех остальных магов в замке, дабы привести в исполнение свой собственный план.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_03");	//На севере долины они обнаружили большую пещеру, которая с виду показалась им вполне надежным местом их пребывания.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_04");	//Собственно, с этого все и началось.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_05");	//Уже после того, как меня забросили в колонию, я повстречался с одним из этих магов. Его звали Сатурас.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_06");	//Узнав, что я являюсь бывшим генералом армии короля Робара, он сразу же предложил мне возглавить охрану их миссии.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_07");	//Вся долина просто кишела орками и другими опасными тварями. Так что мой боевой опыт пришелся им весьма кстати.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_08");	//Потом к нам присоединилось еще несколько человек, которым надоели порядки Гомеза и его прихвостней.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_09");	//А дальше я стал уже набирать людей только из новоприбывших.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_10");	//Среди них порой оказывались и те, кто раньше служил в армии под моим началом. 
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_11");	//Они-то и составили костяк нашей небольшой армии наемников.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_12");	//Вот так со временем мы превратились в ту силу, с которой уже приходилось считаться всем остальным, включая Гомеза.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_13");	//Спустя некоторое время мы обнаружили заброшенную шахту в старой лощине позади лагеря.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_14");	//Маги Воды решили, что можно было бы заняться ее разработкой. 
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_15");	//И, разумеется, все это вызвало сильный гнев баронов - особенно со стороны Гомеза.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_16");	//Ведь до этого времени магическую руду добывали исключительно в его шахте.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_17");	//Кроме того, наши люди постоянно грабили караваны с товарами извне, направляющиеся в Старый лагерь.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_18");	//Особенно в этих набегах отличился Ларес.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_19");	//Этот хитрец собрал возле себя целую шайку таких же воров, как и он сам.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_20");	//В итоге сложилась ситуация, которая устраивала практически всех.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_21");	//Воры нападали на караваны и делились с нами награбленным. А мы в свою очередь защищали их от стражников Гомеза.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_22");	//Естественно, все это не лучшим образом сказалось на наших отношениях со Старым лагерем.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_23");	//Мы стали заклятыми врагами. И при любом случае готовы были перерезать друг другу глотки.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_24");	//И кто знает, сколько бы это продолжалось. Если бы не появился ты...
};

instance DIA_Lee_NW_WaterMageDocumentsDone(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocumentsDone_condition;
	information = DIA_Lee_NW_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Записи магов Воды у меня.";
};

func int DIA_Lee_NW_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocumentsDone_01_00");	//Записи магов Воды у меня.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocumentsDone_01_01");	//Хорошо! Но будет лучше, если ты сам отнесешь их Сатурасу.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocumentsDone_01_02");	//Мне они без надобности.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocumentsDone_01_03");	//Как скажешь.
	B_LogEntry(TOPIC_WaterMageDocuments,"Ли попросил меня передать принесенные мною записи лично Сатурасу.");
};

instance DIA_Lee_NW_Seekers(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_Seekers_condition;
	information = DIA_Lee_NW_Seekers_info;
	permanent = FALSE;
	description = "Ты ведь знаешь Сагитту?";
};

func int DIA_Lee_NW_Seekers_condition()
{
	if((MIS_SagittaGuard == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_Seekers_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_00");	//Ты ведь знаешь Сагитту?
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_01");	//Конечно. Она местная ведунья и целительница. Тут все ее знают.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_02");	//А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_03");	//Неподалеку от ее пещеры объявились Ищущие. А она там одна, совершенно беззащитная.
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_04");	//Мало ли что может случиться, не приведи Иннос.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_05");	//Тогда пусть приходит сюда, на ферму. Тут ей ничто не будет угрожать.
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_06");	//Но она не хочет уходить из своей пещеры. Как бы я ее не уговаривал.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_07");	//И что ты предлагаешь?
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_08");	//Не мог бы ты послать к ней несколько своих людей? Ну, чтобы они приглядели за ней.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_09");	//Хммм. (задумчиво) Вообще-то все мои парни уже при деле. Но раз ты так просишь...
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_10");	//Очень прошу!
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_11");	//(вздыхая) Ладно, так уж и быть. Я пошлю к ней парочку своих ребят.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_12");	//В конце концов, она ведь стольким здесь помогла! Это будет справедливо.
	B_LogEntry(TOPIC_SagittaGuard,"Ли пошлет несколько своих людей, чтобы они присмотрели за пещерой Сагитты и за ней самой.");
	LeeSendGuard = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(SLD_847_SOELDNER,"NW_SAGITTA_CAVE_08");
	Wld_InsertNpc(SLD_848_SOELDNER,"NW_SAGITTA_CAVE_05_99");
};

//-----------------------------------------линейка наемников---------------------

instance DIA_SLD_853_Bret_EXIT(C_Info)
{
	npc = SLD_853_Bret;
	nr = 999;
	condition = DIA_SLD_853_Bret_EXIT_Condition;
	information = DIA_SLD_853_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_853_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_853_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_853_Bret_Hallo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Hallo_Condition;
	information = DIA_SLD_853_Bret_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_853_Bret_Hallo_Condition()
{
	if(BretInsert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Hallo_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_00");		//Эй, ты! Руки прочь от моего мяса!
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_01");		//Эммм... а я думал, тут никого нет. Откуда ты появился?
	B_GiveInvItems(other,self,ItMi_BretMeet,1);
	Npc_RemoveInvItems(self,ItMi_BretMeet,1);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_02");		//Это я хочу тебя спросить - откуда ТЫ тут взялся?!
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_03");		//Я прошел через проход в Свободной шахте. 
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_04");		//Он прямиком ведет в эту долину!
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_05");		//Хммм...(с ухмылкой) А ты, похоже, крутой парень, раз проделал столь долгий и опасный путь в одиночку.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_06");		//Но ты зря старался, тут ничего нет! Ничего, кроме жуткого холода и кучи свирепых монстров.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_07");		//А теперь отдай то, что взял! Я имею в виду тот кусок мяса.
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_08");		//Вот, держи.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_09");		//Хорошо! Вижу, что и с мозгами у тебя тоже все в порядке.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_10");		//А посему, советую тебе убраться из этого места как можно скорее.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_11");		//Здесь тебя ждет только смерть.
	AI_StopProcessInfos(self);	
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_SLD_853_Bret_Who(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Who_Condition;
	information = DIA_SLD_853_Bret_Who_Info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_SLD_853_Bret_Who_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Who_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Who_01_00");		//Кто ты?
	AI_Output(self,other,"DIA_SLD_853_Bret_Who_01_01");		//Меня зовут Аделхард! А большего тебе знать не обязательно.
};

instance DIA_SLD_853_Bret_You(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_You_Condition;
	information = DIA_SLD_853_Bret_You_Info;
	permanent = FALSE;
	description = "Ты наемник?";
};

func int DIA_SLD_853_Bret_You_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_You_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_You_01_00");		//Ты наемник?
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_01");		//Хммм...(мрачно) Когда то был им!
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_02");		//До тех пор, пока судьба не забросила меня в это забытое Инносом место.
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_03");		//Но тебе то какое до этого дело?
};

instance DIA_SLD_853_Bret_Alone(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Alone_Condition;
	information = DIA_SLD_853_Bret_Alone_Info;
	permanent = FALSE;
	description = "Ты тут один?";
};

func int DIA_SLD_853_Bret_Alone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Alone_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Alone_01_00");		//Ты тут один?
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_01");		//А что, ты кого-то еще здесь видишь?
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_02");		//Да, я здесь один! И пожелал бы и дальше оставаться тут в полном одиночестве.
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_03");		//Лишний шум только привлечет сюда орков! И тогда уже никакие мольбы не помогут... 
	AI_Output(other,self,"DIA_SLD_853_Bret_Alone_01_04");		//Думаю, с орками я как-нибудь разберусь.
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_05");		//Ах, ну да... Я и забыл, что ты у нас крутой!
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_06");		//Вот только мне что-то не хочется так рисковать. 
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_07");		//Поэтому проваливай отсюда, и лучше не возвращайся!
	AI_StopProcessInfos(self);	
};

instance DIA_SLD_853_Bret_NeedInfo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_NeedInfo_Condition;
	information = DIA_SLD_853_Bret_NeedInfo_Info;
	permanent = FALSE;
	description = "Я никуда не уйду!";
};

func int DIA_SLD_853_Bret_NeedInfo_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_Alone) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_NeedInfo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_00");		//Я никуда не уйду!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_01");		//(угрожающе) Правда?!
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_02");		//Да! Пока не выясню тут кое-что.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_03");		//И что же?
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_04");		//Я ищу отряд наемников! Им командовал некто по имени Дариус.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_05");		//Хммм...(мрачно) Ну, тогда считай, что ты его уже нашел!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_06");		//Правда, как видишь, я - это все, что от него осталось.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_07");		//Остальные либо убиты, либо в плену у орков. Или, быть может, еще хуже...
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_08");		//А что насчет самого Дариуса?
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_09");		//Понятия не имею, что стало с ним.
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_10");		//Как так?
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_11");		//Парень, последнее, что я помню, так это то, как здоровенный горный орк бьет меня по голове чем-то тяжелым!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_12");		//Похоже, мне тогда хватило одного удара, чтобы вырубиться.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_13");		//Когда же я очнулся, кругом были только лужи крови да мертвые тела моих товарищей.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_14");		//Видать, меня орки тоже посчитали мертвым! 
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_15");		//А иначе как объяснить, что я выжил в той адской мясорубке?
	B_LogEntry(TOPIC_MissOldFriend,"Высоко в горах Хориниса я повстречал наемника по имени Аделхард. Он рассказал мне о том, отряд Дариуса уничтожили горные орки. Сам он не знает ничего о судьбе своего командира.");
	CanTrailOrcCamp = TRUE;
};

instance DIA_SLD_853_Bret_HistoryBattle(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_HistoryBattle_Condition;
	information = DIA_SLD_853_Bret_HistoryBattle_Info;
	permanent = FALSE;
	description = "Как вы оказались в этой долине?";
};

func int DIA_SLD_853_Bret_HistoryBattle_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_HistoryBattle_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_00");      //Как вы оказались в этой долине?
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_01");      //История получится долгая, приятель...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_02");      //Но если ты никуда не торопишься, я могу тебе ее рассказать.
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_03");      //Конечно! Я с удовольствием послушаю.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_04");      //Ну, тогда...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_05");      //У нас ходили упорные слухи, что после обвала в Старой шахте Гомез постарается прибрать к рукам шахту Нового лагеря.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_06");      //Ли решил обезопасить добычу и послал наш отряд во главе с Дариусом на усиление и защиту.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_07");      //По прибытии, Дариус первым делом приказал осмотреть саму шахту!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_08");      //Чтобы учесть и прикрыть уязвимые места, если нам придется оборонять ее.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_09");      //Но... Дариус немного опоздал со всеми приготовлениями.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_10");      //Пока отряд спускался внутрь шахты, люди Гомеза напали на лагерь снаружи.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_11");      //Естественно, мы ничего не знали об этом и были крайне удивлены, увидев чужаков перед собственным носом.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_12");      //Минутная растерянность быстро прошла. Завязался тяжелый бой...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_13");      //Казалось, победа вот-вот будет в наших руках...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_14");      //Но с бойцами Старого лагеря пришло слишком много арбалетчиков.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_15");      //В узких проходах луки почти бесполезны, а вот арбалеты представляют собой очень серьезную угрозу!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_16");      //Нас стали теснить к шахте и нам ничего не оставалось, как отступать все глубже и глубже.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_17");      //В конце концов, остатки нашего отряда зажали в каком-то глухом отнорке.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_18");      //Когда бойцы потеряли надежду на спасение, кто-то разглядел в темноте узкий проход!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_19");      //Мы ринулись внутрь и, после долгих блужданий, выбрались на свет.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_20");      //Осмотревшись, поняли, что оказались в незнакомой снежной долине, где-то высоко в горах.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_21");      //Позже мы наткнулись на этот лагерь и решили обосноваться в нем.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_22");      //Нам требовалась передышка. Головорезы Гомеза нас прилично потрепали, а тяжелая дорога не позволяла передохнуть.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_23");      //Но беды не закончились так быстро. Ночью на лагерь напали горные орки!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_24");      //Что было дальше, ты уже знаешь.
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_25");      //М-да, нелегко вам пришлось.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_26");      //Не то слово, приятель... не то слово!
};

instance DIA_SLD_853_Bret_Away(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Away_Condition;
	information = DIA_SLD_853_Bret_Away_Info;
	permanent = FALSE;
	description = "Почему ты не вернешься в Долину Рудников?";
};

func int DIA_SLD_853_Bret_Away_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Away_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_00");		//Почему ты не вернешься в Долину Рудников?
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_01");		//У меня уже была подобная мысль...
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_02");		//Но боюсь, один я далеко не уйду!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_03");		//Вся эта местность просто кишит различными злобными тварями, не говоря уже о горных орках.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_04");		//И они значительно сильней тех, с которыми мне доводилось иметь дело в Долине Рудников!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_05");		//Так что для меня это верная гибель.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_06");		//Поэтому лучше уж я посижу тут.
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_07");		//Тебе тут не холодно?
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_08");		//Я уже привык к морозу и практически его не замечаю.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_09");		//Да и еды вполне хватает!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_10");		//Так что если не привлекать к себе внимание орков, то жить вполне можно.
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_11");		//Понимаю.
};

instance DIA_SLD_853_Bret_Adept(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Adept_Condition;
	information = DIA_SLD_853_Bret_Adept_Info;
	permanent = FALSE;
	description = "Ты не очень-то прихотлив, да?";
};

func int DIA_SLD_853_Bret_Adept_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Away) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Adept_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Adept_01_00");		//Ты не очень-то прихотлив, да?
	AI_Output(self,other,"DIA_SLD_853_Bret_Adept_01_01");		//Так оно и есть. (улыбаясь) Недаром парни в Новом лагере дали мне прозвище Адепт!
	AI_Output(self,other,"DIA_SLD_853_Bret_Adept_01_02");		//Я через многое прошел, многое повидал, и вряд ли меня испугают небольшие трудности, вроде этих.
	AI_Output(other,self,"DIA_SLD_853_Bret_Adept_01_03");		//Ну да, понимаю.
};

instance DIA_SLD_853_Bret_OrcCamp(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_OrcCamp_Condition;
	information = DIA_SLD_853_Bret_OrcCamp_Info;
	permanent = FALSE;
	description = "А где находится лагерь орков?";
};

func int DIA_SLD_853_Bret_OrcCamp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_OrcCamp_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_00");		//А где находится лагерь орков?
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_01");		//Хммм...(ухмыляясь) Ты меня так спрашиваешь, как будто я уже там бывал.
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_02");		//Я этого не знаю, приятель! Наверное, где-нибудь тут, в горах.
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_03");		//Но я бы не советовал тебе искать его! Вряд ли орки будут с тобой дружелюбны.
		AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_04");		//Спокойно! У меня есть то, что не позволит оркам напасть на меня.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_05");		//Правда? И что же это?
		AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_06");		//Орочий тотем! Орки уважают его обладателя.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_07");		//Ну, может быть и так.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_08");		//Но, насколько я успел понять, горные орки довольно сильно отличаются от своих собратьев в Долине Рудников.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_09");		//Они куда более сильные и свирепые! Так что, возможно, твоя штука на них и не сработает.
	B_LogEntry(TOPIC_MissOldFriend,"Аделхард полагает, что мне понадобится нечто особенное, чтобы здешние орки не тронули меня. Если такое вообще возможно...");
	Wld_InsertNpc(ORC_7550_GORKAR,"FP_ROAM_OZPRIDE_01_90");
};

instance DIA_SLD_853_Bret_Perm(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Perm_Condition;
	information = DIA_SLD_853_Bret_Perm_Info;
	permanent = TRUE;
	description = "Ну, как дела?";
};

func int DIA_SLD_853_Bret_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Adept) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Perm_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Perm_01_00");		//Ну, как дела?
	AI_Output(self,other,"DIA_SLD_853_Bret_Perm_01_01");		//Пока все в полном порядке.
};

//---------------------------Дариус--------------------------------------------

instance DIA_SLD_852_Darius_EXIT(C_Info)
{
	npc = SLD_852_Darius;
	nr = 999;
	condition = DIA_SLD_852_Darius_EXIT_Condition;
	information = DIA_SLD_852_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_852_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_852_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Wait");
};

instance DIA_SLD_852_Darius_Hallo(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Hallo_Condition;
	information = DIA_SLD_852_Darius_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_852_Darius_Hallo_Condition()
{
	if(DariusInsert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Hallo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_00");		//Вот это да! Никогда бы не подумал, что когда-нибудь вновь увижу тут человека. Ты кто?
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_01");		//Это не так важно. Лучше сам назовись.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_02");		//Мое имя Дариус. Хотя мы вряд ли с тобой раньше встречались, иначе я бы запомнил тебя.
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_03");		//Дариус? Выходит, мне все-таки удалось найти тебя.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_04");		//(удивленно) А ты искал меня? Но... зачем?
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_05");		//Меня прислал Ли. Он не забыл о своем старом друге.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_06");		//Ли?! Черт побери... Как же приятно это слышать!
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_07");		//Он попросил меня узнать, что случилось с твоим отрядом после того, как отправил тебя на защиту рудной шахты.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_08");		//Нет уже никакого отряда. Все мои люди мертвы. А мне лишь чудом удалось избежать этой участи.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_09");		//Хотя еще неизвестно, что хуже - погибнуть в бою или провести остаток своих дней в плену у орков.
	B_LogEntry(TOPIC_MissOldFriend,"Я отыскал Дариуса. Он оказался пленником клана Огненного камня. Не самая приятная новость, но он хотя бы жив.");
};

instance DIA_SLD_852_Darius_Surv(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Surv_Condition;
	information = DIA_SLD_852_Darius_Surv_Info;
	permanent = FALSE;
	description = "Кое-кто все еще жив.";
};

func int DIA_SLD_852_Darius_Surv_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) && (CanTrailOrcCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Surv_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_00");		//Кое-кто все еще жив.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_01");		//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_02");		//В заброшенном форте я повстречал наемника по имени Аделхард.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_03");		//Аделхард? Да, это один из моих людей.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_04");		//Но каким образом ему удалось тогда выжить в той заварушке? Там же была настоящая бойня!
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_05");		//Орки сочли его мертвым и просто оставили лежать там.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_06");		//(ухмыляясь) Выходит, ему просто повезло.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_07");		//Ну ладно, хоть что-то! Это первая хорошая новость за последние несколько месяцев.
	AlexCanBack = TRUE;
};

instance DIA_SLD_852_Darius_WhyKill(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_WhyKill_Condition;
	information = DIA_SLD_852_Darius_WhyKill_Info;
	permanent = FALSE;
	description = "Почему орки не убили тебя?";
};

func int DIA_SLD_852_Darius_WhyKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_WhyKill_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_WhyKill_01_00");	//Почему орки не убили тебя?
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_01");	//Это долгая история...(вздыхая)
	AI_Output(other,self,"DIA_SLD_852_Darius_WhyKill_01_02");	//А я бы послушал. Тем более что горные орки куда кровожаднее тех, что в Долине Рудников. Странно, что они не тронули тебя.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_03");	//Ну ладно. Раз уж ты так настаиваешь.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_04");	//Когда орки напали на нашу стоянку, завязался тяжелый бой.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_05");	//Мои люди были сильно измотаны. Так что серьезного сопротивления мы им оказать не смогли. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_06");	//Большинство из моих людей было убито в первые же минуты сражения.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_07");	//Мы отбивались как могли, но орков было слишком много! В итоге мы сдались.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_08");	//Выживших орки не стали убивать, а забрали с собой в свой лагерь. В том числе и меня.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_09");	//По прибытию туда, нам выжгли клеймо, посадили в загон и держали там, как свиней.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_10");	//Не проходило и дня, чтобы орки нас не избивали и не издевались над нами.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_11");	//И это еще наряду с тем, что нам приходилось с утра до ночи гнуть спину на этих тварей.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_12");	//А иногда приходил их шаман и показывал на одного из нас.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_13");	//После чего они уводили бедолагу куда-то в неизвестном направлении, и тот больше никогда не возвращался.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_14");	//Как я потом узнал, эти твари приносили нас в жертву своим богам.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_15");	//Осознав, что моя участь уже предрешена, я задумал во чтобы то ни стало бежать из орочьего плена. И в один прекрасный день мне это удалось.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_16");	//Вырвавшись на свободу, я долго скитался по этим горам, голодный и почти полностью обмерзший. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_17");	//Силы уже покидали меня, когда на меня наткнулся орочий патруль.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_18");	//Но они не были похожи на тех орков, у которых я был все это время в плену. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_19");	//Я уж подумал, мне конец. Однако орки не спешили покончить со мной.
 	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_20");	//Они долго о чем-то говорили, а потом отнесли меня в свой лагерь. Смутно помню, что было потом...(вздыхая)
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_21");	//Очнулся я уже в лагере Огненного камня - так зовется их клан.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_22");	//Как оказалось, они во вражде с теми орками, от которых я сбежал.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_23");	//Потом они начали меня спрашивать о том, что я там видел, и я рассказал им все, что только знал.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_24");	//В благодарность за это они сохранили мне жизнь, и с того момента я живу здесь.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_25");	//Но как ни крути, я все равно их пленник! И, по всей видимости, останусь тут навсегда.
	B_LogEntry(TOPIC_MissOldFriend,"Дариус рассказал мне о том как побывал в плену у орков другого племени. А также поведал причину, почему орки клана 'Огненного камня' сохранили ему жизнь.");
};

instance DIA_SLD_852_Darius_Escape(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Escape_Condition;
	information = DIA_SLD_852_Darius_Escape_Info;
	permanent = FALSE;
	description = "И ты не пытался снова сбежать?";
};

func int DIA_SLD_852_Darius_Escape_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_WhyKill) == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Escape_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_00");		//И ты не пытался снова сбежать?
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_01");		//А какой в этом смысл, приятель?
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_02");		//Во-первых, я абсолютно не знаю этих земель.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_03");		//Скорей уж я погибну от голоду или стану кормом каких-нибудь диких зверей, чем выберусь живым из этих мест.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_04");		//Во-вторых, если орки меня поймают, то вряд ли уже пощадят.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_05");		//Да и бежать особо некуда... Нового лагеря, как я слышал, уже нет. А больше я не знаю мест, куда можно было бы податься.
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_06");		//Ты бы мог вновь присоединиться к Ли и его людям.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_07");		//И где он сейчас?
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_08");		//Его наемники охраняют ферму богатого землевладельца, что неподалеку от города Хориниса.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_09");		//Парень! Ты хотя бы имеешь малейшее представление о том, где мы сейчас, и куда ты предлагаешь мне отправиться?!
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_10");		//Я и пары шагов отсюда не сделаю в правильном направлении. Да и ты тоже...
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_11");		//Так что без хорошего проводника можно про это забыть! Да и орки меня просто так не отпустят.
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_12");		//Ладно, я что-нибудь придумаю.
	B_LogEntry(TOPIC_MissOldFriend,"По словам Дариуса, бежать из плена орков смысла абсолютно нет. Но если я все-таки смогу договориться с орками о его освобождении из плена, то нам понадобится проводник, хорошо ориентирующийся в этих местах. Без него Дариус и шагу не сделает отсюда.");
	NeedDariusFree = TRUE;
};

instance DIA_SLD_852_Darius_IsFree(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_IsFree_Condition;
	information = DIA_SLD_852_Darius_IsFree_Info;
	permanent = FALSE;
	description = "Ты свободен!";
};

func int DIA_SLD_852_Darius_IsFree_Condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (DariusHasPath == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_IsFree_Info()
{
	B_GivePlayerXP(2000);	
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_00");	//Ты свободен!
	AI_Output(self,other,"DIA_SLD_852_Darius_IsFree_01_01");	//Что?! Ты шутишь?
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_02");	//Я купил твою свободу у вождя за огромную шкуру белого горного тролля.
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_03");	//И он даст тебе несколько воинов, которые сопроводят тебя обратно в Хоринис.
	AI_Output(self,other,"DIA_SLD_852_Darius_IsFree_01_04");	//Невероятно! Благодарю тебя, друг. Я этого никогда не забуду!
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_05");	//Что ж, полагаю, увидимся уже у Ли.
	DariusIsFree = TRUE;
	B_LogEntry(TOPIC_MissOldFriend,"Я сообщил Дариусу, что теперь он свободен. А Орки Грум Лока помогут ему выбраться из этих гор. Пора возвращаться к Ли...");
};

instance DIA_SLD_852_Darius_Perm(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Perm_Condition;
	information = DIA_SLD_852_Darius_Perm_Info;
	permanent = TRUE;
	description = "Когда ты отправишься в путь?";
};

func int DIA_SLD_852_Darius_Perm_Condition()
{
	if((DariusIsFree == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Perm_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_Perm_01_00");		//Когда ты отправишься в путь?
	AI_Output(self,other,"DIA_SLD_852_Darius_Perm_01_01");		//Скоро. Но сперва надо хорошо подготовиться.
	AI_Output(self,other,"DIA_SLD_852_Darius_Perm_01_02");		//Переход через горы не будет легкой прогулкой!
};


//---------------------Хоринис Аделхард--------------------------------------------------

instance DIA_SLD_858_Bret_EXIT(C_Info)
{
	npc = SLD_858_Bret;
	nr = 999;
	condition = DIA_SLD_858_Bret_EXIT_Condition;
	information = DIA_SLD_858_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_858_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_858_Bret_Perm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Condition;
	information = DIA_SLD_858_Bret_Perm_Info;
	permanent = FALSE;
	description = "Как ты тут очутился?";
};

func int DIA_SLD_858_Bret_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_01_00");		//Как ты тут очутился?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_01");		//Как, как... Вернулся вместе с Дариусом. Как же еще?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_02");		//Правда поначалу я был немного удивлен, когда тот появился в заброшенном форте в окружении отряда орков.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_03");		//Но потом все стало на свои места.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_04");		//Дариус все мне объяснил и рассказал о том, что эти орки наши проводники и покажут дорогу обратно в Долину.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_05");		//И скажу тебе, парень, это лучше, чем морозить задницу в тех покинутых Инносом горах!
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_01_06");		//Не сомневаюсь.
	AlehardHere = TRUE;
};

instance DIA_SLD_858_Bret_Farm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Farm_Condition;
	information = DIA_SLD_858_Bret_Farm_Info;
	permanent = FALSE;
	description = "И как тебе на ферме?";
};

func int DIA_SLD_858_Bret_Farm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Farm_Info()
{
	AI_Output(other,self,"DIA_SLD_858_Bret_Farm_01_00");      //И как тебе на ферме?
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_01");      //Неплохо. Здесь хотя бы не такая скукотища, как в том забытом краю, хе-хе!
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_02");      //Да и Текла очень вкусно готовит. Хотя, похоже, она и не очень-то рада на своей кухне такому гурману как я. (смеется)
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_03");      //Довелось мне пообщаться и с Онаром. Немного занудлив, но, в общем, нормальный мужик.
};

instance DIA_SLD_858_Bret_Perm_Done(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Done_Condition;
	information = DIA_SLD_858_Bret_Perm_Done_Info;
	permanent = TRUE;
	description = "Что теперь собираешься делать?";
};

func int DIA_SLD_858_Bret_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Farm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Perm_Done_Info()
{
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_Done_01_00");		//Что теперь собираешься делать?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_Done_01_01");		//Для начала, я хочу отогреться! В этих проклятых горах я себе все кости отморозил.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_Done_01_02");		//И наесться до отвала! Ну, а там будет уже видно.
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_Done_01_03");		//Понимаю.
};

//---------------------Хоринис Дариус--------------------------------------------------


instance DIA_SLD_857_Darius_EXIT(C_Info)
{
	npc = SLD_857_Darius;
	nr = 999;
	condition = DIA_SLD_857_Darius_EXIT_Condition;
	information = DIA_SLD_857_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_857_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_857_Darius_Perm(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Condition;
	information = DIA_SLD_857_Darius_Perm_Info;
	permanent = FALSE;
	description = "Как прошел переход через горы?";
};

func int DIA_SLD_857_Darius_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self,"DIA_SLD_857_Darius_Perm_01_00");		//Как прошел переход через горы?
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_01");		//Непросто. Мы спускались с гор около двух дней.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_02");		//Правда я думал, что орки отведут меня куда-нибудь в Долину Рудников.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_03");		//Но они почему-то привели меня прямо к Проходу.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_04");		//В Долине Рудников сейчас очень опасно. Думаю, они знали об этом, потому и довели тебя до туда.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_05");		//Ладно, это не так уж и важно. Главное, что я теперь снова с парнями и Ли.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_06");		//Еще раз спасибо, друг.
};

instance DIA_SLD_857_Darius_Perm_Done(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Done_Condition;
	information = DIA_SLD_857_Darius_Perm_Done_Info;
	permanent = TRUE;
	description = "Как дела?";
};

func int DIA_SLD_857_Darius_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_857_Darius_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_857_Darius_Perm_Done_Info()
{
	AI_Output(other,self,"DIA_SLD_857_Darius_Perm_Done_01_00");		//Как дела?
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_Done_01_01");		//Все в полном порядке, приятель.
};

instance DIA_LEE_TOWER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = dia_lee_tower_condition;
	information = dia_lee_tower_info;
	permanent = FALSE;
	description = "Слушай, у меня к тебе есть один вопрос.";
};

func int dia_lee_tower_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_tower_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lee_Tower_15_00");	//Слушай, у меня к тебе есть один вопрос.
	AI_Output(other,self,"DIA_Lee_Tower_15_01");	//У вас здесь имеется башня к югу от фермы. У Онара есть какие-либо планы на нее?
	AI_Output(self,other,"DIA_Lee_Tower_05_02");	//Что ты имеешь в виду? Онар считает эту башню своей, но на деле ею не пользуется.
	AI_Output(self,other,"DIA_Lee_Tower_05_03");	//После того как жившие там бандиты были перебиты, я предлагал ему занять ее и отремонтировать.
	AI_Output(self,other,"DIA_Lee_Tower_05_04");	//Но он тогда был в дурном настроении из-за проблем с рентой Секоба, и не стал меня слушать.
	AI_Output(self,other,"DIA_Lee_Tower_05_05");	//Больше я к этой теме не возвращался. Почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Lee_Tower_15_06");	//Как ты, думаю, знаешь, я недавно очистил башню от обитавших там слуг Белиара.
	AI_Output(other,self,"DIA_Lee_Tower_15_07");	//Лорд Хаген в благодарность за это решил отдать ее мне.
	AI_Output(self,other,"DIA_Lee_Tower_05_08");	//И что позволило лорду Хагену думать, что он может распоряжаться здешними территориями?!
	AI_Output(self,other,"DIA_Lee_Tower_05_09");	//(Успокаиваясь) Ладно. Хорошо, что он хотя бы решил отдать ее тебе, а не кому-то другому. Что ты хочешь с ней делать?
	AI_Output(other,self,"DIA_Lee_Tower_15_10");	//Обустроить, найти людей для охраны. Может, попробую разработать старые шахты с рудой.
	AI_Output(other,self,"DIA_Lee_Tower_15_11");	//Одним словом, постараюсь сделать так, чтобы она начала приносить пользу вместо вреда.
	AI_Output(self,other,"DIA_Lee_Tower_05_12");	//Хммм... хорошо. Мне нравится твоя затея. Тем не менее, без одобрения Онара башни тебе не видать.
	AI_Output(self,other,"DIA_Lee_Tower_05_13");	//Я так понимаю, ты хочешь, чтобы я замолвил за тебя пару слов?
	AI_Output(other,self,"DIA_Lee_Tower_15_14");	//Верно.
	AI_Output(self,other,"DIA_Lee_Tower_05_15");	//Хорошо. Я поговорю с Онаром. Он все равно пальцем о палец не ударит ради наведения там порядка.
	AI_Output(self,other,"DIA_Lee_Tower_05_16");	//А лично мне уже надоело выслушивать жалобы крестьян и наемников насчет этой злосчастной территории.
	AI_Output(self,other,"DIA_Lee_Tower_05_17");	//Ах да, я не скажу ему о роли лорда Хагена во всем этом, и тебе не советую.
	LEE_APPROVES_TOWER = TRUE;
	B_LogEntry(TOPIC_MYNEWMANSION,"Ли поговорит с Онаром насчет моего дела.");
	AI_StopProcessInfos(self);
};
