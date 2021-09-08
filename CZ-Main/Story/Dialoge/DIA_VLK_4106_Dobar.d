
instance DIA_Dobar_EXIT(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 999;
	condition = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dobar_HALLO(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 2;
	condition = DIA_Dobar_HALLO_Condition;
	information = DIA_Dobar_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dobar_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dobar_HALLO_Info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//Co chceš?
};


instance DIA_Dobar_Talent(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Talent_Condition;
	information = DIA_Dobar_Talent_Info;
	permanent = FALSE;
	description = "Rozumím trochu kovařině.";
};


func int DIA_Dobar_Talent_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dobar_Talent_Info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//Rozumím trochu kovařině.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//No a co?
};


instance DIA_Dobar_Schmiede(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Schmiede_Condition;
	information = DIA_Dobar_Schmiede_Info;
	permanent = FALSE;
	description = "Můžu použít tvoji kovárnu?";
};


func int DIA_Dobar_Schmiede_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Schmiede_Info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//Můžu použít tvoji kovárnu?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//Přes den mám hodně práce, ale v noci můžeš.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//Parlaf a já tu nebudeme a tvá práce bude nerušená.
};

instance DIA_Dobar_Waffe(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 80;
	condition = DIA_Dobar_Waffe_Condition;
	information = DIA_Dobar_Waffe_Info;
	permanent = FALSE;
	description = "Můžeš pro mě udělat zbraň?";
};

func int DIA_Dobar_Waffe_Condition()
{
	return TRUE;
};

func void DIA_Dobar_Waffe_Info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//Můžeš pro mě udělat zbraň?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//Na to nemám čas. Nějaké zbraně prodává Tandor.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Tandor prodává zbraně na hradě.");
};

instance DIA_Dobar_NEWS(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 900;
	condition = DIA_Dobar_NEWS_Condition;
	information = DIA_Dobar_NEWS_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_Dobar_NEWS_Condition()
{
	return TRUE;
};

func void DIA_Dobar_NEWS_Info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//Jak to jde?
	if(Dobar_einmalig == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//Kovám zbraně pro paladiny tady na hradě. Od té doby co tu jsme zavření jsem jich udělaal hodně.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//A taky jich hodně budeme potřebovat - ti zatracení skřeti se bojí jen ostré oceli.
		if(Npc_IsDead(Parlaf) == FALSE)
		{
			B_TurnToNpc(self,Parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(volá) Hej, Parlafe - udělej ty zbraně krásné a ostré, aby si jich skřeti všimli!
			B_TurnToNpc(self,other);
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//Mohlo to být lepší.
	};
};

instance DIA_DOBAR_ARMORCANTEACH(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = dia_dobar_armorcanteach_condition;
	information = dia_dobar_armorcanteach_info;
	permanent = TRUE;
	description = "Rozumíš kování zbroje?";
};


func int dia_dobar_armorcanteach_condition()
{
	if((DOBAR_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dobar_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_00");	//Rozumíš kování zbroje?
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_01");	//Trochu rozumím její výrobě, ale zbraně jsou mi bližší.
	AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_02");	//A nemohl bys mě to naučit?
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_03");	//Kovat zbroj? To asi ne, ale můžu ti ukázat jak ji udělat odolnější.
	AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_04");	//Ale první musíš porozumět základům kovařiny.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Dobar_ArmorCanTeach_01_05");	//Neříkal jsem ti, že kování rozumím?
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_07");	//Aha, ano, nějak se mi to vykouřilo z hlavy... Pak tu není žádný problém, prostě tě naučím co umím. Ale musím tě varovat, že vše má svou cenu - včetně mých lekcí.
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_08");	//Připrav se a přijď aaž se budeš chtít učit.
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_09");	//Zdá se, že jsi úplný kovář!
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_10");	//Dám ti radu, dítě. Nejdříve se nauč kovat a pak se na tebe podíváme...
		AI_Output(self,other,"DIA_Dobar_ArmorCanTeach_01_11");	//A všechno má svou cenu, včetně mých lekcí.
	};

	DOBAR_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Dobar mě může naučit, jak vylepšit zbroje domobrany.");
};

func void b_dobar_teacharmor_1()
{
	AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_01");	//Dobrá, poslouchej pozorně a připrav si suroviny...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_02");	//... Na kovadlinu ulož rozhžavenou ocel...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_03");	//... Pak jí dej potřebný tvar a připevni k příslušné části zbroje...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_05");	//... To je vše!
	};
};

func void b_dobar_teacharmor_2()
{
	AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_01");	//Pamatuj si vše, co ti teď řeknu. Ale ze všeho nejdřív se ujisti, že máš všechny materiály...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_02");	//... Vezmi ocel a dej jí určitý tvar...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_03");	//... Každou část spoj s dalším materiálem...
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_04");	//... Pak ti vznikne kostra, kterou napojíš na zbroj... 
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_2_01_05");	//... A máš hotovo!
	};
};

func void b_dobararmorchoices()
{
	Info_ClearChoices(dia_dobar_armorteach);
	Info_AddChoice(dia_dobar_armorteach,Dialog_Back,dia_dobar_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_dobar_armorteach,"Zbroj domobránce (cena: 600 zlatých)",dia_dobar_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_dobar_armorteach,"Těžká zbroj domobránce (cena: 1200 zlatých)",dia_dobar_armorteach_itar_mil_m_v1);
	};
};

instance DIA_DOBAR_ARMORTEACH(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = dia_dobar_armorteach_condition;
	information = dia_dobar_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};

func int dia_dobar_armorteach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent) && (Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DOBAR_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_dobar_armorteach_info()
{
	AI_Output(other,self,"DIA_Dobar_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Dobar_ArmorTeach_01_01");	//Dobrá, začneme...
		b_dobararmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_ArmorTeach_01_02");	//Chlape, vždyť je noc. Snad si nemyslíš, že teď tě budu něco učit... Vrať se ráno.
	};
};

func void dia_dobar_armorteach_back()
{
	Info_ClearChoices(dia_dobar_armorteach);
};

func void dia_dobar_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 600)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,600);
			b_dobar_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_TeachArmor_01_00");	//(naštvaný) Nepokoušej se mě podvést, první zlato, potom výcvik... 
	};
	b_dobararmorchoices();
};

func void dia_dobar_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1200);
			b_dobar_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_TeachArmor_01_00");	//(naštvaný) Nepokoušej se mě podvést, první zlato, potom výcvik... 
	};
	b_dobararmorchoices();
};


instance DIA_Dobar_WarGoods(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Condition;
	information = DIA_Dobar_WarGoods_Info;
	permanent = FALSE;
	description = "Nepotřebuješ pomoc?";
};

func int DIA_Dobar_WarGoods_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Info()
{
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_00");	//Nepotřebuješ pomoc?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_01");	//Hmm... Teď by se mi skutečně zišla pomocná ruka.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_02");	//Naši chlapi někdy musí zastřelit pár skřetů, když se moc přiblíží k beranidlu.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_03");	//A no to potřebují šipky. Hodně šipek! Ale teď jsme oblíčeni...
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_04");	//... Takže chceš abych ti je sehnal, správně?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_05");	//Nepřerušuj mě! Šipky samotné jsem schopen sehnat, ale...
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_06");	//... Potřebuješ ocel. Uhádl jsem?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_07");	//(otráveně) Za Beliarem s tebou chlapče! Můžeš si mě poslechnout do konce?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_08");	//Oceli mám hodně! Teď jsem se dokonce naučil tavit zbraně mrtvých paladinů, takže s ocelí nemám problém.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_09");	//Potřebuji uhlí. Jeho rezervy se blíží konci a každý den musím něco tavit.
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_10");	//A kde ho mám sehnat?
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_11");	//(otráveně) A jak to mám vědět? Ale možná bys mohl skusit staré rudné doly.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_12");	//Tam by měli být velké pece. A na jejich zahřátí bylo třeba ohromné množství uhlí.
	AI_Output(other,self,"DIA_Dobar_WarGoods_01_13");	//Dorbá, tak já se tam podívám.
	AI_Output(self,other,"DIA_Dobar_WarGoods_01_14");	//Tak to je lepší...
	MIS_DobarCoal = LOG_Running;
	Log_CreateTopic(TOPIC_DobarCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Running);
	B_LogEntry(TOPIC_DobarCoal,"Dobarovi dochází na hradě uhlí. Mám se kouknout do starých rudných dolů a skusit nějaké najít.");
};

instance DIA_Dobar_WarGoods_Done(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Done_Condition;
	information = DIA_Dobar_WarGoods_Done_Info;
	permanent = FALSE;
	description = "Mám pro tebe velé vrece uhlí.";
};

func int DIA_Dobar_WarGoods_Done_Condition()
{
	if((MIS_DobarCoal == LOG_Running) && (Npc_HasItems(other,ITMI_COALBAG) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Done_Info()
{
	var int MoreCoal;

	AI_Output(other,self,"DIA_Dobar_WarGoods_Done_01_00");	//Mám pro tebe velé vrece uhlí.

	if(Npc_HasItems(other,ITMI_COALBAG) == 1)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ITMI_COALBAG,1);
		Npc_RemoveInvItems(self,ITMI_COALBAG,1);
	}
	else if(Npc_HasItems(other,ITMI_COALBAG) >= 2)
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ITMI_COALBAG,2);
		Npc_RemoveInvItems(self,ITMI_COALBAG,2);
		MoreCoal = TRUE;
	};

	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_01");	//Výborně! A kde jsi ho sehnal?
	AI_Output(other,self,"DIA_Dobar_WarGoods_Done_01_02");	//V starém dole.
	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_03");	//Vidíš? Moje rada se vyplatila.
	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_04");	//Díky chlape. Tady máš pár šipek z našeho skladu.

	if(MoreCoal == TRUE)
	{
		B_GiveInvItems(self,other,ItRw_Bolt,200);
	}
	else
	{
		B_GiveInvItems(self,other,ItRw_Bolt,100);
	};

	AI_Output(self,other,"DIA_Dobar_WarGoods_Done_01_06");	//Hádam ti přijdou vhod.
	MIS_DobarCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Success);
	B_LogEntry(TOPIC_DobarCoal,"Dobar byl potěšen uhlím co jsem mu donesl.");
};

var int DobarTeachOrcsWeapon;

instance DIA_Dobar_OrcsWeapon(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_OrcsWeapon_Condition;
	information = DIA_Dobar_OrcsWeapon_Info;
	permanent = FALSE;
	description = "Víš jak tavit skřetí zbraně?";
};

func int DIA_Dobar_OrcsWeapon_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dobar_WarGoods))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeapon_Info()
{
	AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_00");	//Víš jak tavit skřetí zbraně?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_01");	//Musel jsem se to naučit! Jak jinak by paladinové měli čím střílet.
	AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_02");	//A můžeš mě to naučit?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_03");	//No... proč ne?
	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_05");	//Ale nejdřív budeš muset perfektně ovládnout výrobu oceli z železné rudy.

	if(KNOWHOWTOOREFUS == TRUE)
	{
		AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_06");	//To už vím.
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_07");	//Paráda! Potom to pro tebe bude jednodušší...
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_08");	//Ale musím tě varovat. Jako poplatek za učení beru pouze magickou rudu.
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_09");	//Bez této znalosti ti nepomůžu.
		AI_Output(other,self,"DIA_Dobar_OrcsWeapon_01_10");	//Aha.
		AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_11");	//A ještě jdena věc. Jako poplatek za učení beru pouze magickou rudu.
	};


	AI_Output(self,other,"DIA_Dobar_OrcsWeapon_01_12");	//Zlato mi je na nic!
	DobarTeachOrcsWeapon = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Dobar mě dokáže naučit jak přetavit skřetí zbraně do ocelových ingotů.");
};

instance DIA_Dobar_OrcsWeaponTeach(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 5;
	condition = DIA_Dobar_OrcsWeaponTeach_condition;
	information = DIA_Dobar_OrcsWeaponTeach_info;
	permanent = TRUE;
	description = "Nauč mě tavit skřetí zbraně. (VB: 2, cena: 10 kusů magické rudy)";
};

func int DIA_Dobar_OrcsWeaponTeach_condition()
{
	if((DobarTeachOrcsWeapon == TRUE) && (OrcsWeaponSteel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeaponTeach_info()
{
	AI_Output(other,self,"DIA_Dobar_OrcsWeaponTeach_01_00");	//Nauč mě tavit skřetí zbraně.

	if(KNOWHOWTOOREFUS == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_01");	//Nejdřív budeš muset perfektně ovládnout výrobu oceli z železné rudy. Neříkal jsem ti to už?
	}
	else
	{
		if((hero.lp >= 2) && (Npc_HasItems(other,ItMi_Nugget) >= 10))
		{
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_02");	//Dobře. Jako základ budeš potřebovat jeden ocelový ingot.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_03");	//Je důležité abys měl všechny co natavíš přesně takové veliksoti.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_04");	//Též bys měl vědět, že skřetí ocel je rozličná od té naší. Skřeti si nelámou hlavu její čistotou.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_05");	//A proto na vytvoření ingotu dobré kvality jedna jejich zbraň nestačí.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_06");	//Já zvyčejně udělám jeden ingot z deseti.
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_07");	//A nejdůležitěšjí je abys správně odstranil všechny nečistoty!
			AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_08");	//Tak, to by mělo být všechno.
			hero.lp = hero.lp - 2;
			RankPoints = RankPoints + 2;
			Npc_RemoveInvItems(hero,ItMi_Nugget,10);
			OrcsWeaponSteel = TRUE;
			AI_Print("Naučeno: Tavení skřetích zbraní");
			B_LogEntry(TOPIC_STEELDRAW,"Teď umím tavit skřetí zbraně.");
			Snd_Play("LevelUP");
		}
		else
		{
			if(hero.lp < 2)
			{
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Print(Print_NotEnoughOre);
				AI_Output(self,other,"DIA_Dobar_OrcsWeaponTeach_01_12");	//A kde máš rudu? Bez ní tě nic nenaučím.
			};
		};
	};
};