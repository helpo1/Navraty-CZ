
instance DIA_garond_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_EXIT_Condition;
	information = DIA_Garond_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_EXIT_Info()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE) && (MIS_LostPaladins == FALSE))
	{
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_00");	//Погоди минутку...
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_01");	//Есть еще одно дело, в котором твоя помощь оказалась бы полезной.
		AI_Output(other,self,"DIA_Garond_SeekPaladin_01_02");	//И в чем оно заключается?
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_03");	//Когда мы направлялись к замку, то разбились на три группы, чтобы не привлекать к себе особого внимания орков.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_04");	//Первую группу возглавлял я! Командирами остальных двух были паладины Альберт и Венцель.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_05");	//Однако до сих пор о них ничего не было слышно. Я даже не знаю, живы они или нет!
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_06");	//Поэтому ты должен постараться выяснить, что стало с моими людьми.
		AI_Output(other,self,"DIA_Garond_SeekPaladin_01_07");	//Ладно! Я сделаю все, что в моих силах.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_08");	//Я очень надеюсь на тебя.
		MIS_LostPaladins = LOG_Running;
		Log_CreateTopic(TOPIC_LostPaladins,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Running);
		B_LogEntry(TOPIC_LostPaladins,"Гаронд попросил меня выяснить, что стало с отрядами паладинов Альберта и Венцеля.");
	};

	AI_StopProcessInfos(self);
};

var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;

instance DIA_Garond_PMSchulden(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Garond_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = "Паладины объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_garond_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = "Паладины объявили вас вне закона!";
	AI_Print(concatText);
};

func void DIA_Garond_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Прежде чем мы обсудим что-нибудь, заплати штраф.
	temp1 = 0;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_36");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_37");	//Ты - убийца, и это твоя истинная сущность. А мой священный долг - избавлять землю от таких, как ты!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_38");	//И поверь мне: эту обязанность перед людьми и Инносом я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_39");	//А теперь - умри!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_40");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_41");	//Ты - бандит, и это твоя истинная сущность. А мой священный долг - избавлять землю от таких, как ты!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_42");	//И поверь мне: эту обязанность перед людьми и Инносом я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_43");	//А теперь - умри!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_44");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_45");	//Ты - вор, и это твоя истинная сущность. А мой священный долг - избавлять землю от таких, как ты!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_46");	//И поверь мне: эту обязанность перед людьми и Инносом я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_47");	//А теперь - умри!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Мои отношения с паладинами испорчены из-за постоянных бесчинств в замке. Теперь там меня считают бандитом, это касается и города!");
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PMSchulden,"Постой...(пора сматываться)",dia_garond_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//А он возник из-за последних обвинений.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//По-видимому, ты доставишь мне еще больше неприятностей.
			diff = B_GetTotalPetzCounter(self) - Garond_LastPetzCounter;
			if(diff > 0)
			{
				Garond_Schulden = Garond_Schulden + (diff * 250);
			};
			if(Garond_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Но я надеюсь, что ты теперь оплатишь все! В целом это...
				AI_Output(other,self,"DIA_Garond_PMSchulden_10_03A");	//Сколько?
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Я разочарован тобой. Твой штраф составляет...
				AI_Output(other,self,"DIA_Garond_PMSchulden_10_04A");	//Сколько?
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Выяснилось несколько новых обстоятельств.
			if(Garond_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Теперь тебя никто больше не обвиняет в убийстве.
				GLOBAL_OLDCAMP_MURDER = GLOBAL_OLDCAMP_MURDER - 1;
				if(GLOBAL_OLDCAMP_MURDER < 0)
				{
					GLOBAL_OLDCAMP_MURDER = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_THEFT) || ((Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Никто не вспоминает о том, что застал тебя за кражей.
				GLOBAL_OLDCAMP_THEFT = GLOBAL_OLDCAMP_THEFT - 1;
				if(GLOBAL_OLDCAMP_THEFT < 0)
				{
					GLOBAL_OLDCAMP_THEFT = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_ATTACK) || ((Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//Больше нет ни одного свидетеля, который бы подтвердил, что ты участвовал в драке.
				GLOBAL_OLDCAMP_ATTACK = GLOBAL_OLDCAMP_ATTACK - 1;
				if(GLOBAL_OLDCAMP_ATTACK < 0)
				{
					GLOBAL_OLDCAMP_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//По-видимому, все обвинения против тебя были устранены.
			};
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Я не знаю, что произошло, но я предостерегаю тебя: не заходи слишком далеко!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Я решил простить тебе твои долги.
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//И больше не делай неприятностей в замке!
				Garond_Schulden = 0;
				Garond_LastPetzCounter = 0;
				Garond_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//Чтобы было ясно: ты должен заплатить свой штраф в полном размере.
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//Итак, что ты решил?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Garond_PMSchulden);
			Info_ClearChoices(DIA_Garond_PETZMASTER);
			Info_AddChoice(DIA_Garond_PMSchulden,"У меня недостаточно золота!",DIA_Garond_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Garond_PMSchulden,"Сколько я должен заплатить?",DIA_Garond_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
			{
				Info_AddChoice(DIA_Garond_PMSchulden,"Я хочу заплатить штраф.",DIA_Garond_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Сколько я должен заплатить?
	if(Garond_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Garond_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PMSchulden,"У меня недостаточно золота!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Garond_PMSchulden,"Сколько я должен заплатить?",DIA_Garond_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PMSchulden,"Я хочу заплатить штраф.",DIA_Garond_PETZMASTER_PayNow);
	};
};


instance DIA_Garond_PETZMASTER(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Garond_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Ты парень, который устроил неприятности в замке.
	};
	temp1 = 0;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_48");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_49");	//Кровожадным ублюдкам вроде тебя не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_50");	//И поверь мне, эту обязанность перед людьми и Инносом я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_51");	//А теперь - умри!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_52");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_53");	//Ты - бандит, и это твоя истинная сущность. А мой священный долг - избавлять землю от таких, как ты!
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_54");	//И поверь мне: эту обязанность перед людьми и Инносом я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_55");	//А теперь - умри!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_56");	//Но в свете твоих последних деяний - это уже ни к чему...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_57");	//Ты - вор, и это твоя истинная сущность. А мой священный долг - избавлять землю от таких как ты!
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_58");	//И поверь мне: эту обязанность перед людьми и Инносом, я исполню, чего бы мне это не стоило.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_59");	//А теперь - умри!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Мои отношения с паладинами испорчены из-за постоянных бесчинств в замке. Теперь там меня считают бандитом, это касается и города!");
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER,"Постой!!!...(пора сматываться)",dia_garond_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//Я уже спрашивал себя - когда ты придешь ко мне?
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Убийство - это самое последнее, что я хотел бы видеть!
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Я отвечаю за каждого из моих людей - и теперь у меня еще на одного человека меньше!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//И я даже не заикаюсь об остальных делах, которые ты натворил.
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Теперь я объясню тебе кое-что. Мы все сидим здесь в ловушке.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//И я отвечаю за каждого из моих людей. И за тебя.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Если ты захочешь убить кого-то, тебе надо только выйти из замка. Там предостаточно орков.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Я назначу тебе штраф - хотя я вовсе не хочу заниматься таким дерьмом.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Я слышал, ты занимаешься воровством?
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Помимо других дел, о которых мне сообщили.
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Я не позволю тебе этого. Я думаю, что ты недооцениваешь серьезности положения.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Ты заплатишь штраф, чтобы исправить последствия своего преступления!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Мне не нравится, что между моими людьми возникают драки.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//И случай с овцами не делает тебе чести.
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Ты заплатить штраф за это!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Ты ходишь кругом и убиваешь наших овец? Они принадлежат нам всем.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Ты оплатишь мне мясо.
			Garond_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Сколько?
		if(Garond_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Garond_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER,"У меня недостаточно золота!",DIA_Garond_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
		{
			Info_AddChoice(DIA_Garond_PETZMASTER,"Я хочу заплатить штраф.",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Garond_Schulden);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Хорошо, я скажу об этом нашим парням, чтобы немного успокоить их. Но чтобы больше такое не повторялось!
	B_GrantAbsolution(LOC_OLDCAMP);
	Garond_Schulden = 0;
	Garond_LastPetzCounter = 0;
	Garond_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_ClearChoices(DIA_Garond_PMSchulden);
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Тогда постарайся раздобыть это золото как можно быстрее.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//И я предупреждаю тебя: если ты будешь совершать подобные преступления и в будущем, цена возрастет!
	Garond_LastPetzCounter = B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Garond_Hello(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Hello_Condition;
	information = DIA_Garond_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Garond_Hello_Condition()
{
	if((Kapitel == 2) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Garond_Hello_Info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Откуда ты взялся? Ты не из старателей, и ты не один из моих людей. Так кто же ты?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Я пришел через Проход.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Через Проход...? Ты действительно прошел там?! О, Иннос всемогущий!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Зачем ты прошел этот путь, маг?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Какой приказ ты выполняешь, солдат?
	}
	else if(hero.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Я задаю себе вопрос: зачем наемнику проделывать такой путь? Что ты делаешь здесь?
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_06");	//Что ищет здесь почтенный маг Воды?
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_07");	//И какая же причина заставила НЕКРОМАНТА появиться здесь?
	}
	else if(hero.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_08");	//Ты похож на тех парней из бывшего лагеря на болотах. Чего тебе тут надо?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_09");	//Что ты здесь делаешь?
	};
};

instance DIA_Garond_NeedProof(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_NeedProof_Condition;
	information = DIA_Garond_NeedProof_Info;
	description = "Я прибыл от лорда Хагена.";
};


func int DIA_Garond_NeedProof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Hello) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_NeedProof_Info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Я пришел от лорда Хагена. Он хочет, чтобы я представил ему доказательства присутствия здесь драконов.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//Так ты пришел, чтобы получить эти доказательства и исчезнуть опять?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Да! Именно на это я и рассчитывал.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//Так ему нужны доказательства? Он может получить их. Но я не могу отправить тебя назад к лорду Хагену, не предоставив ему информацию о руде.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Послушай - лорд Хаген должен узнать все о ситуации здесь и о том, сколько руды удалось нам добыть.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//Хорошо. И что ты хочешь, чтобы я сделал?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//У нас здесь в долине три отряда старателей. Но я еще не получил от них ни одного куска руды.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Посети все три шахты и доложи мне, сколько руды они добыли.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//После этого я дам тебе письмо, которое ты отнесешь лорду Хагену.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Ну, хорошо. Похоже, у меня нет выбора.
	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTWO == FALSE))
	{
		IDOLORANQUESTIONTWO = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Судя по всему, основной причиной, по которой паладины прибыли на этот остров явилась магическая руда. Без достаточного количества оружия из магической руды армия короля не будет иметь ни единого шанса в войне против орков. Отряд, что отправился в Долину Рудников, должен выяснить ситуацию с возможностью добычи руды на острове. После этого, паладины планируют вернуться обратно на материк.");
	};
	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTHREE == FALSE))
	{
		IDOLORANQUESTIONTHREE = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Отряд паладинов, который лорд Хаген отправил для разъяснения ситуации с рудой, обосновался в старом замке Баронов. Их дела обстоят совсем плохо. По словам паладина Гаронда, ситуация с рудой до сих пор не ясна и ко всему прочему, орки взяли замок в кольцо, окружив паладинов со всех сторон. К тому же недавно на замок было совершено нападение драконов - что еще больше добавляет 'оптимизма' в успех всей операции.");
	};
	MIS_ScoutMine = LOG_Running;
	B_StartOtherRoutine(Jergan,"FAJETH");
	B_LogEntry(Topic_MISOLDWORLD,"Прежде чем комендант Гаронд даст мне письмо с доказательствами, он хочет, чтобы я нашел ТРИ группы рудокопов и сообщил ему, сколько руды они уже добыли.");
	Log_CreateTopic(TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutMine,LOG_Running);
	B_LogEntry_Quiet(TOPIC_ScoutMine,"Комендант Гаронд дал мне задание. Он послал в разведку ТРИ группы рудокопов на поиск магической руды. Но до сих пор от них не было никаких известий.");
	B_LogEntry_Quiet(TOPIC_ScoutMine,"Я должен разыскать группы рудокопов и узнать сколько руды они нашли.");
};

instance DIA_Garond_WhyNot(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_WhyNot_Condition;
	information = DIA_Garond_WhyNot_Info;
	description = "Почему ты не отправил людей в другие шахты?";
};

func int DIA_Garond_WhyNot_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Garond_NeedProof) == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void DIA_Garond_WhyNot_Info()
{
	AI_Output(other,self,"DIA_Garond_WhyNot_01_00");	//Почему ты не отправил людей в Старую шахту?
	AI_Output(self,other,"DIA_Garond_WhyNot_01_01");	//(серьезно) Насколько мне известно, в ней произошел обвал.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_02");	//Вряд ли мы сможем добывать там руду.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_03");	//Да и потом, в той шахте наверняка сейчас полно нежити.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_04");	//А я не собираюсь посылать своих людей на верную смерть! У меня их и так мало.
	AI_Output(other,self,"DIA_Garond_WhyNot_01_05");	//Есть еще шахта в Новом лагере.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_06");	//Шахта в Новом лагере? Еще одна?
	AI_Output(other,self,"DIA_Garond_WhyNot_01_07");	//А ты о ней не знал?
	AI_Output(self,other,"DIA_Garond_WhyNot_01_08");	//Кажется, один из заключенных говорил о чем-то похожем. Но я тогда не придал этому значения.
	AI_Output(other,self,"DIA_Garond_WhyNot_01_09");	//А зря. В свое время маги Воды добывали в ней руду для своих экспериментов. 
	AI_Output(self,other,"DIA_Garond_WhyNot_01_10");	//Если это так...(задумчиво) То тогда, пожалуй, нам стоит проверить ее.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_11");	//Займись этим! Надо выяснить, что сейчас с этой шахтой и можно ли там добывать руду.
	MIS_ScoutNewMine = LOG_Running;
	Log_CreateTopic(TOPIC_ScoutNewMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Running);
	B_LogEntry(TOPIC_ScoutNewMine,"Гаронд был удивлен известием о том, что в Долине Рудников существует еще одна шахта - та, которая была в Новом лагере. Он приказал мне узнать ситуацию там!");
};

var int SFRM_01;
var int SFRM_02;

instance DIA_Garond_ScoutNewMine(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_ScoutNewMine_Condition;
	information = DIA_Garond_ScoutNewMine_Info;
	permanent = TRUE;
	description = "Насчет шахты в Новом лагере.";
};

func int DIA_Garond_ScoutNewMine_Condition()
{
	if((MIS_ScoutNewMine == LOG_Running) && ((ScoutFreeMine == TRUE) || (ScoutFreeLager == TRUE) || (FreeMineGeneralIsDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_ScoutNewMine_Info()
{
	var int sumqx;

	sumqx = FALSE;

	AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_00");	//Насчет шахты в Новом лагере.
	AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_01");	//Я тебя слушаю.

	if(FreeMineGeneralIsDead == FALSE)
	{
		if((ScoutFreeLager == TRUE) && (SFRM_01 == FALSE))
		{
			sumqx = sumqx + 200;
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_02");	//Орки полностью контролируют все подходы к ней.
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_03");	//И их там довольно много.
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_04");	//Я в этом и не сомневался. Эти твари своего не упустят!
			SFRM_01 = TRUE;
		};
		if((ScoutFreeMine == TRUE) && (SFRM_02 == FALSE))
		{
			sumqx = sumqx + 200;
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_05");	//Мне удалось попасть в саму шахту. Там тоже полно орков!
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_06");	//Логично было предположить, что они не оставят ее без охраны.
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_07");	//Теперь, чтобы добывать там руду, нам придется выбить их оттуда!
			SFRM_02 = TRUE;
		};
		if(sumqx > 0)
		{
			B_GivePlayerXP(sumqx);
		};

		AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_08");	//Больше пока ничего.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_09");	//Хорошо! Тогда сообщи мне, если ситуация изменится.
	}
	else
	{
		if((SFRM_01 == FALSE) && (SFRM_02 == FALSE))
		{
			B_GivePlayerXP(500);
		}
		else
		{
			B_GivePlayerXP(1000);
		};

		AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_10");	//Я позаботился об орках. Шахта теперь свободна.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_11");	//Ты серьезно? Честно говоря, этого я никак от тебя не ожидал.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_12");	//Хорошо! Как только мы снимем осаду с замка, я пошлю туда небольшую группу людей.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_13");	//Посмотрим, много ли там запасов руды.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_14");	//Вот - возьми это золото в качестве награды.
		B_GiveInvItems(self,other,ItMi_Gold,1500);
		MIS_ScoutNewMine = LOG_Success;
		Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Success);
		B_LogEntry(TOPIC_ScoutNewMine,"Гаронд был доволен тем, что мне удалось освободить шахту в Новом лагере.");
		AI_StopProcessInfos(self);
	};
};

var int AlbertGroupDone;
var int VenzelGroupDone;

instance DIA_GAROND_GROUP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_group4_condition;
	information = dia_garond_group4_info;
	permanent = FALSE;
	description = "Я обнаружил отряд паладина Альберта.";
};

func int dia_garond_group4_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITELORCATC == FALSE) && (AlbertGroup == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_group4_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Garond_Group4_15_01");	//Я обнаружил отряд паладина Альберта.
	AI_Output(self,other,"DIA_Garond_Group4_10_00");	//Что с ними?
	AI_Output(other,self,"DIA_Garond_Group4_15_02");	//Они укрылись в пещере за забором орков.
	AI_Output(other,self,"DIA_Garond_Group4_15_03");	//Он спрашивает - что им делать?
	AI_Output(self,other,"DIA_Garond_Group4_10_01");	//Иннос прислал нам сегодня хорошие новости!
	AI_Output(self,other,"DIA_Garond_Group4_10_02");	//Если ты сумеешь добраться туда вновь, передай мой приказ - пусть сидят в укрытии, пока в долине не появится лорд Хаген со своими людьми.
	AI_Output(self,other,"DIA_Garond_Group4_10_04");	//А потом они ударят оркам в тыл!
	AI_Output(self,other,"DIA_Garond_Group4_10_05");	//Если мы ударим с трех сторон - из Хориниса, из замка и со стороны моря, то мы посеем панику в рядах орков.
	AI_Output(self,other,"DIA_Garond_Group4_10_06");	//И тогда у нас будет заметный шанс.
	B_LogEntry(TOPIC_LostPaladins,"Я сообщил Гаронду о найденной группе паладинов.");

	if(MIS_EscapeMine == LOG_Success)
	{
		MIS_LostPaladins = LOG_Success;
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	};

	MIS_FINDEDOCGROUP = LOG_Running;
	Log_CreateTopic(TOPIC_FINDEDOCGROUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Running);
	B_LogEntry_Quiet(TOPIC_FINDEDOCGROUP,"Гаронд попросил меня передать приказ Альберту, чтобы те пока оставались на месте до прихода в долину лорда Хагена с подкреплением.");
};

instance DIA_GAROND_Venzel(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_Venzel_condition;
	information = dia_garond_Venzel_info;
	permanent = FALSE;
	description = "По поводу группы паладина Венцеля.";
};

func int dia_garond_Venzel_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITELORCATC == FALSE) && (HintVenzelOrcs_01 == TRUE) && (HintVenzelOrcs_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_Venzel_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Garond_Venzel_01_01");	//По поводу группы паладина Венцеля...
	AI_Output(self,other,"DIA_Garond_Venzel_01_02");	//Я внимательно тебя слушаю.
	AI_Output(other,self,"DIA_Garond_Venzel_01_03");	//Пару дней назад один из охотников видел раненого паладина на берегу реки. 
	AI_Output(other,self,"DIA_Garond_Venzel_01_04");	//Возможно, это был кто-то из отряда Венцеля.
	AI_Output(self,other,"DIA_Garond_Venzel_01_05");	//Интересно... Больше ничего не удалось узнать?
	AI_Output(other,self,"DIA_Garond_Venzel_01_06");	//Также разведчик Йерган говорит, что недавно наблюдал, как орки вели группу пленных людей к себе в лагерь.
	AI_Output(other,self,"DIA_Garond_Venzel_01_07");	//Правда на них не было никаких опознавательных знаков.
	AI_Output(other,self,"DIA_Garond_Venzel_01_08");	//Поэтому он не может сказать точно.
	AI_Output(self,other,"DIA_Garond_Venzel_01_09");	//Если они все-таки живы и попали в плен к оркам, надо как-то попытаться вытащить их из лап этих тварей. 
	AI_Output(self,other,"DIA_Garond_Venzel_01_10");	//(решительно) Где они сейчас?
	AI_Output(other,self,"DIA_Garond_Venzel_01_11");	//Боюсь, что кроме орков, этого никто не скажет.
	AI_Output(self,other,"DIA_Garond_Venzel_01_12");	//Знаешь, мне все равно, как ты это сделаешь...(серьезно) Но ты должен узнать, что это были за люди!
	AI_Output(self,other,"DIA_Garond_Venzel_01_13");	//И если среди них есть мои братья по оружию - постараться спасти их.
	AI_Output(self,other,"DIA_Garond_Venzel_01_14");	//Выполни это поручение - и можешь просить от меня все, что захочешь. Клянусь Инносом!
	AI_Output(other,self,"DIA_Garond_Venzel_01_15");	//Ну, если это для тебя так важно...
	B_LogEntry(TOPIC_LostPaladins,"Я сообщил Гаронду о том, что мне удалось выяснить по поводу отряда Венцеля. Новости его, конечно, не порадовали. Он настоял на том, чтобы я выяснил, что это были за люди, которых орки увели в горы. И если представится возможность, спас их. По всей видимости, это могут знать только сами орки.");
	KnowVenzelOrcs = TRUE;
};

instance DIA_PAL_250_Garond_VenzelDone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_PAL_250_Garond_VenzelDone_condition;
	information = DIA_PAL_250_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Я выяснил, что случилось с Венцелем.";
};

func int DIA_PAL_250_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_250_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_01");	//Я выяснил, что случилось с Венцелем.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_02");	//Рассказывай все, что знаешь. Он жив?
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_03");	//Жив, но попал в плен к оркам. Они отправили его в железную шахту добывать руду.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_04");	//Хвала Инносу...(облегченно) Значит, еще не все потеряно! Надо попробовать вытащить его оттуда.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_05");	//В этом уже нет необходимости. В шахте орков я нашел магический портал.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_06");	//Венцель вместе с остальными рабами воспользуется им, чтобы сбежать из плена.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_07");	//Однако есть подозрение, что портал ведет прямиком на материк.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_08");	//Поэтому Венцель попросил меня передать тебе, что скорее всего, не вернется обратно в Хоринис.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_09");	//Что же, пусть будет так. Главное, что с ним все будет в порядке.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_10");	//Он сказал, что вернется в Миртану и будет сражаться с орками там.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_11");	//По всей видимости, он был прав, когда говорил, что у короля там дела обстоят не лучше вашего.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_12");	//Эти проклятые орки...(гневно) Они заполонили всю страну, как саранча!
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_13");	//Но мы будем сражаться до последнего! Просто так им нас не сломить.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_14");	//Что касается ситуации на материке...(с неохотой) Я не стану тебя обманывать! Да, это так.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_15");	//Король из последних сил старается сдержать орды орков, прорвавшиеся из Нордмара.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_16");	//Но ему это плохо удается. Орков слишком много, а королю не хватает ни людей, ни оружия.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_17");	//Поэтому вся надежда лежит на нас! Возможно, с помощью магической руды еще есть шанс переломить ход войны.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_18");	//Но, как видишь, мы сами тут с трудом отбиваемся от орков.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_19");	//Я не привык сдаваться раньше времени...(обреченно) Но похоже, что в этой войне мы уже проиграли.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_20");	//Но только не вздумай об этом рассказывать кому-либо! 
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_21");	//Я не позволю, чтобы мои солдаты пали духом только из-за каких то глупых домыслов.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_22");	//Само собой.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Я рассказал Гаронду о судьбе Венцеля.");
};

instance DIA_Garond_Why(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Why_Condition;
	information = DIA_Garond_Why_Info;
	permanent = FALSE;
	description = "Но почему именно я? ";
};

func int DIA_Garond_Why_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Why_Info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Но почему именно я?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Потому что ты знаешь как пробираться через ряды орков. Мои парни только зря отдадут свои жизни.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//Ведь тебе один раз уже удалось преодолеть все препятствия - значит, ты как нельзя лучше подходишь для этой работы.
};

instance DIA_Garond_Equipment(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Equipment_Condition;
	information = DIA_Garond_Equipment_Info;
	permanent = FALSE;
	description = "Мне нужно снаряжение.";
};


func int DIA_Garond_Equipment_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void DIA_Garond_Equipment_Info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Мне нужно снаряжение.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Поговори с магом Милтеном здесь, в замке. Он разбирается в таких вещах.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Поговори об этом с Тандором. Он выдаст тебе все необходимое.
		Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Trader_OC,"Тандор продает оружие в замке.");
	};
};


instance DIA_Garond_zahlen(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_zahlen_Condition;
	information = DIA_Garond_zahlen_Info;
	permanent = FALSE;
	description = "Сколько ты заплатишь мне за эту работу?";
};


func int DIA_Garond_zahlen_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_zahlen_Info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Сколько ты заплатишь мне за эту работу?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//Я не торгуюсь с вами, наемниками.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Ох, ладно, похоже, у меня нет выбора. Я заплачу тебе пятьсот золотых, если ты выполнишь мое задание.
};


instance DIA_Garond_Wo(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Wo_Condition;
	information = DIA_Garond_Wo_Info;
	permanent = FALSE;
	description = "Где мне найти эти шахты?";
};


func int DIA_Garond_Wo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Wo_Info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Где мне найти эти шахты?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Вот, возьми эту карту. На ней показаны две области, где находятся шахты.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis_1,1);
	B_GiveInvItems(self,other,itwr_map_oldworld_oremines_mis_1,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Если у тебя есть еще вопросы, обратись к Парсивалю. Он расскажет все, что тебе нужно знать о старателях.
	B_LogEntry(TOPIC_ScoutMine,"Паладин Парсиваль может дать мне информацию о старателях.");
};

func void B_Garond_OreCounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Черт! Что там происходит? Неужели сам Белиар явился, чтобы стереть нас с лица земли?!
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Мои люди почти все мертвы, а с той рудой, что у нас есть, мы НЕ МОЖЕМ ОСТАНОВИТЬ ДАЖЕ ОДНОГО ОРКА, НЕ ГОВОРЯ УЖЕ ОБ АРМИИ!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Эта экспедиция обречена на провал.
};


instance DIA_Garond_Fajeth(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Fajeth_Condition;
	information = DIA_Garond_Fajeth_Info;
	permanent = FALSE;
	description = "Я поговорил с Фаджетом.";
};


func int DIA_Garond_Fajeth_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Fajeth_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Fajeth_Info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Я поговорил с Фаджетом.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Что он может сказать мне?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Его люди добыли два ящика руды.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Хмм... два ящика? Мне не нужны два ящика - мне нужно ДВЕ СОТНИ.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Он хочет, чтобы я передал тебе - ему нужны еще люди.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Что? Я должен послать еще людей на верную смерть? Он может забыть об этом.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Fajeth_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Silvestro(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Silvestro_Condition;
	information = DIA_Garond_Silvestro_Info;
	permanent = FALSE;
	description = "Насчет шахты Сильвестро...";
};


func int DIA_Garond_Silvestro_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Silvestro_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Silvestro_Info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Насчет шахты Сильвестро...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Ты видел его? Ты говорил с ним?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Все, кто находился в шахте, мертвы. Растерзаны ползунами!
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//А что насчет руды? Ты знаешь, сколько они добыли?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Им удалось спрятать несколько ящиков. Они в пещере - по пути от замка к шахте.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Черт! Это были хорошие люди - да проявит Иннос милосердие к их душам.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Silvestro_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Marcos(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Marcos_Condition;
	information = DIA_Garond_Marcos_Info;
	permanent = FALSE;
	description = "Я встретил Маркоса.";
};


func int DIA_Garond_Marcos_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Marcos_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Marcos_Info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Я встретил Маркоса.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//И? Что он может доложить? Сколько руды он добыл для нас?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Четыре ящика. Он покинул шахту, чтобы переправить руду в безопасное место.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Теперь он охраняет эти ящики в небольшой долине за позициями орков. Он просит прислать подкрепление.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Что? Всего четыре ящика - и он покинул шахту? Черт, как это все плохо.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//И ему нужны еще люди?.. Что ж, ладно, я пошлю к нему двух человек.
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	B_StartOtherRoutine(Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine(Marcos_Guard2,"MARCOS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	Ore_Counter = Ore_Counter + 1;
	MIS_Marcos_Jungs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Marcos_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Success(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Success_Condition;
	information = DIA_Garond_Success_Info;
	permanent = FALSE;
	description = "Что насчет письма для лорда Хагена?";
};


func int DIA_Garond_Success_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter >= 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Success_Info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//Что насчет письма для лорда Хагена?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//В общей сложности у нас есть десять ящиков руды - и мы потеряли в два раза больше хороших людей.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Ты получишь свое письмо. Лорд Хаген должен услышать об этом! Эта долина проклята...
	CreateInvItems(self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONFOUR == FALSE))
	{
		IDOLORANQUESTIONFOUR = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"По мнению Гаронда, экспедиция в Долину Рудников потерпела полное фиаско! Те залежи руды, что еще доступны для добычи - не могут обеспечить потребности всей королевской армии. Гаронд послал меня с донесением к лорду Хагену, где также просит о подкреплении.");
	};

	B_LogEntry(Topic_MISOLDWORLD,"Гаронд вручил мне письмо. Это хорошее доказательство! С ним я могу возвращаться к лорду Хагену.");
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP(XP_ScoutMine);
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
};


instance DIA_Garond_SLD(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_SLD_Condition;
	information = DIA_Garond_SLD_Info;
	permanent = FALSE;
	description = "Как насчет оплаты?";
};


func int DIA_Garond_SLD_Condition()
{
	if((MIS_ScoutMine == LOG_SUCCESS) && (other.guild == GIL_SLD) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_SLD_Info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//Как насчет оплаты?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Ох, да, точно. Я должен тебе немного золота. Вот твоя награда.
	B_GiveInvItems(self,other,ItMi_Gold,500);
};


instance DIA_Garond_Running(C_Info)
{
	npc = PAL_250_Garond;
	nr = 10;
	condition = DIA_Garond_Running_Condition;
	information = DIA_Garond_Running_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int DIA_Garond_Running_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Running_Info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Как обстановка?
	if(Ore_Counter == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Теперь я жду только новостей с последней шахты - и надеюсь, что это будут хорошие новости.
	}
	else if(Ore_Counter == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Мне нужны доклады о двух других шахтах. А там посмотрим.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Ты должен найти наши шахты. Мне очень нужны новости о том, как обстоят дела с добычей руды.
	};
};


instance DIA_Garond_Gorn(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Gorn_Condition;
	information = DIA_Garond_Gorn_Info;
	permanent = FALSE;
	description = "Я хочу, чтобы ты освободил Горна.";
};


func int DIA_Garond_Gorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Gorn) && (Kapitel == 2) && Npc_KnowsInfo(other,DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};

func void DIA_Garond_Gorn_Info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Я хочу, чтобы ты освободил Горна.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//Я не могу отпустить его. Он совершил слишком много преступлений и должен поплатиться за это.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Могу я заплатить штраф за него?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//Это возможно - но обойдется тебе очень недешево. Я хочу получить за Горна тысячу золотых!
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//Это огромная сумма.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Вина Горна тоже не маленькая! Принеси мне это золото и я освобожу его.
	MIS_RescueGorn = LOG_Running;
	B_LogEntry(TOPIC_RescueGorn,"Гаронд требует тысячу золотых монет за освобождение Горна. ");
};


instance DIA_Garond_Pay(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Pay_Condition;
	information = DIA_Garond_Pay_Info;
	permanent = TRUE;
	description = "Я хочу купить свободу Горну. (Заплатить 1000 монет)";
};


func int DIA_Garond_Pay_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Pay_Info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Я хочу купить Горну свободу.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Хорошо. Ты можешь пойти к Герольду и сказать ему, что я приказываю освободить Горна.
		Garond_Kerkerauf = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Я заплатил Гаронду. Теперь я могу освободить Горна из темницы. Стражник Герольд не будет препятствовать.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//Тогда принеси мне тысячу золотых монет.
	};
};


instance DIA_Garond_Perm2(C_Info)
{
	npc = PAL_250_Garond;
	nr = 9;
	condition = DIA_Garond_Perm2_Condition;
	information = DIA_Garond_Perm2_Info;
	permanent = TRUE;
	description = "Что ты планируешь делать дальше?";
};


func int DIA_Garond_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Success) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Perm2_Info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Я уже все перепробовал. Ты - моя единственная надежда, что лорд Хаген пришлет мне подкрепление.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Но мы не падем духом и будем молиться Инносу, чтобы он не оставил нас без своей поддержки в этот мрачный час.
};


instance DIA_Garond_KAP3_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP3_EXIT_Condition;
	information = DIA_Garond_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_WASGIBTSNEUES(C_Info)
{
	npc = PAL_250_Garond;
	nr = 30;
	condition = DIA_Garond_WASGIBTSNEUES_Condition;
	information = DIA_Garond_WASGIBTSNEUES_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_Garond_WASGIBTSNEUES_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Что нового?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Черт. Что ты тут ошиваешься? Мне нужно подкрепление!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Даже Милтен покинул замок. Но мне не нужно несколько человек - мне нужно БОЛЬШОЕ подкрепление!
};


instance DIA_Garond_KAP4_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP4_EXIT_Condition;
	information = DIA_Garond_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_BACKINKAP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_BACKINKAP4_Condition;
	information = DIA_Garond_BACKINKAP4_Info;
	permanent = FALSE;
	description = "Я вернулся.";
};


func int DIA_Garond_BACKINKAP4_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_BACKINKAP4_Info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Я вернулся.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//Я сам это вижу. А что насчет подкрепления?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Лорд Хаген прибудет, как только со всем разберется. Столько всего произошло.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//Меня это не волнует. Мне нужны войска. Орки все прибывают и прибывают. Нам не продержаться долго.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Мои люди измотаны, и у нас заканчивается провизия.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Прибыли волонтеры.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Ты имеешь в виду себя и твоих друзей, охотников на драконов, что ли? Вы, конечно, можете помочь нам, но вас слишком мало.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Ты имеешь в виду охотников на драконов? Они, конечно, могут помочь нам, но их слишком мало.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Если Хаген не пришлет в ближайшее время своих людей, я ничего не могу гарантировать.
	B_InitNpcGlobals();
	AI_Teleport(DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");
	B_StartOtherRoutine(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;
	B_StartOtherRoutine(Kjorn,"START");
	B_StartOtherRoutine(Godar,"START");
	B_StartOtherRoutine(Hokurn,"START");
	B_StartOtherRoutine(PC_Fighter_DJG,"START");
	B_StartOtherRoutine(Kurgan,"START");
	if(DJG_BiffParty == FALSE)
	{
		B_StartOtherRoutine(Biff,"START");
	};
};


instance DIA_Garond_DragonPlettBericht(C_Info)
{
	npc = PAL_250_Garond;
	nr = 11;
	condition = DIA_Garond_DragonPlettBericht_Condition;
	information = DIA_Garond_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "Насчет драконов...";
};


var int DIA_Garond_DragonPlettBericht_NoPerm;

func int DIA_Garond_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4) && (DIA_Garond_DragonPlettBericht_NoPerm == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;

func void DIA_Garond_DragonPlettBericht_Info()
{
	var int CurrentDragonCount;
	var int Drachengeld;
	var int XP_LocalGarond;
	B_LogEntry(TOPIC_DRACHENJAGD,"Гаронд наверняка заинтересован тем, как идут дела с драконами, хотя делает вид, что это ему полностью безразлично.");
	if(Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//У меня есть новости о драконах.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Докладывай.
		CurrentDragonCount = 0;
		if(Npc_IsDead(SwampDragon) && (Garond_SwampdragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Я убил дракона в болоте к востоку отсюда.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
			if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
			{
				Npc_ExchangeRoutine(DJG_702_Rod,"ONDCamp");
				AI_Teleport(DJG_702_Rod,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
			};
			if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
			{
				Npc_ExchangeRoutine(DJG_703_Cipher,"ONDCamp");
				AI_Teleport(DJG_703_Cipher,"VORPOSTEN");
			};
		};
		if(Npc_IsDead(RockDragon) && (Garond_RockdragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Дракон в каменной крепости к югу отсюда мертв.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if(Npc_IsDead(FireDragon) && (Garond_FireDragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Огненный дракон из вулкана на юге больше не будет беспокоить вас.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if(Npc_IsDead(IceDragon) && (Garond_IcedragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Я был в западном ледяном районе и расправился с драконом, обитавшем там.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//Это хорошие новости. Вот. Возьми эти деньги. Надеюсь, они помогут тебе обновить свое снаряжение.
		Drachengeld = CurrentDragonCount * Garond_KilledDragonGeld;
		XP_LocalGarond = CurrentDragonCount * XP_Garond_KilledDragon;
		B_GivePlayerXP(XP_LocalGarond);
		CreateInvItems(self,ItMi_Gold,Drachengeld);
		B_GiveInvItems(self,other,ItMi_Gold,Drachengeld);
		Garond_DragonCounter = MIS_KilledDragons;
		if(MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
	if((Garond_OricExperte_OneTime == FALSE) && (Npc_IsDead(Oric) == FALSE) && (MIS_AllDragonsDead == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Ты можешь еще что-нибудь рассказать о драконах?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Мне нужно заниматься другими делами. Пусть мой помощник-стратег Орик расскажет тебе об этом.
		B_LogEntry(TOPIC_DRACHENJAGD,"Гаронд сообщил мне, что у офицера Орика есть больше информации о драконах для меня.");
		Garond_OricExperte_OneTime = TRUE;
	}
	else if(MIS_AllDragonsDead == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Последнее время были еще нападения драконов?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//По счастью, нет. В настоящий момент они держатся вдалеке.
	};
};


instance DIA_Garond_AllDragonDead(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_AllDragonDead_Condition;
	information = DIA_Garond_AllDragonDead_Info;
	permanent = FALSE;
	description = "Все драконы мертвы.";
};


func int DIA_Garond_AllDragonDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (DIA_Garond_DragonPlettBericht_NoPerm == TRUE) && (Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Все драконы мертвы.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//Все?...(недоверчиво) То есть зло изгнано отсюда навеки?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Нет! Остался их предводитель.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Разве не драконы были предводителями орков?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Да, это так, но у них также есть свой хозяин. Мы должны уничтожить и его тоже!
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Я, к сожалению, ничем не могу тебе помочь! Я должен охранять руду, а эти проклятые орки, кстати, тоже все еще здесь.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Тебе придется сделать это самому.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Да защитит тебя Иннос!
	OWDragonsDeadIsDead = TRUE;
};

instance DIA_Garond_JanBecomeSmith(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_JanBecomeSmith_Condition;
	information = DIA_Garond_JanBecomeSmith_Info;
	permanent = TRUE;
	description = "Я хочу поговорить о кузнеце.";
};


func int DIA_Garond_JanBecomeSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && (Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//Я хочу поговорить о кузнеце.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Каком кузнеце? Он исчез.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//Он что вернулся? Тогда можешь сказать ему...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Нет, я говорю о Яне.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//Он охотник на драконов, как и я, и хороший кузнец.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Одном из охотников на драконов. Он кузнец.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//Это хорошо. Наш предыдущий кузнец слинял, трус.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Ян хотел бы поработать в кузнице.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Понимаю. Так ты думаешь, я могу доверять ему?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Да.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Если ты так уверен, то ты можешь поручиться за него.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Если из-за него возникнут проблемы, за это ответишь ты. Согласен?
	DobarOut = TRUE;
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"Я еще подумаю над этим.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"Я ручаюсь за Яна.",DIA_Garond_JanBecomeSmith_Yes);
};

func void DIA_Garond_JanBecomeSmith_No()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Как я могу доверять ему, если даже ты сомневаешься в нем?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Если за него никто не сможет поручиться, этот Ян на пушечный выстрел не подойдет к кузнице.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
};

func void DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Я ручаюсь за Яна.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Хорошо. Он может работать в кузнице. Но, конечно же, он должен обеспечивать моих людей мечами.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Garond_DobarOut(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_DobarOut_Condition;
	information = DIA_Garond_DobarOut_Info;
	permanent = FALSE;
	description = "Ты сказал, что ваш кузнец сбежал.";
};

func int DIA_Garond_DobarOut_Condition()
{
	if((DobarOut == TRUE) && (Npc_IsDead(VLK_4107_Parlaf) == FALSE) && (ParlafIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Garond_DobarOut_01_00");	//Ты сказал, что ваш кузнец сбежал.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_01");	//Да, и не один, а вместе со своим помощником Парлафом. Правда, я не думаю, что им удалось далеко уйти.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_02");	//В последние дни в долине стало еще больше орков и всяких других тварей, а эти двое не были хорошими бойцами.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_03");	//Знаешь, пусть они и жалкие трусы, но Иннос с ними. Во всяком случае худшее – я имею в виду момент, когда орки возьмут замок – они уже не застанут.
	AI_Output(other,self,"DIA_Garond_DobarOut_01_04");	//Может, мне поискать их?

	if(MIS_JanBecomesSmith == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garond_DobarOut_01_05");	//Если честно, в нынешней ситуации мне уже все равно. Кузнец теперь у нас есть.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_DobarOut_01_06");	//Если честно, в нынешней ситуации мне уже все равно.
	};

	AI_Output(self,other,"DIA_Garond_DobarOut_01_07");	//Но, так или иначе, ты постоянно носишься по всей долине... в общем, решай сам.
	AI_Output(other,self,"DIA_Garond_DobarOut_01_08");	//Я тебя понял.
	DayParlafDead = Wld_GetDay();
	MIS_DobarOut = LOG_Running;
	Log_CreateTopic(TOPIC_DobarOut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarOut,LOG_Running);
	B_LogEntry(TOPIC_DobarOut,"За время моего отсутствия в замке произошло немало изменений, и это касается не только прибывших сюда охотников на драконов. Кузнец Добар и его помощник Парлаф решили бежать из замка. Я мог бы поискать их.");
};

instance DIA_Garond_DobarOut_Done(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Done_Condition;
	information = DIA_Garond_DobarOut_Done_Info;
	permanent = FALSE;
	description = "Я нашел Парлафа.";
};

func int DIA_Garond_DobarOut_Done_Condition()
{
	if((MIS_DobarOut == LOG_Running) && ((ParlafOnPlace == TRUE) || (ParlafOnPlaceDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Done_Info()
{
	AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_00");	//Я нашел Парлафа.
	AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_01");	//Где же был этот щенок?

	if(ParlafNoExcort == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_02");	//Прятался в одной из пещер недалеко от замка.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_03");	//Он попросил меня сопроводить его обратно в замок, но к сожалению погиб пробираясь сюда.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_04");	//Что ж... По крайней мере он успел осознать свою ошибку.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_05");	//Не могу сказать, что буду сильно скучать по нему.
		B_LogEntry(TOPIC_DobarOut,"Я сообщил Гаронду, что не смог довести Парлафа живым до замка.");
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Думаю, на этом мои поиски окончены.");
		};
	}
	else if(ParlafOnPlaceDead == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_06");	//Прятался в одной из пещер недалеко от замка. Когда я добрался до нее, он уже был мертв. Голод.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_07");	//(с сарказмом) Что, там не кормили лучше, чем здесь? Проклятые нытики...
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_08");	//Необязательно уже корить покойника.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_09");	//О, Иннос, да мы тут все наполовину покойники! А ты предлагаешь мне жалеть трусливого дезертира?
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_10");	//Ничего я не предлагаю.
		B_LogEntry(TOPIC_DobarOut,"Я сообщил Гаронду, что нашел Парлафа мертвым. Похоже, эта новость не произвела на него особого впечатления.");
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Думаю, на этом мои поиски окончены.");
		};
	}
	else if(ParlafOnPlace == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_11");	//Прятался в одной из пещер недалеко от замка. Только благодаря мне ему удалось выжить.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_12");	//Он попросил меня сопроводить его обратно в замок. Думаю, он осознает свою ошибку.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_13");	//Что ж... в иной ситуации я бы бросил его в темницу. Но раз он понял всю глупость своего поступка, я не буду этого делать.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_14");	//Тем более, занятие для него найдется – пусть помогает Яну в кузнице.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_15");	//Хорошо, я ему передам.
		B_LogEntry(TOPIC_DobarOut,"Я сообщил Гаронду, что привел Парлафа обратно в замок. Тот велел ему, вновь помогать в кузнице.");
		GarondKnowParlaf = TRUE;
 
		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Думаю, на этом мои поиски окончены.");
		};
	};
};

instance DIA_Garond_DobarOut_Xone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Xone_Condition;
	information = DIA_Garond_DobarOut_Xone_Info;
	permanent = FALSE;
	description = "Я нашел Добара.";
};

func int DIA_Garond_DobarOut_Xone_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Xone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Garond_DobarOut_Xone_01_00");	//Я нашел Добара.
	AI_Output(self,other,"DIA_Garond_DobarOut_Xone_01_01");	//И что с ним?
	AI_Output(other,self,"DIA_Garond_DobarOut_Xone_01_02");	//Он мертв. 
	AI_Output(self,other,"DIA_Garond_DobarOut_Xone_01_03");	//Я нисколько не удивлен этой новости. Да, он был неплохим кузнецом, но плакать по нему я точно не буду.
	GarondKnowDobar = TRUE;
	B_LogEntry(TOPIC_DobarOut,"Я сообщил Гаронду, что нашел Добара мертвым.");

	if(GarondKnowParlaf == TRUE)
	{
		MIS_DobarOut = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
		B_LogEntry_Quiet(TOPIC_DobarOut,"Думаю, на этом мои поиски окончены.");
	};
};

instance DIA_Garond_KAP5_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP5_EXIT_Condition;
	information = DIA_Garond_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_PERM5(C_Info)
{
	npc = PAL_250_Garond;
	nr = 59;
	condition = DIA_Garond_PERM5_Condition;
	information = DIA_Garond_PERM5_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int DIA_Garond_PERM5_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Как обстановка?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Что за бардак! Какой-то ублюдок оставил открытыми главные ворота. Теперь мы остались совсем без защиты.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Ну, доберусь я до этого предателя...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Мы все здесь помрем как мухи, если Хаген не прибудет как можно скорее.
	};
};


instance DIA_Garond_KAP6_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP6_EXIT_Condition;
	information = DIA_Garond_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_MADERZ(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_maderz_condition;
	information = dia_garond_maderz_info;
	permanent = FALSE;
	description = "У меня есть для тебя новость.";
};


func int dia_garond_maderz_condition()
{
	if((MIS_MADERZ == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_maderz_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Garond_MadErz_01_00");	//У меня есть для тебя новость.
	AI_Output(other,self,"DIA_Garond_MadErz_01_04");	//Недалеко от развалин старого города орков я обнаружил большие запасы магической руды. Не меньше двадцати ящиков!
	AI_Output(self,other,"DIA_Garond_MadErz_01_05");	//Не уж то это правда?
	AI_Output(self,other,"DIA_Garond_MadErz_01_07");	//Если это действительно так, это просто отличная новость!
	AI_Output(self,other,"DIA_Garond_MadErz_01_08");	//Двадцать ящиков это больше того, что мы имеем сейчас.
	AI_Output(self,other,"DIA_Garond_MadErz_01_10");	//Однако радоваться еще рано. Орки еще тут и до сих пор осаждают наш замок.
	AI_Output(self,other,"DIA_Garond_MadErz_01_12");	//Нам же теперь надо решить, что делать дальше с найденной тобою рудой.
	AI_Output(other,self,"DIA_Garond_MadErz_01_13");	//Думаю, для начала тебе стоит послать туда пару своих людей.
	AI_Output(self,other,"DIA_Garond_MadErz_01_14");	//Ты прав - я пошлю туда несколько солдат. В конце концов, это пока единственное, что я могу сделать.
	AI_Output(self,other,"DIA_Garond_MadErz_01_21");	//Что же касается тебя - то ты заслужил небольшую награду за свои труды.
	AI_Output(self,other,"DIA_Garond_MadErz_01_22");	//Выбери сам, что тебе нужно.
	MIS_MADERZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_MADERZ,"Я сообщил Гаронду о найденных мною запасах магической руды недалеко от развалин старого города орков. Гаронд был рад услышать эту новость. Он направит туда несколько своих людей для транспортировки руды в замок.");
	Info_ClearChoices(dia_garond_maderz);
	Info_AddChoice(dia_garond_maderz,"Взять золото.",dia_garond_maderz_gold);
	Info_AddChoice(dia_garond_maderz,"Взять эликсир маны.",dia_garond_maderz_mana);
	Info_AddChoice(dia_garond_maderz,"Взять эликсир жизни.",dia_garond_maderz_health);
	Info_AddChoice(dia_garond_maderz,"Взять эликсир ловкости.",dia_garond_maderz_dex);
	Info_AddChoice(dia_garond_maderz,"Взять эликсир силы.",dia_garond_maderz_str);
};

func void dia_garond_maderz_gold()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Gold_01_00");	//Дай мне золото.
	AI_Output(self,other,"DIA_Garond_MadErz_Gold_01_01");	//Хорошо! Вот, возьми тысячу золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Garond_MadErz_Gold_01_02");	//Надеюсь, ты потратишь эти деньги с умом.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_mana()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Mana_01_00");	//Я возьму зелье магической энергии.
	AI_Output(self,other,"DIA_Garond_MadErz_Mana_01_01");	//Хорошо! Вот, возьми его.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Mana_01_02");	//Надеюсь, он пригодится тебе.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_str()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Str_01_00");	//Я хочу взять зелье силы.
	AI_Output(self,other,"DIA_Garond_MadErz_Str_01_01");	//Хорошо! Вот, возьми его.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Str_01_02");	//Надеюсь, он пригодится тебе.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_dex()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Dex_01_00");	//Я выбираю зелье ловкости.
	AI_Output(self,other,"DIA_Garond_MadErz_Dex_01_01");	//Хорошо! Вот, возьми его.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Dex_01_02");	//Надеюсь, он пригодится тебе.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_health()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Health_01_00");	//Дай мне эликсир жизни.
	AI_Output(self,other,"DIA_Garond_MadErz_Health_01_01");	//Хорошо! Вот, возьми его.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Health_01_02");	//Надеюсь, он пригодится тебе.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};


instance DIA_GAROND_CAPTURED(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_captured_condition;
	information = dia_garond_captured_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_garond_captured_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Garond_Captured_01_00");	//Это ты?! Как тебе удалось пробраться сюда?
	AI_Output(other,self,"DIA_Garond_Captured_01_94");	//Это долгая история! Ты лучше скажи мне - что произошло?
	AI_Output(self,other,"DIA_Garond_Captured_01_05");	//Не знаю! Последнее, что я помню - это сильный удар по голове, после чего я потерял сознание.
	AI_Output(self,other,"DIA_Garond_Captured_01_06");	//А потом очнулся в этой камере вместе с остальными.
	KNOWABOUTGAROND = TRUE;

	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Думаю, что лорд Хаген обрадовался бы, узнав, что Гаронд и часть его людей живы. Теперь я просто обязан помочь им выбраться из этой ситуации.");
	};
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Я проник в крепость, захваченную орками. Вначале я не поверил своим глазам, когда увидел, что Гаронд и несколько его людей живы. Орки почему-то не стали их убивать, а просто взяли в плен. Надо подумать, как их вытащить.");
	};
	if(MIS_STURMCASTLE == LOG_Running)
	{
		B_LogEntry(TOPIC_STURMCASTLE,"Вначале я не поверил своим глазам, когда увидел, что Гаронд и несколько его людей живы. Орки почему-то не стали их убивать, а просто взяли в плен. Думаю, что самый простой способ вызволить их отсюда - это очистить крепость от орков.");
	};
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};

instance DIA_GAROND_ABOUTSLAVE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_GAROND_ABOUTSLAVE_condition;
	information = DIA_GAROND_ABOUTSLAVE_info;
	permanent = FALSE;
	description = "А где остальные заключенные?";
};

func int DIA_GAROND_ABOUTSLAVE_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GAROND_ABOUTSLAVE_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_GAROND_ABOUTSLAVE_01_00");	//А где остальные заключенные?
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_01");	//Орки куда-то их угнали. Но я точно не знаю, куда!
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_02");	//Возможно, вкалывать на какой-нибудь орочий рудник.
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_03");	//Или, что хуже, просто на бойню.
};

instance DIA_GAROND_FINDAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_findaway_condition;
	information = dia_garond_findaway_info;
	permanent = FALSE;
	description = "Вам надо как-то выбираться отсюда!";
};

func int dia_garond_findaway_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_findaway_info()
{
	AI_Output(other,self,"DIA_Garond_FindAway_01_00");	//Вам надо выбираться отсюда!
	AI_Output(self,other,"DIA_Garond_FindAway_01_01");	//И как ты предлагаешь нам этот сделать?!
	AI_Output(self,other,"DIA_Garond_FindAway_01_02");	//Крепость пала, и в ней наверняка сейчас полно орков! Мы даже не успеем добежать до главных ворот, как будем уже мертвы.
	AI_Output(other,self,"DIA_Garond_FindAway_01_04");	//Я что-нибудь придумаю.
	AI_Output(self,other,"DIA_Garond_FindAway_01_05");	//Очень надеюсь на это. Но по моему мнению, выход у нас только один...
	AI_Output(self,other,"DIA_Garond_FindAway_01_09");	//Если ты перебьешь здесь всех орков и освободишь эту крепость!
	AI_Output(self,other,"DIA_Garond_FindAway_01_10");	//Однако не думаю, что даже тебе такое под силу.
};


instance DIA_GAROND_PALADINFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_paladinfree_condition;
	information = dia_garond_paladinfree_info;
	permanent = FALSE;
	description = "Идем! Теперь вы все свободны.";
};


func int dia_garond_paladinfree_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && ((CANFREEPALADIN == TRUE) || (CASTLEISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_garond_paladinfree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Garond_PaladinFree_01_00");	//Идем! Теперь вы все свободны.
	AI_Output(self,other,"DIA_Garond_PaladinFree_01_01");	//То есть? (непонимающе) Что ты имеешь в виду?
	if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_02");	//Замок снова в наших руках!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_03");	//Правда?! Неужели вы смогли выбить орков из этой крепости?
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_05");	//Невероятно! Поверить не могу!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_09");	//Только выпусти меня и моих парней из этих чертовых клеток.
		PALADINCASTELFREE = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Я освободил Гаронда и его людей из плена. Теперь надо как можно скорее убраться из этой долины.");
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	}
	else if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_12");	//Нам нужно выбираться отсюда!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_13");	//Ха! И куда же мы, по-твоему, пойдем? Тут ведь кругом одни орки!
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_17");	//Я смог договориться с их предводителем, чтобы вас выпустили на свободу.
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_18");	//Так что если не хотите остаться здесь навсегда - пошевеливайтесь. А то орки могут и передумать!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_19");	//Ну что же, ладно - как скажешь.
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_20");	//Только для начала выпусти меня и моих парней из этих чертовых клеток.
		PALADINCASTELFREE = TRUE;
		SAFEFLAGPALADIN = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Я освободил Гаронда и его людей из плена. Теперь надо как можно скорее убраться из этой долины.");
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	};
};


instance DIA_GAROND_WHATWAIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwait_condition;
	information = dia_garond_whatwait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && ((OLDCAMDGATEOPEN_01 == FALSE) || (OLDCAMDGATEOPEN_02 == FALSE) || (OLDCAMDGATEOPEN_03 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_garond_whatwait_info()
{
	AI_Output(self,other,"DIA_Garond_WhatWait_01_00");	//Ну и долго нам еще тут сидеть? Чего ты ждешь?!
	AI_Output(self,other,"DIA_Garond_WhatWait_01_01");	//Давай, выпусти нас отсюда!
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PEOPLEFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peoplefree_condition;
	information = dia_garond_peoplefree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peoplefree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_01 == TRUE) && (OLDCAMDGATEOPEN_02 == TRUE) && (OLDCAMDGATEOPEN_03 == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peoplefree_info()
{
	AI_Output(self,other,"DIA_Garond_PeopleFree_01_00");	//Отлично! Так-то намного лучше.
	AI_Output(other,self,"DIA_Garond_PeopleFree_01_01");	//Теперь идем.
	if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_02");	//Нужно как можно скорее добраться до отряда паладинов, что стоит при выходе из этой долины.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_03");	//Хорошо. Тогда не будем терять времени - веди нас.
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree,"Идем!",dia_garond_peoplefree_go);
	}
	else if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_05");	//Нам необходимо как можно скорее убраться из этой крепости!
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_06");	//Но почему?
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_07");	//В скором времени орки вновь пришлют сюда новые подкрепления, и тогда нам всем придется очень несладко.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_14");	//Хммм...(задумчиво) Ну что же, ладно.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_15");	//Тогда не будем терять времени - веди нас. Мы уходим отсюда!
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree,"Идем!",dia_garond_peoplefree_go);
	};
};

func void dia_garond_peoplefree_go()
{
	AI_Output(other,self,"DIA_Garond_PeopleFree_Go_01_01");	//Идем!
	AI_StopProcessInfos(self);
	b_paladinawayone();
};


instance DIA_GAROND_PEOPLEAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peopleaway_condition;
	information = dia_garond_peopleaway_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peopleaway_condition()
{
	if((ALLAWAYFROMCASTLE == TRUE) && (GARONDARRIVESEXIT == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peopleaway_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Garond_PeopleAway_01_00");	//Отлично, мы на месте! Думаю, что здесь мы теперь в полной безопасности.
	AI_Output(other,self,"DIA_Garond_PeopleAway_01_03");	//Но нам все равно нужно двигаться дальше. Сейчас дорога каждая минута!
	AI_Output(self,other,"DIA_Garond_PeopleAway_01_04");	//Согласен. Поэтому иди через проход, а мы сразу же после этого последуем за тобой.
	AI_Output(other,self,"DIA_Garond_PeopleAway_01_05");	//Хорошо. Встретимся на той стороне.
	ALLAWAYFROMPLACE = TRUE;
	AI_StopProcessInfos(self);
	b_paladinawaytwo();
};


instance DIA_GAROND_WHATWAITAGAIN(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwaitagain_condition;
	information = dia_garond_whatwaitagain_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwaitagain_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ALLAWAYFROMPLACE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_whatwaitagain_info()
{
	AI_Output(self,other,"DIA_Garond_WhatWaitAgain_01_00");	//Давай, ступай! Мы последуем за тобой.
	AI_StopProcessInfos(self);
};

instance DIA_Garond_OrcTraitor(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_OrcTraitor_Condition;
	information = DIA_Garond_OrcTraitor_Info;
	permanent = FALSE;
	description = "У меня тут кое-что для тебя есть.";
};

func int DIA_Garond_OrcTraitor_Condition()
{
	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_OrcTraitor_Info()
{
	var int RanGonezPlace;

	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_00");	//У меня тут кое-что есть для тебя.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_01");	//Надеюсь, это что-то действительно важное, а не какая-нибудь очередная ерунда! 
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_02");	//Вот, взгляни.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_03");	//И что это?
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_04");	//Это послание военачальника орков к одному из вождей их горных племен. Ну как, тебе уже интересно?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_05");	//(с интересом) А ну-ка, дай взглянуть...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_06");	//Но это послание написано на орочьем языке!
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_07");	//Конечно, его же писал орк! Тебе найти переводчика?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_08");	//Не надо, я сам прочту...(раздраженно) За долгие годы войны с этими тварями я стал немного понимать их язык.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_09");	//(читая) Глазам своим поверить не могу! То, что ты принес - действительно крайне важные сведения!
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_10");	//И что там написано?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_11");	//Похоже, в скором времени орки планируют начать штурм замка, и собирают для этого дополнительные силы.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_12");	//Они хотят застигнуть нас врасплох, атаковав сразу с нескольких сторон. Но, похоже, теперь у них уже ничего не получится.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_13");	//Я распоряжусь удвоить охрану стен и установить дополнительные оборонительные заслоны.
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_14");	//А у тебя хватит на это людей?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_15");	//Пока хватит. Хотя мы и находимся в нелегкой ситуации, но обладаем достаточным людским ресурсом, чтобы держать оборону сразу с нескольких сторон.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_16");	//Конечно, без дополнительных укреплений это было бы куда сложней.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_17");	//Но у нас теперь есть достаточно времени, чтобы хорошо подготовиться к штурму.
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_18");	//Я рад, что это информация оказалась полезной для тебя.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_19");	//Твою помощь в этом деле невозможно переоценить, и я благодарю тебя от имени всех паладинов, что находятся в этой крепости!
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_20");	//Вот, прими это в качестве награды...
 	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_21");	//Думаю, ты и сам знаешь, что наши запасы крайне скудны. 
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_22");	//Но я просто не могу не отблагодарить тебя за то, что ты сделал для нас.
	OrcTraitor = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Вместо того, чтобы передать сообщение Ур-Карраса вождю клана Высокой Скалы, я отнес его в крепость людям. Как выяснилось из письма, орки готовятся к новому штурму и для этого ищут помощи у других кланов. Как и предполагалось, эта информация оказалась весьма важной для паладинов! Однако теперь, после своего предательства, думаю мне не стоит возвращаться в город орков. Наверняка мое присутствие в крепости не осталось для них незамеченным, и они пошлют кого-нибудь к Ур-Каррасу, чтобы сообщить о моей измене. Если только я не успею перехватить гонца до того, как он расскажет все Ур-Каррасу. Надо поспешить, поскольку наверняка времени у меня на это осталось крайне мало...");

	RanGonezPlace = Hlp_Random(100);
	DayGonezStart = Wld_GetDay();

	if(RanGonezPlace >= 60)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_01");
	}
	else if(RanGonezPlace >= 30)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_02");
	}
	else if(RanGonezPlace >= 0)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_03");
	};
};

instance DIA_Garond_PICKPOCKET(C_Info)
{
	npc = PAL_250_Garond;
	nr = 900;
	condition = DIA_Garond_pickpocket_condition;
	information = DIA_Garond_pickpocket_info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_Garond_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_pickpocket_info()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
	Info_AddChoice(DIA_Garond_pickpocket,Dialog_Back,DIA_Garond_pickpocket_back);
	Info_AddChoice(DIA_Garond_pickpocket,DIALOG_PICKPOCKET,DIA_Garond_pickpocket_doit);
};

func void DIA_Garond_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 150)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Garond,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garond_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Garond_pickpocket_back()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
};
