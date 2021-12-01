
instance DIA_Randolph_EXIT(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 999;
	condition = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SchwereLuft(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_SchwereLuft_Condition;
	information = DIA_Randolph_SchwereLuft_Info;
	permanent = FALSE;
	description = "Je všechno v pořádku?";
};


func int DIA_Randolph_SchwereLuft_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SchwereLuft_Info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmm... jakmile tu řekne někdo něco špatně, začne tanec... Takže si dávej pozor na jazyk, jinak se taky nemusíš dožít zítřejšího rána.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Budeš taky bojovat?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Nebudu tady jenom stát a civět, až se něco semele. Ale nehodlám ani nic začínat.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci.");
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_HALLO(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HALLO_Condition;
	information = DIA_Randolph_HALLO_Info;
	permanent = FALSE;
	description = "Je všechno v pořádku?";
};


func int DIA_Randolph_HALLO_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Je všechno v pořádku?
	if(Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Teď, když Kati a Akil odešli do Innosovy říše, asi začnu hospodařit.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Ano, je mi dobře. Ten Alvares byl poslední dobou stále drzejší a drzejší. Dobře, že už je to za námi.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//Co bych zrovna teď potřeboval, je pořádnej odvaz v hostinci.
};


instance DIA_Randolph_Baltram(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Baltram_Condition;
	information = DIA_Randolph_Baltram_Info;
	permanent = FALSE;
	description = "Posílá mě Baltram. Mám tu pro něj vyzvednout nějaký balík.";
};


func int DIA_Randolph_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (MIS_Baltram_ScoutAkil == LOG_Running) && Npc_IsDead(Akil) && Npc_IsDead(Kati) && (Lieferung_Geholt == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Posílá mě Baltram. Mám tu pro něj vyzvednout nějaký balík.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Fajn. Už jsem všechno připravil. Tady je tvůj balík.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};


instance DIA_Randolph_Geschichte(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Geschichte_Condition;
	information = DIA_Randolph_Geschichte_Info;
	permanent = FALSE;
	description = "Ty nejsi zdejší, viď?";
};


func int DIA_Randolph_Geschichte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Ty nejsi zdejší, viď?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Pocházím z jižních ostrovů. Říkalo se, že tady v Korinidu budou zapotřebí lidi kvůli magické rudě.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Ale když jsem se sem dostal, měli tady obrovskou bariéru. A mně se tam zrovna nechtělo. Tak jsem začal pracovat v přístavu.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//No, pak přestaly lodě vydělávat, tak jsem šel pracovat pro Akila. Už jsem dělal horší věci, vážně.
};


instance DIA_Randolph_TAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_TAVERNE_Condition;
	information = DIA_Randolph_TAVERNE_Info;
	description = "Ty jsi vysedával v hostinci?";
};


func int DIA_Randolph_TAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Ty jsi vysedával v hostinci?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//Jo, přesně tak. Ale teď už ne.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//Už si to nemůžu dovolit.
};


instance DIA_Randolph_WASISTINTAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 6;
	condition = DIA_Randolph_WASISTINTAVERNE_Condition;
	information = DIA_Randolph_WASISTINTAVERNE_Info;
	description = "Co se vlastně v tom hostinci děje?";
};


func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_TAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//Co se vlastně v tom hostinci děje?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Hraje se tam.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Ti chlápkové tam soutěžej každej s každým. Kdo vydrží nejvíc piv, vyhrál.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//Nakonec jsem nedělal nic jiného než prohrával, a teď potřebuju vydělat něco peněz.
	Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
	B_LogEntry(TOPIC_Wettsaufen,"V hostinci se uzavírají sázky.");
};


instance DIA_Randolph_GEGENWEN(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 7;
	condition = DIA_Randolph_GEGENWEN_Condition;
	information = DIA_Randolph_GEGENWEN_Info;
	description = "Proti komu jsi hrál?";
};


func int DIA_Randolph_GEGENWEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASISTINTAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_GEGENWEN_Info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Proti komu jsi hrál?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Proti Rukharovi, tomu starýmu budižkničemovi. Co vím, pokaždý mě porazil.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Ale mám takový nejasný tušení, že mi ten mizernej hajzl vždycky říznul pivo kořalkou.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Nejspíš ji má schovanou ve svý truhle. Ten všiváckej hajzl!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Někdo by mu do tý jeho truhly měl nastrčit čistou vodu. Pak by toho mohl do piva přidávat, kolik by chtěl.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Kdybych tak měl dost peněz, abych si to s ním mohl rozdat ještě jednou.
	B_LogEntry(TOPIC_Wettsaufen,"Randolph mi vyprávěl o Rukharovi a o soutěži v pití a také o tom, že už neměl dost peněz, aby s Rukharem změřil síly ještě jednou.");
	B_LogEntry_Quiet(TOPIC_Wettsaufen,"Randolph se domnívá, že Rukhar při souboji v pití podváděl. Rád by mu v truhle vyměnil jednu láhev kořalky za láhev vody.");
};

instance DIA_Randolph_WASBRAUCHSTDU(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 8;
	condition = DIA_Randolph_WASBRAUCHSTDU_Condition;
	information = DIA_Randolph_WASBRAUCHSTDU_Info;
	description = "Kolik na tu soutěž potřebuješ?";
};

func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && (MIS_Rukhar_Wettkampf == LOG_Running) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Kolik na tu soutěž potřebuješ?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 zlatých.
};


instance DIA_Randolph_ICHGEBEDIRGELD(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 9;
	condition = DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information = DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent = TRUE;
	description = "Dám ti ty peníze, aby sis to mohl rozdat s Rukharem.";
};


var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASBRAUCHSTDU) && (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Dám ti ty peníze, aby sis to mohl rozdat s Rukharem.

	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(nadšeně) Fakt? Díky moc. Brzo ti to vrátím.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Když vyhraju, vyklopím ještě o trochu víc, než jsi mi dal. Ještě se uvidíme.
		B_LogEntry(TOPIC_Wettsaufen,"Už jsem si vsadil a teď se na to podívám.");
		B_GivePlayerXP(XP_Randolph_WettkampfStart);
		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
		B_NpcClearObsessionByDMT(self);
		MIS_Rukhar_Wettkampf_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//To je v pořádku. Nemáš dost ani pro sebe.
	};

	B_NpcClearObsessionByDMT(self);
};

instance DIA_Randolph_WETTKAMPFZUENDE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 10;
	condition = DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information = DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent = TRUE;
	description = "Kocovina?";
};

func int DIA_Randolph_WETTKAMPFZUENDE_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Kapitel < 4))
	{
		return TRUE;
	};
};


var int DIA_Randolph_WETTKAMPFZUENDE_OneTime;

func void DIA_Randolph_WETTKAMPFZUENDE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Kocovina?

	if(Rukhar_Won_Wettkampf == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Přímo matka všech kocovin. A já se jí nemůžu zbavit. Už nebudu chlastat, přísahám.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Tvoje peníze jsou fuč. Je mi líto.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Ani nápad. Je mi fajn, vážně.
		if(DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//Tak to tentokrát konečně vyšlo. Ještě jednou dík za peníze. Tady, vezmi si je zpátky.
			CreateInvItems(self,ItMi_Gold,20);
			B_GiveInvItems(self,other,ItMi_Gold,12);
			DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Vypadá to, že Rukhar nevstane zrovna brzy.
	};

	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PERM(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 30;
	condition = DIA_Randolph_PERM_Condition;
	information = DIA_Randolph_PERM_Info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};


func int DIA_Randolph_PERM_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Jsi v pořádku?

		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HealRandolph != LOG_SUCCESS))
		{
			if((DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE) && (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE) && (DIA_Randolph_PERM_GotMoney == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Posíláš mě tam bez jediný zlatky a vůbec se neobtěžuješ mi říct, že to je tak drahé?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta po mně chce 300 zlatých.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Nemůžu ti dát víc než 150 zlatých. Prosím, musíš mi pomoct. Prosím.
				CreateInvItems(self,ItMi_Gold,150);
				B_GiveInvItems(self,other,ItMi_Gold,150);
				DIA_Randolph_PERM_GotMoney = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Jsem vážně na dně. Pokaždé, když přestanu pít, zabíjí mě kocovina.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Existuje lék, který mi může pomoct.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, ta stará bylinkářka, mi ho už připravuje. Ale sám se tam teď nedostanu - všude jsou skřeti.
			};
			Log_CreateTopic(TOPIC_HealRandolph,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph,LOG_Running);
			B_LogEntry(TOPIC_HealRandolph,"Randolph prý nechal pití a poslal mě za bylinkářkou Sagittou, aby mu dala něco na jeho abstinenční příznaky.");
			MIS_HealRandolph = LOG_Running;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Ještě pořád se mi trochu pletou nohy, ale jinak jsem v pohodě.
		};
	};
};


instance DIA_Randolph_Heilung(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 55;
	condition = DIA_Randolph_Heilung_Condition;
	information = DIA_Randolph_Heilung_Info;
	permanent = TRUE;
	description = "Chlast ti nalezl do hlavy, co?";
};


func int DIA_Randolph_Heilung_Condition()
{
	if((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Heilung_Info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Chlast ti nalezl do hlavy, co?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Už si nedám ani panáka. Ne v tomhle životě. To se můžeš vsadit, chlape.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SAGITTAHEAL(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_SAGITTAHEAL_Condition;
	information = DIA_Randolph_SAGITTAHEAL_Info;
	description = "Tady. To by mělo zmírnit abstinenční příznaky.";
};


func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && Npc_HasItems(other,ItPo_HealRandolph_MIS))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Tady. To by mělo zmírnit abstinenční příznaky.
	B_GiveInvItems(other,self,ItPo_HealRandolph_MIS,1);
	if(Npc_IsInState(self,ZS_Pick_FP))
	{
		B_UseItem(self,ItPo_HealRandolph_MIS);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Ach! Díky, chlape. Teď si zase budu moct odpočinout.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Jak se ti za to budu moct kdy odvděčit?
	if(DIA_Randolph_PERM_GotMoney == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Hádám, že těchhle pár mincí je dobrejch akorát k tomu, abych si zachoval tvář. Ale to je všechno, je mi líto.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Zaplatil jsem za tebe spoustu peněz a těch tvých pár ušmudlaných mincí nestačí ani na pokrytí nákladů.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Fajn - v tom případě můžu mluvit o štěstí, že jsem potkal tak vstřícného paladina, nemyslíš?
	};
	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealRandolph);
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PICKPOCKET(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 900;
	condition = DIA_Randolph_PICKPOCKET_Condition;
	information = DIA_Randolph_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Randolph_PICKPOCKET_Condition()
{
	return C_Beklauen(58,2);
};

func void DIA_Randolph_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,Dialog_Back,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

