
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EDDA_NO_TALK(C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = dia_edda_no_talk_condition;
	information = dia_edda_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_edda_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_edda_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//Co to tady vaříš?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//Rybí polívku. Není to žádná delikatesa, ale alespoň je horká.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//Můžeš ochutnat jeden talíř, jestli máš zájem.
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 5;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o městě?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//Co mi můžeš říct o městě?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//Většina občanů tohodle města se bojí zlodějů. Proto není zrovna dobrej nápad chodit do cizích domů.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//Ale jestli hledáš místo, kde bys přečkal noc, můžeš se vyspat v mé chatrči. Je tam jedna postel navíc, která může bejt tvoje.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//Nemáš strach ze zlodějů?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//Jedinou cennou věc, kterou jsem kdy vlastnila, mi už stejně ukradli.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//Někdo mi ukradl Innosovu sošku!
	Edda_Schlafplatz = TRUE;
	MIS_EddaStatue = LOG_Running;
	Log_CreateTopic(TOPIC_EddaStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Running);
	B_LogEntry(TOPIC_EddaStatue,"Nějaký zloděj ukradl Eddě Innosovu sošku. Měli bychom pomoct té chudačce získat ji zpět.");
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
	Npc_ExchangeRoutine(VLK_471_Edda,"friend");
};

instance DIA_Edda_Kochen(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Kochen_Condition;
	information = DIA_Edda_Kochen_Info;
	permanent = FALSE;
	description = "Můžeš mi uvařit trochu polévky?";
};

func int DIA_Edda_Kochen_Condition()
{
	return TRUE;
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//Můžeš mi uvařit trochu polévky?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//Uvařím každému. Tobě taky, jestli chceš. Jediný, co musíš udělat, je přinýst mi rybu.
};

var int EddaTeachCook;

instance DIA_Edda_TeachCook(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCook_Condition;
	information = DIA_Edda_TeachCook_Info;
	permanent = FALSE;
	description = "Naučila bys mě vařit polévku?";
};

func int DIA_Edda_TeachCook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCook_Info()
{
	AI_Output(other,self,"DIA_Edda_TeachCook_01_00");	//Naučila bys mě vařit polévku?
	AI_Output(self,other,"DIA_Edda_TeachCook_01_01");	//Hmmm... (přemýšlí) Vzhledem k tomu to bude těžší! Ale jsem připravena vám pomoci v případě několika zlatých mincí.
	EddaTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Edda mě může naučit, jak vařit polévky.");
};

instance DIA_Edda_TeachCookDone(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_TeachCookDone_Condition;
	information = DIA_Edda_TeachCookDone_Info;
	permanent = TRUE;
	description = "Nauč mě jak uvařit polívku.";
};

func int DIA_Edda_TeachCookDone_Condition()
{
	if((EddaTeachCook == TRUE) && ((Edda_Soup_01 == FALSE) || (Edda_Soup_02 == FALSE) || (Edda_Soup_03 == FALSE) || (Edda_Soup_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Edda_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_01_00");	//Nauč mě jak uvařit polívku.
	AI_Output(self,other,"DIA_Edda_TeachCookDone_01_01");	//Dobře! Co chceš vařit?
	Info_ClearChoices(DIA_Edda_TeachCookDone);
	Info_AddChoice(DIA_Edda_TeachCookDone,Dialog_Back,DIA_Edda_TeachCookDone_back);

	if(Edda_Soup_00 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Tuřínová polévka (cena: 25 zlatých)",DIA_Edda_TeachCookDone_Beet);
	};
	if(Edda_Soup_01 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Rybí polévka (cena: 50 zlatých)",DIA_Edda_TeachCookDone_fish);
	};
	if(Edda_Soup_02 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Želví polévka (cena: 200 zlatých)",DIA_Edda_TeachCookDone_shildkroetesoup);
	};
	if(Edda_Soup_03 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Houbová polévka (cena: 100 zlatých)",DIA_Edda_TeachCookDone_pilzsuppe);
	};
	if(Edda_Soup_04 == FALSE)
	{
		Info_AddChoice(DIA_Edda_TeachCookDone,"Masová polévka (cena: 150 zlatých)",DIA_Edda_TeachCookDone_Meet);
	};
};

func void DIA_Edda_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Edda_TeachCookDone);
};

func void DIA_Edda_TeachCookDone_Beet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 25)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,25);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_02");	//Vaříš jí deset minut - a vaše polévka je hotová.
		AI_Print("Naučeno: Vaření - 'Tuřínová polévka'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro TUŘÍNOVOU POLÉVKU: tuřín.");
		Snd_Play("LevelUP");
		Edda_Soup_00 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_04");	//Je mi líto. Mám volno.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_05");	//Zaprvé, přines zlato.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_fish()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_fish_01_00");	//Rybí polévka

	if(Npc_HasItems(hero,ItMi_Gold) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_01");	//Je to jednoduché. (zasměje se) Vezmi rybu, očisti ji, šup s ní na váhu a pak do hrnce s vodou.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_02");	//Vaříš jí asi deset minut, a tvoje polévka je hotová!
		AI_Print("Naučeno: Vaření - 'Rybí polévka'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro RYBÍ POLÉVKU: ryba.");
		Snd_Play("LevelUP");
		Edda_Soup_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_04");	//Je mi to líto. Ale mám volno, už nebudu nic dělat.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_fish_01_05");	//Zaprvé, přines zlato.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_Meet()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 150)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,150);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_01");	//Dobrá volba! Pokud ji uvaříš správně, bude velmi chutná!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_03");	//Myslím, že z jednoho kusu by to mělo stačit. Hodíš do hrnce a vaříš.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_04");	//S očima ani zamrkat nestihneš, už je polévka hotová. Jasný?
		AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_05");	//Jistě.
		AI_Print("Naučeno: Vaření - 'Masová polévka'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro MASOVOU POLÉVKU: syrové maso.");
		Snd_Play("LevelUP");
		Edda_Soup_04 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_06");	//Promiň. Ale zadarmo to nebudu dělat.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_07");	//Za prvý zlato.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

func void DIA_Edda_TeachCookDone_shildkroetesoup()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_00");	//Želví polívka.

	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,200);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_01");	//Dobrá volba! Pokud ji uvaříš správně, bude to doopravdy velmi chutné!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_02");	//Ale nejprve budeš muset najít želví maso.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_03");	//Myslím, že z jednoho kusu by to mělo stačit. Hodíš do hrnce a vaříš.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_04");	//S očima ani zamrkat nestihneš, už je polévka hotová. Zapamatuješ si to?
		AI_Output(other,self,"DIA_Edda_TeachCookDone_shildkroetesoup_01_05");	//Jasně
		AI_Print("Naučeno: Vaření - 'Želví polévka'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro ŽELVÍ POLÉVKU: želví maso.");
		Snd_Play("LevelUP");
		Edda_Soup_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_06");	//Je mi to líto. Ale mám volno, už nebudu nic dělat.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_shildkroetesoup_01_07");	//Zaprvé, přines zlato.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};


func void DIA_Edda_TeachCookDone_pilzsuppe()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_pilzsuppe_01_00");	//Houbová polívka.

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,100);
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_01");	//Vše je jednoduché. Budete potřebovat pouze jednu houbu!
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_03");	//Hoď to do hrnce, tvojee polévka se vaří jen pár minut a bude připravena.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_04");	//To je všechno.
		AI_Print("Naučeno: Vaření - 'Houbová polévka'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro HOUBOVOU POLÉVKU: otrokův chléb.");
		Snd_Play("LevelUP");
		Edda_Soup_03 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_05");	//Je mi to líto. Ale mám volno, už nebudu nic dělat.
		AI_Output(self,other,"DIA_Edda_TeachCookDone_pilzsuppe_01_06");	//Zaprvé, přines zlato.
		Info_ClearChoices(DIA_Edda_TeachCookDone);
	};
};

instance DIA_Edda_Kochen_Compot(C_Info)
{
	npc = VLK_471_Edda;
	nr = 1;
	condition = DIA_Edda_Kochen_Compot_Condition;
	information = DIA_Edda_Kochen_Compot_Info;
	permanent = FALSE;
	description = "To už nic jiného nevaříš?";
};

func int DIA_Edda_Kochen_Compot_Condition()
{
	if(EddaTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Edda_Kochen_Compot_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_00");	//To už nic jiného nevaříš?
	AI_Output(self,other,"DIA_Edda_Kochen_Compot_01_01");	//O co přesně máš zájem?
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_02");	//No, například, ovoce nebo zeleninu.
	AI_Output(self,other,"DIA_Edda_Kochen_Compot_01_03");	//Bohužel nevím jak na to. Takže radši hledej někoho jiného.
	AI_Output(other,self,"DIA_Edda_Kochen_Compot_01_04");	//Jasně.
};

instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "Můžeš mi uvařit trochu polévky?";
};

func int DIA_Edda_Suppe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void dia_edda_suppe_back()
{
	Info_ClearChoices(DIA_Edda_Suppe);
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//Můžeš mi uvařit trochu polévky?

 	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(15,0,20,0))
	{
		if(Wld_GetDay() == 0)
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//Od zítřka můžeš kdykoli přijít a dostat svou polívku.
		}
		else if(Edda_Day != Wld_GetDay())
		{
			Info_ClearChoices(DIA_Edda_Suppe);
			Info_AddChoice(DIA_Edda_Suppe,Dialog_Back,dia_edda_suppe_back);
			Info_AddChoice(DIA_Edda_Suppe,"Rybí polévka (vyžaduje: 2 ryby)",DIA_Edda_Suppe_Fish);

			if(MIS_EddaStatue == LOG_Success)
			{
				Info_AddChoice(DIA_Edda_Suppe,"Želví polévka (vyžaduje: 2 kusy želvýho masa)",DIA_Edda_Suppe_Turtle);
				Info_AddChoice(DIA_Edda_Suppe,"Houbová polévka (vyžaduje: 2 houby)",DIA_Edda_Suppe_Mushroom); 
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//Ne, dneska ne! Vrať se zítra.
		};
	}
 	else if(Wld_IsTime(13,0,15,0))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_11");	//Nyní je noc! Vrať se zítra.
	};	
};

func void DIA_Edda_Suppe_Fish()
{
	if(B_GiveInvItems(other,self,ItFo_Fish,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//Není nic jednoduššího! Tady, vezmi si tohle.
		B_GiveInvItems(self,other,ItFo_FishSoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//Přines mi rybu a já ti uvařím chutnou polívku.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Turtle()
{
	if(B_GiveInvItems(other,self,itfoschildkroeteraw,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Turtle_17_01");	//Není nic jednoduššího! Tady, vezmi si tohle.
		B_GiveInvItems(self,other,itfo_schildkroetesoup,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Turtle_17_04");	//Přines mi dva kusy želvího masa, a já ti uvařím delikatesu.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Edda_Suppe_Mushroom()
{
	if(B_GiveInvItems(other,self,ItPl_Mushroom_02,2))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Mushroom_17_01");	//Není nic jednoduššího! Tady, vezmi si tohle.
		B_GiveInvItems(self,other,itfo_pilzsuppe,1);
		Info_ClearChoices(DIA_Edda_Suppe);
		Edda_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_Mushroom_17_04");	//Přines mi dvě houby, a udělám ti chutnou polívku.
		Info_ClearChoices(DIA_Edda_Suppe);
		AI_StopProcessInfos(self);
	};
};

instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "Hele, mám pro tebe Innosovu sošku.";
};

func int DIA_Edda_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Stadt) && (Npc_HasItems(other,ItMi_InnosStatue) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	B_GivePlayerXP(XP_Edda_Statue);
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//Hele, mám pro tebe Innosovu sošku.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//Ó - díky mockrát. Ať nad tebou Innos drží své ochranné světlo.
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//Jo, klidně.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	MIS_EddaStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_EddaStatue,LOG_Success);
	B_LogEntry(TOPIC_EddaStatue,"Její sošku by dokázalo ukrást i malé děcko, možná.");
};

instance DIA_EDDA_UHA_SBORNAY(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_condition;
	information = DIA_EDDA_UHA_SBORNAY_info;
	permanent = FALSE;
	description = "Dokážeš uvařit jistou zvláštní rybí polévku?";
};

func int DIA_EDDA_UHA_SBORNAY_condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo) && (MIS_FARIM_QUEST >= 1))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_00");	//Dokážeš uvařit jistou zvláštní rybí polévku?
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_01");	//Myslím, že vím, o čem mluvíš. Ano, ale je poměrně složitá na přípravu.
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_02");	//Jestli mi dodáš všechny ingredience - tak ti tu polévku uvařím.
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_03");	//Co k tomu potřebuješ?
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_04");	//Hmm... (zamyšleně) Zapamatuj si! Pro začátek budeme potřebovat ryby, asi tak deset.
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_05");	//Dále budu potřebovat sýr, pět rostlin modrého bezu, červený pepř a co je nejdůležitější - rum!
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_06");	//Rum?!
	AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_01_07");	//Ano, pčesně tak! A žádnou levnou kořalku, jestli chceš abych uvařila pořádnou polévku a ne nějaké pomeje.
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_01_08");	//Dobře, všemu jsem rozuměl.
	EddaCanMakeUhaSborka = TRUE;
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Edda může uvařit Farimovi jeho speciální polévku, ale potřebuje ty správné ingredience. Deset kusů ryb, sýr, červený pepř, pět rostlin modrého bezu a rum.");
};


instance DIA_EDDA_UHA_SBORNAY_Done(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_EDDA_UHA_SBORNAY_Done_condition;
	information = DIA_EDDA_UHA_SBORNAY_Done_info;
	permanent = TRUE;
	description = "Přinesl jsem vše co jsi potřebovala.";
};

func int DIA_EDDA_UHA_SBORNAY_Done_condition()
{
	if((EddaCanMakeUhaSborka == TRUE) && (EddaCookFarim == FALSE) && (Npc_HasItems(other,ItFo_Addon_Pfeffer_01) >= 1) && (Npc_HasItems(other,ItFo_Fish) >= 10) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItPl_Blueplant) >= 5) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EDDA_UHA_SBORNAY_Done_info()
{
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_00");	//Přinesl jsem vše co jsi potřebovala.
	AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_01");	//Uvaříš mi teď tu polévku?

 	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(15,0,20,0))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_02");	//Samozřejmě, jak jsem slíbila, nech to tady.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Addon_Pfeffer_01,1);
		Npc_RemoveInvItems(other,ItFo_Fish,10);
		Npc_RemoveInvItems(other,ItFo_Cheese,1);
		Npc_RemoveInvItems(other,ItPl_Blueplant,5);
		Npc_RemoveInvItems(other,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_03");	//Výborně! A rum zde, můj drahý.
		B_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_04");	//No, tak... Teď můžu připravit skutečnou týmovou polévku!
		AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_05");	//Hej! Vypila jsi celou láhev rumu!
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_06");	//A co jsi myslel, že ho budu žmoulat v rukách?
		AI_Output(other,self,"DIA_EDDA_UHA_SBORNAY_Done_01_07");	//Ale co polévka? Říkala jsi, že ho potřebuješ na přípravu polévky!
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_08");	//No ano to je pravda! A taky jsem ho použila, jak jsem zamýšlela.
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_09");	//No, zatímco ses tady staral o rum, tvoje polévka se už uvařila.
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_10");	//Tady máš! Doufám, že splní tvé očekávání.
		B_GiveInvItems(self,other,itfo_schildkroetesoup_sborka,1);
		B_LogEntry(TOPIC_ADDON_FARIMFISH,"Edda mě uvařila speciální rybí polévku.");
		EddaCookFarim = TRUE;
	}
 	else if(Wld_IsTime(13,0,15,0))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_EDDA_UHA_SBORNAY_Done_01_11");	///Nyní už je pozdě! Přijď zítra.
		AI_StopProcessInfos(self);
	};
};

instance DIA_EDDA_ASKFORDT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = dia_edda_askfordt_condition;
	information = dia_edda_askfordt_info;
	permanent = FALSE;
	description = "Nechtěla bys pro mě pracovat?";
};

func int dia_edda_askfordt_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_EddaStatue == LOG_Success) && (EddaNeed == TRUE))
	{
		return TRUE;
	};
};

func void dia_edda_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Edda_AskforDT_15_00");	//Nechtěla bys pro mě pracovat?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_01");	//Co tím myslíš?!
	AI_Output(other,self,"DIA_Edda_AskforDT_17_02");	//Potřebuju někoho kdo rozumí vaření. V mém táboře je parta hladových kluků kterým nikdo nevaří.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_03");	//Tak jsem si myslel že bys mi mohla pomoci.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_04");	//Ptáš se na post kuchaře v táboře? Hmmm...
	AI_Output(self,other,"DIA_Edda_AskforDT_17_05");	//I když proč ne. Koneckonců život v téhle části města je téměř nesnesitelný. A byla bych ráda kdyby nastala změna na něco jiného.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_06");	//Takže souhlasíš?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_07");	//Jistě, proč ne.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_08");	//Ale varuji tě, jestli na mě jeden z tvých kluků začne šplhat se svými nesmysli, tak za sebe nenesu zodpovědnost!
	AI_Output(other,self,"DIA_Edda_AskforDT_17_09");	//To se zas neboj. Všechno mám pod kontrolou.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_10");	//Velmi doufám že ano. Takže, kde že se ten tábor nachází?
	AI_Output(other,self,"DIA_Edda_AskforDT_17_11");	//Je to nedaleko Onarovy farmy, ve staré věži. Nemůžeš ji přehlédnout!
	AI_Output(self,other,"DIA_Edda_AskforDT_17_12");	//Dobře, tak si půjdu posbírat svoje věci.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_13");	//Počkej! Ještě musíme probrat tvůj plat.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_14");	//Nepotřebuju nic jiného než střechu nad hlavou a možnost dělat to, co miluju nejvíc na světě. 
	AI_Output(other,self,"DIA_Edda_AskforDT_17_15");	//To je co?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_16");	//Jak CO?! Přece vaření.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_17");	//Hmmm... Nechtěla bys doprovodit do tábora? Cesta je daleko a plná nebezpečí.
	AI_Output(self,other,"DIA_Edda_AskforDT_17_18");	//Neboj se o mě. Zvládnu to sama.
	AI_Output(other,self,"DIA_Edda_AskforDT_17_19");	//No, pokud ano... Uvidíme se v táboře, heslo pro vstup zní 'dračí poklad'. Pamatuješ si to?
	AI_Output(self,other,"DIA_Edda_AskforDT_17_20");	//Samozřejmě. Uvidíme se tam!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Edda od teď bude kuchařem v mém táboře. Její hojné a delikátní polévky budou jistě chlapcům chutnat!");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EDDARECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_EDDA_INTOWER(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_condition;
	information = dia_edda_intower_info;
	permanent = TRUE;
	description = "Vše jde dobře?";
};

func int dia_edda_intower_condition()
{
	if((EDDARECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_edda_intower_info()
{
	AI_Output(other,self,"DIA_Edda_InTower_OrcKap_15_00");	//Vše jde dobře?
	AI_Output(self,other,"DIA_Edda_InTower_OrcKap_01_01");	//Jak můžeš vidět! Žádné problémy.
};

instance DIA_EDDA_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_471_Edda;
	nr = 22;
	condition = dia_edda_intower_orckap_condition;
	information = dia_edda_intower_orckap_info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int dia_edda_intower_orckap_condition()
{
	if((EDDARECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_edda_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Edda_InTower_OrcKap_15_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Edda_InTower_OrcKap_01_01");	//Jo, jen díky tobě! Jestli že se mi to zdá... nech mě žít...
};