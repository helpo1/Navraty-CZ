
instance DIA_GRAVO_EXIT(C_Info)
{
	npc = vlk_988_gravo;
	nr = 999;
	condition = dia_gravo_exit_condition;
	information = dia_gravo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gravo_exit_condition()
{
	return TRUE;
};

func void dia_gravo_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRAVO_PICKPOCKET(C_Info)
{
	npc = vlk_988_gravo;
	nr = 900;
	condition = DIA_GRAVO_PICKPOCKET_Condition;
	information = DIA_GRAVO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_GRAVO_PICKPOCKET_Condition()
{
	return C_Beklauen(45,88);
};

func void DIA_GRAVO_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
	Info_AddChoice(DIA_GRAVO_PICKPOCKET,Dialog_Back,DIA_GRAVO_PICKPOCKET_BACK);
	Info_AddChoice(DIA_GRAVO_PICKPOCKET,DIALOG_PICKPOCKET,DIA_GRAVO_PICKPOCKET_DoIt);
};

func void DIA_GRAVO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

func void DIA_GRAVO_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

instance DIA_GRAVO_FIRSTMEET(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_firstmeet_condition;
	information = dia_gravo_firstmeet_info;
	permanent = FALSE;
	description = "Myslíš si, že se známe?";
};


func int dia_gravo_firstmeet_condition()
{
	return TRUE;
};

func void dia_gravo_firstmeet_info()
{
	AI_Output(other,self,"DIA_Gravo_FirstMeet_01_00");	//Myslíš si, že se známe?
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_01");	//Ano? Hmm... (přemýšlí) Možná ano. Tvůj obličej jsem už někde viděl.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_03");	//Ach, jistěže ano! Pamatuji si tě.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_04");	//Ty jsi ten kluk, který se vždy dostane do problémů. Jenže ti to v ničem nezabrání!
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_06");	//Ukazuje se, že se nepletu. Mohl byste být snadno zaměněný za banditu.
	AI_Output(self,other,"DIA_Gravo_FirstMeet_01_07");	//K odsouzeným se nechovají příliš dobře.
};


instance DIA_GRAVO_HOWHERE(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_howhere_condition;
	information = dia_gravo_howhere_info;
	permanent = FALSE;
	description = "Jak jsi tu zkončil?";
};


func int dia_gravo_howhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_howhere_info()
{
	AI_Output(other,self,"DIA_Gravo_HowHere_01_00");	//Jak jsi tu zkončil?
	AI_Output(self,other,"DIA_Gravo_HowHere_01_01");	//Blbá otázka... Prošel jsem průsmykem jako všichni.
	AI_Output(self,other,"DIA_Gravo_HowHere_01_02");	//Po pádu bariéry mě tam už nic nedrželo, ano takhle to bylo.
};


instance DIA_GRAVO_HALLO(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_hallo_condition;
	information = dia_gravo_hallo_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_gravo_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_hallo_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_01_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_01");	//Jelikož mě bolí záda...
	AI_Output(other,self,"DIA_Gravo_Hallo_01_02");	//Co život?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_03");	//Pomáhám lidem řešit jejich problémy.
	AI_Output(other,self,"DIA_Gravo_Hallo_01_05");	//Jaké problémy řešíš?
	AI_Output(self,other,"DIA_Gravo_Hallo_01_06");	//No, všechny. Záleží na tom, jakej máš problém.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_08");	//No, některé se většinou považují za trestný čin.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_09");	//Mohl bych vyřešit kdejaké nedorozumění nebo se přimluvi u těch správných lidí.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_10");	//Věř mi, vždy je nějaký článek, který lze vyndat a hned bude po problémech.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_11");	//A poté se k tobě začnou lidé chovat jinak. Opět tě budou mít v oblibě.
	AI_Output(self,other,"DIA_Gravo_Hallo_01_12");	//Samozřejmě si budeš moci dělat co chceš, a všechno bude normální. Nic neobvyklého.
	Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
	B_LogEntry(TOPIC_DIPLOM,"Pokud se dostanu do problémů, Gravo mi s nimi pomůže. Avšak za poplatek.");
};


instance DIA_GRAVO_HELPANGRYNOW(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_helpangrynow_condition;
	information = dia_gravo_helpangrynow_info;
	permanent = TRUE;
	description = "Mám problém! Pomůžeš mi?";
};


func int dia_gravo_helpangrynow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo) && ((VatrasPissedOffForever == TRUE) || (GLOBAL_MAKE_BANDIT_FORCITY == TRUE) || (GLOBAL_MAKE_BANDIT_FORMON == TRUE) || (GLOBAL_MAKE_BANDIT_FORFARM == TRUE) || (GLOBAL_MAKE_BANDIT_FORCOAST == TRUE) || (GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gravo_helpangrynow_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Jsem v maléru! Pomůžeš mi?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Ano! Ale bude tě to něco stát!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,Dialog_Back,dia_gravo_helpangrynow_back);

	if(GLOBAL_MAKE_BANDIT_FORFARM == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problémy na Onarově farmě!.",dia_gravo_helpangrynow_bigfarm);
	};
	if(GLOBAL_MAKE_BANDIT_FORMON == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problémy v klášteře!",dia_gravo_helpangrynow_kloster);
	};
	if(GLOBAL_MAKE_BANDIT_FORCITY == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problém s paladiny!",dia_gravo_helpangrynow_city);
	};
	if(GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problémy v táboře Bratrstva!",dia_gravo_helpangrynow_psicamp);
	};
	if(GLOBAL_MAKE_BANDIT_FORCOAST == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problém v Netbekově táboře!",dia_gravo_helpangrynow_netbek);
	};
	if(VatrasPissedOffForever == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Mám problém s mágem Vody Vatrasem.",dia_gravo_helpangrynow_vatras);
	};
};

func void dia_gravo_helpangrynow_back()
{
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Vatras_01_00");	//Mám problém s mágem Vody Vatrasem.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_01");	//Hmmm... (přemýšlí) Myslím že tohle půjde vyřešit docela snadno.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_04");	//Tři tisíce zlatých mincí!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"Nemám tolik.",dia_gravo_helpangrynow_nomoney);

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Dobře! Ujednáno.",dia_gravo_helpangrynow_vatras_takeit);
	};
};

func void dia_gravo_helpangrynow_bigfarm()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_00");	//Mám problémy na Onarově farmě!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_01");	//Hmm... To se dá snadno vyřešit!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_02");	//Musíš si znovu získat důvěru, budeš mi ale muset zaplatit.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_01_04");	//3000 zlatých.
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"To je zatraceně hodně.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Dohodnuto. Tady jsou.",dia_gravo_helpangrynow_bigfarm_takeit);
	};
};

func void dia_gravo_helpangrynow_kloster()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_01_00");	//Mám problémy v klášteře!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_01");	//Mágové Ohně? Hmmm... Do čeho ses to namočil?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_02");	//Mágové Ohně jsou nesmírně tvrdohlavý a pyšní. Bude je těžké přesvědčit!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_03");	//Bude po problému, ale musíš mi zaplatit obrovskou sumu zlatých!
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_01_04");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_01_05");	//10 000 zlatých!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"Nemám u sebe tolik peněz.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 10000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Dobře, tady je tvých 10 000 zlatých.",dia_gravo_helpangrynow_kloster_takeit);
	};
};

func void dia_gravo_helpangrynow_city()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_01_00");	//Mám problém s paladiny!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_01");	//Hmmm... Bude to těžké je přesvědčit aby zapomněli na tvé problémy.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_02");	//Bude tě to stát více než obvykle!
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_01_03");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_01_04");	//5000 zlatých!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"To je dost zlatých.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Dohodnuto. Tady jsou.",dia_gravo_helpangrynow_city_takeit);
	};
};

func void dia_gravo_helpangrynow_psicamp()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_01_00");	//Mám problémy v táboře Bratrstva!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_01");	//To půjde velmi snadno...
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_02");	//Aby tě znovu akceptovali, budeš mi muset zaplatit!
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_01_03");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_01_04");	//4000 zlatých!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"Ach jo! To je pro mě hodně.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 4000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Dobře tedy.",dia_gravo_helpangrynow_psicamp_takeit);
	};
};

func void dia_gravo_helpangrynow_netbek()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NetBek_01_00");	//Mám problém v Netbekově táboře!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_01");	//Lehce, tohle vyřeším.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_02");	//Ale nebude to zadarmo!
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NetBek_01_03");	//Kolik?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NetBek_01_04");	//2000 zlatých mincí!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,"Tolik u sebe nemám.",dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_gravo_helpangrynow,"Jsou tvé!.",dia_gravo_helpangrynow_netbek_takeit);
	};
};

func void dia_gravo_helpangrynow_nomoney()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_NoMoney_01_00");	//Nemám žádné problémy!
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_NoMoney_01_01");	//Je mi líto, moje služby nebudeš více potřebovat!
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00");	//Dobře tedy.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	VatrasPissedOffForever = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Teď mi musí Vatras odpustit.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_bigfarm_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00");	//Skvělé!
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	B_GrantAbsolution(LOC_FARM);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
	PETZCOUNTER_Farm_Murder = 0;
	PETZCOUNTER_Farm_Theft = 0;
	PETZCOUNTER_Farm_Attack = 0;
	PETZCOUNTER_Farm_Sheepkiller = 0;
	GLOBAL_FARM_MURDER = 0;
	GLOBAL_FARM_THEFT = 0;
	GLOBAL_FARM_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORFARM = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"S žoldáky je to už v suchu.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_kloster_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_00");	//Skvělé!
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	B_GrantAbsolution(LOC_MONASTERY);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
	PETZCOUNTER_Monastery_Murder = 0;
	PETZCOUNTER_Monastery_Theft = 0;
	PETZCOUNTER_Monastery_Attack = 0;
	PETZCOUNTER_Monastery_Sheepkiller = 0;
	GLOBAL_MONASTERY_MURDER = 0;
	GLOBAL_MONASTERY_THEFT = 0;
	GLOBAL_MONASTERY_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORMON = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"S mágy Ohně je vše vyřízeno.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_city_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_00");	//Skvělé!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_City_TakeIt_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	if(GARONDTROUBLE == TRUE)
	{
		B_GrantAbsolution(LOC_OLDCAMP);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		PETZCOUNTER_OldCamp_Murder = 0;
		PETZCOUNTER_OldCamp_Theft = 0;
		PETZCOUNTER_OldCamp_Attack = 0;
		PETZCOUNTER_OldCamp_Sheepkiller = 0;
		GLOBAL_OLDCAMP_MURDER = 0;
		GLOBAL_OLDCAMP_THEFT = 0;
		GLOBAL_OLDCAMP_ATTACK = 0;
		GARONDTROUBLE = FALSE;
		B_LogEntry(TOPIC_DIPLOM,"Mé vztahy s paladiny se zlepšily.");
	}
	else
	{
		B_GrantAbsolution(LOC_CITY);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		PETZCOUNTER_City_Murder = 0;
		PETZCOUNTER_City_Theft = 0;
		PETZCOUNTER_City_Attack = 0;
		PETZCOUNTER_City_Sheepkiller = 0;
		GLOBAL_CITY_MURDER = 0;
		GLOBAL_CITY_THEFT = 0;
		GLOBAL_CITY_ATTACK = 0;
		B_LogEntry(TOPIC_DIPLOM,"S paladiny ve městě nejsou už žádné problémy.");
	};
	GLOBAL_MAKE_BANDIT_FORCITY = FALSE;
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_psicamp_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_00");	//Skvělé!
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	B_GrantAbsolution(LOC_PSICAMP);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_PSICAMP = ABSOLUTIONLEVEL_PSICAMP + 1;
	PETZCOUNTER_PSICAMP_MURDER = 0;
	PETZCOUNTER_PSICAMP_THEFT = 0;
	PETZCOUNTER_PSICAMP_ATTACK = 0;
	GLOBAL_PSICAMP_MURDER = 0;
	GLOBAL_PSICAMP_THEFT = 0;
	GLOBAL_PSICAMP_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORPSICAMP = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"V táboře Bratrstva jsem opět respektován.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_netbek_takeit()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_00");	//Skvělé!
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_01");	//To by mohlo stačit. Předpokládejme, že problém je vyřešen.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_02");	//Nikomu o tom neříkej! Chovej se, jakoby se nic nedělo.
	B_GrantAbsolution(LOC_COAST);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_COAST = ABSOLUTIONLEVEL_COAST + 1;
	PETZCOUNTER_COAST_MURDER = 0;
	PETZCOUNTER_COAST_THEFT = 0;
	PETZCOUNTER_COAST_ATTACK = 0;
	GLOBAL_COAST_MURDER = 0;
	GLOBAL_COAST_THEFT = 0;
	GLOBAL_COAST_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORCOAST = FALSE;
	B_LogEntry(TOPIC_DIPLOM,"Obnovil jsem vztahy s obyvateli Netbekova táboru.");
	Info_ClearChoices(dia_gravo_helpangrynow);
};