/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};

var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Vítej v 'Kruhu Vody', bratře.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//Měl bys jít za Vatrasem...
	};

	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Jestli máš problém s vlky nebo polními škůdci, tak si běž promluvit s jedním z našich mladších žoldáků.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Můžeš ke mně přijít, až se tu ukážou paladinové.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Co?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Kdykoliv někdo z vás rolníků přijde ke mně, vždycky se mluví o vyvraždění nevinných tvorů.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Nejsem rolník.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Hm... A co tedy potom chceš?
	};
};

var int Cord_SchonmalGefragt;
var int CordAppFT;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát žoldákem!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//A protože ty sotva víš, jak se zachází se zbraní, řekl bych, že jsi tady na špatném místě!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Chtěl bych se stát žoldákem!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Vypadáš spíš jako někdo, kdo se narodil pro práci na poli, chlapče.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Umíš tedy ovládat zbraň?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Už ses zlepšil?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Takže umíš ovládat jednoruční zbraně?

	if(hero.HitChance[NPC_TALENT_1H] >= 30)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Nejsem v tom špatnej.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Noooo... (zamyšleně)
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//A umíš ovládat obouruční zbraně?

	if(hero.HitChance[NPC_TALENT_2H] >= 30)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Umím s nimi zacházet.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Určitě se zlepším!
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 30) || (hero.HitChance[NPC_TALENT_2H] >= 30))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//No, alespoň nejsi úplnej začátečník. V pořádku. Budu pro tebe volit.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Když budeš potřebovat něco dalšího, můžeš se to naučit ode mne.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"Cord pro mě bude hlasovat.");
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry_Quiet(Topic_SoldierTeacher,"Cord mě vycvičí v používání jednoručních a obouručních zbraní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Jinými slovy: jsi mizernej zelenáč!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Každý žoldák se musí spolehnout na své kamarády. Závisí na tom všechny naše životy.
		B_Cord_BeBetter();

		if(CordAppFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
			B_LogEntry(TOPIC_CordProve,"Cord se za mě přimluví až poté, co se naučím lépe bojovat. (Jednoručních a obouručních zbraní: 30 nebo více).");
			CordAppFT = TRUE;
		};
	};
};

instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "Slyšel jsem, že jsi členem 'Kruhu Vody'. Je to tak?";
};

func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if((RangerHelp_gildeSLD == TRUE) && (Cord_SchonmalGefragt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Slyšel jsem, že jsi členem 'Kruhu Vody'. Je to tak?
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Kterej idiot nedržel hubu?

		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee mi o tom řekl.
		};
		if(SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares ti vzkazuje, abys mi pomohl, když ti řeknu, že žiju pod jeho ochrannými křídly.
		};
	};

	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(povzdechne si) To vypadá, že tě teď budu muset přijmout, že?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Dobrá, co potřebuješ?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//Dobře si rozmysli co mě odpovíš. Protože jestli se mě nebude líbit co uslyším, sedřu z tebe kůži.
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Právě teď nic nepotřebuji, udělám si to posvém.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tvou zbroj.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Chci tvou zbraň!",DIA_Addon_Cord_YouAreRanger_waffe);

	if((Cord_Approved == FALSE) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && (Cord_RangerHelp_Fight == FALSE))
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Nauč mě, jak bojovat!",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Pomoz mi dostat se k žoldákům.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(hrozivě) A nechtěj být nadohled, pokud uslyším, že jsi neudržel jazyk za zuby. To ti říkám pouze jednou, jasný?
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(rozzlobeně) Dobrá, tady to máš. Zašel jsi příliš daleko, toho budeš litovat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Chci tvou zbroj.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Ještě jednou to zkusíš a budeš sbírat zuby ze země.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Chci tvou zbraň!

	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//Opravdu?... (výhružně)
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(zubí se) Tak schválně, zkus to!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Rád bych měl tvou pozici na farmě.

	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Nezkoušej ze mě udělat hlupáka kámo, jinak ti zpřelámu každou kost v těle.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};


var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Nauč mě jak bojovat.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Dobrá, co dál?
	Cord_RangerHelp_Fight = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To je vše.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Mohl bys mi pomoct dostat se k žoldákům.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//Ha, ha, ha... (směje se) Ááá, to bude sranda. Dobrá, zkusím to. Co dál?
	Cord_RangerHelp_GetSLD = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"To je vše.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Zaplať mi a nebudu o tom mluvit.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Ale já se vydírat nenechám ty bastarde.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//Právě nic nepotřebuji. Udělám si vše raději sám.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Jak chceš.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//To je vše.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//Hádám, že to by nemělo být těžké.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = "Problém je vyřešen.";
};

var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Problém je vyřešen.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Och, tak to vypadá, že ti nemůžu pomoct.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//No, že ti nemůžu pomoct.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Nebo bys chtěl, abych bojoval s každým žoldákem jen proto, aby tě přijali?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Musíš to udělat sám.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Dobře, udělej to a pak se vrať ke mě.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Dobře, to je jednoduché. Vrať se zítra až to bude všechno vyřešené.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Ale rád bych, kdyby si za to pro mě něco udělal.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//A co by to mělo být?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Je tu malý tábor banditů v horách na jihovýchod odtud.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//Půjdeš přímo na jihovýchod odsud, měl bys tam vidět věž.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Jeden z mých mužů jménem Patrick tam šel před několika dny. Chtěl s těmi bastardy na něčem domluvit.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//Říkal jsem mu, aby tam nechodil, ale ten blbec mě neposlouchal.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Možná jim padl za oběť. Ale nevím to jistě.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Musíš zjistit, co se mu stalo.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Cord se postará o Torlofovu zkoušku. Cordův kamarád Patrick se ztratil. Mám jít do tábora banditů nedaleko odsud na jihovýchodě a podívat se, zdali tam Patrick není.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"Zapomeň na to. Úkol je mnohem těžší než ten Torlofův.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"A jak si mohu být jistý, že na mě nezaútočí, jakmile mě uvidí?",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Zapomeň na to. Úkol je mnohem těžší než ten Torlofův.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Neboj, takový neškodný chlapík se jim dozajista podezřelý zdát nebude.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//Sám to udělat nemůžu. Jakmile vidí žoldáka tasí zbraně.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//A jak si mohu být jistý, že na mě nezaútočí, jakmile mě uvidí?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Protože znám jméno jejich vůdce. Jeho jméno je DEXTER. Prostě řekneš, že ho znáš.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//To si pak ti chlápci dvakrát rozmyslí, než na tebe zaútočí.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Samozřejmě to může být nebezpečné dobrodružství.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Ale ty to nějak zvládneš.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Vůdce banditů se jmenuje Dexter.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Žoldák Cord hledá svého přítele Patricka.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Pomoz mi stát se žoldákem.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Podívej. Musíš udělat Torlofovu zkoušku, jestli chceš projít. To je jisté.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Už jsi o tom řekl Torlofovi?

	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Ještě ne.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Ano. Řekl mi o zkoušce a dalších věcí...
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Aha. A co přesně je ten test?

		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Ještě jsem se k tomu nedostal.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//Mám vybrat nájemné od Sekoba.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//Mám se postarat o domobranu u Bengarovy farmy.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = "Byl jsem za tím Dextrem.";
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE) || Npc_IsDead(BDT_1060_Dexter)) && (MIS_Addon_Cord_Look4Patrick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Byl jsem za tím Dextrem.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//Dobrá, a?!
	if(Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Je mrtev.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Nicméně jsem nenašel ani stopu po tvém příteli Patrickovi.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter si na něj vzpomněl, ale řekl mi, že nenavštívil tábor.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//A máš jistotu, že ti Dexter nelhal?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Ne, to nemám. Ale to jsou všechny informace, které jsem byl schopen sehnat.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Ten chlap prostě zmizel beze stopy.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Dobrá, dodržel jsi svou část dohody...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Co Torlofův test?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Prostě se vrať k Torlofovi. Považuj test za zvládnutý. Jen mu řekni, že se o to postarám.
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = Sld_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = "Patrick se vrátil.";
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if((Npc_GetDistToWP(STRF_1123_Addon_Patrick_NW,"NW_BIGFARM_PATRICK") <= 10000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick se vrátil.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Á, ani jsem nevěřil, že ho ještě někdy uvidím. Ty...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hej, udělej mi laskavost.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Ano?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Uchraň mě svého vděku.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Neplánoval jsem ti děkovat.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Co?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(směje se) Jen jsem ti chtěl říct, že jsi strašný blázen.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(směje se) Opatruj se!
	AI_StopProcessInfos(self);
};

instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Jaké jsou výhody jednoručních a obouručních zbraní?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Jaké jsou výhody jednoručních a obouručních zbraní?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Dobrá otázka. Vidím, že téhle věci věnuješ dostatečnou pozornost.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Jednoruční zbraně jsou rychlejší, ale trochu slabší.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Obouruční zbraně způsobují větší poškození, ale nemůžeš s nimi útočit tak rychle.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//K ovládání obouručních zbraní také potřebuješ více síly. To znamená dodatečný trénink.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Jediný způsob, jak se stát skutečně dobrým, je vložit do toho mnoho úsilí.
};

var int Cord_Merke_1h;
var int Cord_Merke_2h;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě bojovat!";
};

func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Nebudu plýtvat svým časem se začátečníky.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Nauč mě bojovat!

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Mohu tě naučit používat jakoukoliv zbraň. Čím začneme?
		Cord_Merke_1h = hero.HitChance[NPC_TALENT_1H];
		Cord_Merke_2h = hero.HitChance[NPC_TALENT_2H];
		Info_ClearChoices(DIA_Cord_Teach);
		Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Já trénuji pouze žoldáky nebo vhodné uchazeče!
		B_Cord_Zeitverschwendung();
		B_Cord_BeBetter();
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Jestli ses už zlepšil, tak v tom pokračuj!
	};

	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Nauč mě rychleji obnovovat svou výdrž.

	kosten = 5;
	money = 10000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace výdrže");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
		};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Regenerace výdrže (VB: 5, cena: 10000 zlatých)",DIA_Cord_Teach_RegenStam);
	};
};

instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};


//----------------------------------------------------Loa-----------------------------------

instance DIA_Loa_EXIT(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 999;
	condition = DIA_Loa_EXIT_Condition;
	information = DIA_Loa_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Loa_EXIT_Condition()
{
	if((LoaOnParty == FALSE) || (LoaOverParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EXIT_Info()
{
	if((LoaBonus_01 == TRUE) && (LoaBonus_02 == TRUE) && (LoaBonus_03 == TRUE) && (MIS_LoaRomance != LOG_Success))
	{
		MIS_LoaRomance = LOG_Success;
		Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Success);

		if((KAPITELORCATC == FALSE) && (LoaLover == FALSE) && (LoaAntiBonus == FALSE))
		{
			LoaLover = TRUE;
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Loa_Hello(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_Hello_Condition;
	information = DIA_Loa_Hello_Info;
	permanent = FALSE;
	description = "Tvoje tvář se mě zdá povědomá.";
};

func int DIA_Loa_Hello_Condition()
{
	return TRUE;
};

func void DIA_Loa_Hello_Info()
{
	AI_Output(other,self,"DIA_Loa_Hello_01_01");	//Tvoje tvář se mě zdá povědomá.
	AI_Output(self,other,"DIA_Loa_Hello_01_02");	//Hmm... (uznale) Ano, máš pravdu, také si na tebe vzpomínám.
	AI_Output(self,other,"DIA_Loa_Hello_01_03");	//Ach ano, teď jsem si vzpomněla.
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_Hello,"Mhm... nepovídej!",DIA_Loa_Hello_Later);
};

func void DIA_Loa_Hello_Later()
{
	PlayVideo("RET2_LoaMeet.bik");
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_01");	//Tak co? (smích) Vzpomínáš si?
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_02");	//To si piš! Jo, ty jsi mě tenkrát praštila.
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_03");	//Byl jsem dlouho v bezvědomí a když jsem se probral už jsi byla pryč.
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_04");	//Promiň. Tenkrát jsem nevěděla, jestli ti můžu důvěřovat.
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_05");	//A teď už to víš?
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_06");	//Teď to taky nevím! Ale tentokrát, ušetřím tvou tvář. 
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_07");	//To doufám.
};

instance DIA_Loa_MineTale(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_MineTale_Condition;
	information = DIA_Loa_MineTale_Info;
	permanent = FALSE;
	description = "Taky jsi byla v Hornickém údolí?";
};

func int DIA_Loa_MineTale_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Hello))
	{
		return TRUE;
	};
};

func void DIA_Loa_MineTale_Info()
{
	AI_Output(other,self,"DIA_Loa_MineTale_01_01");	//Taky jsi byla v Hornickém údolí?
	AI_Output(self,other,"DIA_Loa_MineTale_01_02");	//Ano... (smutně) Bohužel, jsem se tam taky dostala. 
	AI_Output(self,other,"DIA_Loa_MineTale_01_03");	//Ale to už je dávno! A nemá cenu na to vzpomínat.
};

instance DIA_Loa_WhatNew(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_WhatNew_Condition;
	information = DIA_Loa_WhatNew_Info;
	permanent = TRUE;
	description = "Co je nového?";
};

func int DIA_Loa_WhatNew_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Hello) && (LoveBonus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_WhatNew_Info()
{
	AI_Output(other,self,"DIA_Loa_WhatNew_01_01");	//Co je nového?
	AI_Output(self,other,"DIA_Loa_WhatNew_01_02");	//Místo toho, abys mě mučil hloupýma otázkama, můžeš dělat něco užitečnýho. 
	AI_Output(other,self,"DIA_Loa_WhatNew_01_03");	//Máš pravdu, promiň.
};

//---------------romantik--------------------------------

instance DIA_Loa_Romantic(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Romantic_Condition;
	information = DIA_Loa_Romantic_Info;
	permanent = FALSE;
	description = "Moc se mě líbil tvůj tanec!";
};

func int DIA_Loa_Romantic_Condition()
{
	if((ConcertLoaBonus == TRUE) && (Npc_KnowsInfo(other,DIA_Loa_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Romantic_Info()
{
	AI_Output(other,self,"DIA_Loa_Romantic_01_01");	//Moc se mě líbil tvůj tanec!
	AI_Output(self,other,"DIA_Loa_Romantic_01_02");	//Nepodlézej! Jestli si myslíš, že mě dostaneš do postele, tak máš smůlu. Nejsem z těch co hledáš!
	AI_Output(self,other,"DIA_Loa_Romantic_01_03");	//To si raději zajdi do bordelu.
	AI_Output(other,self,"DIA_Loa_Romantic_01_04");	//Co tě nemá! Jen jsem chtěl pochválit tvůj talent. 
	AI_Output(self,other,"DIA_Loa_Romantic_01_05");	//No, ze začátku tak mluvěj všichni, a pak to na mě zkoušej. Myslím, že nejsi výjimkou!
	AI_Output(self,other,"DIA_Loa_Romantic_01_06");	//Ale varuji tě, jestli něco zkusíš... špatně skončíš! Jako tenkrát na molu. Nebo jsi zapomněl?
	AI_Output(other,self,"DIA_Loa_Romantic_01_07");	//Na to se nedá zapomenout.
};

instance DIA_Loa_HowGetYou(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_HowGetYou_Condition;
	information = DIA_Loa_HowGetYou_Info;
	permanent = FALSE;
	description = "Myslím, že jsi na muže příliš tvrdá.";
};

func int DIA_Loa_HowGetYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Romantic))
	{
		return TRUE;
	};
};

func void DIA_Loa_HowGetYou_Info()
{
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_01");	//Myslím, že jsi na muže příliš tvrdá.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_02");	//A co s váma? Ničím se nelišíte od neotesaných pařezů, kteří ani nevědí, jak zaujmout slušné děvče.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_03");	//Všichni myslíte furt na to jedno.
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_04");	//A nemohla bys mě sdělit, jak na tebe mám udělat dobrý dojem?
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_05");	//U Innose! Tak dobře! Hlavní je aby se to dívce líbilo a aby se pak cítila důležitá. Chápeš?
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_06");	//Moc ne. Můžeš dát konkrétní příklad?
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_07");	//No... možná napsat pro ni báseň, dát ji nějaký šperk a nebo jenom květinu.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_08");	//Jen ne ten plevel, co roste za Theklinou hospodou. Musí být opravdu krásná!
	MIS_LoaRomance = LOG_Running;
	Log_CreateTopic(TOPIC_LoaRomance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Running);
	B_LogEntry(TOPIC_LoaRomance,"Pokud chci uspět u Loy, musím na ni zapůsobit galantním způsobem.");
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_HowGetYou,"Jaký druh květin se ti líbí?",DIA_Loa_Hello_Flower);
	Info_AddChoice(DIA_Loa_HowGetYou,"Máš na mysli nějaký speciální šperk?",DIA_Loa_Hello_Pearl);
	Info_AddChoice(DIA_Loa_HowGetYou,"Pochybuji, že existují básníci mezi žoldáky.",DIA_Loa_Hello_Stihi);
};

func void DIA_Loa_Hello_Flower()
{
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_01");	//A jaké květiny se ti líbí?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_02");	//Těžko říct! Všechny květiny jsou svým způsobem krásné.
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_03");	//Nemáš nějaké oblíbené?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_04");	//Hmm... Možná, mezi všemi, je nejhezčí... modrý sléz.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_05");	//Rostl v blízkosti našeho domu v Sildenu a vždycky mě připomínal nejšťastnější roky mého života.
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_06");	//Chceš přinést kytici těchto květů?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_07");	//Bylo by to od tebe hezké, ale obávám se, že v této části souostroví se s nima nesetkáš.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_08");	//Otec říkal, že rostou pouze na pevnině a nikde jinde. 
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_09");	//Zkusím něco vymyslet.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_10");	//Doře, budu doufat.
	LoaCase_01 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Loa by ráda, kdybych jí přines kytici modrého slézu.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Musím jít.",DIA_Loa_Hello_Buy);		
	};
};

func void DIA_Loa_Hello_Pearl()
{
	AI_Output(other,self,"DIA_Loa_Hello_Pearl_01_01");	//Máš na mysli nějaké speciální dekorace?
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_02");	//Hmm... Nevím jak ostatní, ale já jsem vždycky toužila po náhrdelníku z černých perel!
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_03");	//Jeho barvy jsou tak fascinující, že se od něho nedají odtrhnout oči.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_04");	//Ach... Kdysi jsem měla takový šperk. Stále jsem ho nosila jako talisman, který přináší štěstí.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_05");	//Ale, bohužel královská stráž mě ho sebrala, když mě poslali do Hornického údolí.
	AI_Output(other,self,"DIA_Loa_Hello_Pearl_01_06");	//A co ti brání pořídit si jiný?
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_07");	//Není to tak snadné! Černé perly jsou velmi vzácné a najít jednu je považováno za velký úspěch.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_08");	//A co teprve na celý náhrdelník...
	LoaCase_02 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Loa vždycky snila o náhrdelníku z černých perel. Pokud chci upoutat její pozornost, měl bych se pokusit je získat.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Musím jít.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Stihi()
{
	AI_Output(other,self,"DIA_Loa_Hello_Stihi_01_01");	//Pochybuju, že mezi žoldáky najdu pravé básníky.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_02");	//To máš pravdu! Měl by být kultivované povahy a tak trochu pohodář.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_03");	//A tito romantici, nesloží ani větičku, zejména když si daj flaštičku.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_04");	//Možná někdo z bývalých trestanců.
	LoaCase_03 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Jak jsem vyrozuměl Loa miluje krásné básně. Měl bych najít něco podobného, jestli na ní chci udělat dojem.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Musím jít.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Buy()
{
	AI_Output(other,self,"DIA_Loa_Hello_Buy_01_01");	//Musím jít
	AI_Output(self,other,"DIA_Loa_Hello_Buy_01_02");	//Na viděnou.
	AI_StopProcessInfos(self);
};

instance DIA_Loa_Give_Flower(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Flower_Condition;
	information = DIA_Loa_Give_Flower_Info;
	permanent = FALSE;
	description = "Podívej co jsem ti přinesl.";
};

func int DIA_Loa_Give_Flower_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_01 == TRUE) && (LoaCase_01_Done == FALSE) && (Npc_HasItems(other,ItPl_ExBlueMalve) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Flower_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Loa_Give_Flower_01_01");	//Podívej co jsem ti přinesl.
	B_GiveInvItems(other,self,ItPl_ExBlueMalve,1);
	Npc_RemoveInvItems(self,ItPl_ExBlueMalve,1);
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_02");	//Neuvěřitelné! Kde si je sehnal?!
	AI_Output(other,self,"DIA_Loa_Give_Flower_01_03");	//Dlouhý příběh. Doufám, že ti udělají radost.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_04");	//Nemám slov! Ani si nedokážeš představit, jak jsem šťastná, že je opět vidím a cítím jejich vůni.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_05");	//Abych byla upřímná, nečekala jsem, že je seženeš.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_06");	//Tady, vem si to zlato, jako projev mé vděčnosti.
	LoaCase_01_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Přinesl jsem Loi modrý sléz. Byla prostě nadšená!");
	Info_ClearChoices(DIA_Loa_Give_Flower);
	Info_AddChoice(DIA_Loa_Give_Flower,"Není nutný!",DIA_Loa_Give_Flower_No);
	Info_AddChoice(DIA_Loa_Give_Flower,"Díky!",DIA_Loa_Give_Flower_Yes);
};

func void DIA_Loa_Give_Flower_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Flower_No_01_01");	//To nestojí za to! Poděkování úplně stačí.
	LoaBonus_01 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

func void DIA_Loa_Give_Flower_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Flower_Yes_01_01");	//Děkuji! Zlato se vždycky hodí.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	LoaBonus_01 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

instance DIA_Loa_Give_Pearl(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Pearl_Condition;
	information = DIA_Loa_Give_Pearl_Info;
	permanent = FALSE;
	description = "Tady, přinesl jsem ti náhrdelník.";
};

func int DIA_Loa_Give_Pearl_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (Npc_HasItems(other,ItMi_BlackPearlNeckle) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Pearl_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_01");	//Tady, přinesl jsem ti náhrdelník.
	B_GiveInvItems(other,self,ItMi_BlackPearlNeckle,1);
	Npc_RemoveInvItems(self,ItMi_BlackPearlNeckle,1);
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_02");	//Ale... jak se ti podařilo sehnat tolik perel?!
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_03");	//Přiznám se, že to nebylo vůbec lehké. Prošel jsem celý Khorinis a nejen ten.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_04");	//Samé perly, oni jsou skutečně všechny pravé?
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_05");	//Samozřejmě! Podívej se na ty barvy... jak hrají ve světle.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_06");	//Neuvěřitelné. Nikdy by mě nenapadlo, že vezmeš moje slova tak vážně.
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_07");	//Jak vidíš, beru tvé slova naprosto vážně.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_08");	//Pak tedy... Přijmi mé upřímné poděkování za tento dar. Je opravdu krásný.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_09");	//A já ti dám na oplátku magický prsten, za veškeré tvé úsilí.
	LoaCase_02_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Přinesl jsem Loi náhrdelník z perel, podle toho jak se tvářila, se jí moc líbil.");
	Info_ClearChoices(DIA_Loa_Give_Pearl);
	Info_AddChoice(DIA_Loa_Give_Pearl,"Nemohu ho přijmout!",DIA_Loa_Give_Pearl_No);
	Info_AddChoice(DIA_Loa_Give_Pearl,"Je velmi užitečný.",DIA_Loa_Give_Pearl_Yes);
};

func void DIA_Loa_Give_Pearl_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Pearl_No_01_01");	//To nemohu přijmout! Myslím, že by pro tebe bylo velmi těžké se s ním rozloučit.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_No_01_02");	//Máš pravdu... (povzdech) Je pro mne velmi cenný jako památka! Bohužel nemám nic jiného abych ti poděkovala.
	AI_Output(other,self,"DIA_Loa_Give_Pearl_No_01_03");	//To není nutné. Nech si prsten u sebe.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_No_01_04");	//No dobrá, ať je po tvém.
	LoaBonus_02 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

func void DIA_Loa_Give_Pearl_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Pearl_Yes_01_01");	//Je velmi užitečný. Děkuji!
	B_GiveInvItems(self,other,ItRi_Loa,1);
	AI_Output(self,other,"DIA_Loa_Give_Pearl_Yes_01_02");	//Není zač.
	LoaBonus_02 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

instance DIA_Loa_Give_Stihi(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Stihi_Condition;
	information = DIA_Loa_Give_Stihi_Info;
	permanent = FALSE;
	description = "Ohledně básně.";
};

func int DIA_Loa_Give_Stihi_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_03 == TRUE) && (LoaCase_03_Done == FALSE) && (Npc_HasItems(other,MYRTANAS_LYRIK) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Stihi_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_01");	//Ohledně básně.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_02");	//Co, rozhodl ses, že mě překvapíš, svýma básnickýma dovednostma?
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_03");	//Ne, jen jsem myslel, že bys mohla mít zájem, se na to podívat.
	B_GiveInvItems(other,self,MYRTANAS_LYRIK,1);
	Npc_RemoveInvItems(self,MYRTANAS_LYRIK,1);
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_04");	//Hmm... (čte) Docela zajímavá knížka! Není to tak krásně napsané, ale je to mnohem lepší než poslouchat plkání opilých žoldáků.
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_05");	//Můžeš si ji ponechat.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_06");	//Opravdu? Pak s radostí přímám váš dar.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_07");	//To jistě rozzáří mé nudné večery strávené na této farmě. Děkuji!
	LoaCase_03_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Přinesl jsem Loi knihu básní, myslím, že se jí líbí.");
	Info_ClearChoices(DIA_Loa_Give_Stihi);
	Info_AddChoice(DIA_Loa_Give_Stihi,"Užij si ji!",DIA_Loa_Give_Stihi_No);
	Info_AddChoice(DIA_Loa_Give_Stihi,"Myslím, že mi dlužíš odměnu.",DIA_Loa_Give_Stihi_Yes);
};

func void DIA_Loa_Give_Stihi_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Stihi_No_01_01");	//Užij si ji!
	AI_Output(self,other,"DIA_Loa_Give_Stihi_No_01_02");	//Děkuji... (smích) 
	LoaBonus_03 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

func void DIA_Loa_Give_Stihi_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Stihi_Yes_01_01");	//Myslím, že mi dlužíš odměnu.
	B_GiveInvItems(self,other,ItFo_Wine_Loa,1);
	AI_Output(self,other,"DIA_Loa_Give_Stihi_Yes_01_02");	//Samozřejmě! Tady, vezmi si tuto láhev vína.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_Yes_01_03");	//Věřím, že přijde k chuti.
	AI_Output(other,self,"DIA_Loa_Give_Stihi_Yes_01_04");	//O tom nepochybuj.
	LoaBonus_03 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

instance DIA_Loa_Give_Lover(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Lover_Condition;
	information = DIA_Loa_Give_Lover_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_Give_Lover_Condition()
{
	if((LoaLover == TRUE) && (LoaLoverDay == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Lover_Info()
{
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_01");	//Počkej chvilku!
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_02");	//Poslouchám.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_03");	//Víš, tolik jsi toho pro mně udělal a já jsem se ti ničím neodměnila.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_04");	//To není nutné.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_05");	//A přesto... Můžeš přijít zítra o půlnoci k majáku, nedaleko od města.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_06");	//Proč?
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_07");	//Řekněme, že ti chci něco ukázat. Neboj se, určitě se ti to bude líbit.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_08");	//Dobře budu o tvém návrhu přemýšlet.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_09");	//Výborně, tak nepřemýšlej dlouho...
	LoaLoverDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Loa_ComeLH(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_ComeLH_Condition;
	information = DIA_Loa_ComeLH_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_ComeLH_Condition()
{
	if((MIS_LoaRomance == LOG_Success) && (LoaInLH == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_ComeLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_ComeLH_01_01");	//Tak jsem tady.
	AI_Output(self,other,"DIA_Loa_ComeLH_01_02");	//Vidím, a dokonce včas... (s úsměvem)
	AI_Output(other,self,"DIA_Loa_ComeLH_01_03");	//Když o to žádá taková žena jako ty, nemohl jsem tě nechat čekat.
	AI_Output(self,other,"DIA_Loa_ComeLH_01_04");	//Nepochybně... (směje se) I když, úplně jistá jsem si nebyla.
	AI_Output(other,self,"DIA_Loa_ComeLH_01_05");	//Přišel jsem nebo ne?
	AI_Output(self,other,"DIA_Loa_ComeLH_01_06");	//Ano... (něžně) Kdyby ne, o hodně bys přišel.
	AI_Output(other,self,"DIA_Loa_ComeLH_01_07");	//Hmmm... Například?
	AI_Output(self,other,"DIA_Loa_ComeLH_01_08");	//Jako například... (zamyšleně) Máš příležitost obdivovat některé krásy, které se ti otvírají při pohledu z výšky majáku. 
	AI_Output(self,other,"DIA_Loa_ComeLH_01_09");	//Mimochodem, se ti líbí výhled?
	LoaTellInLH = TRUE;
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Impozantní!",DIA_Loa_ComeLH_S_03);
	Info_AddChoice(DIA_Loa_ComeLH,"Opravdu, je odsud lepší výhled.",DIA_Loa_ComeLH_S_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Myslím, že přišel ten správný čas něco podniknout.",DIA_Loa_ComeLH_S_01);
};

func void DIA_Loa_ComeLH_S_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_03_01");	//Impozantní!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_02");	//Máš pravdu... (povzdech) Je zde velmi krásně! Často sem chodívám koukat se na hvězdy a moře...
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_03");	//Je v nich něco zvláštního, co uklidní tvůj vnitřní svět. 
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_04");	//Tak uklidňujícího, že zapomínáš na strasti a problémy tohoto světa.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_05");	//O čem přemýšlíš?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Myslím, že o tom o čem ty.",DIA_Loa_ComeLH_M_01);
	Info_AddChoice(DIA_Loa_ComeLH,"O ničem.",DIA_Loa_ComeLH_M_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Promiň, jen ztrácíme čas.",DIA_Loa_ComeLH_M_03);
};

func void DIA_Loa_ComeLH_S_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_01");	//Opravdu, je odsud lepší výhled.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_02");	//Hmmm... a na co konkrétně?
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_03");	//Například na tebe! Pohled na tebe je mnohem příjemnější, než všechny ty krásy kolem.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_04");	//A to je, kompliment?
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_05");	//A proč ne. Koneckonců, každý má vlastní ideu o kráse!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_06");	//A ty věříš, že po tomhle se ti vrhnu kolem krku. 
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_07");	//To je krásná představa.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_08");	//Ó, Innosi... (zavrtí hlavou) Jsi jako ostatní muži, myslíš jen na jedinou věc.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_09");	//Myslíš také na něco jiného?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Obvykle, mám jasnější mysl.",DIA_Loa_ComeLH_H_03);
	Info_AddChoice(DIA_Loa_ComeLH,"Samo sebou.",DIA_Loa_ComeLH_H_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Nyní, nedokážu myslet na nic jiného.",DIA_Loa_ComeLH_H_01);
};

func void DIA_Loa_ComeLH_S_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_01");	//Myslím, že přišel ten správný čas něco podniknout.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_02");	//O čem mluvíš?!
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_03");	//Myslím, že jsi mě sem nepozvala jeno kvůli tomu krásnému výhledu.
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_04");	//Tak pojď, pomůžu ti sundat šaty.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_05");	//Co?!... (vztekle) 
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_06");	//Slyšelas! Nebo jsem se nevyjádřil jasně?
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_07");	//Opovaž se mě dotknout, ty parchante!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_08");	//Opravdu jsem si myslela, že nejsi takový zatracený parchant jako ostatní.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_09");	//Jak vidět, spletla jsem se!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_10");	//A teď vypadni, než ti přidám něco na památku!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_M_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_01");	//Myslím, že o tom o čem ty.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_02");	//Opravdu?!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_03");	//Víš, někdy jsem ze všeho tak unavený, že chci jen v klidu sedět a sledovat zapadající slunce.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_04");	//V takových chvílích si uvědomuji, že život není jen boj o přežití a stále nekončící války.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_05");	//Že existují i jiné věci, které tě naplňují a umožňují ti vidět mnohem víc než se na první pohled zdá.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_06");	//Nikdy jsem si nemyslela, že jsi schopen tak hluboké myšlenky!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_07");	//A to proč?
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_08");	//Protože na to prostě nevypadáš...
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_09");	//... Neotesaný rváč! To znám.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_10");	//Na druhou stranu je příjemné vědět, že ve mě někdo vidí něco víc než rváče.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_11");	//Jak ti jen rozumím... (povzdechne si) 
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_12");	//Víš, nestává se často abych potkala někoho jako jsi ty.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_13");	//Většina těch, které jsem potkala ve mě viděli jenom jedno. A vůbec je nezajímalo, co skutečně cítím.
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Nejsem jeden z nich.",DIA_Loa_ComeLH_F_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Chápu je.",DIA_Loa_ComeLH_F_01);
};

func void DIA_Loa_ComeLH_M_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_01");	//O ničem.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_03");	//Nemůžu na nic myslet, když jsi tady se mnou.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_04");	//Jak to myslíš?!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_05");	//Tak, že přichází důležitá chvíle.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_06");	//Jsem si jistý, že jsi mě sem nepozvala jenom kvůli tomu krásnému výhledu.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_07");	//Ach, ano... (směje se) Samozřejmě! Co jiného jsem mohla od tebe v této situaci očekávat. 
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_08");	//Ale obávám se, že nemám co nabídnout.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_09");	//Jseš si jistá?
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_10");	//O tom nepochybuj. Takže, možná bude lepší volbou bordel!
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_11");	//Tam tě určitě rádi uvidí!
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_12");	//A já už musím jít... Měj se!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_M_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_01");	//Promiň, jen ztrácíme čas.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_02");	//Co tím myslíš?!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_03");	//Jsem si jistý, že jsi mě sem nepozvala jenom kvůli výhledu.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_04");	//Tak co s tím něco udělat.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_05");	//V žádném případě s tebou nic dělat nebudu.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_06");	//A jestli se mě jen dotkneš prstem, dostaneš přes svoji nevymáchanou hubu.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_07");	//To je vše domluvila jsem!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_H_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_01");	//Většinou mě to myslí lépe.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_02");	//Ale jestli mám mluvit na rovinu, tak...
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_03");	//Co?
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_04");	//Jednoduše... velmi se mi líbíš!
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_05");	//Ale nemyslím si že to něco znamená. Pravděpodobně mě pošleš ke všem čertům!
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_06");	//Ale musel jsem ti to říct, než abych pak celý život litoval, že jsem to neudělal.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_07");	//Mohl bych tady s tebou sedět beze slova a rozjímat při pohledu na západ slunce ustupujícího za obzor.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_08");	//V takových chvílích si uvědomuji, že život není jen boj o přežití a stále nekončící války.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_09");	//Že existují i jiné věci, které tě naplňují a umožňují ti vidět mnohem víc než se na první pohled zdá.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_10");	//Ale v tuhle chvíli nedokážu myslet na nic jiného, jenom na tebe.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_11");	//Takže se omlouvám, jestli jsem nenaplnil tvé očekávání. Ale pravda je lepší nežli sladké lži.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_12");	//Hmmm... (zasní se) Zní to jako vyznání lásky.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_13");	//Něco na ten způsob.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_14");	//Víš, taky se mě moc líbíš.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_15");	//Ale myslím, že to ještě není důvod ti podlehnout.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_16");	//A proto je asi lepší ukončit tento rozhovor... (klidně) Možná budeme mít jednou příležitost se k němu vrátit.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_17");	//Ale ne teď...
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_18");	//Už svítá... Musím se vrátit! Hodně štěstí.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_02_01");	//Samo sebou.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_02");	//Je pravda, že vždy to směřuje k jednomu a tomu samému. Mám pravdu?
	AI_Output(other,self,"DIA_Loa_ComeLH_H_02_03");	//Téměř.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_04");	//To mě nepřekvapuje... Jen se na sebe podívej!
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_05");	//Máš ho tak napruženýho, že by mohl sám z kalhot vyskočit.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_06");	//Víš opravdu se mě líbíš. Ale to ještě není důvod abych se s tebou vyspala.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_07");	//Asi bude lepší se uklidnit a rozejít se každý po svém. Možná budem mít jednou příležitost se k této konverzaci vrátit.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_08");	//A já už stejně musím jít... Opatruj se!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_01_01");	//Nyní, nedokážu myslet na nic jiného.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_02");	//Ani nemusíš říkat na co!
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_03");	//A nemysli si že se ti to splní, aspoň ne dnes. 
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_04");	//Tak radši běž odkud jsi přišel.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_05");	//A já už také budu muset jít... Měj se!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_F_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_01");	//Chápu je
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_02");	//Co tím chceš říct?
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_03");	//Jenom tolik, že mě samotnému se moc líbíš!
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_04");	//Ale nemyslím si že to něco znamená. Pravděpodobně mě pošleš ke všem čertům!
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_05");	//Ale musel jsem ti to říct, než abych pak celý život litoval, že jsem to neudělal.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_06");	//Mohl bych tady s tebou sedět beze slova a rozjímat při pohledu na západ slunce ustupujícího za obzor.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_07");	//V takových chvílích si uvědomuji, že život není jen boj o přežití a stále nekončící války.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_08");	//Že existují i jiné věci, které tě naplňují a umožňují ti vidět mnohem víc než se na první pohled zdá.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_09");	//Ale v tuhle chvíli nedokážu myslet na nic jiného, jenom na tebe.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_10");	//Takže se omlouvám, jestli jsem nenaplnil tvé očekávání. Ale pravda je lepší nežli sladké lži.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_11");	//Hmmm... (zasní se) Zní to jako vyznání lásky.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_12");	//A také to je.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_13");	//Víš, taky se mě moc líbíš.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_14");	//Ale myslím, že to ještě není důvod ti podlehnout.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_15");	//A proto je asi lepší ukončit tento rozhovor... (klidně) Možná budeme mít jednou příležitost se k němu vrátit.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_16");	//Ale ne teď... Tím spíš, že už svítá.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_17");	//A já už stejně musím jít... Opatruj se!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	CanSayLoaStay = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PreLoveScene");
};

func void DIA_Loa_ComeLH_F_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_F_02_01");	//Nejsem jedním z nich.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_02_02");	//To jsem už pochopila.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_02_03");	//Škoda, už svítá. Je čas se vrátit! Hodně štěstí.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_PissOff(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PissOff_Condition;
	information = DIA_Loa_PissOff_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PissOff_Condition()
{
	if((LoaPissOff[1] == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PissOff_Info()
{
	B_Say(self,other,"$HandsOff");
	AI_StopProcessInfos(self);
};

instance DIA_Loa_LoveScene(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_LoveScene_Condition;
	information = DIA_Loa_LoveScene_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_LoveScene_Condition()
{
	if((CanSayLoaStay == TRUE) && (LoaLoveScene == TRUE) && (LoaLoveSceneNoBonus == FALSE) && (LoaLoveSceneFailed == FALSE) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_LOA_LOVE_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Loa_LoveScene_Info()
{
	AI_Output(self,other,"DIA_Loa_LoveScene_Do_01_01");	//Musím jít...
	AI_Output(self,other,"DIA_Loa_LoveScene_Do_01_02");	//Nikdy nezapomenu co jsi pro mě udělal a co mezi námi bylo.
	Info_ClearChoices(DIA_Loa_LoveScene);
	Info_AddChoice(DIA_Loa_LoveScene,"Ani já...",DIA_Loa_LoveScene_Done);
};

func void DIA_Loa_LoveScene_Done()
{
	AI_Output(other,self,"DIA_Loa_LoveScene_Done_01_01");	//Ani já... nezapomenu.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");

	if(LoveBonus == FALSE)
	{
		Snd_Play("LevelUp");
		hero.lp = hero.lp + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_LoveBonus);
		LoveBonus = TRUE;
		LoveBonusDay = Wld_GetDay();

	};
};

//-------------------------------------------------Loa epik kvest---------------------------------------------

instance DIA_Loa_EpicQuest(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Condition;
	information = DIA_Loa_EpicQuest_Info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};

func int DIA_Loa_EpicQuest_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((LoveBonus == TRUE) && (LoveBonusDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_01");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_02");	//Ano. Proč se ptáš?
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_03");	//Já... mám o tebe starost.
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_04");	//Víš, po tom setkání u majáku, se za tebe cítím tak trochu odpovědný.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_05");	//To se pěkně poslouchá. No mě nyní nic nehrozí když jsi tady.
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_06");	//Zajímalo by mě, jak ses vlastně dostala k žoldákům?
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_07");	//To je dlouhý příběh. 
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_08");	//Klidně mi to řekni. Moc toho o tobě nevím.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_09");	//Moc ráda na to nevzpomínám. Ale tobě... ten příběh povím.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_10");	//Když mě moře vyplavilo na břeh Khorinisu v Hornickém údolí, byla jsem těžce raněná.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_11");	//Šipka z kuše, který vystřelil královský voják, mě prošel celým bokem.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_12");	//Silně jsem krvácela a myslela si, že je to můj konec. 
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_13");	//Na štěstí pro mě, šel kolem malý oddíl žoldáků.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_14");	//Myslím, že právě přepadli další Gomezovu karavanu a vraceli se do Nového tábora.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_15");	//Ošetřili mě a vzali s sebou. A tak jsem tam žila, dokud nepadla bariéra.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_16");	//A pak Lee se svýma lidma sem přišel a začal pracovat pro Onara. No a já s nima.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_17");	//(usmívá se) A to je můj příběh.
	LoaEpicStory = TRUE;
};

instance DIA_Loa_EpicQuest_Next(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Next_Condition;
	information = DIA_Loa_EpicQuest_Next_Info;
	permanent = FALSE;
	description = "Doufám, že ti nikdo z nich neublížil?";
};

func int DIA_Loa_EpicQuest_Next_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Next_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Next_01_01");	//Doufám, že ti nikdo z nich neublížil?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_02");	//Ne, nic takového.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_03");	//Kromě toho Cord s Torlofem ostatní varovali, že kdo se na mě jen křivě podívá, bude mít problém s nima.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_04");	//Chápeš, že pak už jsem se nemusela ničeho obávat.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_05");	//Ale i já sama, se o sebe dokážu postarat. A ty to dobře víš.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Next_01_06");	//Jak bych mohl zapomenout, pořád mě to připomínáš.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_07");	//Nezlob se... nemyslím to zle.
};

instance DIA_Loa_EpicQuest_Judge(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Judge_Condition;
	information = DIA_Loa_EpicQuest_Judge_Info;
	permanent = FALSE;
	description = "Takže jsi utekla královské stráži?";
};

func int DIA_Loa_EpicQuest_Judge_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE) && (LoaEpicStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Judge_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_01");	//Takže jsi utekla královské stráži?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_02");	//Od nich a od soudce, co četl moje odvinění.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_03");	//Věděla jsem, že je to moje poslední šance na spádu. Takže jsem to udělala bezmyšlenkovitě.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_04");	//A co jsi provedla? Něco jsi ukradla, nebo někoho zabila?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_05");	//Ani to ani ono. Ačkoliv by bylo skvělé kdyby to byla jedna z těchto možností.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_06");	//Bohužel, jsem to zjistila pozdě, až když jsem se ocitla v rukách královské spravedlnosti.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_07");	//A co jsi teda provedla?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_08");	//Myslím, že se moc vyptáváš. Proč se o to staráš?
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_09");	//Možná bych ti s tím mohl pomoci.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_10");	//Pomoct, s čím. Stalo se to tak dávno a já se k tomu nechci vracet.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_11");	//Dobře, jak chceš.
	MIS_LoaSecret = LOG_Running;
	Log_CreateTopic(TOPIC_LoaSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaSecret,LOG_Running);
	B_LogEntry(TOPIC_LoaSecret,"Zdá se, že jsem se dotkl citlivého tématu. Týká se to jejího útěku před královskými strážemi. Podle všeho na to nerada vzpomíná. Ale soudě podle jejího výrazu, jí to stále trápí. Nechce o tom mluvit ani se mnou. Myslím, že musím přijít s něčím, co by jí přimělo, aby se mě sama chtěla svěřit.");
};

instance DIA_Loa_EpicQuest_Party(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Condition;
	information = DIA_Loa_EpicQuest_Party_Info;
	permanent = FALSE;
	// description = "A co kdybychom si udělali něco jako piknik?";
};

func int DIA_Loa_EpicQuest_Party_Condition()
{
	DIA_Loa_EpicQuest_Party.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 70, TRUE), "A co kdybychom si udělali něco jako piknik?");
	
	if((MIS_LoaSecret == LOG_Running)
	// && (RhetorikSkillValue[1] >= 70)
	)
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_01");	//A co kdybychom si udělali něco jako piknik?
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_02");	//Krásná příroda, chutné jídlo a dobré víno... co říkáš?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_03");	//Hmm... To zní dobře! A nějaké překvapení? 
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_04");	//Samozřejmě!
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_05");	//(šibalsky) Tak jsem pro.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_06");	//Tak já se pustím do přípravy.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_07");	//Budu čekat!
	MakeLoaParty = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Navrhl jsem Loi, že pro nás připravím něco jako piknik a on souhlasila. Teď už jen najít vhodné místo, připravit chutné jídlo a dobré víno. Možná se trochu uvolní a bude otevřenější při konverzaci.");
	AI_StopProcessInfos(self);
};

instance DIA_Loa_EpicQuest_Party_Go(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Go_Condition;
	information = DIA_Loa_EpicQuest_Party_Go_Info;
	permanent = FALSE;
	description = "Vše je připraveno!";
};

func int DIA_Loa_EpicQuest_Party_Go_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE) && (LoaPartyWine == TRUE) && (LoaPartyFood == TRUE) && (Npc_HasItems(other,ItMi_LoaWine) >= 2) && (Npc_HasItems(other,ItMi_LoaPartyFood) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Go_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_Go_01_01");	//Vše je připraveno! Chutné jídlo, dobré víno... Stačí najít příhodné místo. 
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_Go_01_02");	//Myslím, že o takovém místě vím. Je tady v lese za tou farmou. Pojď za mnou!
	LoaGoParty = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Informoval jsem Lou, že jsem připravil všechno na piknik. Stačí najít vhodné místo. Loa má nápad a navrhla místo v lese, za farmou.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};

instance DIA_Loa_PartyInPlace(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyInPlace_Condition;
	information = DIA_Loa_PartyInPlace_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyInPlace_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_01_56") <= 500) && (LoaGoParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyInPlace_Info()
{
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_01");	//A jsme tady. Líbí se ti tu?
	AI_Output(other,self,"DIA_Loa_PartyInPlace_01_02");	//Hezké místo.
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_03");	//Věděla jsem, že se ti tu bude líbit. Tak tu zůstanem.
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_04");	//No... (s úsměvem) A co to víno, o kterém jsi mluvil?
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry(TOPIC_LoaSecret,"Došli jsme k místu, které našla Loa, teď se určitě uvolní...");
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace,"Teď se to stane...",DIA_Loa_PartyInPlace_Done);
};

func void DIA_Loa_PartyInPlace_Done()
{
	Wld_SendTrigger("EVT_LOAPARTY_CAM");
	AI_SetWalkMode(self,NPC_WALK);
	AI_SetWalkMode(other,NPC_WALK);
	AI_GotoWP(self,"NW_DARKFOREST_IN_LOA_PARTY");
	AI_GotoWP(other,"NW_DARKFOREST_IN_HERO_PARTY");
	B_TurnToNpc(self,other);
	B_TurnToNpc(other,self);
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_PlayAni(other,"T_STAND_2_SIT");
	Npc_RemoveInvItems(other,ItMi_LoaWine,Npc_HasItems(other,ItMi_LoaWine));
	Npc_RemoveInvItems(other,ItMi_LoaPartyFood,Npc_HasItems(other,ItMi_LoaPartyFood));
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace,"... (pokračování)",DIA_Loa_PartyInPlace_Exit);
};

func void DIA_Loa_PartyInPlace_Exit()
{
	Wld_SendTrigger("EVT_PARTYPLACE_01");
	PlayVideo("RET2_BlackScreen.bik");
	LoaOnParty = TRUE;
	AI_NoticePrint(500,7000,"O dvě hodiny později...");
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_00");	//Proč vstáváš? Kam jdeš?
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_01");	//Nic, akorát se otáčím. Takže, co bylo dál?
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_02");	//No... řekla jsem mu ať najde nějakého koně a pak přijde!
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_03");	//Takže odešel. Pravděpodobně ho ještě teď hledá... (výbuchne smíchy)
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_04");	//Ha, velmi zábavný příbeh.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_05");	//Víš... (zamyšleně) Jsem moc ráda, že jsi přišel s tím nápadem na piknik.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_06");	//Uprostřed této šedé a zoufalé rutiny života. Bylo to jako bych znovu vdechla život. Moc ti děkuju!
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_07");	//Nemáš zač. Ačkoliv stále si myslím, že tě něco trápí.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_08");	//Ale, vzpomněla jsem si jak jsem ráda trávila čas v lese, uživala si to ticho a ten klid.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_09");	//To jsem byla ještě hodně malá. Když moji rodiče byli naživu...
};

instance DIA_Loa_PartyTalk_Ext(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Ext_Condition;
	information = DIA_Loa_PartyTalk_Ext_Info;
	permanent = FALSE;
	description = "Takže, co se ti vlastně stalo?";
};

func int DIA_Loa_PartyTalk_Ext_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaOnParty == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Ext_Info()
{
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_01");	//Takže, co se ti vlastně stalo?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_02");	//... (váhavě) Nechci o tom mluvit... Ale chci se ti svěřit.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_03");	//Je to kvůli němu, že jsem přišla o své příbuzné a můj život visel na vlásku.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_04");	//Kdo je ten parchant?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_05");	//No... (vzdychne si) Nevím ti jistě. Bylo mi kolem deseti let když se to stalo. Nikdy nezapomenu jeho jméno. Rotgrif!
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_06");	//A pokaždé když řeknu jeho jméno se cítím strašně. Když si jenom pomyslím, že tenhle chlap chodí v klidu po svobodě...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_07");	//Jde to jednoduše napravit. Nemyslím si, že najít toho hajzla bude problém. Kde jsi ho naposledy viděla?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_08");	//V Drakii. Bylo mi řečeno, že se tam usadil a slouží místnímu baronovi. Nemohla jsem to prověřit. 
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_09");	//Zřejmě někdo řekl Rotgrifovi, že jsem ve městě a snažím se ho vypátrat.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_10");	//Hned potom mě zatknuli. No a zbytek příběhu už víš. Vzpomínáš?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_11");	//Mrzí mě že sis na to musela vzpomenout!
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_12");	//Je mi to líto, ale chtěl jsi to vědět.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_13");	//Dobře, nemysli na to. Takže... Drakia.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_14");	//Byl jsi tam?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_15");	//Ne... Ale on tam byl. O tom městě nic nevím a to se musí změnit.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_16");	//Počkej! Chystáš se pomstít mé rodiče?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_17");	//Ano. Vadí ti to?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_18");	//Ne, ale o to tu nejde. Nepochop mě špatně... Nemám nic proti tomu, že mi chceš pomoct. Ale...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_19");	//Ale co?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_20");	//... Tohle bych měla udělat sama! A nikdo jiný. 
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_21");	//Chci se tomu tlustýmu praseti podívat do očí a vidět jak cítí... Pokání... Strach.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_22");	//Jinak mě tahle noční můra bude pořád strašit. 
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_23");	//Dobře, rozumím ti. Ale stejně se ti budu snažit pomoct.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_24");	//Och... (koulí očima) Nikdo ti ještě neřekl, že jsi strašně tvrdohlavý?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_25");	//Ne. Mě totiž nezajímá, co si o mě ostatní myslí.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_26");	//Proč mě to jenom nepřekvapuje. Změňme téma... Jsme pořád na pikniku.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_27");	//Jak říkáš.
	KnowAboutRotgrif = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Zjistil jsem čeho se Loa bojí. Kvůli Rotgrifovi umřeli její rodiče a ona skoro taky. Sloužil místnímu baronovi na Drakie. Rozhodl jsem se, že Loi pomůžu, ačkoliv o Drakii nic nevím. Je nezbytné zjistit více.");
};

instance DIA_Loa_PartyTalk_Over(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Over_Condition;
	information = DIA_Loa_PartyTalk_Over_Info;
	permanent = FALSE;
	description = "Chceš ještě víno?";
};

func int DIA_Loa_PartyTalk_Over_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Over_Info()
{
	AI_Output(other,self,"DIA_Loa_PartyTalk_Over_01_01");	//Chceš ještě víno?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Over_01_02");	//To neodmítnu. Nalejvej!
	AI_Output(other,self,"DIA_Loa_PartyTalk_Over_01_03");	//Počkej, neslyšela jsi něco?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Over_01_04");	//Hmmm... Co jsem měla slyšet?
	LoaOverParty = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Loa_PartyTalk_Home(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Home_Condition;
	information = DIA_Loa_PartyTalk_Home_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyTalk_Home_Condition()
{
	if((LoaOverParty == TRUE) && (ShadowbeastLoa01 == TRUE) && (ShadowbeastLoa02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Home_Info()
{
	AI_Output(self,other,"DIA_Loa_PartyTalk_Home_01_01");	//A tady je slíbené překvapení...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Home_01_02");	//Sakra, začíná to tu být nebezpečné.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Home_01_03");	//Vezmi mě zpátky.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Home_01_04");	//Jasně, jdeme.
	LoaBackToFarm = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_Loa_BackToFarm(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_BackToFarm_Condition;
	information = DIA_Loa_BackToFarm_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_BackToFarm_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaBackToFarm == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_TORLOF") <= 3000))
	{
		return TRUE;
	};
};

func void DIA_Loa_BackToFarm_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_Loa_BackToFarm_01_01");	//Díky, že jsi na mě dohlídnul.
	AI_Output(self,other,"DIA_Loa_BackToFarm_01_02");	//Ale teď si musím něco zařídit. Měj se.
	AI_Output(other,self,"DIA_Loa_BackToFarm_01_03");	//Samozřejmě...
	LoaBackToFarmDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_GoDrakia(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_GoDrakia_Condition;
	information = DIA_Loa_GoDrakia_Info;
	permanent = FALSE;
	description = "Chystám se do Drakie, půjdeš se mnou?";
};

func int DIA_Loa_GoDrakia_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (MIS_OldElza == LOG_SUCCESS) && (SailAwayDrakia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_GoDrakia_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_01");	//Chystám se do Drakie, půjdeš se mnou?
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_02");	//Do Drakie?! Děláš si srandu? Jak se tam chceš dostat?
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_03");	//Piráti mě pomůžou. Za několik dnů tak chtějí vyplout.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_04");	//Piráti?! Hmmm... (překvapeně) Nemyslela jsem si, že s nima máš nějaké kšefty.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_05");	//Nicméně, pokud vím tak nemají žádnou loď. Tu poslední potopili paladinové, kteří přijeli před nedávnem do Khorinisu.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_06");	//Koukám, že jsi dobře informovaná. Na obyčejnou žoldačku.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_07");	//Není to nic těžkého. Stačí poslouchat.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_08");	//Opravili starou loď. A teď chtějí všechno jejich zboží a krámy prodat na Drakii.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_09");	//To je od nich rozumné.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_10");	//Takže, jdeš se mnou?
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_11");	//Pokud je všechno jak říkáš... jdu s tebou. Bude to perfektní příležitost jak se vypořádat s Rotgrifem.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_12");	//Nejlepší bude vyrazit hned a neztrácet čas.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_13");	//Počkej, počkej... Ne tak rychle. Nemůžu teď všeho jen tak nechat.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_14");	//Navíc potřebuju ještě cvičit. Sejdeme se až na místě.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_15");	//A víš, kde mají piráti tábor?!
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_16");	//Neměj péči! Nějak se tam dostanu. Dám ti takovou malou radu. Připrav se velmi pečlivě na nadcházející události.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_17");	//Drakia je nebezpečné místo takže nečekej vřelé přivítání.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_18");	//To mě nepřekvapuje. Dobře, jak chceš.
	LoaGoDrakia = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

//---------------------------Loa v Yarike------------------------------------

instance DIA_SLD_10921_Loa_ADW_EXIT(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 999;
	condition = DIA_SLD_10921_Loa_ADW_EXIT_Condition;
	information = DIA_SLD_10921_Loa_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_10921_Loa_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_10921_Loa_ADW_Hello(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_Hello_Condition;
	information = DIA_SLD_10921_Loa_ADW_Hello_Info;
	permanent = FALSE;
	description = "Neskutečné! Ty už jsi tady.";
};

func int DIA_SLD_10921_Loa_ADW_Hello_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_Hello_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_01");	//Neskutečné! Ty už jsi tady.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_02");	//Samozřejmě... (podrážděně) Ale zdá se, že jsem spěchala kvůli ničemu.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_03");	//Vypadá to, že nejsi ve své kuži. Co se stalo?
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_04");	//Co, co... Ten bídák Greg mě nechce pustit na palubu.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_05");	//Proč?
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_06");	//Protože si myslí, že ženská na palubě přitahuje problémy. Pro něj je velmi důležité, aby loď doplula na místo be problémů.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_07");	//Snažila jsem se mu vysvětlit, že to je jen hloupý předsudek.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_08");	//Ale neposlechl mě. Vyhodil mě ze dveří!
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_09");	//Neboj se! Promluvím s ním.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_10");	//To jsem zvědavá jestli se ti to podaří. Je to tvrdohlavý mezek.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_11");	//Uvidíme.
	MIS_OldRumors = LOG_Running;
	Log_CreateTopic(TOPIC_OldRumors,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_Running);
	B_LogEntry(TOPIC_OldRumors,"Loa má problém s Gregem. Greg je proti tomu, aby na palubě byla žena, protože podle něho žena přitahuje pouze problémy. Je pro něj životně důležité, aby se loď dostala na Drakiu bez problémů.");
};

instance DIA_SLD_10921_Loa_ADW_CanSail(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_CanSail_Condition;
	information = DIA_SLD_10921_Loa_ADW_CanSail_Info;
	permanent = FALSE;
	description = "Můžeš na palubu.";
};

func int DIA_SLD_10921_Loa_ADW_CanSail_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_CanSail_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_01");	//Můžeš na palubu.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_02");	//Co tím myslíš?
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_03");	//To, že Greg tě vezme na Drakiu.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_04");	//Hmmm... Pročpak asi změnil názor?
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_05");	//No... Řekněme, že mám na něho dobrý vliv.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_06");	//Ale bylo by lepší, aby se takovéhle situace už neopakovali. To by pak vliv... hmm... mohl velmi rychle přestat fungovat.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_07");	//Děkuju ti! Zase jsi pro mě udělal nedocenitelnou službu. Co bych bez tebe dělala.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_08");	//Ale slib mi, že nebudeš provokovat Grega. Aspoň do té doby než budeme na Drakii.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_09");	//Dobře, budu tichá jako myška.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_10");	//Dobrá tedy.
	LoaInsDrakia = TRUE;
	AI_StopProcessInfos(self);
};