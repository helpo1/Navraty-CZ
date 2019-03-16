var int NetBekIsDruid;

instance DIA_NETBEK_EXIT(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 999;
	condition = dia_netbek_exit_condition;
	information = dia_netbek_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_netbek_exit_condition()
{
	return TRUE;
};

func void dia_netbek_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_FIRSTHALLO(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_firsthallo_condition;
	information = dia_netbek_firsthallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_netbek_firsthallo_condition()
{
	return TRUE;
};

func void dia_netbek_firsthallo_info()
{
	AI_Output(self,other,"DIA_Netbek_Hallo_01_00");	//Vítám tě, starý příteli.
	AI_Output(other,self,"DIA_Netbek_Hallo_01_01");	//Cože?! Ty si mě odněkud pamatuješ?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_02");	//A jak!... (úsměv) Ano, většinou jsem byl zasněn mezi svýmy stromy, ale konverzaci s osobou jako jsi ty si prostě musím pamatovat!
	AI_Output(other,self,"DIA_Netbek_Hallo_01_03");	//To je potěšující. Ale co se tady stalo?!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_04");	//Celkěm nic, ale jestli tě zajímá to, jak jsem dokázal přežít, pak poslouchej.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_05");	//Mé stromy mi propůjčily ochranu proti Spáčově magii - zachránily mne ze šílenství a strašlivé smrti, která postihla mé bratry!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_06");	//A nyní mi pomohly dostat se k božstvu, vědění a poznání skutečného smyslu života.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_08");	//Je to duch přírody, jehož moc bys teď měl kolem sebe cítit. Nebo snad ne?!
};


instance DIA_NETBEK_HALLO2(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hallo_brothers;
	permanent = FALSE;
	description = "A co si myslíš o ostatních božstvech?";
};

instance DIA_NETBEK_HALLO3(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hallo_orcs;
	permanent = FALSE;
	description = "A jak se tvůj bůh staví ke skřetům?";
};

instance DIA_NETBEK_HALLO4(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo4_condition;
	information = dia_netbek_hallo_runes;
	permanent = TRUE;
	description = "Tvůj bůh ti propůjčil znalost magických run?";
};

func int dia_netbek_hallo_condition()
{
	return TRUE;
};

var int netbek_hallo4;

func int dia_netbek_hallo4_condition()
{
	if(NETBEK_HALLO4 == FALSE)
	{
		return TRUE;
	};
};

func void dia_netbek_hallo_brothers()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_05");	//A co si myslíš o ostatních božstvech?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_09");	//Myslíš Innose a ostatní?!... (povýšeně) Jsou to bratři hrající hru!
	AI_Output(other,self,"DIA_Netbek_Hallo_15_06");	//Innos přinesl světlo do našeho světa - to je hra?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_10");	//Přijal lesk mincí, když jsi ho u svatyně žádal o světlo.
	AI_Output(other,self,"DIA_Netbek_Hallo_15_07");	//Nebo snad nejsi seznámen se silou, kterou slibuje Beliar?!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_11");	//Který ani nedokáže vytvořit les jako můj bůh?
	AI_Output(other,self,"DIA_Netbek_Hallo_15_08");	//A co pak Adanos?!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_12");	//Možná jen Adanos si zaslouží uznání. Jeho cesta rovnováhy je moudrá.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_20");	//Jeho voda propůjčuje život mým stromům.
	NetBekIsDruid = TRUE;
};

func void dia_netbek_hallo_orcs()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_09");	//A jak se tvůj bůh staví ke skřetům?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_13");	//Je otcem všech živých stvoření.
	AI_Output(other,self,"DIA_Netbek_Hallo_15_10");	//Proč odsud tedy nevyžene skřety?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_14");	//Myslím, že ta zvířátka mají stormy ráda, ale chtěla pokácet moje stromy!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_15");	//Nyní jsou posláni pryč a už se nikdy nevrátí do mého lesa.
};

func void dia_netbek_hallo_runes()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_12");	//Tvůj bůh ti propůjčil znalost magických run?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_16");	//Vidíš na mém oblečení místo, kde bych mohl umístit runy?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_19");	//Je pravda že jsem občas použil runu transformace do zvířat.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_21");	//Ale nazvat toto runou, není správné.
	NETBEK_HALLO4 = TRUE;
};

instance DIA_NETBEK_OrcFight(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_condition;
	information = dia_netbek_OrcFight_info;
	permanent = FALSE;
	description = "Pomůžeš mi nějak v boji se skřety?";
};

func int dia_netbek_OrcFight_condition()
{
	if(Npc_KnowsInfo(hero,DIA_NETBEK_HALLO3) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_info()
{
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_01");	//Pomůžeš mi nějak v boji se skřety?
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_02");	//Jistě. Ale je tu jeden takový malý problém.
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_03");	//Nedávno, do mého lesa vpadlo obrovské monstrum - jeskynní trol!
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_04");	//Tato bytost přináší jen zkázu mému lesu, dupá na rostliny a láme stromy. Je třeba ho zastavit, dokud nenatropí ještě větší problémy!
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_05");	//Mám se ho pokusit zabít?
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_06");	//To záleží na vás! Já chci jen aby měli stromy klid.
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_07");	//Dobře, tak si s ním promluvím.
	MIS_EvilTroll = LOG_Running;
	Log_CreateTopic(TOPIC_EvilTroll,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Running);
	B_LogEntry(TOPIC_EvilTroll,"Netbek po mě chce, abych ho zbavil obrovského trola v jeho lese.");
	Wld_InsertNpc(TROLL_CAVE_UNIQ,"WP_COAST_FOREST_72");
};

instance DIA_NETBEK_OrcFight_Done(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_Done_condition;
	information = dia_netbek_OrcFight_Done_info;
	permanent = FALSE;
	description = "Postaral jsem se o tvého návštěvníka.";
};

func int dia_netbek_OrcFight_Done_condition()
{
	if((MIS_EvilTroll == LOG_Running) && (UturIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Netbek_OrcFight_Done_01_01");	//Postaral jsem se o tvého návštěvníka
	AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_02");	//Dobře. Nyní je můj les v bezpečí.

	if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_08");	//Vezmi si tyto magické byliny jako symbol mého uznání.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_09");	//Pomůžou ti na tvých cestách.
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_03");	//Vezmi si tento luk jako symbol mého uznání.
			B_GiveInvItems(self,other,ITRW_KMR_KADAT_BOW_01,1);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_04");	//Vytvořila ho sama příroda! Bude tě spolehlivě chránit před tvými nepříteli.
		};
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_08");	//Vezmi si tyto magické byliny jako symbol mého uznání.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_09");	//Pomůžou ti na tvých cestách.
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_06");	//Vezmi si tyto léčivé byliny jako symbol mého uznání.
			B_GiveInvItems(self,other,ItPl_NetbekPlant,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_07");	//Vyléčí tvé rány utržené v boji!
		};
	};

	MIS_EvilTroll = LOG_Success;
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Success);
	B_LogEntry(TOPIC_EvilTroll,"Netbek byl rád, když slyšel že jeho lesní kraj již není v ohrožení.");
};

instance DIA_NETBEK_DRAGONS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragons_condition;
	information = dia_netbek_dragons_info;
	permanent = FALSE;
	description = "Jdu bojovat proti drakům.";
};

func int dia_netbek_dragons_condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_dragons_info()
{
	AI_Output(other,self,"DIA_Netbek_Dragons_15_00");	//Jdu bojovat proti drakům, nemůže mi tvůj bůh nějak pomoci?
	AI_Output(self,other,"DIA_Netbek_Dragons_01_00");	//On uznává svobodu nejen pro tebe, ale i pro draky! I přes skutečnost, že jejich myšleny jsou temné a plné ničení.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_01");	//Ale jejich ničení už zašlo příliš daleko - proto ti může pomoci.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_02");	//Zde, přijmi tento malý dar od mého boha - síla přírody tě ochrání.
	B_GiveInvItems(self,other,ITRU_SUMTREANT,1);
	AI_Output(other,self,"DIA_Netbek_Dragons_01_03");	//Hmmm... co je to?
	AI_Output(self,other,"DIA_Netbek_Dragons_01_04");	//To je magický kámen Druidů.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_05");	//S jeho pomocí můžeš vyvolat dav věrných služebníků mého boha. 
	AI_Output(self,other,"DIA_Netbek_Dragons_01_06");	//Jejich hněv mi nejedenkrát pomohl obhájit místo před nepřáteli!
};

var int netbeksayonetimemoney;

func void netbekaboutmoney()
{
	if(NETBEKSAYONETIMEMONEY == FALSE)
	{
		AI_Output(other,self,"DIA_Netbek_AboutMoney_15_00");	//A?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_01");	//Čekáš ode mne náhradu?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_02");	//To děláš vše jen pro peníze?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_03");	//Nečekej je odemne, já žádné nemám.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_04");	//Pro uložení peněz je třeba měšec a pro uložení měšce kalhoty. Také bych měl meč na jejich ochranu.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_05");	//Kde je meč a kalhoty, tam je dům. Kde je dům, tam je hodně nápadů - jak ochránit všechny věci, za které jsi utratil zlato.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_06");	//A na takovém místě by nebylo místo pro mé stromy a konverzaci s mým bohem.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_07");	//Co to pro mě je? Už nikdy se mě neptej na peníze.
		NETBEKSAYONETIMEMONEY = TRUE;
	};
};


instance DIA_NETBEK_DRAGONSDEAD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragonsdead_condition;
	information = dia_netbek_dragonsdead_info;
	permanent = FALSE;
	description = "Všichni draci jsou mrtví!";
};


func int dia_netbek_dragonsdead_condition()
{
	if((MIS_AllDragonsDead == TRUE) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_netbek_dragonsdead_info()
{
	B_GivePlayerXP(XP_NETBEKGREATWORK);
	AI_Output(other,self,"DIA_Netbek_DragonsDead_15_00");	//Všichni draci jsou mrtví!
	AI_Output(self,other,"DIA_Netbek_DragonsDead_01_01");	//Děkuji ti! Oni byli špatnými návštěvníky.
	netbekaboutmoney();
};


instance DIA_NETBEK_LASTDRAGON(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_lastdragon_condition;
	information = dia_netbek_lastdragon_info;
	permanent = FALSE;
	description = "Musím do Irdorathských síní.";
};


func int dia_netbek_lastdragon_condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Kapitel < 6) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_lastdragon_info()
{
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_00");	//Musím do Irdorathských síní zapudit následovníky Beliara.
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_01");	//Nemůže mi tvůj bůh nějak pomoci?
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_02");	//Hmm... (zamyšleně) Ano, už mě varoval, že se tu můžeš zastavit.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_03");	//A tak jsem pro tebe vyrobyl jeden velmi zvláštní lektvar.
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_04");	//Co je to za lektvar?!
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_05");	//Jak jsem řekl, je to velmi neobvyklý lektvar. Daruje ti nesmrtelnost!
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_06");	//Ale můžeš ho použít jen jednou a jen na omezený čas.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_07");	//Použij ho jen v čase nejvyšší nutnosti - zde ho máš.
	B_GiveInvItems(self,other,itpo_xmagicdef,1);
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_08");	//Děkuji ti.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_09");	//Také pamatuj, že tvůj hlavní boj může být jiný, než si myslíš.
};


instance DIA_NETBEK_DEMENTORS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dementors_condition;
	information = dia_netbek_dementors_info;
	permanent = FALSE;
	description = "Musím překonat Pátrače, pomůžeš mi?!";
};


func int dia_netbek_dementors_condition()
{
	if((Kapitel < 6) && ((SC_ObsessionCounter > 0) || (SC_ObsessionTimes > 0) || (SC_IsObsessed == TRUE)))
	{
		return TRUE;
	};
};

func void dia_netbek_dementors_info()
{
	AI_Output(other,self,"DIA_Netbek_Dementors_15_00");	//Musím překonat Pátrače, pomůžeš mi?!
	AI_Output(self,other,"DIA_Netbek_Dementors_01_00");	//Ty sám jim musíš vzdorovat.
	AI_Output(self,other,"DIA_Netbek_Dementors_01_01");	//Je pro mne těžké zapudit včerejší bratry, i přesto, že jsou ztraceni!

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Netbek_Dementors_01_02");	//A tebe Innos osvobodil před takovými úvahami.
	};
};


instance DIA_NETBEK_HEADILL(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_headill_condition;
	information = dia_netbek_headill_info;
	permanent = FALSE;
	description = "Nemá někdo v táboře bolest hlavy?";
};


func int dia_netbek_headill_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void dia_netbek_headill_info()
{
	AI_Output(other,self,"DIA_Netbek_HeadIll_15_00");	//Nemá někdo v táboře bolest hlavy? Nebo zlé sny?
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_00");	//Cítím temnou magii, která zachvacuje údolí.
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_01");	//Začíná to tu být opravdu nebezpečné, hlavně s táborem v bažinách pod námi.
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_02");	//Ale můj bůh mi dal sílu udržet toto místo čisté a v bezpečí!
};


instance DIA_NETBEK_HEALING(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_healing_condition;
	information = dia_netbek_healing_info;
	permanent = TRUE;
	description = "Prosím, vyleč mě.";
};


func int dia_netbek_healing_condition()
{
	if(Npc_KnowsInfo(other,dia_netbek_firsthallo))
	{
		return TRUE;
	};
};


var int netbekhealobsession;

func void dia_netbek_healing_info()
{
	AI_Output(other,self,"DIA_Netbek_Healing_15_00");	//Prosím, vyleč mě.
	if(SC_IsObsessed == TRUE)
	{
		if(SC_ObsessionTimes < 1)
		{
			AI_Output(other,self,"DIA_Netbek_Healing_15_01");	//Mám nepříjemné pocity po setkání s Pátrači.
			AI_Output(self,other,"DIA_Netbek_Healing_01_00");	//Uvrhli tvou duši do prokletí!
			AI_Output(self,other,"DIA_Netbek_Healing_01_01");	//Měl bys jít za mágy Innose.
			AI_Output(self,other,"DIA_Netbek_Healing_01_02");	//Nicméně ses ptal na léčbu mě a můj bůh mě to naučil.
			NETBEKHEALOBSESSION = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Netbek_Healing_15_02");	//Mám zase ty bolesti hlavy.
			if(NETBEKHEALOBSESSION == FALSE)
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_03");	//Měl bys jít za mágy Innose!
				AI_Output(self,other,"DIA_Netbek_Healing_01_04");	//Nicméně ses ptal na léčbu mě a můj bůh mě to naučil.
				NETBEKHEALOBSESSION = TRUE;
			}
			else if(MIS_OCGateOpen == TRUE)
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_08");	//To je dobré, ale nevím, jestli si to zasloužíš.
			}
			else
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_07");	//Dobře.
			};
		};
		AI_WaitTillEnd(self,other);
		SC_ObsessionTimes = SC_ObsessionTimes + 1;
		B_ClearSCObsession(hero);
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	}
	else if(hero.attribute[ATR_HITPOINTS] >= hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Netbek_Healing_01_05");	//Jsi zdravý.
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		if(MIS_OCGateOpen == TRUE)
		{
			AI_Output(self,other,"DIA_Netbek_Healing_01_09");	//Dobrá, pomohu ti, ale nezasloužíš si to!
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_Healing_01_06");	//Dobrá, pomohu ti, ale nezasloužíš si to.
		};
		AI_WaitTillEnd(self,other);
	};
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_FullyHealed);
	};
	AI_Output(self,other,"DIA_Netbek_Healing_01_10");	//A teď jsi znova zdravý.
	AI_Output(other,self,"DIA_Netbek_Healing_15_03");	//Díky.
};


instance DIA_NETBEK_WHATHAPPENED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_whathappened_condition;
	information = dia_netbek_whathappened_info;
	permanent = FALSE;
	description = "Stalo se tu něco zajímavého?";
};


func int dia_netbek_whathappened_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_netbek_whathappened_info()
{
	AI_Output(other,self,"DIA_Netbek_WhatHappened_01_01");	//Stalo se tu něco zajímavého?
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_02");	//Pár dní zpět se skřeti pokusili napadnout náš tábor, ale jak vidíš, nepovedlo se jim to.
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_03");	//Je jisté, že už to nezkusí!
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_05");	//Jednoduše se rozhlédni a uvidíš.
	AI_Output(other,self,"DIA_Netbek_WhatHappened_01_06");	//On...
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_07");	//Samozřejmě, jestli ti to není jasné (smích).
};

instance DIA_NETBEK_GUARDIANSKNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardiansknow_condition;
	information = dia_netbek_guardiansknow_info;
	permanent = FALSE;
	description = "Co tvůj bůh ví o Strážcích?!";
};

func int dia_netbek_guardiansknow_condition()
{
	if((GATHERALLONBIGFARM == TRUE) && (MIS_ORCSECRET == LOG_Running) && (PyrokarTellAboutCreatures == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_guardiansknow_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_01");	//Co tvůj bůh ví o Strážcích?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_02");	//Ví vše, co potřebuje vědět... (lehce) Ale ty se mě chceš zeptat na něco trochu jiného, že?
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_03");	//Ano! Opravdu se tě chci zeptat na něco jiného.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_04");	//Myslím, že chceš vědět, jestli můj bůh ta stvoření, která zveš Strážci, dokáže zničit.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_05");	//No... Vidím, že před tebou nic neukryju!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_06");	//Pak ti na tvou otázku odpovím. Nemůže. Dokonce ani on nedokáže vzdorovat těmto tvůrcům.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_07");	//Nicméně je tu něco, co by ti mohlo pomoci je zničit.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_08");	//A co to je, že je toho schopno?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_09");	//Tebe to nenapadne? Je jen jedna osoba, která se neřídí tím, co chtějí bozi - ty!
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_10");	//Já?!... Ale jak by mohl pouhý smrtelník?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_11");	//Nejsi jen obyčejný smrtelník a konečně bys to měl začít chápat... (vážně) Obyčejní lidé by nedokázali takové věci jako ty.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_15");	//Já mám být vyvolený bohů?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_16");	//Nerozumíš? Nemusíš poslouchat Innose, Beliara nebo Adana, ani všechny najdenou.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_17");	//V tom je tvůj rozdíl od ostatních! Můžeš si zvolit cestu podle sebe a ne podle toho, komu chceš sloužit.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_18");	//A nyní nastal čas, kdy máš ty zachránit svět.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_19");	//Jen ty můžeš tento svět ochránit před Strážci!
 	B_LogEntry(TOPIC_GUARDIANS,"Obrátil jsem se o pomoc k Netbekovi, protože jsem si myslel, že jeho božstvo by mi mohlo pomoci. Nicméně jeho odpověď mě trochu překvapila. Řekl, že Strážce můžu překonat jen já sám a jeho bůh mi může jen trochu pomoci. Vypadá to, že osud světa spočívá na mých ramenech... znovu...");
};

instance DIA_NETBEK_GUARDIANSHOWHELP(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardianshowhelp_condition;
	information = dia_netbek_guardianshowhelp_info;
	permanent = FALSE;
	description = "A jak mi tvůj bůh pomůže?";
};

func int dia_netbek_guardianshowhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_netbek_guardiansknow) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guardianshowhelp_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_01");	//A jak mi tvůj bůh pomůže?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_02");	//Velmi jednoduše! Dá ti vše potřebné, co se ti bude hodit v boji.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_04");	//Dobrá, a co bych tedy měl udělat?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_05");	//Pro začátek bys měl ostatní bohy přimět, aby ti propůjčili svou sílu!
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_06");	//Může postačit jakékoliv posvátné místo, nebo svatyně, aby si tě všimli.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_07");	//To nezní tak složitě, co dál?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_08");	//Pak je třeba vytvořit speciální zbraň, se kterou porazíš Strážce.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_09");	//Normální zbraně, či runy stačit nebudou.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_12");	//Hmm... Určitě víš, že Strážci nejsou jen božským výplodem, ale vzešli ze základních elementů.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_13");	//Takže první bys měl najít nějaké artefakty, které odhalují jejich podstatu.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_14");	//A pak bys jejich sílu měl usměrnit do čepele nebo rudy.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_18");	//Ale bezobav, (smích) pomůžu ti s jejich nalezením.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_21");	//Když to říkáš... Ještě něco?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_22");	//Ano, musíš najít cestu do posvátných síní Strážců!
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_23");	//A abych řekl pravdu, nikdo neví, kde to je.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_24");	//To není problém, mám runu teleportace.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_25");	//Opravdu?! Hmm... (smích) Pak budou stačit jen první dvě podmínky.
	B_LogEntry(TOPIC_GUARDIANS,"Netbek mi řekl, jak se připravit na boj se Strážci! Zaprvé bych měl získat sílu bohů z jejích svatyň, nebo jiných posvátných míst, aby mi pomohli zničit Strážce. Pak bude třeba vytvořit zbraň, která dokáže zranit Strážce. Pro tu budu potřebovat artefakty, které odhalí podstatu jejich elementů. To může být problém, ale Netbek slíbil, že až získám moc bohů, řekne mi kde je hledat.");
};

instance DIA_NETBEK_HOWGETBLESSED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_HOWGETBLESSED_condition;
	information = DIA_NETBEK_HOWGETBLESSED_info;
	permanent = FALSE;
	description = "Myslíte že mi bohové propůjčí svou sílu?";
};

func int DIA_NETBEK_HOWGETBLESSED_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_HOWGETBLESSED_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NETBEK_HOWGETBLESSED_01_01");	//Myslíte že mi bohové propůjčí svou sílu?
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_02");	//Věř mi, že nemají jinou možnost!
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_03");	//Není nikdo, s výjimkou tebe kdo by byl schopen ustát, tobě jsou ochotni svěřit moc.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_04");	//(Vážně) Nicméně předtím než to uděláš, bohové budou chtít opět být přesvědčeni o správnosti svého rozhodnutí.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_05");	//Osud světa závisí na jejich volbě, a teď nemají žádný prostor pro chyby. Stejně jako ty!
	AI_Output(other,self,"DIA_NETBEK_HOWGETBLESSED_01_07");	//To chápu. Ale co tentokrát ode mě budou potřebovat?
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_08");	//Jsem si jistý že ti to poví.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_09");	//Jen se k němu obrať v modlitbě, a uslyšíš vůli bohů!
	NETBEKLEADME_STEP1 = TRUE;
	B_LogEntry(TOPIC_GUARDIANS,"Než mi bozi dají svou sílu, chtějí mě znovu otestovat v tom, co bude mou zkoušku, budu se muset zeptat...");
};

instance DIA_NETBEK_TITANS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_condition;
	information = DIA_NETBEK_TITANS_info;
	permanent = FALSE;
	description = "Zdá se, že Strážci sponzorují i skřety.";
};

func int DIA_NETBEK_TITANS_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_01");	//Zdá se, že Strážci sponzorují i skřety.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_02");	//Víš o tom něco?
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_03");	//Hmmm...(zaraženě) V poslední době jsme se opět museli s nimi vypořádat.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_04");	//Myslím, že byli obklopeni nějakou velmi silnou ochrannou aurou.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_05");	//Po pravdě řečeno, nevím co to spojuje.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_06");	//Jedině díky bohu se mi podařilo přežít.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_07");	//Jsem však připraven s tebou souhlasit, že sami skřeti by nikdy nebyli schopni používat podobnou magii.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_08");	//Možná, že to tam opravdu nebylo bez zásahu některých starověkých sil.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_09");	//Musíme nějak najít a zničit zdroj magie!
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_10");	//V opačném případě lidé nebudou mít žádnou šanci odolávat skřetům.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_11");	//Koneckonců, váš bůh vás nemůže pořád všechny chránit!
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_12");	//Ano, máte pravdu. On není tak silný jako ostatní bohové tohoto světa.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_13");	//Tak mi alespoň pomoz najít toto starobylé zlo! Pokud nejsme schopni více.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_14");	//Chystám se ho požádat, aby pomohl... (vážně), ale bude to trvat nějakou dobu.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_15");	//Jenže čas nemáme! Takže pospíchej a kontaktuj svého přítele.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_16");	//Vrať se zítra. Pokusím se zjistit, co způsobilo silné kouzlo skřetů.
	NetBekWaitDay = Wld_GetDay();
	B_LogEntry(TOPIC_ORCSECRET,"Netbek již čelí skřetím vojskům která jsou chráněna starobylým kouzlem. Do příštího rána se zeptá božstva co způsobylo onu silnou magii...");
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_KNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_KNOW_condition;
	information = DIA_NETBEK_TITANS_KNOW_info;
	permanent = FALSE;
	description = "A co magie, která chrání skřety?";
};

func int DIA_NETBEK_TITANS_KNOW_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((Npc_KnowsInfo(hero,DIA_NETBEK_TITANS) == TRUE) && (NetBekWaitDay != FALSE) && (NetBekWaitDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_KNOW_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_01");	//A co magie, která chrání skřety?
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_02");	//Její důvod je velice starý, poslouchá vůli Strážců.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_03");	//Přišli do tohoto světa s jejich souhlasem, a jejich magie pomáhá skřetům ve válce proti lidem.
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_04");	//Co je to za stvoření?
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_05");	//Všichni z nich jsou produktem čisté magie tohoto světa.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_06");	//Jsem přesvědčen, že Strážci investovaly do nich velkou část své moci.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_07");	//Za předpokladu že každý ze Strážců je ztělesnění jednoho z elementů...
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_08");	//... můžeme předpokládat že ti tvorové vzešli z nich!
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_09");	//Víc ti toho bohužel říct nemůžu. 
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_10");	//Hmm, není toho mnoho, půjdu.
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_11");	//Nechci ztrácet další čas mluvením.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_12");	//Počkej. Ještě bych ti chtěl něco povědět.
	B_LogEntry(TOPIC_ORCSECRET,"Bůh pravil Netbekovi, že důvodem byly staré bytosti, které přinesly sami Strážci. Dávají jí značnou část své moci a to jí umožňuje chránit skřety. Podle druida, samy o sobě ti tvorové představují látku, paletu elementů, kterou jsou samy i Strážci, kteří je vytvořili.");
};

instance DIA_NETBEK_TITANS_Sleeper(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_condition;
	information = DIA_NETBEK_TITANS_Sleeper_info;
	permanent = FALSE;
	description = "Je nějaká novinka?";
};

func int DIA_NETBEK_TITANS_Sleeper_condition()
{
	if((Npc_KnowsInfo(hero,DIA_NETBEK_TITANS_KNOW) == TRUE) && (MIS_SleeperBack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_info()
{
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_01");	//Je nějaká novinka?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_02");	//Jeden fakt, že v posledních letech jsem byl sužován podivnými představami mé minulosti.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_03");	//To je velmi podivné vzhledem k tomu, že kouzlo tohoto místa mě vždy spolehlivě chrání před všemi druhy nočních můr.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_04");	//Navíc spoustu bývalých učňů z Bratrstva sužují nemalé bolesti hlavy!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_05");	//Podobné bolesti těm které zažily při zničení bariéry.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_06");	//Bohužel, nevím jak vysvětlit co se děje, asi se sem plíží nějaký druh strachu.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_07");	//Co tím myslíš?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_08");	//Myslím, že se do tohoto světa vrací zlo které bylo kdysi vypuzeno.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_09");	//Myslíš Spáče?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_10");	//Ano...(smutně) Mluvím o něm.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_11");	//Nechci na to myslet, ale každý den jsou mé obavy větší.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_12");	//Pak bychom měli okamžitě zkontrolovat chrámové skřety! Možná máš pravdu.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_13");	//Co tím myslíš?
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_14");	//Ten temný čaroděj, kterého jsem zabil v chrámu. Řekl mi před svou smrtí, že se mu podařilo dokončit rituál.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_15");	//Samozřejmě jsem tomu přílišnou vážnost nedal.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_16");	//Ale zdá se že ten mág mluvil pravdu!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_17");	//Pokud ano... (v zoufalství), pak se vydej do chrámu co NEJDŘÍVE!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_18");	//Ještě není příliš pozdě!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_19");	//Návrat Spáče by mohlo ve světě mít příliš negativních změn!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_20");	//Navíc, vzhledem k hrozbě Strážců se svět může zhroutit přes noc!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_21");	//A Innos nebo Beliar nic nezmůžou.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_22");	//Dobře, uklidni se! Vezměme si, že jsem v půli cesty do chrámu.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_23");	//A pokud je to nutné, usnadním vetřelci odchod zpět.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_24");	//Pak radši tam. Každá minuta se počítá.
	B_LogEntry(TOPIC_SLEEPERBACK,"Vypadá to, že mých obav potvrzených Netbekem kterému se v noci zdály noční můry, zatímco bývalím nováčkům Bratrstva začaly silné bolesti hlavy, se jen tak nezbavím. Je nutné co nejdříve navštívit chrám.");
	SLEEPERINSHRAM = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_Sleeper_Find(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Find_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Find_info;
	permanent = FALSE;
	description = "Spáč se vrátil do světa lidí!";
};

func int DIA_NETBEK_TITANS_Sleeper_Find_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedSleeperStone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Find_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_01");	//Spáč se vrátil do světa lidí!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_02");	//Takže mé obavy nebyly marné... (zděšení) A teď jsme všichni ve velkém nebezpečí!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_03");	//Tento démon je schopen zničit náš svět i bez zásahu Strážců.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_04");	//Musíme udělat něco dříve, než bude příliš pozdě.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_05");	//Existuje ještě další problém.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_06");	//Jsem naprosto bezmocný proti uspávacímu kouzlu!
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_07");	//Jakmile se k němu přiblížím, upadnu do hlubokého spánku.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_08");	//Uspávací magie je nebezpečná! Nebude mí potom problém vás roztrhat na kusy.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_09");	//Vykročit si k němu bude šílenost.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_10");	//A co mám dělat?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_11");	//Je třeba mocný artefakt, který může uchránit před mentálními chapadly!
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_12");	//Nevíš o něčem?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_13");	//Bohužel ne. Zdá se, že to ví jen ten komu je známa podstata démonů.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_14");	//A co tvůj bůh? Řekl mi, že v žádném případě nepomůže?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_15");	//Obávám se že ne. Sotva zvládne zasáhnout do tohoto světa.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_16");	//Jeho dar - je především dar uzdravení a života! Tady je naprosto bezmocný.
	NeedDemonolog = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Budu potřebovat mocný artefakt odolávající kouzlu spánek, ale jaký - zná to pouze osobá zběhlá v umění démonů.");
};

instance DIA_NETBEK_TITANS_Sleeper_Dead(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Dead_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Dead_info;
	permanent = FALSE;
	description = "Spáč zemřel!";
};

func int DIA_NETBEK_TITANS_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_01_01");	//Spáč zemřel! 
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_01_02");	//Bojoval jsem se zlým démonem, už tě rušit nebude.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_03");	//Vím to už. Cítil jsem jak jeho strašná moc opustila svět!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_04");	//Moje noční můry ustoupily a ani mi nevadí zbytek z bratrů.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_05");	//Děkuji za pomoc při zbavení světa velkého zla!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_06");	//Tady je odměna jako důkaz vděčnosti mé.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
	Info_AddChoice(DIA_NETBEK_TITANS_Sleeper_Dead,"A kde je ona?",DIA_NETBEK_TITANS_Sleeper_Dead_Prize);
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_Prize()
{
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,EligorPrice);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_01");	//Co se děje?!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_02");	//Můj bůh ti dal životní sílu!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_03");	//To vám pomůže v budoucnu s větší jistotou čelit nepřátelům a nebezpečí tohoto světa.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_04");	//Děkuji! Víte, dokonce jsem se nějak začal cítit lépe.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_05");	//(Usmívá se) Nepochybuji.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
};

instance DIA_NETBEK_LEADMESTEPONEDONE(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_leadmesteponedone_condition;
	information = dia_netbek_leadmesteponedone_info;
	permanent = FALSE;
	description = "Bohové mi dali sílu.";
};

func int dia_netbek_leadmesteponedone_condition()
{
	if(NETBEKLEADME_STEP1DONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_leadmesteponedone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_00");	//Bohové mi dali sílu.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_02");	//Ale teď přišel čas promyslet si náš další postup.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_03");	//Ano, co ty artefakty?!
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_04");	//No... (vážně) Jak jsem řekl, povím ti kde je hledat. Nicméně zbytek bude na tobě!
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_05");	//Což je jasné...
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_06");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_07");	//Všechna moc pocházející od Strážců ovládá elementy tohoto světa - Oheň, Voda, Temnota a Země.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_08");	//Pouze zbraně obdařené všemi těmito vlastnostmi najednou, budou účinné.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_09");	//Je nepravděpodobné že něco takového najdeš, proto ti pomůžu to vytvořit.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_10");	//Jsem jedno ucho.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_11");	//Dobře. Chceš-li začít budeš potřebovat artefakty nasáklé v čistém kouzlu samotných elementů.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_12");	//Můžou být uzavřeny pouze ve velmi dávných a starých tvorech tohoto světa!
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_13");	//Nezapomeň že ses mě ptal na magii chránící skřety.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_14");	//No, ty bytosti vytvořené kouzlem Strážců, můžou obsahovat potřebné položky.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_15");	//Neptejte se mě, kde to najít. Já nevím! A nemůžu vědět.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_16");	//Budeš to muset najít sám. Ale jsem si jistý že to nebude těžké.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_17");	//Zejména s ohledem na skutečnost, že pravděpodobně již kolem sebe shromáždil velké množství nižších tvorů.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_18");	//Dobře, co dál?
	ELEMTITANSINS = TRUE;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_20");	//Jako mágovi se ti bude více hodit runa než čepel.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_21");	//Takže kromě artefaktů potřebuješ ještě jeden vzácný předmět.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_23");	//Ohniskový kámen.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_24");	//Tyto kameny mají téměř všechny magické vlastnosti potřebné pro přenos energie z artefaktů do tvé runy.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_26");	//Nevíš, kde to najdu?
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_27");	//Pokud si vzpomínám, něco takového bylo jednou v Y'Beriona - Bratrstvo, nejvyšší Guru.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_29");	//Takže nejspíš je tento kámen stále ponechán v našem starém táboře, v močálech. Zkus se podívat tam na něj!
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_30");	//Obávám se, že mi to moc nepomůže, protože jsem to donesl mágům Vody.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_31");	//V poslední době putovali skrze portál do Jharkendaru.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_32");	//Bojím se že v tomto případě ti nepomůžu. Zkus se zeptat samotných mágů.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_34");	//Jasně. Já něco vymyslím.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_35");	//Radši mi pověz, jak přenesu tu energii z artfaktů do run.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_36");	//Budeš k tomu potřebovat runový stůl.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_37");	//Připrav artefakty aby směřovali do středu stolu, tam vlož kámen.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_38");	//Jakmile ho položíš začne vyzařovat světlo.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_39");	//Čím více energie pojme tím více zazáří.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_40");	//V okamžiku kdy světlo pohasne bude hotovo.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_41");	//Pak už to bude na tobě...
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_43");	//Boj se Strážci bude těžký!
		B_LogEntry(TOPIC_GUARDIANS,"Netbek mi odhalil tajemství zbraně potřebné pro porážku Strážců. Jako mág bud potřebovat runu. Netbek říká že potřebuji artefakty spojené s utvářením světa.");
		Log_AddEntry(TOPIC_GUARDIANS,"Zdá se že budu potřebovat ještě jeden ohniskový kámen...");
		HOWCANMAKERUNE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_45");	//Jako válečníkovi se ti více bude hodit čepel než runa.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_46");	//Pro začátek bys měl vytvořit speciální rudnou čepel!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_48");	//Ne ovšem obvyklou jako zbraně které znáš!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_49");	//Budeš potřebovat zbraň z černé rudy!
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_50");	//Černá ruda? Ano, to je opravdu těžké najít.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_52");	//Každý kus tohoto druhu je skutečným pokladem magických vlastností, je mnohem lepší než ta obyčejná.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_53");	//Budeš potřebovat pět těchto kusů jestliže chceš vytvořit meč!
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_54");	//Nevíš, kde to najdu?
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_56");	//Chceš-li být upřímný, ne. Budeš se muset podívat sám.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_58");	//Dále budeš potřebovat speciální svitek napřenesení moci do meče.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_60");	//Jsem přesvědčen že vám pomůžou mágové Ohně.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_61");	//Jejich síla by měla stačit k vytvoření takového kouzla!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_62");	//Poté už to bude na tobě!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_63");	//Pamatuj, boj se Strážci bude těžký!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_64");	//No, všechno ostatní bude záviset na tobě.
		B_LogEntry(TOPIC_GUARDIANS,"Netbek mi odhalil tajemství zbraně potřebné pro porážku Strážců. Jako válečník budu potřebovat meč. Netbek říká že potřebuji artefakty spojené s utvářením světa.");
		Log_AddEntry(TOPIC_GUARDIANS,"Budu potřebovat černou rudu. Pět kousků pro jednoručku a deset pro obouruční zbraň. Také kouzlo na přesun energie. S tím by mohli pomoci mágové Ohně.");
		HOWCANMAKEBLACKSWORD = TRUE;
	};

	NETBEKLEADME_STEP2 = TRUE;
	AI_StopProcessInfos(self);

	Wld_InsertNpc(Avatar_Water,"OW_ICEREGION_78");
	Wld_InsertNpc(Avatar_Fire,"URHAN_CHALANGE");
	Wld_InsertNpc(Avatar_Stone,"OW_ROCKDRAGON_11");

	Wld_InsertNpc(DMT_13004_STONEMAGE,"DM_RITUAL_04");
	Wld_InsertNpc(DMT_13005_STONEMAGE,"DM_RITUAL_05");
	Wld_InsertNpc(DMT_13006_STONEMAGE,"DM_RITUAL_06");
	Wld_InsertNpc(DMT_13007_FIREMAGE,"DM_RITUAL_07");
	Wld_InsertNpc(DMT_13008_FIREMAGE,"DM_RITUAL_08");
	Wld_InsertNpc(DMT_13009_FIREMAGE,"DM_RITUAL_09");
	Wld_InsertNpc(DMT_13010_WATERMAGE,"DM_RITUAL_10");
	Wld_InsertNpc(DMT_13011_WATERMAGE,"DM_RITUAL_11");
	Wld_InsertNpc(DMT_13012_WATERMAGE,"DM_RITUAL_12");

	//-------svita Avatara Vody--------------------------------

	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_67");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_66");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_65");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_109");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_101");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_102");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_103");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_95");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_96");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_97");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_93");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_91");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_92");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_89");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_86");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_87");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_88");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_77");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_78");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_79");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_05");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_04");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_72");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_73");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_74");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_69");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_70");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_63");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_64");

	//-------svita Avatara Vody--------------------------------


	//-------svita Avatara Ognya--------------------------------

	Wld_InsertNpc(FireGolem,"CASTLE_35");
	Wld_InsertNpc(FireGolem,"CASTLE_30");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_150");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_149");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_144");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_145");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_146");
	Wld_InsertNpc(FireGolem,"CASTLE_22");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_142");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_143");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_141");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_139");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_140");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_136");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_137");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_138");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_133");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_134");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_135");
	Wld_InsertNpc(FireGolem,"CASTLE_12");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_132");
	Wld_InsertNpc(FireGolem,"CASTLE_32");
	Wld_InsertNpc(FireGolem,"CASTLE_33");
	Wld_InsertNpc(FireGolem,"CASTLE_34");

	//-------svita Avatara Ognya--------------------------------


	//-------svita Avatara Skaly--------------------------------

	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_05");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_06");
	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_04");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_181");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_188");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_182");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_180");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_02");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_179");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_176");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_177");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_178");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_03");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_183");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_187");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_15");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_186");
	Wld_InsertNpc(WindGolem,"FP_ROAM_DRACONIAN_184");

	//-------svita Avatara Skaly--------------------------------
};

instance DIA_NETBEK_MAKEBLACKSWORD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_makeblacksword_condition;
	information = dia_netbek_makeblacksword_info;
	permanent = FALSE;
	description = "Jak vytvořím meč z černé rudy?";
};

func int dia_netbek_makeblacksword_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_makeblacksword_info()
{
	AI_Output(other,self,"DIA_Netbek_MakeBlackSword_01_00");	//Jak vytvořím meč z černé rudy?
	AI_Output(self,other,"DIA_Netbek_MakeBlackSword_01_01");	//Stejně jako obvyklou čepel.
	AI_Output(self,other,"DIA_Netbek_MakeBlackSword_01_02");	//Nicméně bys měl zajít za Darrionem naším kovářem, řekne ti co a jak!
};

instance DIA_NETBEK_GUARDDEFEAT(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guarddefeat_condition;
	information = dia_netbek_guarddefeat_info;
	permanent = FALSE;
	description = "Zničil jsem Strážce!";
};

func int dia_netbek_guarddefeat_condition()
{
	if(ALLGUARDIANSKILLED == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guarddefeat_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Netbek_GuardDefeat_01_00");	//Zničil jsem Strážce! Už nejsme v ohrožení.
	AI_Output(self,other,"DIA_Netbek_GuardDefeat_01_01");	//Dobře. I když po pravdě řečeno, od začátku jsem byl přesvědčen že to zvládneš.
	AI_Output(self,other,"DIA_Netbek_GuardDefeat_01_02");	//Volba bohů nebyla náhodná. Jak vidíš, výsledek se prokázal.
};

instance DIA_NETBEK_CALMYOU(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_calmyou_condition;
	information = dia_netbek_calmyou_info;
	permanent = FALSE;
	description = "Nemáš pro mě nějakou radu?";
};

func int dia_netbek_calmyou_condition()
{
	if(Npc_KnowsInfo(hero,dia_netbek_guarddefeat))
	{
		return TRUE;
	};
};

func void dia_netbek_calmyou_info()
{
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_01");	//Tvůj klid dělá dojem.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_02");	//Co se mi snažíš říci?
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_03");	//Jednoduše se chováš, jakoby se nic nestalo během posledních dnů.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_05");	//To je jednoduché, naučil mě to můj bůh.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_06");	//Jeho vědění mi dává sílu odolat nátlaku okolního světa!
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_07");	//Kromě toho, náš nepřítel je poražen, takže není důvod se tím zabývat.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_09");	//Jsem si jistý, že zvládnete i skřety! Zvlášť teď, když ztratili pomoc Strážců.
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_11");	//Doufám, že máte pravdu.
};

instance DIA_NETBEK_DRUID(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_condition;
	information = dia_netbek_DRUID_info;
	permanent = FALSE;
	description = "Zničil jsem Strážce!";
};

func int dia_netbek_DRUID_condition()
{
	if((NetBekIsDruid == TRUE) && (XarDruid == TRUE) && (RootIsUp == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Netbek_DRUID_01_01");	//Jsi druid, ne?
	AI_Output(self,other,"DIA_Netbek_DRUID_01_02");	//Co myslíš tímto slovem?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_03");	//No, mluvíte se stromy a používáte své magické schopnosti.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_04");	//Pokud je mi známo, je toho schopný jen druid.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_05");	//No, pokud ano, pak máš pravdu. Jsem druid.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_06");	//Pak potřebuji vaši pomoc.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_07");	//Dobrý! Jak ti mohu pomoci?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_08");	//Musím přivést zpět k životu jeden strom. A obávám se, že se mi to bez vás nepovede.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_09");	//To je správná věc. Samozřejmě, pomůžu ti v tom. Počkej chvilku...
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other,"DIA_Netbek_DRUID_01_10");	//Tady, tento kořen. S ním můžeš inhalovat mrtvé tělo dřeviny do nového života.
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	AI_Output(other,self,"DIA_Netbek_DRUID_01_11");	//Takhle jednoduše?
	AI_Output(self,other,"DIA_Netbek_DRUID_01_12");	//Chceš něco složitějšího? Pokud jo, pak by ses měl obrátit na někoho jiného.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_13");	//Ne, jsem spokojený.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_14");	//Tak proč ty dotěrné dotazy?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_15");	//Á, omlouvám se!
	B_LogEntry(TOPIC_AdanosCrone,"Všechno bylo mnohem jednodušší, Netbeka jsem požádal o pomoc a on mi dal magický kořen, který je schopen velkého stroma navrátit zpět k životu. Jsem ohromen jeho magii, nebo možná přesněji - magii druidů?!");
	RootIsUp = TRUE;
};

instance DIA_NETBEK_DRUID_TEACH(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_TEACH_condition;
	information = dia_netbek_DRUID_TEACH_info;
	permanent = FALSE;
	description = "Můžeš mě naučit, jak dělat ty kameny?";
};

func int dia_netbek_DRUID_TEACH_condition()
{
	if((NETBEK_HALLO4 == TRUE) && ((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_TEACH_info()
{
	AI_Output(other,self,"DIA_Netbek_DRUID_TEACH_01_01");	//Můžeš mě naučit, jak dělat ty kameny?
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_02");	//Hmmm... proč ne.
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_03");	//Je však nutná určitá zkušenost a znalost kruhů magie, jinak to nejde.
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_04");	//A samozřejmě runový kámen, bez toho by se to neobešlo.
	Netbek_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_NetbekTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_NetbekTeacher,"Netbek mě může naučit, jak vytvořit runy transformace v různá zvířata.");
};

instance DIA_Netbek_Runen(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Runen_Condition;
	information = DIA_Netbek_Runen_Info;
	permanent = TRUE;
	description = "Nauč mě vyrábět runy přeměny.";
};

func int DIA_Netbek_Runen_Condition()
{
	if((Netbek_TeachRunes == TRUE) && (HeroKnownTrans_Troll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Netbek_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Uč mě!
	Info_ClearChoices(DIA_Netbek_Runen);
	Info_AddChoice(DIA_Netbek_Runen,Dialog_Back,DIA_Netbek_Runen_BACK);

	if(HeroKnownTrans_BloodFly == FALSE)
	{
		Info_AddChoice(DIA_Netbek_Runen,"Přeměna v krvavou mouchu (VB: 1)",DIA_Netbek_Runen_BloodFly);
	};
	if((HeroKnownTrans_FireWaran == FALSE) && (HeroKnownTrans_BloodFly == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Přeměna v ohnivého ještěra (VB: 2)",DIA_Netbek_Runen_FireWaran);
	};
	if((HeroKnownTrans_Warg == FALSE) && (HeroKnownTrans_FireWaran == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Přeměna ve warga (VB: 4)",DIA_Netbek_Runen_Warg);
	};
	if((HeroKnownTrans_ShadowBeast == FALSE) && (HeroKnownTrans_Warg == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Přeměna v stínovou šelmu (VB: 6)",DIA_Netbek_Runen_ShadowBeast);
	};
	if((HeroKnownTrans_DragonSnapper == FALSE) && (HeroKnownTrans_ShadowBeast == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Přeměna v dračího chňapavce (VB: 8)",DIA_Netbek_Runen_DragonSnapper);
	};
	//if((HeroKnownTrans_Troll == FALSE) && (HeroKnownTrans_DragonSnapper == TRUE))
	//{
	//	Info_AddChoice(DIA_Netbek_Runen,"Prevrashcheniye v trollya (Ochki obucheniya: 10)",DIA_Netbek_Runen_Troll);
	//};
};

func void DIA_Netbek_Runen_BACK()
{
	Info_ClearChoices(DIA_Netbek_Runen);
};

func void DIA_Netbek_Runen_BloodFly()
{
	if(hero.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 1;
		RankPoints = RankPoints + 1;
		AI_Print("Naučeno: Tvorba run - 'Přeměna v krvavou mouchu'");
		HeroKnownTrans_BloodFly = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA V KRVAVOU MOUCHU: křídla, pryskyřice a akvamarín.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};

	};
};

func void DIA_Netbek_Runen_FireWaran()
{
	if(hero.lp < 2)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		AI_Print("Naučeno: Tvorba run - 'Přeměna v ohnivého ještěra'");
		HeroKnownTrans_FireWaran = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA V OHNIVÉHO JEŠTĚRA: ohnivý jazyk, síra a kůže plaza.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

func void DIA_Netbek_Runen_Warg()
{
	if(hero.lp < 4)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		AI_Print("Naučeno: Tvorba run - 'Přeměna ve warga'");
		HeroKnownTrans_Warg = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA VE WARGA: 2x zuby, černá perla a kůže warga.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

func void DIA_Netbek_Runen_ShadowBeast()
{
	if(hero.lp < 6)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		AI_Print("Naučeno: Tvorba run - 'Přeměna ve stínovou šelmu'");
		HeroKnownTrans_ShadowBeast = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA VE STÍNOVOU ŠELMU: uhlí, roh stínové šelmy a kůže stínové šelmy.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

func void DIA_Netbek_Runen_DragonSnapper()
{
	if(hero.lp < 8)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		AI_Print("Naučeno: Tvorba run - 'Přeměna v dračího chňapavce'");
		HeroKnownTrans_DragonSnapper = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA V DRAČÍHO CHŇAPAVCE: roh dračího chňapavce, křemen a magická ruda.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

func void DIA_Netbek_Runen_Troll()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Print("Naučeno: Tvorba run - 'Přeměna v trola'");
		HeroKnownTrans_Troll = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Ingredience pro vytvoření runy PŘEMĚNA V TROLA: 2x trolí tesák, pryskyřice, síra a trolí kůže.");


		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

instance DIA_Netbek_Trade(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Trade_condition;
	information = DIA_Netbek_Trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své magické svitky.";
};

func int DIA_Netbek_Trade_condition()
{
	if((CHOOSESTONE == TRUE) && (other.guild != GIL_GUR))
	{
		if((other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM))
		{
			return TRUE;
		};
	};
};

func void DIA_Netbek_Trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_BaalTyon_Trade_01_01");	//Ukaž mi své magické svitky.
	B_GiveTradeInv(self);
};
