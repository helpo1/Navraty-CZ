
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_PICKPOCKET(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 900;
	condition = DIA_Addon_Scatty_PICKPOCKET_Condition;
	information = DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	return C_Beklauen(60,90);
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,Dialog_Back,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = "Jak jde obchod?";
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak jde obchod?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Hůř od doby, co byla otevřena krypta.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven už nepotřebuje otroky. Teď kutají zlato na Bloodwynův příkaz.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kopáči si dávají oraz. (mumlá) Kopáči, kteří mají pauzu nejsou dobří pro můj obchod.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Scatty prodává různé věci.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "Bloodwyn? Má tady nějaký úkol?";
};


func int DIA_Addon_Scatty_last_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && !Npc_IsDead(Bloodwyn) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? Má tady nějaký úkol?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje důl. Ale je tady dole jen stěží. Většinu času je s Ravenem v chrámu.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co to 'stěží' znamená doopravdy?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Naposled jsem ho viděl, když opouštěl kryptu...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(uvažuje) Ne, počkej! Myslím, že to bylo když posílal otroky dolů, aby kopali zlato.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Narozdíl od Ravena, ON je velmi zaujat zlatem.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "O jaké kryptě mluvíš?";
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jaké kryptě mluvíš?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Je to prokletá krypta! Její ochránci zabili mnoho mužů!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Ochránci? Mluvíš o kamenných stvořeních? Plochý a kulatý obličej?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Ano! Nesčetněkrát se objevili z hluboké skály.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Věděl jsem, že otevření krypty není dobrý nápad už od začátku.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Ale Raven byl posedlý nápadem tady dolovat. A jen co byla krypta odkryta, on a jeho stráže do ní vstoupili.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "Proč chtěl Raven do té krypty?";
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Proč chtěl Raven do té krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(uvažuje) Hmm... jsi hodně zvědavý. Podobáš se chlápkovi, kterého jsem znal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Byl stejně zvědavý jak ty. A jednoho dne se obrátil k osudu.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Nezakecávej to. Co se stalo v kryptě?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Dobrá... uhm... Je trochu sucho a mě by nevadilo něco k pití...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej Scatty, ne teď. Tohle je důležité, takže, co tam dole Raven dělal?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobrá, dobrá. (dýchá) On... přivolal... něco. Používal slova jazyka, který nezněl známě.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Oslňující světlo se uvolnilo z vnitřku krypty a potom jsem slyšel výkřik. Byl to šokující, démonický výkřik.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//A potom?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To je vše, co jsem viděl. Bloodwyn vyšel z krypty a řekl mi, abych odešel. A to jsem také udělal.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Raven a jeho chlapi opustili chrám krátce potom. A potom už tady dole nebyl vůbec.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "Chtěl bys něco k pití?";
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Chtěl bys něco k pití?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Určitě jsi nemyslel pivo. To je velice vzácné v tomhle táboře.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Možná má Lucia stále někde láhev...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "Na zdraví! (dát pivo)";
};

func int DIA_Addon_Scatty_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken) && Npc_HasItems(other,ItFo_Beer) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Na zdraví.
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Och, tohle chutná skvěle. Díky, chlape, jseš můj hrdina!
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_02");	//Za to, ti prodám tu nejlepší zbroj!
	SCATTY_CANTRADESHC = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = "Co bych měl vědět o kopání zlata?";
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Získat krumpáč a bušit zlato... Každý to může dělat.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Nicméně, pokud do toho bušíš, zlato se roztříští na mnoho malých nugetů. Proto mohou dolovat jen zkušení lidé.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Můžu ti dát pár informací, pokud jsi dostatečně zkušený.
};

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
	description = "Nauč mě těžit zlato.";
};

func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Hero_HackChance < 100))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	if(KNOWHOWPICKGOLD == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Řekni mi něco o těžbě zlata.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Scatty_teach_01_05");	//Nauč mě těžit zlato.
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
	Info_AddChoice(DIA_Addon_Scatty_teach,Dialog_Back,DIA_Addon_Scatty_teach_Back);
	Info_AddChoice(DIA_Addon_Scatty_teach,b_buildlearnstringforgoldhunt("Těžba zlata",B_GetLearnCostTalent(other,NPC_TALENT_GOLDWORK,1)),DIA_Addon_Scatty_teach_GOLDWORK);
};

func void DIA_Addon_Scatty_teach_Back()
{
	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

func void DIA_Addon_Scatty_teach_GOLDWORK()
{
	if(b_teachplayertalentgoldhunt(self,other,NPC_TALENT_GOLDWORK))
	{
		if(SCATTYTEACHMOREGOLD == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Musíš si být vědom, že zlato není jako ruda. Je jemné jako máslo. Pokud udeříš moc silně, rozpadne se na malé kousky!
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Každý kopáč má své vlastní triky jak ze skály získat nějaké pěkné nugety.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//A právě tyto triky odlišují dobré a špatné kopáče.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Také, je to všechno o praxi. Budeš se zlepšovat, pokud tady budeš chvíli pracovat.
			SCATTYTEACHMOREGOLD = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_06");	//Dobře! Já ti to řeknu... (říká)
		};
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = "Bloodwyn je mrtvý.";
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn je mrtvý.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, normálně nepřipíjím na takovéhle zprávy - nicméně, Bloodwyn byl náhodou jeden z chlapů, kteří jsou lepší mrtví.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pojďme obchodovat.";
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


instance DIA_ADDON_SCATTY_ORCINVASION(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_orcinvasion_condition;
	information = dia_addon_scatty_orcinvasion_info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int dia_addon_scatty_orcinvasion_condition()
{
	if((RavenAway == TRUE) && (SCATTY_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_scatty_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_orcinvasion_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_01");	//Špatně - nemysli si, že je to teď lepší! A když skřeti něco podniknou, to si ani neumíš představit?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_02");	//Povím ti to narovinu, chlape. Už teď se mi třepou kolena!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_03");	//Vždyť jsi na živu, co víc potřebuješ?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_04");	//Ano to jsem, ale v táboře mám stále pořádnou kopu různých věcí, bez kterých bych nechtěl odejít.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_05");	//A teď do toho nestrkej nos, nebo riskuješ, že přijdeš o hlavu.
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_06");	//Ne chlape! Ne že bych ti nevěřil, ale teď ještě nezakročím!
	};
};


instance DIA_ADDON_SCATTY_CHEST(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_chest_condition;
	information = dia_addon_scatty_chest_info;
	permanent = FALSE;
	description = "Jak se daří?";
};


func int dia_addon_scatty_chest_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_orcinvasion) && (SCATTYCHEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_chest_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_00");	//Jak se daří?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_01");	//Ale, nijak zvláštně... (ututláva)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_02");	//Pokud se nic neděje, proč jsi tak vystrašený?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_03");	//Dobře chlape... Ano do úst by sis zato prst nestrčil.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_04");	//No tak Scatty? Co je to?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_05");	//Tak dobře... Byla tam moje truhla dovrchu plná zlata!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_06");	//Bylo to tak, že při útěku z tábora nebyl prostě čas vzít si ji a vláčet sebou.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_07");	//Zlato?!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_08");	//Ano!... (naštvaně) Moje zlato, pamatuj. Ale neotevřeš ji, pokud si myslíš, že je vhodná pro tebe.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_09");	//Má velmi silný zámek, který bys nevypáčil za celý život!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_10");	//A jedinej kdo má klíč jsem já! (naštvaně)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_11");	//Dobře dobře proč jsi naštvaný? Nemám v plánu ti vzít tvoje zlato.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_12");	//A co teda chceš?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_13");	//Můžu ti pomoct. Půjdu do tábora a přinesu ti všechno tvoje zlato.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_14");	//(pochybuje) Opravdu to uděláš?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_15");	//Ano udělám to ale jen pokud si zlato rozdělíme na půl a bez ceremónií.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_16");	//(naštvaně) TO CHCEŠ?! 
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_17");	//Já nabizím - ty odmítáš.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_18");	//Eh... Vidím, že nemám na výběr. No i polovina je lepší než nic.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_19");	//Dobře přijimám nabídku... Ale pokud mě podrazíš rozsekám tě na kusy!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_20");	//Neboj se. Nepodrazím tě.
	B_GiveInvItems(self,other,itke_scattychest,1);
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_21");	//Tady máš klíč. A pohni si!
	AI_StopProcessInfos(self);
	SCATTYCHEST = TRUE;
	Log_CreateTopic(TOPIC_SCATTYCHEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_Running);
	B_LogEntry(TOPIC_SCATTYCHEST,"Scatty mi dal klíč od truhly v táboře, která je plná zlata. Dohodli jsme se, že jestli mu ji přinesu dá mi z ní polovinu zlata.");
};


instance DIA_ADDON_SCATTY_DOCHESTIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_dochestit_condition;
	information = dia_addon_scatty_dochestit_info;
	permanent = FALSE;
	description = "Ohledně zlata...";
};


func int dia_addon_scatty_dochestit_condition()
{
	if((SCATTYCHEST == TRUE) && (Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 500) && (SCATTYCHESTDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_dochestit_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_00");	//Ohledně zlata...
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,500);
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_01");	//(uvažuje) Tak se na to podívejme... Hmm...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_02");	//Ano, zdá se, že je jeho množství přesné.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_03");	//Vidím, že jsi férový chlap. Dá se ti věřit narozdíl od těchto zločineckých magorů.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_04");	//A ty jsi o nich někdy pochyboval?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_05");	//No někdy jo a ne málo! Přátelství to zlato odcizuje... (vážně)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_06");	//Co naše dohoda?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_07");	//Dohoda byla vážnější jako zlato... (vážně) Tady máš svůj podíl.
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,250);
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_08");	//Výborně!
	B_LogEntry(TOPIC_SCATTYCHEST,"Donesl jsem Scattymu zlato. Dostal jsem poloviční sumu zlata jak jsme se dohodli.");
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_SUCCESS);
	SCATTYCHESTDONE = TRUE;
};


instance DIA_ADDON_SCATTY_CANTRADEARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_cantradearmor_condition;
	information = dia_addon_scatty_cantradearmor_info;
	permanent = FALSE;
	description = "Prodáváš zbroje?";
};

func int dia_addon_scatty_cantradearmor_condition()
{
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_CANTRADEARMOR == FALSE) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_cantradearmor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_00");	//Prodáváš zbroje?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_05");	//Hmm... Samozřejmě bych ti mohl prodat aj zbroj stráže - ale Bloodwyn by mi usekl hlavu, kdyby se to dozvěděl.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_06");	//Můžu ti ji prodat pouze pod jeho rozkazem. Takže promiň, ale s tímto ti nemůžu pomoct.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_07");	//A kdyby náhodou Bloodwyn zemřel? Prodáš mi potom tu zbroj?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_08");	//No samozřejmě pokud se tak stane... Ale o tom, že zemře pochybuji. (směje se)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_09");	//Jasně.
	SCATTY_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_SCATTY_ARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 3;
	condition = dia_addon_scatty_armor_condition;
	information = dia_addon_scatty_armor_info;
	permanent = TRUE;
	description = "Ukáž mi zbroje.";
};


func int dia_addon_scatty_armor_condition()
{
	if((SCATTY_CANTRADEARMOR == TRUE) && (BLOODWYNISDEAD == TRUE) && (SCATTY_TP == FALSE) && ((SCATTY_ARMORPERM_THREE == FALSE) || (SCATTY_ARMORPERM_FOUR == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_15_01");	//Bloodwyn je mrtvý. Prodáš mi teď tu zbroj?
	AI_Output(self,other,"DIA_Addon_Scatty_Armor_15_02");	//Ano tak jak jsme se dohodli.

	if(SCATTY_CANTRADESHC == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_15_03");	//A ještě jedna věc. Můžu ti nabídnout ty nejlepší zbroje co mám.
	};

	Info_AddChoice(dia_addon_scatty_armor,Dialog_Back,dia_addon_scatty_armor_back);

	if(SCATTY_ARMORPERM_THREE == FALSE)
	{
		Info_AddChoice(dia_addon_scatty_armor,"Lehká zbroj stráže (cena: 1800 zlatých)",dia_addon_scatty_armor_buy3);
	};
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_ARMORPERM_FOUR == FALSE))
	{
		Info_AddChoice(dia_addon_scatty_armor,"Zbroj stráže (cena: 2100 zlatých)",dia_addon_scatty_armor_buy4);
	};
};

func void dia_addon_scatty_armor_back()
{
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy3()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_Buy3_15_00");	//Dobře, beru tuto zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,1800))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy3_06_01");	//Výborně.
		B_GiveInvItems(self,other,itar_grd_l,1);
		SCATTY_ARMORPERM_THREE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy3_06_02");	//Žádné peníze - žádná zbroj.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy4()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_Buy4_15_00");	//Dobře, beru tuto zbroj.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Bloodwyn_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy4_06_01");	//Výborně.
		B_GiveInvItems(self,other,ITAR_Bloodwyn_Addon,1);
		SCATTY_ARMORPERM_FOUR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy4_06_02");	//Žádné peníze - žádná zbroj.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};
