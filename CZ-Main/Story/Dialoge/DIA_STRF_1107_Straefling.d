/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_strf_1107_fleenow_info - opraven odkaz na následující dialog (dia_strf_1107_fleenow_djg_lcr)
func void dia_strf_1107_fleenow_info - přidána další možnost (ITAR_PAL_H_V1)
(2x) opraveno ID předmětu (ItMw_Schwert -> ItMw_Schwert3)

*/




instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Ruce pryč! Na moje hrnce nikdo nešáhne!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Jsem tu zodpovědný za jídlo. Nikoho nenechám nic ukrást.
};

instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "Kdo tě jmenoval kuchařem?";
};

func int DIA_STRF_1107_COOK_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kdo tě jmenoval kuchařem?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Lord Garond. Už dříve jsem býval kuchařem v hostinci.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//Proč je z tebe trestanec?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//No, jednou došlo k nepochopení mezi jedním návštěvníkem a mnou...
};

var int ClifTeachCook;

instance DIA_STRF_1107_WHATCOOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_WHATCOOK_Condition;
	information = DIA_STRF_1107_WHATCOOK_Info;
	description = "Co vaříš?";
};

func int DIA_STRF_1107_WHATCOOK_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_1107_COOK) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_WHATCOOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_00");	//Co vaříš?
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_01");	//Co mi přinesou, to uvařím. Nemusím nic rozhodovat.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_02");	//Ačkoliv moje specialita jsou kompoty.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_03");	//(pyšně) Ty dělám božské. Nechť mi Innos odpustí.
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_04");	//Můžeš mne naučit jak vařit?
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_05");	//Tebe? (pochybovačně) Víš něco o vaření?
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_06");	//Nic moc.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_07");	//Hm... ale dobrá...
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_08");	//Ale nebude tozadarmo.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_09");	//Za každý recept si vezmu... padesát kousků rudy.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_10");	//Zlato se tady nemůže rovnat hodnotě rudy.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_11");	//Snad mi rozumíš.
	ClifTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Cliff mě může naučit, jak vařit kompoty. Ale jen za malý příspěvek ve formě magické rudy!");
};

instance DIA_STRF_1107_TeachCookDone(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 6;
	condition = DIA_STRF_1107_TeachCookDone_Condition;
	information = DIA_STRF_1107_TeachCookDone_Info;
	permanent = TRUE;
	description = "Nauč mě, jak vyrábět kompoty.";
};

func int DIA_STRF_1107_TeachCookDone_Condition()
{
	if((ClifTeachCook == TRUE) && ((Rezept_Compote_01 == FALSE) || (Rezept_Compote_02 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_TeachCookDone_01_00");	//Nauč mě, jak vyrábět kompoty.
	AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_01_01");	//Dobře! Který.
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	Info_AddChoice(DIA_STRF_1107_TeachCookDone,Dialog_Back,DIA_STRF_1107_TeachCookDone_back);

	if(Rezept_Compote_01 == FALSE)
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone,"Kompot z lučních bobulí (cena: 50 kusů magické rudy)",DIA_STRF_1107_TeachCookDone_compote1);
	};
	if(Rezept_Compote_02 == FALSE)
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone,"Kompot z lesních bobulí (cena: 100 kusů magické rudy)",DIA_STRF_1107_TeachCookDone_compote2);
	};
};

func void DIA_STRF_1107_TeachCookDone_back()
{
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
};

func void DIA_STRF_1107_TeachCookDone_compote1()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_compote1_01_00");	//Kompot z lučních bobulí.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_01");	//Nejdůležitější je přesně vědět, kolik bobulí je potřeba pro jednu porci.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_02");	//Bez toho nemůžete připravit kvalitní kompot. V opačném případě bude příliš tekutý nebo jako starý džem.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_03");	//Vezmi 20 plodů a vhoď je do kotle. Pomíchej a přidej léčivou bylinu.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_04");	//Jak začne bublat je hotovo.
		AI_Print("Naučeno: Vaření - 'Kompot z lučních bobulí'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro KOMPOT Z LUČNÍCH BOBULÍ: 20x luční bobule a léčivá rostlina.");
		Snd_Play("LevelUP");
		Rezept_Compote_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_05");	//A kde je ruda?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

func void DIA_STRF_1107_TeachCookDone_compote2()
{
	AI_Output(other,self,"DIA_STRF_1107_TeachCookDone_compote2_01_00");	//Kompot z lesních bobulí.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_01");	//Nejdůležitější je přesně vědět, kolik bobulí je potřeba pro jednu porci.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_02");	//Jinak se srazí.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_03");	//V okamžiku kdy chytne barvu, vhoď léčivý kořen.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_04");	//Poté zamíchej pětsetosmkrát doleva a jednou dprava.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_05");	//Jakmile kompot vyskočí z kotlíku, je hotovo.
		AI_Print("Naučeno: Vaření - 'Kompot z lesních bobulí'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro KOMPOT Z LESNÍCH BOBULÍ: 30x lesní bobule a léčivá bylina.");
		Snd_Play("LevelUP");
		Rezept_Compote_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_06");	//A kde je ruda?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

var int ClifCookMe;
var int FirstKliffCookOne;

instance DIA_STRF_1107_COOKME(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKME_Condition;
	information = DIA_STRF_1107_COOKME_Info;
	permanent = FALSE;
	description = "Můžeš mi připravit kompot?";
};

func int DIA_STRF_1107_COOKME_Condition()
{
	if(ClifTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKME_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKME_01_01");	//Můžeš mi připravit kompot?
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_02");	//Samozřejmě. Pokud přineseš všechny potřebné ingredience.
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_03");	//Ale pořád budu chtít rudu. Pět kousků.
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_04");	//Jinak nehodlám ztrácet čas.
	ClifCookMe = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Cliff mi může připravit kompot, pokud mu donesu přísady a pět kousků magické rudy.");
};

instance DIA_STRF_1107_COOKMEDONE(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMEDONE_Condition;
	information = DIA_STRF_1107_COOKMEDONE_Info;
	permanent = TRUE;
	description = "Připrav kompot!";
};

func int DIA_STRF_1107_COOKMEDONE_Condition()
{
	if((ClifCookMe == TRUE) && (DayCliffCookFor == FALSE) && (DayCliffCookPortionFor == FALSE) && (DayCliffCook == FALSE) && (DayCliffCookPortion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMEDONE_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_01_01");	//Připrav kompot!
	AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_01_02");	//Který?
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"Kompot z lučních bobulí.",DIA_STRF_1107_COOKMEDONE_Planeberry);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"Kompot z lesních bobulí.",DIA_STRF_1107_COOKMEDONE_Forestberry);
};

func void DIA_STRF_1107_COOKMEDONE_back()
{
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_01");	//Kompot z lučních bobulí.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_02");	//Dobře. Ukaž přísady...
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_03");	//Takže... (odhaduje) ano to bude stačit.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_04");	//No, kolik porcí chceš?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"1 porci (20 lučních bobulí, léčivý kořen, 5 kusů rudy)",DIA_STRF_1107_COOKMEDONE_Planeberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"5 porcí (100 lučních bobulí, 5 léčivých kořenů, 25 kusů rudy)",DIA_STRF_1107_COOKMEDONE_Planeberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"10 porcí (200 lučních bobulí, 10 léčivých kořenů, 50 kusů rudy)",DIA_STRF_1107_COOKMEDONE_Planeberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"20 porcí (400 lučních bobulí, 20 léčivých kořenů, 100 kusů rudy)",DIA_STRF_1107_COOKMEDONE_Planeberry_V20);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Na to nemáš dost surovin.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň to a pak přijď.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V1()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_01");	//Jednu porci.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,20);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 1;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_03");	//Zítra bude kompot hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_05");	//No jo (směje se) mám ještě něco na práci. Tvůj kompot počká.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_06");	//Vlastně mám jinou práci,
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Napřed ruda, pak kompot!
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Na to nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň to a pak přijď.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V5()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_01");	//Pět porcí.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,100);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 5;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_03");	//Zítra bude kompot hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_05");	//No jo (směje se) mám ještě něco na práci. Tvůj kompot počká.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_06");	//Vlastně mám jinou práci.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Napřed ruda, pak kompot!
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Na to nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň to a pak přijď.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V10()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_01");	//Deset porcí.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,200);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 10;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_03");	//Zítra bude kompot hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_05");	//No jo (směje se) mám ještě něco na práci. Tvůj kompot počká.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_06");	//Vlastně mám jinou práci.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Napřed ruda, pak kompot!
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Na to nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň to a pak přijď.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V20()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_01");	//Dvacet porcí.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_02");	//Tolik? Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,400);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 20;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_03");	//Snad to zvládnu do zítřrka.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_04");	//Držím ti palce.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_05");	//Hi, hi. Všechno musí stranou. Teď jde o kompot.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_06");	//Jdu na to.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Napřed ruda, pak kompot!
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Na to nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň to a pak přijď.
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Planeberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Planeberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Planeberry_Info;
	permanent = TRUE;
	description = "Co můj kompot?";
};

func int DIA_STRF_1107_COOKMETAKE_Planeberry_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCook < daynow) && (DayCliffCookPortion >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Planeberry_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_01");	//Co můj kompot?
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_02");	//Je hotov. Vezmi si.
	B_GiveInvItems(self,other,itfo_compote_01,DayCliffCookPortion);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_03");	//Díky.
	DayCliffCookPortion = FALSE;
	DayCliffCook = FALSE;
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_01");	//Kompot z lesních bobulí.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_02");	//Dobře, uvídíme jestli máš vše...	
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_03");	//Zdá se že ano...
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_04");	//No, kolik porcí chceš?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"1 porce (20 lesních bobulí, léčivá bylina, 5 kousků rudy)",DIA_STRF_1107_COOKMEDONE_Forestberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"5 porcí (100 lesních bobulí, 5 léčivých bylin, 25 kousků rudy)",DIA_STRF_1107_COOKMEDONE_Forestberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"10 porcí (200 lesních bobulí, 10 léčivých bylin, 50 kousků rudy)",DIA_STRF_1107_COOKMEDONE_Forestberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"20 porcí (400 lesních bobulí, 20 léčivých bylin, 100 kousků rudy)",DIA_STRF_1107_COOKMEDONE_Forestberry_V20);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Něco ti chybí.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Sežeň si to.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V1()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_01");	//Jednu porci.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,30);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 1;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_03");	//Zítra bude hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_05");	//Hi, hi. Teď nemám čas.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_06");	//Mám jinou práci.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Napřed ruda, poté kompot.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Sežeň si to!
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V5()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_01");	//Pět porcí.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,150);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 5;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_03");	//Zítra bude hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_05");	//Hi, hi. Teď nemám čas.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_06");	//Mám jinou práci.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Napřed ruda, poté kompot.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Sežeň si to!
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V10()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_01");	//Deset porcí.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_02");	//Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,300);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 10;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_03");	//Zítra bude kompot hotov.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_04");	//Až zítra? Myslel jsem že začneš hned!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_05");	//Nemám čas.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_06");	//Mám jinou práci.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Napřed ruda, poté kompot.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Sežeň si to!
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V20()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_01");	//Dvacet porcí.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_02");	//Tolik? Dobře. Dej to sem.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,600);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 20;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_03");	//Pokusím se to zvládnout do zítra...

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_04");	//Držím ti palce...
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_05");	//Hi, hi. Všechno musí stranou. Teď jde o kompot.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_06");	//Jdu na to.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_07");	//Takže neotravuj. Zítra!
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//A kde je ruda? Ne, to nebude fungovat, kamaráde!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Napřed ruda, poté kompot.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Nemáš dost surovin.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Sežeň si to!
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Forestberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Forestberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Forestberry_Info;
	permanent = TRUE;
	description = "Co můj kompot?";
};

func int DIA_STRF_1107_COOKMETAKE_Forestberry_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCookFor < daynow) && (DayCliffCookPortionFor >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Forestberry_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_01");	//Co můj kompot?
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_02");	//Je připraven. Tady vezmi si.
	B_GiveInvItems(self,other,itfo_compote_00,DayCliffCookPortionFor);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_03");	//Děkuji.
	DayCliffCookPortionFor = FALSE;
	DayCliffCookFor = FALSE;
};

instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = "Něco nového?";
};

func int DIA_STRF_1107_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	var int daynow;
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Něco nového?
	if(MIS_OCCOOKFLEE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_21");	//Spýtaj sa detí. Ja tu nic neviem. Iba spím a jem.
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_22");	//No a niekedy ak my zvolia, tak chodím na lov.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_25");	//Novinky budú ked dosiahneme ciel. Nezmatkuj.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_DAY <= 0)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jestli se chceš dozvědět nějaký novinky, promluv si s rytíři. Já tady jen vařím.
		if(COOK1107_DAY == 0)
		{
			AI_Output(other,self,"DIA_STRF_1107_PERM_15_01");	//Nehlad na mna ako vlk, ja tento zámok poznám lepšie než ty. Hádaj preco?
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_02");	//Ale, ty nevyzeráš ako bývalý vězen.
			AI_Output(other,self,"DIA_STRF_1107_PERM_15_02");	//Ako vieš. Ale ak budeš potrebovat pomoc - nápoveda.
			COOK1107_DAY = Wld_GetDay() + 7;
		};
	}
	else
	{
		daynow = Wld_GetDay();
		if(COOK1107_DAY == (daynow + 1))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_04");	//Polievka. Každý den je nová.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_26");	//Príd zajtra - potom tu pre teba bude cakat novina.
			AI_StopProcessInfos(self);
		}
		else if(((COOK1107_DAY - 3) <= daynow) && (COOK1107_DAY > daynow))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_23");	//Ty si taký nedockavý. Ešte neprešiel ani týžden.
			AI_StopProcessInfos(self);
		}
		else if(COOK1107_DAY > daynow)
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_05");	//Zatial to nie je prítomnost.
		}
		else if(COOK1107_DAY == (daynow + 7))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_27");	//U nás sú novinky zriedkavé. Príd o týžden.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_07");	//Pýtal som sa chlapov. Povedali mi, že ti můžu verit.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_08");	//Dobre, pocúvaj. Nápad je jednoduchý - mal by som s tadeto vypadnút.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_09");	//V Khorinise nezostanem, potrebujem nejaké pokojné miesto kde můžu prestát tieto búrky.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_10");	//Bez odmeny nezostaneš. Povedz, videl si už truhlu na vrchu pološiny vysokej veže?
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_11");	//Je na nej dobrý zámok - bez klúca neotvoritelný. A tiež, je v nej pět alebo šest kúskov rudy. Sú tvoje.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_12");	//Ale zvažuj, že klúc ti nedám ako darcek. Potm ti poviem o mieste, kde je schovaný.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_14");	//Berieš? Bez ohlad aj na to, že na druhý krát ti to už neponúknem.
			COOK1107_DAY = -1;
			Info_ClearChoices(dia_strf_1107_perm);
			Info_AddChoice(dia_strf_1107_perm,"Vyzerá ro ako výmysel. Ale prijímam.",dia_strf_1107_perm_ok);
			Info_AddChoice(dia_strf_1107_perm,"Máš to v hlave v poriadku? Hladat dalšiu možnost ako sa dat zabit.",dia_strf_1107_perm_no);
		};
	};
};

func void dia_strf_1107_perm_no()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_05");	//Máš to v hlave v poriadku?
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_06");	//Ty chceš, aby som ta previedol cez hrad plný paladinov!
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_07");	//A cez hordy skřetů?!
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_15");	//Prepác, ale zmýlil som sa v tebe.
	Info_ClearChoices(dia_strf_1107_perm);
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_perm_ok()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_08");	//Ty chceš, aby som ta previedol cez hrad plný paladinov!
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_09");	//A cez hordy skřetů?!
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_10");	//A nemohol si nájst nieco dalšie? Bolo to pre teba důležité?
	MIS_OCCOOKFLEE = LOG_Running;
	Log_CreateTopic(TOPIC_OCCOOKFLEE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_Running);
	B_LogEntry(TOPIC_OCCOOKFLEE,"Kuchár Cliff na hrade rudobaronov v údolí sa stade chce dostat prec.");
	B_LogEntry(TOPIC_OCCOOKFLEE,"Slúbil, že mi povie kde je klúc od truhly so zopár kúskami rudy.");
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_16");	//Bolo to spůsobené... (široko sa usmieva).
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_17");	//Teraz pocúvaj. Oblecenie, ktoré pre paladinov nevyzerá podozrivé je pre mna na hrade nevyhnutné.
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_18");	//A nejaká zbran!
	B_LogEntry(TOPIC_OCCOOKFLEE,"Cliff hovorí, že šaty ktoré nie sú na hrade povolené a nejaká zbran sú prenho důležité.");
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_20");	//A to najdůležitejšie - nemáš nejakú potuchu o tichom mieste tu v Hornickom údolí?
	B_LogEntry(TOPIC_OCCOOKFLEE,"Ale stále dookola by som mal hladat tiché miseto v údolí.");
	Info_ClearChoices(dia_strf_1107_perm);
};


instance DIA_STRF_1107_FLEEINFO(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 2;
	condition = dia_strf_1107_fleeinfo_condition;
	information = dia_strf_1107_fleeinfo_info;
	permanent = FALSE;
	description = "Zdá sa že som našiel tiché miesto.";
};

func int dia_strf_1107_fleeinfo_condition()
{
	if((MIS_OCCOOKFLEE == LOG_Running) && (HEROKNOWFORESTBASE == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleeinfo_info()
{
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_00");	//Zdá sa že som našiel tiché miesto.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_01");	//Kde teda?
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_01");	//Za velkou skřetí palisádou narástol nový velký les.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_02");	//Vytvorila ho mágia každého boha s ktorým jeden chlapík z bývalého Bažinného tábora komunikoval.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_03");	//V tomto drevenom tábore je vela ludí a je velmi tichý.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_04");	//Už žiadny skřet neriskuje íst tam.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_02");	//Navrhuješ aby som sa z vězna stal bláznom?
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_15_05");	//Tam aspon riešia veci hlavou.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_07");	//Nie je to veselé - hladaj.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_03");	//Tak dobre, dobre - hned půjdu.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_04");	//Teraz je potrebné oblecenie a mec - ale je to potrebné ešte pred útekom.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_05");	//Teraz už nemám miesto na ich skrytie.
	B_LogEntry(TOPIC_OCCOOKFLEE,"Cliff súhlasil íst do Lesného tábora.");
};


instance DIA_STRF_1107_FLEENOW(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_fleenow_condition;
	information = dia_strf_1107_fleenow_info;
	permanent = TRUE;
	description = "Tak co, ideme?";
};

func int dia_strf_1107_fleenow_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_fleeinfo) && (COOK1107_GOBASE == FALSE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleenow_info()
{
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_02");	//A co zbroj?
		AI_Output(other,self,"DIA_STRF_1107_FleeNow_15_01");	//Taraz uvidím, ci to na mne, nevzbudzuje pozornost...
		Info_ClearChoices(dia_strf_1107_fleenow);
		Info_AddChoice(dia_strf_1107_fleenow,Dialog_Back,dia_strf_1107_fleenow_back);

		if(Npc_HasItems(other,itar_djg_l) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát lehkou zbroj drakobijce)",dia_strf_1107_fleenow_djg_l);
		};
		if(Npc_HasItems(other,itar_djg_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát lehkou kovanou zbroj drakobijce)",dia_strf_1107_fleenow_djg_l_v1);
		};
		if(Npc_HasItems(other,itar_djg_m) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát zbroj drakobijce)",dia_strf_1107_fleenow_djg_m);
		};
		if(Npc_HasItems(other,itar_djg_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát kovanou zbroj drakobijce)",dia_strf_1107_fleenow_djg_m_v1);
		};
		if(Npc_HasItems(other,itar_djg_h) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát těžkou zbroj drakobijce)",dia_strf_1107_fleenow_djg_h);
		};
		if(Npc_HasItems(other,itar_djg_h_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát těžkou kovanou zbroj drakobijce)",dia_strf_1107_fleenow_djg_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Mil_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát zbroj domobránce)",dia_strf_1107_fleenow_mil_l);
		};
		if(Npc_HasItems(other,itar_mil_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát kovanou zbroj domobránce)",dia_strf_1107_fleenow_mil_l_v1);
		};
		if(Npc_HasItems(other,ItAr_MIL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát těžkou zbroj domobránce)",dia_strf_1107_fleenow_mil_m);
		};
		if(Npc_HasItems(other,itar_mil_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát těžkou kovanou zbroj domobránce)",dia_strf_1107_fleenow_mil_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát zbroj rytíře)",dia_strf_1107_fleenow_pal_m);
		};
		if(Npc_HasItems(other,itar_pal_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát kovanou zbroj rytíře)",dia_strf_1107_fleenow_pal_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAl_H) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát zbroj paladina)",dia_strf_1107_fleenow_pal_h);
		};
		if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát zbroj z krunýřů důlního červa)",dia_strf_1107_fleenow_djg_lcr);
		};
		if(Npc_HasItems(other,ITAR_PAL_H_V1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát kovanou zbroj paladina)",dia_strf_1107_fleenow_pal_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Leather_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"(dát koženou zbroj)",dia_strf_1107_fleenow_pal_h_v2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_01");	//Priamo v strede bieleho dna? Si na hlavu?!... Půjdeme v noci.
		AI_StopProcessInfos(self);
	};
};

func void dia_strf_1107_fleenow_back()
{
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_05");	//A tu je problém. Príprava... (Povzdech)
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_fleenow_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_03");	//Správne!
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_04");	//A ako je to so zbranou?
	Info_ClearChoices(dia_strf_1107_fleenow);

	if(Npc_HasItems(other,ItMw_Schwert) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát meč)",dia_strf_1107_fleenow_ItMw_Schwert);
	};
	if(Npc_HasItems(other,ItMw_1h_Sld_Sword_New) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát prostý meč)",dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New);
	};
	if(Npc_HasItems(other,ItMw_Schwert2) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát dlouhý meč)",dia_strf_1107_fleenow_ItMw_Schwert2);
	};
	if(Npc_HasItems(other,ItMw_1H_Common_01) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát meč vlastní výroby)",dia_strf_1107_fleenow_ItMw_1H_Common_01);
	};
	if(Npc_HasItems(other,ItMw_ShortSword1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát krátký meč domobránce)",dia_strf_1107_fleenow_itmw_2h_orcsword_01);
	};
	if(Npc_HasItems(other,ItMw_1h_Mil_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát meč domobránce)",dia_strf_1107_fleenow_itmw_2h_orcsword_02);
	};
	if(Npc_HasItems(other,ItMw_Schwert3) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát palaš)",dia_strf_1107_fleenow_itmw_2h_orcaxe_04);
	};
	if(Npc_HasItems(other,ItMw_1h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát paladinský meč)",dia_strf_1107_fleenow_itmw_2h_orcaxe_03);
	};
	if(Npc_HasItems(other,ItMw_2h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát paladinský obouruční meč)",dia_strf_1107_fleenow_itmw_2h_orcaxe_02);
	};
	if(Npc_HasItems(other,ItMw_Zweihaender1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"(dát lehký obouruční meč)",dia_strf_1107_fleenow_itmw_2h_orcaxe_01);
	};

	Info_AddChoice(dia_strf_1107_fleenow,"Už nic jiného nemám...",dia_strf_1107_fleenow_nosword);
};

func void dia_strf_1107_fleenow_axegiven()
{
	B_GivePlayerXP(50);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(dia_strf_1107_fleenow);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_08");	//Úžasné!
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_09");	//Teraz můžeme íst!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

func void dia_strf_1107_fleenow_djg_lcr()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_l()
{
	B_GiveInvItems(other,self,itar_djg_l,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_l_v1()
{
	B_GiveInvItems(other,self,itar_djg_l_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_m()
{
	B_GiveInvItems(other,self,itar_djg_m,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_m_v1()
{
	B_GiveInvItems(other,self,itar_djg_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_h()
{
	B_GiveInvItems(other,self,itar_djg_h,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_h_v1()
{
	B_GiveInvItems(other,self,itar_djg_h_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_l()
{
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_m()
{
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_l_v1()
{
	B_GiveInvItems(other,self,itar_mil_l_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_m_v1()
{
	B_GiveInvItems(other,self,itar_mil_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_m()
{
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h()
{
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_m_v1()
{
	B_GiveInvItems(other,self,itar_pal_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h_v1()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h_v2()
{
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_01()
{
	B_GiveInvItems(other,self,ItMw_ShortSword1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_02()
{
	B_GiveInvItems(other,self,ItMw_1h_Mil_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_04()
{
	B_GiveInvItems(other,self,ItMw_Schwert3,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_03()
{
	B_GiveInvItems(other,self,ItMw_1h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_02()
{
	B_GiveInvItems(other,self,ItMw_2h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_01()
{
	B_GiveInvItems(other,self,ItMw_Zweihaender1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert()
{
	B_GiveInvItems(other,self,ItMw_Schwert,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New()
{
	B_GiveInvItems(other,self,ItMw_1h_Sld_Sword_New,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert2()
{
	B_GiveInvItems(other,self,ItMw_Schwert2,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1H_Common_01()
{
	B_GiveInvItems(other,self,ItMw_1H_Common_01,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_nosword()
{
	AI_Output(other,self,"DIA_STRF_1107_FleeNow_15_02");	//Nenašel jsem nic vhodného.
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_06");	//Copak jsi nenašel žádné skřetí zbraně?
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_07");	//Začínám pochybovat, že se tam dostaneme.
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_10");	//No už je pozdě se hádat. Pojďme!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

instance DIA_STRF_1107_ARRIVEDBASE(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = dia_strf_1107_arrivedbase_condition;
	information = dia_strf_1107_arrivedbase_info;
	important = TRUE;
};

func int dia_strf_1107_arrivedbase_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_FOREST_58") <= 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_arrivedbase_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_00");	//Toto je ono? Perfektné, vyhovuje mi to tu.
	AI_Output(other,self,"DIA_STRF_1107_ArrivedBase_01_01");	//A teraz moja cast dohody.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_02");	//Mal som priatela z Nového tábora. Kde je teraz, po všetkých udalostiach - to neviem.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_03");	//Dal mi klúc od skladu. Tu, klúc od truhly v Novom tábore - niekde pri ryžových poliach.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_04");	//Tam tiež leží truhla s rudou - je na vrchu plošiny vysokej veže.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_05");	//Ako sa dostat cez izbu na druhom podlaží hradu je už tvoja starost.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_06");	//Opovážil som sa povedat, že nemám klúc od truhly s rudou. A to bola pravda!
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_07");	//V každom prípade, si si ho úplne zaslúžil.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_08");	//Vdaka, priatelu.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_09");	//Řekl že tam najdu něco velmi hodnotného.
	B_GiveInvItems(self,other,itke_nc_cookchest,1);
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_10");	//Tady, vezmi si to. Já tam určitě nepůjdu.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_11");	//To je všechno. Ještě něco?
	AI_Output(other,self,"DIA_STRF_1107_ArrivedBase_01_12");	//No, doufám že tvůj přítel nelhal.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_OCCOOKFLEE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_SUCCESS);
	B_LogEntry(TOPIC_OCCOOKFLEE,"Cliff mi dal klúc od truhly v Novom tábore v ktorej je uschovaný klúc od truhly s rudou.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STAYINCAMP");
};

var int CliffTellCassia;

instance DIA_STRF_1107_CASSIA(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_cassia_condition;
	information = dia_strf_1107_cassia_info;
	permanent = TRUE;
	description = "A nevíš náhodou...";
};

func int dia_strf_1107_cassia_condition()
{
	if(((MIS_CASSIAGOLDCUP == LOG_Running) && (CliffTellCassia == FALSE) && (Npc_HasItems(other,ITKE_TWOSTORE) == 0) && ((MIS_OCCOOKFLEE == LOG_SUCCESS) || (MIS_OCCOOKFLEE == LOG_Running))) || ((MIS_RARETHINGS == LOG_Running) && (Npc_KnowsInfo(hero,dia_gomez_hello) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cassia_info()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	Info_AddChoice(dia_strf_1107_cassia,Dialog_Back,dia_strf_1107_cassia_back);

	if((MIS_RARETHINGS == LOG_Running) && (Npc_KnowsInfo(hero,dia_gomez_hello) == FALSE))
	{
		Info_AddChoice(dia_strf_1107_cassia,"O soškách Innose z černého mramoru?",dia_strf_1107_cassia_rarethings);
	};
	if((MIS_CASSIAGOLDCUP != LOG_SUCCESS) && (MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ITKE_TWOSTORE) == 0) && ((MIS_OCCOOKFLEE == LOG_SUCCESS) || (MIS_OCCOOKFLEE == LOG_Running)))
	{
		Info_AddChoice(dia_strf_1107_cassia,"O číši rudobarona?",dia_strf_1107_cassia_goldcup);
	};
};

func void dia_strf_1107_cassia_goldcup()
{
	AI_Output(other,self,"DIA_STRF_1107_Cassia_15_00");	//A ty nevíš kde by mohla být číše rudobarona?
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_01");	//Ha, teď už věřím že jsi z kolonie. Slyšel jsem o tom.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_02");	//Bude někde ve skladu. Engor ztratil klíč...
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_03");	//I kdybys ho našel, potřebuješ ještě jeden a ten má buď Oric nebo Percival.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_04");	//Musíš být velmi mazaný, že si troufáš na takovou krádež.

	if(MILTENSAYABOUTOCKEY == FALSE)
	{
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Číše rudobarona bude ve skladu paladinů. Klíč od skladu má Percival nebo Oric. Druhý klíč ztratil Engor.");
	}
	else
	{
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Číše rudobarona bude ve skladu paladinů. Klíč od skladu má Percival nebo Oric. Druhý klíč ztratil Engor.");
	};

	CliffTellCassia = TRUE;
};

func void dia_strf_1107_cassia_rarethings()
{
	AI_Output(other,self,"DIA_STRF_1107_Cassia_15_01");	//Víš něco o soškách Innose z černého mramoru?
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_05");	//Gomez měl nějaké černé figurky, kterýmy se vychloubal.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_06");	//Nejspíš zůstali někde na hradě. Podívejt se v pokojích paladinů nebo Gomezových starých komnatách...
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_07");	//No a klíče jsou v kapsách paladinů.
	B_LogEntry(TOPIC_RARETHINGS,"Sošky pro Lutera jsou někde na hradě.");
};

func void dia_strf_1107_cassia_back()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Ship(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Ship_condition;
	information = DIA_STRF_1107_Straefling_Ship_info;
	permanent = FALSE;
	description = "Chceš se dostat z ostrova?";
};

func int DIA_STRF_1107_Straefling_Ship_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (MIS_OCCOOKFLEE == LOG_SUCCESS) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Ship_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_00");	//Chceš se dostat z ostrova?
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_01");	//No jasně že jo! Nemůžu to tu vystát.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_02");	//Nyní máš možnost.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_03");	//Děláš si srandu? Nechápu?
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_04");	//Jakýpk vtip! Potřebuji kuchaře na lodi.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_05");	//Přesněji ne já, ale žoldák jménem Sylvio.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_06");	//Jo? No... jen aby to vyšlo...
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_07");	//Jo, jo. Klid. 
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_09");	//Se ptej - jasně!
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_10");	//Jen jedna věc, má ten člověk loď?
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_11");	//Samozřejmě! Není daleko odtud.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_12");	//Vážně? Nevěděl jsem o jiné lodi!
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_13");	//No to je ona!
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_14");	//Co? Ukradl loď skřetům?
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_15");	//No co. To je fuk ne? Hlavně že teď na ní můžeš nastoupit.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_16");	//Můžeme vyrazit. Počkej tam na Silvia.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_17");	//No, ano. Jenom zpočátku budu trochu odpočívat.
	ClifAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Drakar_Perm(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Drakar_Perm_condition;
	information = DIA_STRF_1107_Straefling_Drakar_Perm_info;
	permanent = TRUE;
	description = "Připraveno?";
};

func int DIA_STRF_1107_Straefling_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (CliffOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Drakar_Perm_01_00");	//Připraveno?
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_01");	//Myslím že ano.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_02");	//Chápeš není čas si vybírat.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_03");	//Skřeti zde měli skvělé zásoby. Plné sklady masa.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_04");	//Takže hladem nezemřeme.
};