
instance DIA_Addon_Erol_EXIT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 999;
	condition = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_NO_TALK(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_addon_erol_no_talk_condition;
	information = dia_addon_erol_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_erol_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk) && (EROLRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Erol_PICKPOCKET(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 900;
	condition = DIA_Addon_Erol_PICKPOCKET_Condition;
	information = DIA_Addon_Erol_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	return C_Beklauen(43,42);
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,Dialog_Back,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};


instance DIA_Addon_Erol_Hallo(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Hallo_Condition;
	information = DIA_Addon_Erol_Hallo_Info;
	description = "Co se stalo?";
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(Naštvaně) Co se stalo? Podívej se na ten nepořádek tamhle pod mostem!
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(Naštvaně) Něco takového jsem neviděl za celý můj život. Ti tvorové by je měli do jednoho pobít.
};


instance DIA_Addon_Erol_what(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_what_Condition;
	information = DIA_Addon_Erol_what_Info;
	description = "Co se stalo?";
};


func int DIA_Addon_Erol_what_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Cestoval jsem se svými pomocníky, když v tom se ti podělaní hajzlové z ničeho nic zjevili a všechny je zabili.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Naštěstí jsem nezapomněl na můj pravý hak a díky tomu jsem vyvázl se zdravou kůží.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol,"Obchodník Erol byl přepaden bandity. Vzali mu veškeré zboží. Erol po mě chce abych mu vrátil jeho kamenné desky. Banditi se usadili vedle mostu nedaleko hostince 'U Mrtvé harpyje'.");
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what,"Takže ty věci, co leží pod mostem, jsou tvé?",DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what,"Co to bylo za lidi co tě napadli?",DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//Ty věci pod mostem jsou tvé?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Vozík, zboží, všechno...
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Vzal jsem něco ze tvého zboží...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Nech si to. Nic z toho pro mě nemá žádnou cenu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Nic z toho pro mě nemá žádnou cenu.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Ale je tu něco nenahraditelného, co mi banditi ukradli. Tři kamenné desky.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what,"Kamenné desky?",DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Jo. Chtěl si je u mě koupit mág Vody ve městě. Slíbil jsem mu je, jak se k nim dostanu.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Musím je dostat zpět za každou cenu, jinak to silně poškodí mou reputaci.
	Info_AddChoice(DIA_Addon_Erol_what,"Kde jsi získal ty kamenné desky?",DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what,"Co s nimi chtějí mágové Vody dělat?",DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Co s nimi chtějí mágové Vody dělat?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Řekli mi, že je chtějí studovat a požádali mě, ať jich přinesu co nejvíce.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Odkud máš tyto kamenné desky?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Našel jsem je u starých budov vypadajících jako mausolea a jindy je třeba najdeš i v jeskyních.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Už jsem jich mágům Vody prodal celou kupu.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Nicméně tady dole jsou celkem vzácné. Nejčastěji severovýchodně od Khorinisu jich náchazím spoustu.
	Info_AddChoice(DIA_Addon_Erol_what,"Proč prostě nenajdeš další?",DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Proč prostě nenajdeš další?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//V boji s bandity jsem si vyvrtnul kotník.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//Se špatnou nohou daleko neujdu.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Co to bylo za lidi, co tě napadli?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Banditi. Kdo jiný? Usadili se na mostě.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Oberou každého, kdo chce přejít most.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Věděl jsem, že je na mě nahoře připravená léčka, a proto jsem se rozhodl, že projdu pod mostem.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Ale můj vozík a mé zboží asi vzbudily příliš vysokou pozornost, zdá se.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Ti bastardi prostě skočili z mostu - přímo na na nás.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Bylo nutné se tam pokusit v noci proplížit...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = "Nemáš nějaké informace o zásilkách zbraní banditům?";
};


func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Nemáš nějaké informace o zásilkách zbraní banditům?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Zásilky zbraní? Jasně, jedna tu je. Nějaký hajzl z města jim prodal mnoho zbraní. Taktak je mohli odnést.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Část z toho je uložená u mostu, kde mě napadli ti banditi.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Část museli odnést někam na pastviny za Bengarovou farmou.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Možná je chtěli banditi propašovat přes průsmyk.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,"Kde je ta pastvina?",DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Kde je ta pastvina?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//Přibližně uprostřed ostrova Khorinis leží Orlanův hostinec. Nazývá se 'U Mrtvé harpyje'.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//Vede odtamtud cesta na jih. Prochází přes pastviny až ke vstupu do Hornického údolí.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};


instance DIA_Addon_Erol_Stoneplates(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Stoneplates_Condition;
	information = DIA_Addon_Erol_Stoneplates_Info;
	permanent = TRUE;
	description = "O kamenných deskách...";
};


func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if(MIS_Addon_Erol_BanditStuff == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};


var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = 10;

func void DIA_Addon_Erol_Stoneplates_Info()
{
	var int StoneplatesCount;
	var int XP_Addon_BringStoneplates;
	var int StoneplatesGeld;

	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//O kamenných deskách...

	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

		if(StoneplatesCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//Mám jednu z nich.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//Mám jich pár.

			if((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,3 - StoneplatesCounter);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = (3 - StoneplatesCounter) * XP_Addon_BringStoneplate;
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,StoneplatesCount);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = StoneplatesCount * XP_Addon_BringStoneplate;
				StoneplatesCounter = StoneplatesCounter + StoneplatesCount;
			};

			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Díky.

		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Teď už mi chybí jen dvě.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Teď už mi chybí jen jedna.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//To stačí, nyní můžu dodržet svůj slib mágům Vody ve městě a pak jít konečně domů.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};

		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Zaplatím ti za ně, samozřejmě.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));

		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Jdu domů. Jestli chceš, tak se ke mně můžeš přidat.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Možná ti budu schopen něco prodat, když se dostanu domů.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(C_ScHasMagicStonePlate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//Je tato tabulka dobrá?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Ne, tato má nějakou magickou moc.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Takové kamenné desky mágové Vody nekoupí.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Kolik jich budeš potřebovat?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Abych si zachránil svou reputaci ve městě u mágů Vody, potřebuji 3 kamenné desky.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = "Žiješ ve městě?";
};


func int DIA_Addon_Erol_Buerger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Žiješ ve městě?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Už dlouho ne, kamaráde. Nic mě mezi těma zrádnýma a lakomýma sviněma, co žijí v horní čtvrti, nedrží.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//Míval jsem velký vliv. Jen abys věděl. Ale to bylo velmi dávno...

	if((MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE) && (EROLTELLABOUTGUILD == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Erol_Buerger_10_03");	//Už i tehdy si se zabýval obchodem?!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_04");	//Ne, že jen zabýval, ale býval jsem jeden z nejbohatších obchodníků ve městě.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_05");	//A kromě toho jsem také byl vůdcem cechu obchodníků v Khorinisu.
		AI_Output(other,self,"DIA_Addon_Erol_Buerger_10_06");	//Cech obchodníků?!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_07");	//Spadnul jsi z měsíce?! (udiveně)
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_09");	//Hmm... (udiveně) To je tedy zvláštní!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_10");	//Upřímně řečeno, ještě nikdy jsem nenarazil na někoho, kdo by o něm nikdy neslyšel!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_11");	//Ačkoli, teď se cech ani tak moc nesnaží vystavovat veřejnosti.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_12");	//Je to pochopitelné. V poslední době se tu v okolí ochomýtají různí banditi a jiný odpad.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_13");	//A sám vidíš, že být obchodníkem je v poslední době dost nebezpečné.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_14");	//Ale dříve býval Cech obchodníků v Khorinisu jeden z nejvlivnějších a nejznámějších v celé Myrtaně!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_15");	//Být jeho členem byla čest pro každého, ale mnoho lidí jsme nepřijímali.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_16");	//Eh!... (smutně) 
		EROLTELLABOUTGUILD = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguild_condition;
	information = dia_addon_erol_tradeguild_info;
	permanent = FALSE;
	description = "Chtěl bych se stát členem obchodního cechu.";
};


func int dia_addon_erol_tradeguild_condition()
{
	if((EROLTELLABOUTGUILD == TRUE) && (MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguild_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_00");	//Chtěl bych se stát členem obchodního cechu. Mohl by si mi s tím pomoct?
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_02");	//Hmmm... (Zamyšleně) Vlastně už to bude delší doba, co jsem z tama odešel.
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_03");	//Ačkoli, i přes to, mi pořád zůstalo určité spojení s cechem.
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_04");	//Takže by ti nedalo moc práce mi pomoci?
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_05");	//No...

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Dobře, ale za to pro mně něco uděláš.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachránit mou reputaci, a přines mi zpět mé kamenné desky pro mágy Vody.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_06");	//Pak ti rád pomůžu stát se členem cechu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_07");	//A zvlášť když si mi prokázal takovou službu, vrátil si mi tabulky.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_08");	//? dluh, jak víš, se má zplácet!
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_09");	//Co bych měl udělat?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_10");	//Ty - absolutně nic... (směje se) Já se postarám o všechno.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_11");	//Napíšu ti doporučující dopis, pro jednoho mého přítele.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_13");	//Je to velmi vlivný člověk ve městě, a kromě toho - současný mistr cechu obchodníků.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_14");	//Nebude tě jentak poslouchat... ale s tímto dopisem - to je jiná!
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_15");	//A co bych mu měl říct?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_16");	//Nic říkat nemusíš, vše je řečeno v mém dopise.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_17");	//A věř mi, napíšu to tak, že nebude mít jinou možnost, než tě přijmout.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_20");	//Skvěle! Napiš mi ten dopis.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_21");	//Na, vem to mistru Luterovi.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_22");	//Luterovi?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_23");	//Ano, a věřím, že víš o koho se jedná, takže ti nebude dělat velkou práci ho najít.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_25");	//Dobrá tedy.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILDHOW(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguildhow_condition;
	information = dia_addon_erol_tradeguildhow_info;
	permanent = TRUE;
	description = "Ohledně cechu obchodníků...";
};


func int dia_addon_erol_tradeguildhow_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_tradeguild) && (EROLTELLABOUTGUILD == TRUE) && (EROLGIVERECOMENDATION == FALSE) && (MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguildhow_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_00");	//Ohledně cechu obchodníků...
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_01");	//Už jsem ti řekl - napřed mi vrať mé desky!
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_02");	//Potom si promluvíme o tvé záležitosti.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_03");	//Dobře. Pomohl jsi mi, teď pomůžu já tobě.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_04");	//Co bych měl udělat?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_05");	//Ty - absolutně nic... (směje se) Já se postarám o všechno.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_06");	//Napíšu ti doporučující dopis, pro jednoho mého přítele.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_08");	//Je to velmi vlivný člověk ve městě, a kromě toho - současný mistr cechu obchodníků.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_09");	//Nebude tě jentak poslouchat... ale s tímto dopisem - to je jiná!
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_10");	//A co bych mu měl říct?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_11");	//Nic říkat nemusíš, vše je řečeno v mém dopise.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_12");	//A věř mi, napíšu to tak, že nebude mít jinou možnost, než tě přijmout.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_15");	//Skvěle! Napiš mi ten dopis.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_16");	//Na, vem to mistru Luterovi.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_17");	//Luterovi?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_18");	//Ano, a věřím, že víš o koho se jedná, takže ti nebude dělat velkou práci ho najít.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_20");	//Dobrá tedy.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_Addon_Erol_PreTeach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = "Zahnal jsi ty lupiče na útěk?";
};


func int DIA_Addon_Erol_PreTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Zahnal jsi ty lupiče na útěk?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Ano, ale jsem si jistý, že jsou stále na mostě.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Můžeš mi ukázat jak dát pořádnou ránu?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Samozřejmě, že ano.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Erol_Teach);
};


instance DIA_Addon_Erol_PreTrade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_PreTrade_Condition;
	information = DIA_Addon_Erol_PreTrade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Addon_Erol_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000) && (ErolRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Nic ti prodat nemůžu. Všechno mé zboží zůstalo támhle pod mostem!
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Něco ti budu moct prodat, až se dostanu domů.

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Ale neodejdu odsud, dokud nezískám zpět své kamenné desky pro mága.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = "To je tvůj dům?";
};


func int DIA_Addon_Erol_SLD_Condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int Erol_IsAtHome;

func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(udiveně) Takže to je tvoje dům?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Jo, proč? Máš s tím nějkaý problém?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Nemáš problémy se žoldáky?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Dokud se nebudu plést do jejich záležitostí, oni si mne také nebudou všímat.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//A navíc jsou to skvělí zákazníci a platím jim za to, že mi dávají pozor na chatu, když někam vyrazím pryč.
	B_GivePlayerXP(XP_Ambient);

	if(Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

var int ErolGiveMat;

instance DIA_Addon_Erol_Trade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_Trade_Condition;
	information = DIA_Addon_Erol_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Addon_Erol_Trade_Condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && Wld_IsTime(8,0,22,0) && ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000) || (ErolRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

var int DIA_Addon_Erol_Trade_OneTime;

func void DIA_Addon_Erol_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Bojím se, že není moc na výběr.

	if((MIS_ROBAMATERIAL == LOG_Running) && (ErolGiveMat == FALSE))
	{
		CreateInvItems(self,itmi_novmaterial,1);
		ErolGiveMat = TRUE;
	};
	if(Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_ErolTrade);
		Npc_ExchangeRoutine(self,"Home");
		Erol_IsAtHome = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Erol_Teach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 99;
	condition = DIA_Addon_Erol_Teach_Condition;
	information = DIA_Addon_Erol_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak tvrdě udeřit.";
};


func int DIA_Addon_Erol_Teach_Condition()
{
	if(Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Ukaž mi, jak tvrdě udeřit.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Dobře, ale uděláš pro mě jednu laskavost.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Pomoz mi zachránit mou reputaci, a přines mi zpět mé kamenné desky.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//Pak ti ukážu, jak lépe využít své síly v boji.
	}
	else if(Erol_Bonus == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Dobře. Sleduj. Je to jednoduchý trik.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Když někoho praštíš, nesmíš použít jen sílu paže, ale sílu celého těla.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Otoč se bokem, vystrč rameno dopředu a ve stejnou chvíli vymršti ruku.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(Smích) Když se dobře strefíš, poznáš ten rozdíl!
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Pokud chceš vědět víc, musíš tvrdě trénovat...
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

instance DIA_ADDON_EROL_LURKER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 10;
	condition = dia_addon_erol_lurker_condition;
	information = dia_addon_erol_lurker_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int dia_addon_erol_lurker_condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_lurker_info()
{
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_00");	//Jak to jde?

	if((Kapitel >= 1) && (MIS_RABOGLAV == FALSE) && (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_01");	//(naštvaně) Do háje! Podívej se na můj dům - a to jsem ho zrovna dal do kupy. 
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_02");	//A co s ním bylo?
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_03");	//Představ si, nějaká prokletá nestvůra v něm udělala bordel! Všechen nábytek rozbila na padrť!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_04");	//Dokonce i truhlu rozbila a sežrala celý její obsah.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_05");	//A Thorben ji teď musí spravit! 
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_06");	//Všechny stěny a celou podlahu blátem a špínou zasvinila! Nechala tu po sobě smrad zhnilých ryb! Zápach se drží, že ještě teď mě to do očí řeže!
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_07");	//A k čemu jsou ti dva vazouni se sekyrama, co se ti tu motají kolem chaty?
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_08");	//Oni tvrdí, že nic neviděli... prokletí hlupáci!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_09");	//A pak se ještě opovažujou mě žádat o peníze. Gobliní ohon na ně... a ne zlato!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_10");	//Vsadím se, že si trošičku přihnuli jako obvykle a trošku si pospali, prokleté hovada! 
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_11");	//Mimochodem si myslím, že se tvor tady stále někde okolo potlouká.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_12");	//Sám bych jí nakopnul, ale po příběhu s bandity mě nějak rozbolela noha.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_13");	//Poslyš? zabij tu příšeru, a já ti za to zaplatím!
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_14");	//Dobře! Jestli ji někde zmerčím, budiž - zabiju ji pro tebe.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_15");	//Výborně! Jen nezapomeň donést její drápy, musejí mí nějakou magickou sílu. Zdá se, že se ta potvora pohybuje jen tady!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_16");	//Je to nutné... Truhla na půlky! (smích) Noční můra!
		Wld_InsertNpc(lurker_uniq,"NW_LAKE_GREG_TREASURE_01");
		MIS_RABOGLAV = LOG_Running;
		Log_CreateTopic(TOPIC_RABOGLAV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_Running);
		B_LogEntry(TOPIC_RABOGLAV,"Erol mi řekl o útoku na jeho dům. Myslím si, že to udělalo něco, co smrdělo po zkažených rybách. Souhlasil jsem, že se vypořádám s tímto stvořením, ale nesmím zapomenout získat z ní trofej.");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_17");	//Z těch postav v černých pláštích mám husí kůži.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_18");	//Něco tady neustále chodí, něco čenichá...(nervózně) Nelíbí se mi to!
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_19");	//Zatím je vše v pořádku.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_20");	//Jestli se něco uděje, dám ti vědět.
	};
};

instance DIA_VLK_4303_ADDON_EROL_RABOGLAV(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_vlk_4303_addon_erol_raboglav_condition;
	information = dia_vlk_4303_addon_erol_raboglav_info;
	permanent = FALSE;
	description = "S tou tvojí nestvůrou je konec!";
};

func int dia_vlk_4303_addon_erol_raboglav_condition()
{
	if((MIS_RABOGLAV == LOG_Running) && Npc_IsDead(lurker_uniq) && (Npc_HasItems(other,ITAT_LEADERLURKER) >= 1))
	{
		return TRUE;
	};
};

func void dia_vlk_4303_addon_erol_raboglav_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_00");	//Stou nestvůrou je konec! Vyklubal se z ní nakonec obrovský číhavec.
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_01");	//A tady jsou i ty jeho drápy. To je vše, co jsi žádal.
	B_GiveInvItems(other,self,ITAT_LEADERLURKER,1);
	Npc_RemoveInvItems(self,ITAT_LEADERLURKER,1);

	if(Trophy_LURKERLEADER == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_LURKERLEADER,Npc_HasItems(other,ItUt_LURKERLEADER));
		Trophy_LURKERLEADER = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_02");	//Ohó! S takovýma by se dala i hlava setnout na jedenkrát!
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_03");	//Myslím, že sis zřejmě musel dát s tím práci... s ním?
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_04");	//Ano, docela to stálo úsilí. Doufám ale, že jsem se nedřel zbytečně.
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_05");	//Samozřejmně, že ne. Tady, jak jsem slíbil je tvoje odměna.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_06");	//Hory ze zlata to sice nejsou, ale i tak si myslím, že je to dost. Sám to víš, časy jsou zlé! 
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_07");	//Je to dost. Stává se to!
	MIS_RABOGLAV = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_SUCCESS);
	B_LogEntry(TOPIC_RABOGLAV,"Erol by velice překvapený když uviděl velikost drápů číhavce, který ho obtěžoval.");
};


//--------------------CEO----------------------------------------------

instance DIA_ADDON_EROL_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_recrdt_condition;
	information = dia_addon_erol_recrdt_info;
	permanent = FALSE;
	description = "Jak jde obchod?";
};

func int dia_addon_erol_recrdt_condition()
{
	if((MIS_PPL_FOR_TOWER == LOG_Running) && (PasswordSet == TRUE) && (Erol_IsAtHome == TRUE) && (VALERANRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_recrdt_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_00");	//Jak jde obchod?
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_01");	//Zdravím tě. Ale nic moc.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_02");	//Už jsem starý na to, chodit sem a tam s vozíkem plným zboží. A na cestách je to čím dál tím nebezpečnější.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_03");	//Tady banditi, tam příšery a teď ještě ty přízraky v temných pláštích, co se tady potulují.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_04");	//Šel bych na odpočinek, ale to bych umřel nudou.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_05");	//A ty bys nechtěl změnit způsob své živnosti?
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_06");	//Co máš na mysli?
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_07");	//Možná bych pro tebe měl práci.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_08");	//Tak se přihodilo, že teď jsem majitelem jedné věže v blízkosti Onarovy farmy a chci tam vybudovat malý tábor. A zoufale potřebuju schopného správce.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_09");	//A nabízíš to místo mě? Hmm, zajímavá nabídka, ale hned ti neodpovím.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_10");	//Vzpomínáš, jsem stále obchodník. Já umím dobře nabízet zboží a počítat peníze, ale zkušenosti s vedením lidí nemám.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_11");	//S lidma si poradím sám.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_12");	//Ty, pokud budeš souhlasit, budeš mít na starost finance a obchod: starat se o výplaty a inventarizaci všech věcí. Jednat s dodavateli a přimět je, aby nám poskytli ty nejlepší ceny.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_13");	//To je dobré. A co bydlení? Chápu to dobře, že se budu muset vzdát svého domova a bydlet s vám.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_14");	//To je pravda. Žít musíš s náma. Ale jídlo bude na můj účet.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_15");	//Připouštím - je to velmi vážné rozhodnutí... Musím si to rozmyslet. Přijď zítra, dám ti odpověď!
	EROLDECISIONDAY = Wld_GetDay();
};

instance DIA_ADDON_EROL_AGREES_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_agrees_recrdt_condition;
	information = dia_addon_erol_agrees_recrdt_info;
	permanent = FALSE;
	description = "Co tedy říkáš na moji nabídku?";
};

func int dia_addon_erol_agrees_recrdt_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_recrdt) && (EROLDECISIONDAY < Wld_GetDay()) && (VALERANRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_agrees_recrdt_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_15_00");	//Co tedy říkáš na moji nabídku?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_01");	//(Udiveně) Máš nějaké další návrhy?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_02");	//Dělám si legraci. Uvědomil jsem si, že je to pro mě v současné době nejlepší nabídka.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_03");	//Taky mě nikdy nevadilo vyzkoušet něco nového.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_04");	//Jinými slovy, souhlasím!
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_15_05");	//Skvěle! V tom případě si zbal své věci a vyraz do tvrze, budu tam na tebe čekat. A abych nezapomněl, kolik bys chtěl za práci?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_06");	//Když počítám, že ubytování a jídlo je na tebe, 40 zlatých na den by mělo stačit.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_07");	//Úspory nějaké mám, do šantánu už vzhledem ke svému věku nechodím a většinu času stejně budu trávit tam, tak co.
	Info_ClearChoices(dia_addon_erol_agrees_recrdt);
	Info_AddChoice(dia_addon_erol_agrees_recrdt,"Dobře, uvidíme se v tvrzi.",dia_addon_erol_agrees_recrdt_yes);
	Info_AddChoice(dia_addon_erol_agrees_recrdt,"40 zlatých? Musím o tom popřemýšlet...",dia_addon_erol_agrees_recrdt_no);
};

func void dia_addon_erol_agrees_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_yes_15_00");	//Dobře, uvidíme se ve tvrzi. Jestli po tobě budou chtít heslo, tak jim řekni 'dračí poklad'.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_yes_10_01");	//Dobře, je to jen heslo, a žádný vstupní poplatek. Na viděnou!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Erol souhlasil, že pro mne bude pracovat jako správce.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_addon_erol_agrees_recrdt_no()
{
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_no_15_00");	//40 zlatých? Promiň, musím o tom ještě popřemýšlet...
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_ATLAST_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_atlast_recrdt_condition;
	information = dia_addon_erol_atlast_recrdt_info;
	permanent = FALSE;
	description = "Jsi přijat!";
};

func int dia_addon_erol_atlast_recrdt_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_agrees_recrdt) && (VALERANRECRUITEDDT == FALSE) && (EROLRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_atlast_recrdt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Erol_Atlast_RecrDT_15_00");	//Jsi přijat! Jestli po tobě budou chtít heslo, tak jim řekni 'dračí poklad'.
	AI_Output(self,other,"DIA_Addon_Erol_Atlast_RecrDT_10_01");	//Není příliš moudré používat heslo, o kterém sní každý druhý dobrodruh, který o sobě říká že je hledač pokladů a nechce se mu pracovat. Ale to není můj případ - uvidíme se!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Erol souhlasil, že pro mne bude pracovat jako správce.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

instance DIA_EROL_FIRSTCEO(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_condition;
	information = dia_erol_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_erol_firstceo_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 5000))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_info()
{
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_00");	//Čekal jsem, že to nebude úplně ideální, ale tohle...
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_01");	//Krev, prach, bordel a nábytek rozbitej, no dobře s tím si poradíme. Teď do práce.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_02");	//Říkal jsi, že zde chceš vybudovat tábor. Nepletu se?
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_03");	//Ano. Lord Hagen chce, abych v této oblasti nastolil pořádek a z toho důvodu mě byla přenechána tahle tvrz.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_04");	//A ze stejného důvodu souhlasil i Onar.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_05");	//Ale nemůžu spravovat a chránit tuhle tvrz sám, potřebuju lidi. S prvními dvěma ses už seznámil.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_06");	//Líbí se mi tvé plány. Poslouchej, nejprve budeme muset tohle místo trochu zkulturnit.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_07");	//No úplně nejdřív od tebe budu potřebovat určitý obnos na nejnutnější výdaje.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_08");	//Kolik?
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_09");	//Myslím, že 5000 zlatých bude stačit.
	CEONEEDSFIRSTMONEY = TRUE;
};

instance DIA_EROL_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_moneylate_condition;
	information = dia_erol_firstceo_moneylate_info;
	permanent = FALSE;
	description = "Tady je 5000 zlatých.";
};

func int dia_erol_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Erol_FirstCEO_MoneyLate_15_00");	//Tady je 5000 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_01");	//Dobře. S penězi si nyní nemusíme dělat starosti a já můžu začít s parcí.
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_02");	//Mimo to, já i ostaní potřebujem něco k jídlu.
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_03");	//Myslím, že pro začátek by mohlo stačit 50 kusů opečeného masa, 25 kusů čerstvých ryb a 10 chlebů.
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	CEONEEDSFIRSTFOOD = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Pro lidi, co žijí v mé tvrzi potřebuji zásoby jídla - pro začátek 50 kusů opečeného masa, 25 ryb a 10 chlebů.");
};

instance DIA_EROL_FIRSTCEO_FOODLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_foodlate_condition;
	information = dia_erol_firstceo_foodlate_info;
	permanent = FALSE;
	description = "Tady je všechno potřebné jídlo.";
};

func int dia_erol_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_00");	//Tady je všechno potřebné jídlo.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_01");	//Výborně! Teď mám dost peněz i jídla, abych vedl hospodářství bez problémů.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_02");	//Ale bude to stačit jen na určitou dobu. Nechceš přeci, aby se ti to tady celé zhroutilo?
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_03");	//Samozřejmě, že ne. Řekni mi, co mám dělat, abych tomu předešel?
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_04");	//Najdi lidi, co pro tebe budou chtít pracovat.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_05");	//Například lovce, kteří budou zajišťovat maso pro zdejší obyvatele.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_06");	//Také je tady důl, možná v něm ještě zůstala nějaká ruda. Měl bys to prověřit.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_07");	//Jedním slovem, přemýšlej. Hodně cestuješ, ne jako já, tak sežeň lidi, kteří se k tobě budou chtít přidat.
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_08");	//Dobře... Myslím, že mě pár lidí napadá.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_09");	//Hodně štěstí při hledání. A pamatuj, že dodávky jídla a finanční zajištění jsou na tobě a že většina lidí by chtěla jíst třikrát denně.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_10");	//Já se tím nemohu zabývat, jelikož to vyžaduje cestování mimo tvrz, a pak bych se nemohl věnovat svým povinnostem - řízení a organizaci tábora.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_11");	//Nemůžeš dopustit, aby v tvrzi došli peníze a jídlo.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Teď, když mám správce, mohu přemýšlet o vylepšeních a hledání lidí, co budou ochotni pro mě pracovat. Zároveň musím myslet na to, aby v táboře nedošli peníze a jídlo.");
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireCook(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireCook_condition;
	information = DIA_Erol_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireCook_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireCook == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireCook_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_00");	//Do tábora začali přicházet první dodávky potravin. To je dobrá zpráva!
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_01");	//Teď vyvstává otázka jeho skladování. Bez dobrého uskladnění se budou potraviny kazit.
	AI_Output(other,self,"DIA_Erol_CanHireCook_10_02");	//A co navrhuješ?
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_03");	//Podle mého názoru by se šiknul dobrý kuchař, který by si s tím problémem dokázal poradit.
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_04");	//Popřemýšlej nad tím, je to vážná věc.
	AI_Output(other,self,"DIA_Erol_CanHireCook_10_05");	//Dobře, zkusím to nějak zařídit.
	EddaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"V táboře je potřeba kuchař, který by se postaral i o skladování potravin. Zajímalo by mě, kde se na něj poptat?");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireSmith(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireSmith_condition;
	information = DIA_Erol_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireSmith_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireSmith == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireSmith_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_00");	//V táboře započala těžba rudy.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_01");	//Je čas přemýšlet o tom, kde sehnat dobrého kováře. Tím spíš, že kovárnu tady už máme.
	AI_Output(other,self,"DIA_Erol_CanHireSmith_10_02");	//A kde ho mám hledat? Dobrých kovářů je na tomhle ostrově už tak málo.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_03");	//Souhlasím. Ale jestli chceš, aby tvůj tábor za něco stál, tak bys ho měl najít.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_04");	//Nabrousit zbraně, vyspravit zbroj a vyrábět předměty z rudy, kterou těžíme, dokáže jenom kovář.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_05");	//Tak co kdybys radši zapnul mozkové závity a popřemýšlel, kdo by to místo mohl vzít.
	AI_Output(other,self,"DIA_Erol_CanHireSmith_10_06");	//Dobře, zkusím něco vymyslet.
	CarlNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Tábor potřebuje kováře. Bez něho se nemůže dál rozvíjet.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireHealer(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireHealer_condition;
	information = DIA_Erol_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireHealer_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_00");	//V posledních dnech v táboře přibylo stráží.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_01");	//To je dobře, protože jsem nedávno byl napaden několika dravými potvorami.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_02");	//Jeden ze strážců utrpěl v tom souboji zranění, no naštěstí nejsou příliš vážná.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_03");	//Ale jestli to tak půjde dál, tak budem za chvilku bez lidí.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_04");	//Na co narážíš?
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_05");	//Potřebujeme léčitele. A také alchymistu, který dokáže na ošetření takových zranění vařit lektvary.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_06");	//Hmm... To bude větší problém, než s kovářem.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_07");	//Chápu, že to není snadný úkol, ale od jeho vyřešení závisí životy lidí v táboře.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_08");	//Proto bys s tím měl něco udělat.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_09");	//Dobře, seženu nám léčitele.
	SagittaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Tábor potřebuje léčitele. Bez něj tu lidé dlouho nepřežijí.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceSmith(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceSmith_condition;
	information = DIA_Erol_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceSmith_info()
{
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_00");	//Carl začal pracovat v kovárně. Jsem rád že se ti ho povedlo přemluvit, aby pro nás pracoval.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_01");	//Teď si musíme promluvit o tom hlavním.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_03");	//Kovárna musí přinášet zisky, jinak je k ničemu.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_04");	//Dobrá, jaké máš nápady?
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_05");	//Mohli bychom naše zásoby rudy přetavit na ingoty.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_06");	//To je tovar, po kterém je nyní největší poptávka, a taky nám to umožní snížit náklady na provoz tábora.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_07");	//To zní dobře.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_08");	//Mně se to taky líbí. Tak nad tím popřemýšlej. 
	CanSellOre = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Erol navrhl použít zásoby rudy pro výrobu železných ingotů, které pak můžeme dál prodávat. To nám bude poskytovat dostatečný příjem.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceWeapon(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceWeapon_condition;
	information = DIA_Erol_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceWeapon_info()
{
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_01");	//V poslední době v táboře přibylo lidí. Myslím, že bychom měli lépe vyzbrojit naše stráže.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_02");	//Tím spíš, že jsou těžké časy, kolem dokola se to hemží dravou zvěří.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_03");	//Někdo nedávno dokonce viděl poblíž živého skřeta!
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_04");	//Jestli se nebudeme starat o svou bezpečnost, stane se tohle místo brzo kořistí zločinců nebo skřetů.
	AI_Output(other,self,"DIA_Erol_CanProduceWeapon_10_05");	//Co pro to můžeme udělat?
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_06");	//Zbraně nám vyková Carl. Není to sice mistr kovář, ale vykovat dobrý meč dovede.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_07");	//Ale naši chlapci potřebují lepší zbroje. To co mají teď, je nezachrání ani před krvavou mouchou.
	AI_Output(other,self,"DIA_Erol_CanProduceWeapon_10_08");	//Co navrhuješ?
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_13");	//Abychom mohli vyrábět vlastní zbroje, potřebujeme schémata a nákresy.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_14");	//Vím, že jsi navštívil různá místa, tak jsi třeba něco podobného už viděl.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_15");	//Jestli něco získáš, dones to ke mně a já se už postarám, aby naši chlapci nechodili v hadrech.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_EROL_CrawlerArmor(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_CrawlerArmor_condition;
	information = DIA_EROL_CrawlerArmor_info;
	permanent = FALSE;
	description = "Přinesl jsem plány zbroje.";
};

func int DIA_EROL_CrawlerArmor_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EROL_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_EROL_CrawlerArmor_15_00");	//Přinesl jsem plány zbroje.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other,"DIA_EROL_CrawlerArmor_15_01");	//Dobře, dej mi je. Dám ty nákresy Carlovi, aby se s nimi seznámil.
	AI_Output(self,other,"DIA_EROL_CrawlerArmor_15_02");	//Jestli jim porozumí, možná dokáže tu zbroj i vyrobit a za pár dní by už všechny stráže mohly být pořádně vyzbrojeny.
	AI_Output(other,self,"DIA_EROL_CrawlerArmor_15_03");	//V to doufám.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instance DIA_EROL_ArmorDone(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_ArmorDone_condition;
	information = DIA_EROL_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_EROL_ArmorDone_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_EROL_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_00");	//Carl vyrobil zbroje a já je rozdal mezi kluky.
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_01");	//Teď se o jejich bezpečnost už nemusíme starat, zbroje vypadají velmi silně.
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_02");	//Tady, ber! Tenhle kousek jsem nechal vyrobit speciálně pro tebe. Určitě ti přijde vhod.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self,"DIA_EROL_ArmorDone_15_03");	//Děkuju.
};

instance DIA_Erol_BUSINESSACTION(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 21;
	condition = dia_Erol_businessaction_condition;
	information = dia_Erol_businessaction_info;
	permanent = TRUE;
	description = "Chtěl bych něco udělat...";
};

func int dia_Erol_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_businessaction_info()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_15_00");	//Chtěl bych něco udělat.
	AI_Output(self,other,"DIA_Erol_BusinessAction_10_01");	//Co konkrétně?	
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Vybrat zlato z táborové pokladnice.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Uložit zlato do táborové pokladnice.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Prodat proviant ze skladu v táboře.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Uložit proviant do skladu v táboře.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Začít s výrobou železných a rudných ingotů.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Zastavit výrobu železných a rudných ingotů.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_oretake()
{
	AI_Output(other,self,"dia_Erol_businessaction_oretake_15_00");	//Chtěl bych sebrat magickou rudu ze skladu v táboře.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other,"dia_Erol_businessaction_oretake_10_01");	//Bohužel na to teď nemáme dostatečné zásoby rudy.
	}
	else
	{
		AI_Output(self,other,"dia_Erol_businessaction_oretake_10_02");	//Dobře, tady je veškerá magická ruda, co máme.
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Vybrat zlato z táborové pokladnice.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Uložit zlato do táborové pokladnice.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Prodat proviant ze skladu v táboře.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Uložit proviant do skladu v táboře.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Začít s výrobou železných a rudných ingotů.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Zastavit výrobu železných a rudných ingotů.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_irontake()
{
	AI_Output(other,self,"dia_Erol_businessaction_irontake_15_00");	//Chtěl bych sebrat železnou rudu ze skladu v táboře.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other,"dia_Erol_businessaction_irontake_10_01");	//Bohužel na to teď nemáme dostatečné zásoby rudy.
	}
	else
	{
		AI_Output(self,other,"dia_Erol_businessaction_irontake_10_02");	//Dobře, tady je veškerá železná ruda, co máme.
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Vybrat zlato z táborové pokladnice.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Uložit zlato do táborové pokladnice.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Prodat proviant ze skladu v táboře.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Uložit proviant do skladu v táboře.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Začít s výrobou železných a rudných ingotů.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Ukončit výrobu železných a rudných ingotů.",DIA_Erol_businessaction_produce_off);
		};
	};
};


func void dia_Erol_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Vybrat zlato z táborové pokladnice.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Uložit zlato do táborové pokladnice.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Prodat proviant ze skladu v táboře.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Uložit proviant do skladu v táboře.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Začít s výrobou železných a rudných ingotů.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Zastavit výrobu železných ingotů.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Vybrat zlato z táborové pokladnice.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Uložit zlato do táborové pokladnice.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Prodat proviant ze skladu v táboře.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Uložit proviant do skladu v táboře.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Začít s výrobou železných a rudných ingotů.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Zastavit výrobu železných a rudných ingotů.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_back()
{
	Info_ClearChoices(dia_Erol_businessaction);
};

func void dia_Erol_businessaction_budgetgive()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_15_00");	//Chtěl bych uložit zlato do táborové pokladnice.
	AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetGive_10_01");	//O jakou sumu jde?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_small()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Small_15_00");	//500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_medium()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Medium_15_00");	//1500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_huge()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Huge_15_00");	//2500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_15_00");	//Chtěl bych vybrat zlato z táborové pokladnice.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetTake_10_01");	//Bohužel ti teď zlato dát nemohu, mám v kase jen minimum potřebné k provozu tábora.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetTake_10_02");	//A kolik?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_budgettake_small()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Small_15_00");	//500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_medium()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Medium_15_00");	//1500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Huge_15_00");	//2500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"500 zlatých.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"1500 zlatých.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"2500 zlatých.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_15_00");	//Chtěl bych uložit proviant do skladu v táboře.
	AI_Output(self,other,"DIA_Erol_BusinessAction_FoodGive_10_01");	//Jaké množství zásob máš na mysli?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů opečeného masa.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů syrového masa.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů čerstvých ryb.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 bochníků chleba.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_hmf()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_MF_15_00");	//20 kusů opečeného masa.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů opečeného masa.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů syrového masa.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů čerstvých ryb.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 bochníků chleba.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_mf()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_MF_15_00");	//20 kusů syrového masa.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů opečeného masa.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů syrového masa.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů čerstvých ryb.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 bochníků chleba.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_fb()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_FB_15_00");	//20 kusů čerstvých ryb.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů opečeného masa.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů syrového masa.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů čerstvých ryb.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 bochníků chleba.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_bsc()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_BSC_15_00");	//10 bochníků chleba.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů opečeného masa.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů syrového masa.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"20 kusů čerstvých ryb.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 bochníků chleba.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_15_00");	//Chtěl bych prodat proviant ze skladu v táboře.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_FoodSell_10_01");	//Bohužel to teď není možné, mám ve skladu jen minimum potřebné k provozu tábora.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_FoodSell_10_02");	//To by šlo zrealizovat. Kolik jídla chceš prodat?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_Erol_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_Erol_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_Erol_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_Erol_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_Erol_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_Erol_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Small_15_00");	//10 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Medium_15_00");	//25 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Huge_15_00");	//50 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

instance DIA_Erol_MONEYCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_moneycrisis_condition;
	information = dia_Erol_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_00");	//Ještě něco! V táboře nejsou peníze, nemám lidem jak vyplácet mzdu!
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_01");	//Jen tak-tak se mi je podařilo přemluvit, aby neodešli.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_02");	//Nutně potřebujeme zlato!
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_15_03");	//Kolik?
	concatText1 = ConcatStrings("Potřeba ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1," zlatých");
	AI_Print(concatText1);
	Info_ClearChoices(dia_Erol_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_Erol_moneycrisis,"Tady jsou peníze.",dia_Erol_moneycrisis_yes);
	};

	Info_AddChoice(dia_Erol_moneycrisis,"Nemám teď tolik zlata.",dia_Erol_moneycrisis_no);
};

func void dia_Erol_moneycrisis_yes()
{
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_Yes_15_00");	//Tady jsou peníze.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_Yes_07_01");	//Výborně, hned dám příkaz na vyplacení dluhů.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_Erol_moneycrisis_no()
{
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_No_15_00");	//Nemám teď tolik zlata.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_No_07_01");	//Musíš ho sehnat! Nemůžeš být tak nezodpovědný.
	AI_StopProcessInfos(self);
};

instance DIA_Erol_FOODCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_foodcrisis_condition;
	information = dia_Erol_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_foodcrisis_info()
{
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_00");	//Ještě něco! V táboře došel proviant, nemáme nic k jídlu!
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_01");	//Zatím jsem se domluvil s Onarem na dodávkách, ale čeká ho důležitá zakázka a jakmile ji bude muset zrealizovat, tak nám už nebude moci pomoct.
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_02");	//Nutně potřebujeme jídlo! Především maso, ryby a chléb...
	Info_ClearChoices(dia_Erol_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů opečeného masa.",dia_Erol_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů syrového masa.",dia_Erol_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů čerstvých ryb.",dia_Erol_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 10 bochníků chleba.",dia_Erol_foodcrisis_b);
	};

	Info_AddChoice(dia_Erol_foodcrisis,"Nemám u sebe tolik jídla.",dia_Erol_foodcrisis_no);
};

func void dia_Erol_foodcrisis_m()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_M_15_00");	//Tady máš 20 kusů opečeného masa.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_M_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_M_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů opečeného masa.",dia_Erol_foodcrisis_m);
		};
	};
};

func void dia_Erol_foodcrisis_rm()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_RM_15_00");	//Tady máš 20 kusů syrového masa.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_RM_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_RM_M_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů syrového masa.",dia_Erol_foodcrisis_rm);
		};
	};
};

func void dia_Erol_foodcrisis_f()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_F_15_00");	//Tady máš 20 kusů čerstvých ryb.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_F_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_F_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 20 kusů čerstvých ryb.",dia_Erol_foodcrisis_f);
		};
	};
};

func void dia_Erol_foodcrisis_b()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_B_15_00");	//Tady máš 10 bochníků chleba.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_B_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_B_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Tady máš 10 bochníků chleba.",dia_Erol_foodcrisis_b);
		};
	};
};

func void dia_Erol_foodcrisis_no()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_No_15_00");	//Nemám u sebe tolik jídla. Sám žiju z ruky do huby.
	AI_Output(self,other,"DIA_Erol_FoodCrisis_No_07_01");	//Ó, Innosi! Nemůžeš být tak nezodpovědný! Potřebujeme jídlo!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_IGETTHEFOUTOFHERE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 15;
	condition = dia_erol_igetthefoutofhere_condition;
	information = dia_erol_igetthefoutofhere_info;
	permanent = FALSE;
	description = "Chystám se odplout na pevninu.";
};


func int dia_erol_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_igetthefoutofhere_info()
{
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_00");	//Chystám se odplout na pevninu. Můžeš dohlédnout na tvrz?
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_01");	//To jsou nám noviny... chceš odplout navždy, nebo se máš v úmyslu vrátit?
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_02");	//Bojím se, že už se do Khorinisu nevrátím. Jestli máš zájem starat se i nadále o tvrz, tak ti jí přenechám.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_03");	//Á... dobře, když to říkáš. Díky tvému úsilí jsme se zde dobře zabydleli, tak myslím, že mohu i nadále vést úspěšně tento tábor.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_04");	//Teď když se toje tvrz a Onarova farma, staly hlavním pilířem obrany proti skřetům. Můžeme upevnit vztahy s ostatnímy tábory, ve společném úsilí boje proti těmto tvorům.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_05");	//Tak si myslím, že můžeš bez obav odplout.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_06");	//Udělal jsi pro nás všechno co jsi mohl a teď je řada na nás abychom se snažili. Šťastnou cestu!
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_07");	//Děkuji!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_INTOWER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_condition;
	information = dia_erol_intower_info;
	permanent = TRUE;
	description = "Jak to vypadá v tvrzi?";
};

func int dia_erol_intower_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_erol_intower_info()
{
	AI_Output(other,self,"DIA_Erol_InTower_15_00");	//Jak to vypadá v tvrzi?
	AI_Output(self,other,"DIA_Erol_InTower_07_01");	//Dobře! Jestli budem mít dost jídla a peněz, nemusíš se strachovat.
};

instance DIA_EROL_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_orckap_condition;
	information = dia_erol_intower_orckap_info;
	permanent = TRUE;
	description = "Jak to jde v táboře?";
};

func int dia_erol_intower_orckap_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Erol_InTower_OrcKap_15_00");	//Jak to jde v táboře?
	AI_Output(self,other,"DIA_Erol_InTower_OrcKap_07_01");	//Peněz i jídla máme dost, ale z těch skřetů mám strach...
};
