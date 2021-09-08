/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(2x) dia_orc_8550_urnazul_urhan_Ok - Ok (cyrilice -> latinka)
(2x) dia_orc_8550_urnazul_urhankilldone_Ok - Ok (cyrilice -> latinka)
(2x) DIA_GorkCampGuard_Hello_Ore - Ore (cyrilice -> latinka)

func void DIA_GorkOrcBoss_WarWin_info - opravena chybějící odměna

*/




instance DIA_ORC_8550_URNAZUL_EXIT(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_exit_condition;
	information = dia_orc_8550_urnazul_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8550_urnazul_exit_condition()
{
	return TRUE;
};

func void dia_orc_8550_urnazul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8550_URNAZUL_HIFIRST(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hifirst_condition;
	information = dia_orc_8550_urnazul_hifirst_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8550_urnazul_hifirst_condition()
{
	if(MEETURNAZUL == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hifirst_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_01");	//Nevěřím očím!... Člověk?! Kdo tě sem pustil?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_02");	//Musíš být buď statečný nebo hloupý, že jsi sem přišel.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_03");	//Farrok mě pustil. Přišel jsem si s tebou promluvit, Ur-Thralle.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_04");	//Musí to být vážné, když tě ke mě pustili, mluv člověče.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_05");	//Jestli mě urazíš, nebo něco zkusíš, zemřeš! Ani Ulu-Mulu ti nepomůže.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_06");	//Nyní mluv, já poslouchám.
	MEETURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_LostPaladins(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LostPaladins_condition;
	information = dia_orc_8550_urnazul_LostPaladins_info;
	permanent = FALSE;
	description = "Mám otázku.";
};

func int dia_orc_8550_urnazul_LostPaladins_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KnowVenzelOrcs == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LostPaladins_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_01");	//Měl bych na tebe jednu otázku.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_02");	//Ptej se, jestli chceš.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_03");	//Nezajali vaši vojáci náhodou nedávno nějakého paladina?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_04");	//(zamyšleně) Ur-Thrall myslí, že ne. Jinak by o tom vědět.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_05");	//Paladin je velmi dobrý voják a dobře znát válečný plán lidí.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_06");	//No, stejně by vám moc neřekl.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_07");	//(smích) Člověk prostě neví, jak bratři umět dostat pravdu z lidí.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_08");	//Pokud by se dostat k bratrům do zajetí, Ur-Thrall by ho donutil mluvit!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_09");	//Raděj ani nechci vědet jak.
	B_LogEntry(TOPIC_LostPaladins,"Vůdce skřetů Ur-Thrall neví nic o paladinech. Nebo prostě netuší, že některí z vězňů může být paladin.");
};

instance DIA_ORC_8550_URNAZUL_KnowVenzelOrcs(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_KnowVenzelOrcs_condition;
	information = dia_orc_8550_urnazul_KnowVenzelOrcs_info;
	permanent = FALSE;
	description = "Co uděláte s vězni?";
};

func int dia_orc_8550_urnazul_KnowVenzelOrcs_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8550_UrNazul_LostPaladins) && (MIS_LostPaladins == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_KnowVenzelOrcs_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_01");	//A co uděláte s vězni?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_02");	//Je-li člověk silný, půjde pracovat do železného dolu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_03");	//A pokud ne, pak ho bratři prostě sní. Pro skřety je k ničemu.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_04");	//Máte železný důl?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_05");	//Člověk je překvapen? A jak myslel, že skřeti dělají zbroje a meče?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_06");	//Počítám tedy, že všichni vězni pracují v železném dolu. Můžu se tam nějak dostat?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_07");	//Arrgh... (rozzlobeně) Člověk klást příliš mnoho otázek!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_08");	//Už ti nic víc neřeknu! Ur-Thrall člověku nedůvěruje.
	B_LogEntry(TOPIC_LostPaladins,"Vězni končí buď v železném dolu skřetů, nebo v jejich žaludku. Zůstáva jediné - dostat se do dolu a zjistit jestli je některí z vězňů paladin. Ur-Thrall mi bohužel přetal důverovat a nic víc neřekne. Musím to nějak napravit.");
	MustGoInIronMine = TRUE;
};

instance DIA_ORC_8550_URNAZUL_Psicamp(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_Psicamp_condition;
	information = dia_orc_8550_urnazul_Psicamp_info;
	permanent = FALSE;
	description = "Chci s tebou mluvit o chrámu v bažinách.";
};

func int dia_orc_8550_urnazul_Psicamp_condition()
{
	if((MEETURNAZUL == TRUE) && (MIS_PsicampDemon == LOG_Running) && (HoshNarSentMe == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_Psicamp_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_01");	//Chci s tebou mluvit o chrámu v bažinách.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_02");	//(podrážděně) Co člověk chce říci Ur-Thrall?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_03");	//Veliký šaman Ur-Hosh-Nar tam nedávno vyslal malý oddíl.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_04");	//KROTOK YABAR!... (vztekle) Neposlouchal mě! Je velmi hloupý, když tak učinil.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_05");	//Možná. Ale teď už je pozdě naříkat.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_06");	//Starší Tor Dal, vedoucí oddílu, ztratil téměř všechny své vojáky.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_07");	//(vztekle) Jak se to stalo?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_08");	//Zabili je nemrtví, kteří se usadili v bažinách.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_09");	//A v chrámu Bratrstva, jak se zdá, je něco ještě horší.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_10");	//Ur-Thrall předpokládal, že je to tak... Nedalo se tam jít.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_11");	//Nesmí rušit mrtvé, nesmí rušit zlo...
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_12");	//Tor Dal žádá, abys mu poslal další válečníky, aby mohl zahnat zlo v chrámu.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_13");	//Jak jsem pochopil, jenom ty můžeš dát takový rozkaz.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_14");	//Ur-Thrall znát Tor Dal... (s respektem) Být statečný válečník, nikdy neustoupit před nepřítelem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_15");	//Bylo by velmi smutné, kdyby Tor Dal zemřít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_16");	//Takže mu mohu říct, že pomoc dorazí brzy?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_17");	//Nemám na výběr, člověče. Pošlu mu na pomoc mnoho mocných válečníků!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_18");	//Člověk může jít také aby pomohl Tor Dal zabít zlo v chrámu.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_19");	//Budu o tom přemýšlet.
	TorDalMoreWar = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"Ur-Thrall poslat na záchranu Tor Dala své válečníky. Také mě pozval abych se zúčastnil boje o chrám.");	
};

instance DIA_ORC_8550_URNAZUL_AboutIronMine(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMine_condition;
	information = dia_orc_8550_urnazul_AboutIronMine_info;
	permanent = FALSE;
	description = "Teď už si zasloužím tvou důvěru, náčelníku?";
};

func int dia_orc_8550_urnazul_AboutIronMine_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MustGoInIronMine == TRUE) && (CanEnterOrcMine == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMine_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01");	//Pusťte mě do dolu.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_02");	//Arrgh... (s uznáním) Člověk hodně pomoci Ur-Thrall! Teď mu více důvěrovat.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_04");	//Nejdřív Ur-Thrall chce vědet, proč tam člověk chce jít.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_05");	//Pokud Ur-Thrall souhlasit s člověk, nechá ho jít do železného dolu.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Je sa tam chci porozhlédnout.",DIA_Orc_8550_UrNazul_AboutIronMine_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Zajímá mě železná ruda!",DIA_Orc_8550_UrNazul_AboutIronMine_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Záleží na tom?",DIA_Orc_8550_UrNazul_AboutIronMine_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Musím mluvit s vězni.",DIA_Orc_8550_UrNazul_AboutIronMine_Q4);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ur-Thrall si myslí, že člověk by tam neměl jít.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_01");	//Je sa tam chci porozhlédnout.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_02");	//Důl je velmi nebezpečné místo! Nebýt jen podívaná!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ur-Thrall myslí, že pro člověka nemá cenu tam jít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_04");	//Toková starost...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_01");	//Zajímá mě železná ruda!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_02");	//Člověk chcete dolovat železnou rudu skřetů?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_03");	//Pak tě Ur-Thrall nemůže pustit. Ruda být jen pro skřety!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_04");	//Nebo můžeš jít, ale jen jako otrok a zůstat tam navždy. Člověk si to přát?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_05");	//Obávám se, že tato možnost se mi vůbec nezamlouvá.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_06");	//Arrgh...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_01");	//Záleží na tom?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_02");	//Když Ur-Thrall říct že ano, tak záleží.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_03");	//Pokud člověk nemá dobrý důvod, neměl by chodit k železnému dolu.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_01");	//Musím mluvit s vězni.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_02");	//A o čem chce člověk s nimi mluvit?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Někteří z nich by mohli vědět o Spáčově chrámu.",DIA_Orc_8550_UrNazul_AboutIronMine_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Jeden z nich má informace pro paladiny.",DIA_Orc_8550_UrNazul_AboutIronMine_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Chci se od nich naučit jak těžit železnou rudu.",DIA_Orc_8550_UrNazul_AboutIronMine_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"No o dracích!",DIA_Orc_8550_UrNazul_AboutIronMine_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Chci je jen trochu utěšit.",DIA_Orc_8550_UrNazul_AboutIronMine_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_01");	//Někteří z nich by mohli vědět o Spáčově chrámu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_02");	//To těžko! Spáčův chrám postavili skřeti a jen oni znají jeho tajemství.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_03");	//Lidé nepostavil chrám a neuctívájí Spáče! Nevím o něm nic.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_04");	//Člověk se snaží oklamat Ur-Thrall?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_05");	//Ale kdepak! To be mě ani nenapadlo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_06");	//Arrgh... (výhružně)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_01");	//Jeden z nich má informace pro paladiny.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_02");	//A odkud to víš?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_03");	//Mezi vězni jsou tací co přišli s jejich oddílem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_04");	//Hmmm... (zamyšleně) To je docela možné.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_05");	//Dobře! Ur-Thrall pustí člověka do dolu, pokud ho upozorní na nepřítele.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_06");	//Jistě - dohodnuto! Tak jak se můžu dostat do dolu?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_07");	//Ur-Thrall dát člověku klíč kterým otevře průchod do dolu.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_08");	//Ale pozor! Bratři šamani uvalili na průchod silné kouzlo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_09");	//Skřetům neublíží. Ale jestliže se člověk dotkne, pak okamžitě zemře!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_10");	//A proč to udělali?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_11");	//Aby zabili vězně kteří by chteli utéct ze železného dolu.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_12");	//Jasně.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

 	B_LogEntry(TOPIC_LostPaladins,"Podařilo se mi přesvědčit Ur-Thralla, aby mi otevřel do dolu. Doufám, že najdu něco o Wenzelově oddílu.");
	CanEnterOrcMine = TRUE;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_01");	//Chci se od nich naučit jak těžit železnou rudu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_02");	//Na to člověk nemusí jít do dolu skřetů.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_03");	//To se může naučit i od jiných lidí.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_01");	//No o dracích!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_02");	//(smích) Co může obyčejný otrok vědět o dracích?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_03");	//Ur-Thrall myslí, že člověk mluví nesmysly. Hodně ho rozesmát!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_04");	//Ale pustit člověka k železnému dolu nemůže.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_05");	//Jenom bys otrokům odváděl pozornost od práce!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_06");	//Když myslíš...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W5()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_01");	//Chci je jen trochu utěšit.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_02");	//(smích) Člověk být příliš dobrý pokud to chce udělat.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_03");	//Ale Ur-Thrall říci ne! Jenom bys otrokům odváděl pozornost od práce!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_04");	//A oni pak vytěží méně železné rudy.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

instance DIA_ORC_8550_URNAZUL_AboutIronMineMore(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMineMore_condition;
	information = dia_orc_8550_urnazul_AboutIronMineMore_info;
	permanent = TRUE;
	description = "Pusti mě do dolu.";
};

func int dia_orc_8550_urnazul_AboutIronMineMore_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Orc_8550_UrNazul_AboutIronMine) == TRUE) && (MIS_LostPaladins == LOG_Running) && (MustGoInIronMine == TRUE) && (CanEnterOrcMine == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMineMore_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01");	//Pusti mě do dolu.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_02");	//Ur-Thrall stále neví, proč tam člověk chce jít.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Je sa tam chci porozhlédnout.",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Zajímá mě železná ruda!",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Záleží na tom?",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Musím mluvit s vězni.",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ur-Thrall si myslí, že člověk by tam neměl jít.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_01");	//Jen sa tam chci porozhlédnout.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_02");	//Důl je velmi nebezpečné místo! Nebýt jen podívaná!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_03");	//Ur-Thrall myslí, že pro člověka nemá cenu tam jít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_04");	//Taková starost...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_01");	//Zajímá mě železná ruda!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_02");	//Člověk chcete dolovat železnou rudu skřetů?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_03");	//Pak tě Ur-Thrall nemůže pustit. Ruda být jen pro skřety!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_04");	//Nebo můžeš jít, ale jen jako otrok a zůstat tam navždy. Člověk si to přát?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05");	//Obávám se, že tato možnost se mi vůbec nezamlouvá.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06");	//Arrgh...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_01");	//Záleží na tom?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_02");	//Když Ur-Thrall říct že ano, tak záleží.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_03");	//Pokud člověk nemá dobrý důvod, neměl by chodit k železnému dolu.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_01");	//Musím mluvit s vězni.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_02");	//A o čem chce člověk s nimi mluvit?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Někteří z nich by mohli vědět o Spáčově chrámu.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Jeden z nich má informace pro paladiny.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Chci se od nich naučit jak těžit železnou rudu.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"No o dracích!",DIA_Orc_8550_UrNazul_AboutIronMineMore_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Chci je jen trochu utěšit.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_01");	//Někteří z nich by mohli vědět o Spáčově chrámu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_02");	//To těžko! Spáčův chrám postavili skřeti a jen oni znají jeho tajemství.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_03");	//Lidé nepostavil chrám a neuctívájí Spáče! Nevím o něm nic.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_04");	//Člověk se snaží oklamat Ur-Thrall?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_05");	//Ale kdepak! To be mě ani nenapadlo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_06");	//Arrgh... (výhružně)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_01");	//Jeden z nich má informace pro paladiny.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_02");	//A odkud to víš?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_03");	//Mezi vězni jsou tací co přišli s jejich oddílem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_04");	//Hmmm... (zamyšleně) To je docela možné.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_05");	//Dobře! Ur-Thrall pustí člověka do dolu, pokud ho upozorní na nepřítele.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_06");	//Jistě - dohodnuto! Tak jak se můžu dostat do dolu?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_07");	//Ur-Thrall dát člověku klíč kterým otevře průchod do dolu.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_08");	//Ale pozor! Bratři šamani uvalili na průchod silné kouzlo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_09");	//Skřetům neublíží. Ale jestliže se člověk dotkne, pak okamžitě zemře!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_10");	//A proč to udělali?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_11");	//Aby zabili vězně kteří by chteli utéct ze železného dolu.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_12");	//Jasně.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_LostPaladins,"Podařilo se mi přesvědčit Ur-Thralla aby mi otevřel průchod do železného dolu skřetů. Doufám, že zjistím něco o Wenzelovu oddílu.");
	CanEnterOrcMine = TRUE;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_01");	//Chci se od nich naučit jak těžit železnou rudu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_02");	//Na to člověk nemusí jít do dolu skřetů.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_03");	//To se může naučit i od jiných lidí.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_01");	//No o dracích!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_02");	//(smích) Co může obyčejný otrok vědět o dracích?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_03");	//Ur-Thrall myslí, že člověk mluví nesmysly. Hodně ho rozesmát!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_04");	//Ale pustit člověka k železnému dolu nemůže.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_05");	//Jenom bys otrokům odváděl pozornost od práce!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_06");	//Když myslíš...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W5()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_01");	//Chci je jen trochu utěšit.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_02");	//(smích) Člověk být příliš dobrý pokud to chce udělat.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_03");	//Ale Ur-Thrall říci ne! Jenom bys otrokům odváděl pozornost od práce!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_04");	//A oni pak vytěží méně železné rudy.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_05");	//Aha.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

instance DIA_ORC_8550_URNAZUL_LowLevel(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevel_condition;
	information = dia_orc_8550_urnazul_LowLevel_info;
	permanent = FALSE;
	description = "Poslal mě za tebou Ar Dagar.";
};

func int dia_orc_8550_urnazul_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (SendForHelp == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevel_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_01");	//Poslal mě za tebou Ar Dagar.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_02");	//A co on chtít?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_03");	//Žádá, abys mu poslal několik silných válečníků.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_04");	//Proč to Ar Dagar žádá?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_05");	//Chce je poslat do hlubokého dolu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_06");	//Takže Ar Dagar chtít znovu zabít démona?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_07");	//Ur-Thrall pamatovat, co se stalo naposled, když se pokusil osvobodit důl.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_08");	//Demon být velmi silný! Zabít mnoho bratrů Ur-Thrall.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_09");	//Ano, ale tentokrát půjdu s nimi já! To tě nepřesvědčí?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_13");	//Osoba se nebojí démona? Muž pohmoždí hlavu!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_14");	//Stojím sám v podzemním městě skřetů a mluvím s tebou. Myslíš si, že jsem duševně chorý?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_15");	//Ur-Thrall myslí ano. Ale muž s Ulu-Mulu je statečný a silný.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_13");	//Ur-Thrall myslí, že člověk může osvobodit důl skřetů.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_14");	//Pošlu s tebou své nejlepší válečníky. ORAK SHAKA, člověče!
	OrcHelpLowLevel = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Ur-Thrall souhlasil, že pošle Ar Dagarovi několik svých nejlepších válečníků.");
};

instance DIA_ORC_8550_URNAZUL_LowLevelFree(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevelFree_condition;
	information = dia_orc_8550_urnazul_LowLevelFree_info;
	permanent = FALSE;
	description = "Osvobodil jsem hluboký důl od zla!";
};

func int dia_orc_8550_urnazul_LowLevelFree_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevelFree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevelFree_01_01");	//Osvobodil jsem hluboký důl od zla!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevelFree_01_02");	//Ur-Thrall vědět, že člověk to dokáže. Mor Dar být velký válečník!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevelFree_01_03");	//Děkovat člověku, který pomohl mému národu zbavit se tohoto prokletí.
};

var int TakeIdolKrushak;

instance DIA_ORC_8550_URNAZUL_HELLO(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_condition;
	information = dia_orc_8550_urnazul_hello_info;
	permanent = TRUE;
	description = "Přišel jsem za tebou ohledně Spáčova chrámu.";
};

func int dia_orc_8550_urnazul_hello_condition()
{
	if((MIS_ORCTEMPLE == LOG_Running) && (TakeIdolKrushak == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_07");	//Přišel jsem za tebou ohledně Spáčova chrámu. Slyšel jsem, že je tam nějaké nové zlo - další zlý démon.

	if((MIS_LowLevel == LOG_Success) && ((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE)))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_08");	//Chrám Krushak?! Démon?! Hmmm... Mluv dál.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_09");	//Vím, že démon v chrámu udělal skutečný masakr. Zabil mnoho vašich bratrů.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_10");	//Démon je ovládl a jsou teď z nich duchové.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_11");	//Skřeti kouzlem zapečetili vstup, aby ta nestvůra nemohla ven.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_12");	//Chci toho démona zničit. Proto jsem tu - abych se zeptal, jak pečeť prolomit.
		AI_PlayAni(self,"T_GREETGRD");
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_04");	//Člověk je skvělý válečník. HVstoupit do chrámu Krushak!
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_05");	//Ur-Thrall ti děkuje a dá klíčovou magii - člověk otevře vchod do chrámu Krushak.
		B_GiveInvItems(self,other,itmi_idol_01,1);
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_15");	//Děkuji, vůdce. To jsem chtěl slyšet.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_19");	//Osoba může jít. Měj se dobře!
		TakeIdolKrushak = TRUE;
		B_LogEntry_Quiet(TOPIC_ORCTEMPLE,"Od vůdce skřetů jsem dostal nějaký magický talisman, který otevře průchod do Spáčova chrámu.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_New_18_01");	//Hmmm... To není případ člověka! Skřeti se zabývají zlým démonem.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_New_18_02");	//Teď je člověk lepší jít, dokud se Ur-Thrall na něj moc nezlobí.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05");	//Obávám se, že nebudu souhlasit.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06");	//Arrgh...
		AI_StopProcessInfos(self);
	};
};
instance DIA_ORC_8550_URNAZUL_ORCTEMPLEISFREE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition;
	information = dia_orc_8550_urnazul_ORCTEMPLEISFREE_info;
	permanent = FALSE;
	description = "Zničil jsem zlo v chrámu.";
};

func int dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (SleeperInRage == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_ORCTEMPLEISFREE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_01");	//Zničil jsem zlo v chrámu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_02");	//Ur-Thrall je rád, že to slyší! Člověk znovu dokázal, že je velkým válečníkem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_03");	//Bratři se tam budou moci vrátit.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_04");	//Vážně?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_05");	//Chrám je pro ně svaté místo. Budou tam mluvit s duchem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_06");	//Proto Ur-Thrall děkuje člověku za jeho pomoc!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_07");	//Ale myslet si, že pro to nebude slov.

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_08");	//Vidím, že ty spíše používat kouzlo v bitvě.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_09");	//Ano, máš pravdu.

		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_10");	//No... (s úctou) Pak si člověk vezme tento plášť a hůl jako odměnu.
			AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_11");	//Nos je s pýchou, protože nikdo jiný ještě nebyl oceněn takovou čestností!
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			CreateInvItems(other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_12");	//Takže člověk si vezme tuto zbroj a meč skřetího válečníka jako důkaz mých slov.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_13");	//Nos je s pýchou, protože nikdo jiný ještě nebyl oceněn takovou čestností!

		if(other.attribute[ATR_STRENGTH] >= other.attribute[ATR_DEXTERITY])
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ITAR_ORCARMOR,1);
			CreateInvItems(other,Orc_Blade,1);
		}
		else
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItPo_Perm_DEX,1);
			CreateInvItems(other,ITAR_ORCARMOR_DEX,1);
			FixOrcArmor = TRUE;
		};
	};

	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Děkuju.
	OrcIsBackTemple = TRUE;
};


//---------------------------------------------------------kvest Nag-Dumgar-------------------------------------------------------------

instance DIA_Orc_8550_UrNazul_Muritan(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_info;
	important = FALSE;
	permanent = FALSE;
	description = "Slyšel jsem, že potřebuješ tesák Muritana.";
};

func int DIA_Orc_8550_UrNazul_Muritan_condition()
{
	if((TakeIdolKrushak == TRUE) && (UrTrallTalkTooth == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_00");	//Slyšel jsem, že potřebuješ tesák Muritana.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_01");	//Ano, být tak.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_02");	//A proč ho potřebuješ?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_03");	//(tiše) Člověk neví, ale jeho jed může zabít téměř kohokoliv.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_04");	//Ur-Thrall mít jednoho velmi silného nepřítele, kterého je téměř nemožné zabít. Ale on myslel, že jed téhle příšery ho může přemoci.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_06");	//Zdá se mi, že máš spoustu nepřátel, náčelníku. A kdo že to je?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_07");	//(vážně) Říkat mu Nag-Dumgar. Kdysi byl stejným skřetem jako §Ur-Thrall.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_08");	//Nikdy jsem neslyšel tohoto jméno. Můžeš mi o něm něco říct?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_09");	//... (zamyšleně) Před mnoha zimy, bratři postavili Spáčův chrám.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_10");	//Nag-Dumgar být vůdcem klanu, jehož šamani přivolat zlého démona.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_11");	//Nicméně, jak člověk pravděpodobně již ví, ten démon ovládl skřety a všechny je zabít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_12");	//Ano, já vím, co se stalo v chrámu. Ale co Nag-Dumgar?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_13");	//Když se to dovědel, Nag-Dumgar vzít spoustu vojáků a jít do chrámu, aby zabil démona.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_14");	//Ale k nezdaru! Všichni jeho vojáci umřít, a jen on sám nějak zůstat naživu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_15");	//Po návratu Nag-Dumgar dát příkaz k utěsnění vstupu do chrámu, aby zlý démon nemohl útéct.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_16");	//... (zamyšleně) Ale Nag-Dumgar se výrazně změnit poté, co šel do chrámu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_17");	//Začít ho neustále popadat nějaká nekonečnou žízeň po krvi!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_18");	//Nag-Dumgar začal přinášet bratry k oběti, říkat, že tak chránit klan před hněvem a prokletím zlého démona.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_19");	//A to jak? Nemyslím, že skřetům by se to líbilo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_20");	//Člověk mít pravdu! Skřeti myslet, že Nag-Dumgar se zbláznit a rozhodli se ho zabít.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_21");	//Když se o tom Nag-Dumgar dovědět, o začal šílet!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_22");	//On proklel svůj klan a zabít každého, kdo se odvážil stát v cestě.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_23");	//Ti bratři, kterím se ještě podařilo přežít, přísahali, že Nag-Dumgar se sám proměnit v zlého démona!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_24");	//A co se stalo pak?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_25");	//(zamyšleně) To nikdo nevědět...
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_26");	//Potom co Nag-Dumgar zabít všechny své bratry, on zmizet beze stopy a nikdo ho nevidět po mnoho zim.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_27");	//Nedávno mě však moji špehové informovali, že vidět někoho podobného Nag-Dumgar v blízkosti nejvyšší věže na severu údolí.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_28");	//Já poslal pár z mojich nejlepších válečníků, ale žádný z nich se nevrátit.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_29");	//Myslíš, že to má na svědomí on?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_30");	//Ur-Thrall není úplně jistý, ale věří, že se tak mohlo stát.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_31");	//Nedávný vývoj v Spáčově chrámu mohl Nag-Dumgara přílákat zpátky do údolí.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_32");	//Pokud ano, pak bude jistě chtít pomstit smrt svého pána, a pak všichni bratři být ve velkém nebezpečí.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_33");	//Ale Ur-Thrall nemůže připustit aby Nag-Dumgar znovu přivolat zlo!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_34");	//A ty naivně věříš, že jed Muritana ho zastaví?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_35");	//Ur-Thrall jistě neví! Jiný způsob jak zabít Nag-Dumgar nezná. Možná člověk znát?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_37");	//Odpověď na tuto otázku najdeme zřejmě jen v chrámu. Koneckonců, tam se Nag-Dumgar stal tím s kým máme teď co do činění.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_39");	//Ur-Thrall teď nemůže odejít! Ale možná člověk jít do chrámu aby to zjistil?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan,"Teď nemám čas.",DIA_Orc_8550_UrNazul_Muritan_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan,"Dobře, udělám to.",DIA_Orc_8550_UrNazul_Muritan_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_No()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_No_01_01");	//Teď nemám čas.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_No_01_02");	//S tímto se budeš muset vypořádat sám, náčelníku.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_No_01_03");	//Dobře! Ur-Thrall udělat všechno sám. Člověk už nemusí mít strach.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8550_UrNazul_Muritan_Yes()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_01");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_02");	//Pak člověk neztrácet čas! Vypravit se do chrámu a zjistit jak zabít Nag-Dumgar!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_03");	//Vyčkej na mé zprávy, náčelníku.
	MIS_NagDumgar = LOG_Running;
	Log_CreateTopic(TOPIC_NagDumgar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_Running);
	B_LogEntry(TOPIC_NagDumgar,"Zeptal jsem se Ur-Thralla proč potřebuje jedovatý tesák Muritana. Vůdce skřetů se domnívá, že může být použit k boji proti Nag-Dumgarovi - kdysi mocnému vůdci skřetího klanu, který postavil Spáčův chrám, a který byl následně přeměněn na zlého démona. Obávám se ale, že ani smrtelný jed bude bezmocný proti starobylému prokletí tohoto skřeta. S největší pravděpodobností, jediný jistý způsob, jak zabít Nag-Dumgara leží v troskách chrámu a dobrovolně jsem se nabýdl ho najít...");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_XashGor(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_XashGor_condition;
	information = DIA_Orc_8550_UrNazul_XashGor_info;
	important = FALSE;
	permanent = FALSE;
	description = "Co víš o nejvyšším šamanovi Xash-Gorovi?";
};

func int DIA_Orc_8550_UrNazul_XashGor_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (HashGorIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_XashGor_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_01");	//Co víš o nejvyšším šamanovi Hash-Gorovi?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_02");	//Hmmm... Být velmi staré jméno... (zamyšleně) Jestli Ur-Thrall pamatovat, Hash-Gor kdysi být velký syn ducha.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_03");	//To vím i sám. Co ještě mi o něm můžeš říct?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_04");	//Ur-Thrall vědet jen velmi málo, Hash-Gor žít mnoho zim zpátky. Ještě předtím, než Ur-Thrall přišel do údolí.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_06");	//A netušíš, kde ho mám hledat?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_07");	//Pokud někdo ví, kde Hash-Gor teď, pak jedině ten, kdo žít v té době.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_08");	//Člověk jistě pochopil, že mezi skřeti takový nikdo není.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_09");	//Jasně.
	DeadRabOrkovInsert = TRUE;
	B_LogEntry(TOPIC_NagDumgar,"Jak se dalo čekat, Ur-Thrall o Hash-Gorovi neví nic užitečného. Dle jeho slov mi o něm může říct víc jen ten, kdo žil v jeho době. Jenže mezi skřety už nikdo takový není... možná kdybych hledal mezi mrtvými.");
};

instance DIA_Orc_8550_UrNazul_Muritan_Dagger(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_Dagger_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_Dagger_info;
	important = FALSE;
	permanent = FALSE;
	description = "Příšel jsem na to, jak zabít Nag-Dumgara!";
};

func int DIA_Orc_8550_UrNazul_Muritan_Dagger_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (Npc_HasItems(other,ItMw_1h_TributeDagger) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_02");	//Příšel jsem na to, jak zabít Nag-Dumgara!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_04");	//Tady, podívej se na tohle.
	B_GiveInvItems(other,self,ItMw_1h_TributeDagger,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_05");	//Hmmm... (zamyšleně) Co být tohle?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_06");	//Podle starých záznamů, které jsem našel v chrámu, tuto dýku skřeti používali k obětování vlastních bratří.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_07");	//Avšak oběti nebyly určeny Spáčovi, jak naivně věřili, ale samotnému Nag-Dumgarovi!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_08");	//Nebo spíš - zlému duchovi, který vlastnil mysl jejich mocného vůdce.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_09");	//To je důvod, proč Nag-Dumgar zuřil, když skřetí odmítli zabíjet vlastní. Protože pak by již nedostával krvavé oběti pro sebe.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_11");	//A tahle dýka je podle všeho schopna Nag-Dumgara zabít. Zbývá ho jen najít a vrazit mu dýku do srdce.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_13");	//(uctivě) Člověk velmi překvapit Ur-Thrall, že to všechno dokázal zjistit. Pokud to být opravdu tak, možná již skřeti nemuset mít strach z Nag-Dumgar a jeho prokletí!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_15");	//Ur-Thrall děkovat člověk za jeho pomoc. Ur-Thrall teď jít hledat a zabít Nag-Dumgar!
	B_LogEntry(TOPIC_NagDumgar,"Přinesl jsem Ur-Thrallovi obětní dýku, kterou možno zabít Nag-Dumgara.");
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,"Doufám, že všechno dobrě dopadne.",DIA_Orc_8550_UrNazul_Muritan_Dagger_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,"Můžu toho démona zabít já sám?",DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_No()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_No_01_00");	//Doufám, že všechno dobrě dopadne, náčelníku.
	MIS_NagDumgar = LOG_Success;
	NagDumgarInsertForUrTrall = TRUE;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar,"S mocnou zbraní, Ur-Thrall se teď může postavit Nag-Dumgarovi v boji. Moje účást v tomto příběhu se chýlí ke konci...");
	AI_StopProcessInfos(self);

};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_00");	//Můžu toho démona zabít já sám?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_01");	//(překvapeně) Člověk chce bojovat s Nag-Dumgar?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_03");	//Ur-Thrall obdivovat odvahu člověka... (s uznáním) ale musí ho varovat, protože Nag-Dumgar být velmi silný a nebezpečný!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_04");	//Člověk si musí uvědomit, že nesmí udělat žádnou chybu, jinak může mnoho bratrů přijít o život.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_05");	//Rozumím, budu se snažit aby k tomu nedošlo.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_06");	//No... (zamyšleně) Ur-Thrall vidět, že člověk mít velkou důvěru ve své schopnosti!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_07");	//Proto být připraven poslat ho, aby zabil Nag-Dumgar! Tady - člověk vzít dýku a jít bojovat s démonem.
	B_GiveInvItems(self,other,ItMw_1h_TributeDagger,1);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_09");	//Kde ho mám hledat?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_10");	//Jak již Ur-Thrall říct, naposledy vidět Nag-Dumgar na severu země, v blízkosti kamenné pevnosti v horách. Tam by měl člověk hledat.
	NagDumgarInsert = TRUE;
	B_LogEntry(TOPIC_NagDumgar,"Osobně jsem se přihlásil k boji s Nag-Dumgarem! Ur-Thrall ocenil mou odvahu, ale varoval mě, že si nemůžem dovoli žádnou chybu. Naposledy Nag-Dumgara viděl na severu země, v blízkosti kamenné pevnosti v horách.");
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,Dialog_Ende,DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_Muritan_DaggerDone(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_DaggerDone_info;
	permanent = FALSE;
	description = "Nag-Dumgar je mrtvý!";
};

func int DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (NagDumgarIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_00");	//Nag-Dumgar je mrtvý!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01");	//Arrgh... (respekt) Člověk znovu dokázat, že být velký válečník!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_02");	//Ur-Thrall mu děkovat, za pomoc jeho bratří. Nag-Dumgarova kletba nás už nebude obtěžovat!
	B_GiveInvItems(self,other,ItPo_UrTrallPotion,1);
	MIS_NagDumgar = LOG_Success;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar,"Ur-Thrall byl rád, když uslyšel, že skřetí démon Nag-Dumgar je mrtvý...");
};

instance DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_info;
	permanent = FALSE;
	description = "Jaký lektvar jsi mi to dal?";
};

func int DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition()
{
	if((MIS_NagDumgar == LOG_Success) && (Npc_HasItems(other,ItPo_UrTrallPotion) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_Info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_01");	//A jaký lektvar jsi mi to dal?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_02");	//Jedná se o velmi starý a vzácný skřetí lektvar! Ur-Thrall ho střežit po mnoho zim, ale neodvážil se ho napít.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_03");	//Ale člověk prokázal, že je hoden ho mít!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_04");	//Doufám, že se neotrávím.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_05");	//Člověk nemusí mit strach. Tento nápoj ho nezabije ale udělať silnějším.
};

instance DIA_Orc_8550_UrNazul_Sword(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Sword_condition;
	information = DIA_Orc_8550_UrNazul_Sword_info;
	permanent = FALSE;
	description = "Kovář Hash Tor ti posílá tento meč.";
};

func int DIA_Orc_8550_UrNazul_Sword_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (Npc_HasItems(other,ITMW_2H_ORCSWORD_05) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Sword_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Sword_01_01");	//Kovář Hash Tor ti posílá tento meč.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_02");	//Ukaž, podívat se.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Sword_01_03");	//Tady to je.
	B_GiveInvItems(other,self,ITMW_2H_ORCSWORD_05,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_04");	//Hmmm... (vděčně)
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_05");	//Být velmi dobrý meč! Ur-Thrallovi se líbit.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_06");	//Člověk vzkázat Hash Torovi, že být spokojen s jeho prací. Je to skutečný mistr!
	B_LogEntry(TOPIC_HashTorOre,"Ur-Thrallovi se meč líbil. Mám o tom říct Hash Torovi.");	
	UrTrallTakeSword = TRUE;
};

instance DIA_ORC_8550_URNAZUL_AZGALOR(C_Info)
{
	npc = orc_8550_urnazul;
	condition = DIA_ORC_8550_URNAZUL_AZGALOR_condition;
	information = DIA_ORC_8550_URNAZUL_AZGALOR_info;
	permanent = FALSE;
	description = "Neměl bys něco na práci?";
};

func int DIA_ORC_8550_URNAZUL_AZGALOR_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (OrcIsBackTemple == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ORC_8550_URNAZUL_AZGALOR_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_01");	//Neměl bys něco na práci?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_21");	//Ur-Thrall neví... (zamyšleně) Ne, Ur-Thrall vědět!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_22");	//Člověk jít do starého domu Ur-Thrall, a zabije Azgalora.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_25");	//Azgalor? Kdo je to?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_33");	//Azgalor být velmi velký a zlý drak. Žít tam, kde dřívě žil Ur-Thrall.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_35");	//Drak?! Chceš, abych pro tebe zabil draka? Odkdy jsou draci a skřeti nepřátelé?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_42");	//Tento drak je jiný. Arhhhhh... Azgalor být zlo. Nemít silotávní.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_43");	//Před mnoha zimy, Azgalor přivolat démona - velkého, silného démona jménem Kovář Duší.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_44");	//Démon sloužit Azgaloru! Skřeti sloužit démonu! Azgalor slíbit, že pokud bratři dobře sloužit udělá je silnými aby porazili své nepřátele.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_45");	//Ur-Thrall říkal, že sloužit démonu je nemožné. Démon být zlo!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_46");	//Ale bratři neposlouchat Ur-Thrall... Bratři vypili krev démona, aby získali jeho sílu a začali mu sloužit.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_47");	//Bratři pak porazili všechny nepřátele. Démon duše jejich nepřátel donesl rovnou k Azgalorovi!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_48");	//Ale Azgalor chtel víc a víc duší! Krev démona strašit mysl a duše bratru.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_49");	//Ale bratři nechteli jen bojovat, chteli mír a bohatství kmene. Bratři přestali sloužit Azgalorovi a přišli za mnou, za Ur-Thrallem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_51");	//Azgalor rozkázal démonovi zabít bratry. Všechny skřety, Ur-Thralla a mé bratry!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_52");	//Démon zabil mnoho bratru a vzal jejich duše. Ur-Thrall se pustil do boje s démonem. Spolu s mým bratrem - Ur-Gromem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_55");	//Bratr a Ur-Thrall šli do údolí, bojovat s démonem...
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_56");	//Ur-Thrall nenávidět Azgalora! Přísahat, že pomstít bratrovu smrt.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_57");	//A ty chceš, abych ho pomstil místo tebe?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_58");	//Arrgh... (rozzlobeně) Ur-Thrall se nemůže vrátit. Ur-Thrall být prokletý!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_59");	//Kdybych šel do údolí, okamžitě zemřu. Byl bych uvězněn a musel mu sloužit!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_61");	//Nemohl bych ho pak zabít. Člověk pochopil?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_62");	//Člověk pochopil... (imitujíc skřeta) Zdá se, že není jiná možnost - souhlasím. Kde tedy najdu tvůj starý domov?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_63");	//Člověk pochopil správně! Dobrá. Ur-Thrallův dům být daleko, příliš daleko pro nohy. Použít magický portál!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_65");	//Ur-Thrall dát dva kámeny. Člověk jít dolů do jeskyně. Portál zakrývá mříž. Člověk postaví kámeny a průchod se otevře.
	B_GiveInvItems(self,other,itmi_1_orcportalstone,1);
	B_GiveInvItems(self,other,itmi_2_orcportalstone,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_68");	//Člověk teď jít, Ur-Thrall počká zde na srdce Azgalora.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_69");	//No dobře - mám pocit, že se zapotím! Počkej tady skřete - brzy budeteš mít možnost rozervat jeho srdce.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_70");	//Štastný lov, člověče.
	MIS_URNAZULRAGE = LOG_Running;
	Log_CreateTopic(TOPIC_URNAZULRAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_Running);
	B_LogEntry(TOPIC_URNAZULRAGE,"Ur-Thrall se mnou podstoupil dohodu. Slíbil jsem mu, že zabiju černého draka Azgalora a tak dokážu, že jsem dost silný na setkání s démonem ve Spáeove chrámu. Kdysi dávno Azgalor vyvolal mocného démona - kováře duší. Slíbil skřetům, že když budou vyvolanému démonu sloužit, porazí jejich nepřátele. Skřeti souhlasili a vypili jeho krev. Démonická esence je ueinila neporazitelnými. Azgalor však použil skřety proti svým vlastním nepřátelum. Skřeti se ve skutečnosti stali jeho otroky.");
	B_LogEntry_Quiet(TOPIC_URNAZULRAGE,"Unavený z krvavé války, skřeti už nechteli sloužit Azgalorovi a jeho démonovi. Hněv Azgalora byl obrovský - proklel všechny skřety a nařídil démonovi, aby všechny skřety zabil a sebral jejich duše. Ur-Thrall a jeho bratr, Ur-Grom, se vydali démona zabít. Nicméne vítezství stálo Ur-Groma život. Ur-Thrall po me chce Azgalorovo srdce.");
	B_LogEntry_Quiet(TOPIC_URNAZULRAGE,"Místo, kde se Azgalor zjevuje se nazývá Údolí stínů. Dostanu se tam použitím skřetích teleportu. Ur-Thrall mi dal dva krystaly, které mám položit na pedestaly vedle mříže, aby se otevřela.");
	KNOWS_AZGOGLOR_SUMMON = FALSE;
	UrTrallOkShv = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_HELLO_2(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_2_condition;
	information = dia_orc_8550_urnazul_hello_2_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_orc_8550_urnazul_hello_2_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == FALSE) && (GIVEPOTIONURNAZUL == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_2_info()
{
	Snd_Play3d(self,"ORC_AMBIENT_SHORT02");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_01");	//Člověče, počkej ještě. Ur-Thrall dá člověku lektvar. Muž pije lektvar a je silný, stejně jako skřet.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_03");	//Zajímavé! Určitě mi to neublíží, když budu srážet dračí hlavy.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_04");	//Nyní jdi.
	GIVEPOTIONURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_COMPLETE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_complete_condition;
	information = dia_orc_8550_urnazul_complete_info;
	important = FALSE;
	permanent = TRUE;
	description = "Černý drak Azgalor je mrtvý!";
};

func int dia_orc_8550_urnazul_complete_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == TRUE) && (Npc_HasItems(other,itat_blackdragonheart) >= 1) && (AZGOLORCOMPLETE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_complete_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Complete_Info_18_01");	//Černý drak Azgalor je mrtvý! Tady je jeho srdce.
	B_GiveInvItems(other,self,itat_blackdragonheart,1);
	Npc_RemoveInvItems(self,itat_blackdragonheart,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_03");	//Ur-Thrall vidí, že Azgalor zemřít! Ur-Thrall se pomstil prokletí draka.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01");	//Arrgh... (s respektem) Člověk opět dokazuje, že je skvělý válečník!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Dobrá.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_URNAZULRAGE = LOG_SUCCESS;
	B_LogEntry(TOPIC_URNAZULRAGE,"Přinesl jsem Ur-Thrallovi srdce černého draka.");
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_SUCCESS);
	AZGOLORCOMPLETE = TRUE;
};

instance DIA_ORC_8550_URNAZUL_URGROM(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urgrom_condition;
	information = dia_orc_8550_urnazul_urgrom_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ještě jedna věc...";
};

func int dia_orc_8550_urnazul_urgrom_condition()
{
	if((AZGOLORCOMPLETE == TRUE) && (BROTHERCOMPLETE == FALSE) && (MEETURGROM > 0) && (UrGromIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urgrom_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_01");	//Ještě jedna věc... Zabitím Azgalora jsem odstranil prokletí které vyselo nad všemi tvými bratry.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_02");	//Včetně... tvého bratra, Ur-Groma.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_03");	//(udiveně) Ur-Thrall nerozumět! Ur-Thrall myslet, že bratr je mrtvý!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_04");	//Tvůj bratr je živ a zdráv, vůdče. Byl to on, kdo mi pomohl zabít netvora jehož srdce nyní držíš v ruce.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_07");	//Ve skutečnosti, všechni tvý bratři znovu získali fyzickou podstatu. Opět žijou.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_08");	//Bratře... bratře... Ur-Grome!...
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_09");	//No tak, skřete, to se stává. Rád jsem ťe poznal!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_12");	//Počkej... Člověk přinést velmi dobré zprávy, jsem potěšen!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_15");	//Ur-Thrall děkovat člověku. Musím přemýšlet jak odvděčit... Člověk si vybrat sám! Vybrat vše co chtít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_16");	//Teď nepotřebuju nic. Ale možná později...
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_17");	//Ur-Thrall dát slovo, Ur-Thrall nikdy nezapomene! Člověk přijít a zeptat se. Ur-Thrall udělat!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_20");	//Děkuju.
	BROTHERCOMPLETE = TRUE;
	ORCPROMISE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_PROMISE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_promise_condition;
	information = dia_orc_8550_urnazul_promise_info;
	important = FALSE;
	permanent = TRUE;
	description = "Znáš skřeta jménem Ur-Shak?";
};

func int dia_orc_8550_urnazul_promise_condition()
{
	if((ORCPROMISE == TRUE) && (ORCPROMISEMAKE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_promise_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_00");	//Znáš skřeta jménem Ur-Shak?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_01");	//Ano, být velký syn ducha, před mnoha zimami. Chtěl být přáteli s lidmi. Proč se ptáš?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_02");	//Já ho znám, vím kdo to je. A vím i to, že ho skřeti vyhnali.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_04");	//Slíbil jsi splnit mou žádost, a proto tě prosím - dovol mu vrátit se a opět být vaším šamanem, tak jako předtím.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_11");		//Hmmmm. Ur-Thrall si pamatuje, že člověk porazit zlého draka.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_12");		//To je stejně silné jako démon v hlubokém dolu!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_05");	//Ur-Thrall nečekal takovou žádost. Ale Ur-Thrall držet své slovo!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_06");	//Ur-Shak být odpuštěno - bude se moci vrátit domů. Opět být syn ducha!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_07");	//Děkuji!
	B_LogEntry(TOPIC_Urshak,"Mluvil jsem s vůdcem skřetů o Ur-Shakovi. Vůdce nezapomněl na svůj slib a souhlasil vyhovět mé žádosti. Teď musím najít Ur-Shaka a říct mu o tom.");
	ORCPROMISEMAKE = TRUE;
};

//--------------------------------------Chernaya ruda--------------------------------------------------------------

instance DIA_ORC_8550_URNAZUL_BLACKORE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_blackore_condition;
	information = dia_orc_8550_urnazul_blackore_info;
	permanent = FALSE;
	description = "Řekni mi, jestli vy skřeti víte, kde hledat černou rudu.";
};

func int dia_orc_8550_urnazul_blackore_condition()
{
	if((MIS_URNAZULRAGE == LOG_SUCCESS) && (FINDOREALREADY == FALSE) && Npc_KnowsInfo(hero,xbs_7513_darrion_blackore) && (RhetorikSkillValue[1] >= 75))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_blackore_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_BlackOre_01_01");	//Řekni mi, jestli vy skřeti víte, kde hledat černou rudu.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_02");	//Člověk potřebovat černou rudu?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_04");	//Hmmm... (zamyšleně) Kdysi dávno, když Ur-Thrall žít s bratmi daleko odsud - najít spoustu černé rudy a vytvořit silný pancíř, zabíjet všechny nepřátele.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_05");	//Člověk se vrátit do údolí, kde žil Ur Thrall, a tam hledat rudu.
	B_LogEntry(TOPIC_GUARDIANS,"Darrion měl pravdu. Ur-Thrall mi řekl, kde najít vzácnou černou rudu. Měl bych jít do Údolí stínů a tam ji hledat.");
};

//-----------------------------------------------------Khag-Tar------------------------------------------------

instance DIA_ORC_8550_URNAZUL_URHAN(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhan_condition;
	information = dia_orc_8550_urnazul_urhan_info;
	permanent = FALSE;
	description = "Mám pro tebe ještě něco.";
};

func int dia_orc_8550_urnazul_urhan_condition()
{
	if(MIS_KILLURTRALL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhan_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_04");	//Mám pro tebe ještě něco. Znáš skřeta jménem Hag-Tar?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_05");	//Ano, být jedním z mých nejlepších válečníků.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_06");	//Ur-Thrall ho poslat do války s lidmi ve velkém údolí, vzít pevnost.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_07");	//A Hag-Tar již to udělat. Ur-Thrall respektovat Hag-Tar!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_08");	//To je všechno pekné, jen zatím nevíš, že ten tvuj generál te chce zabít a sám se stát vudcem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_09");	//Co?! Hag-Tar chtít smrt Ur-Thrall?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_10");	//Ano, přesně tak! Chce to udělat aby se stal vůdcem místo tebe.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_11");	//KHATAG BAT NAR!... (výhružně) Jestli člověk lže - člověk zemřít. Pomalu zemřít. Být hodně bolesti.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_12");	//Říkám pravdu. Hag-Tar mě vyzval abych tě zabil, a za odměnu slíbil propustit zajaté paladiny.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_16");	//Pokud si nevěříš zeptej se Ur-Shaka, on může potvrdit moje slova.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_17");	//Ríkat syn ducha a říkat člověk, to značit pravda. Ur-Thrall věřit.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_22");	//Ale Ur-Thrall nechápe, proč mu to člověk říct?
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Jednoduše nerad zabíjím bez varování!",dia_orc_8550_urnazul_urhan_killyou);

	if((CANFREEPALADIN == FALSE) && (CASTLEISFREE == FALSE))
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhan,"Mám k tomu své důvody...",dia_orc_8550_urnazul_urhan_helpyou);
	};
};

func void dia_orc_8550_urnazul_urhan_killyou()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_01");	//Jednoduše nerad zabíjím bez varování!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_02");	//KHROTOK YABART! (vztekle) Takže se přesto rozhodnout mě výzvat?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_06");	//Člověk být hloupý, já rozervat člověk na kusy! Ulu-Mulu nepomůže. Arrrrrrrg!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhan_helpyou()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_03");	//Mám k tomu své důvody. Chci, abys osvobodil paladiny, které Hag-Tar zajal v pevnosti.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_04");	//KHROTOK YABART! (vztekle) Ne! Lidé být nepřátel! Nepřátel prohrát - musí zemřít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_05");	//Vůdče, životy několika lidí výměnou za tvůj.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_06");	//Hag-Tar údeří, když ne dnes, tak zítra. Pokud to neudělám já, pak některý ze skřetů.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_09");	//Arrgh... Dobře! Ur-Thrall odpustit lidem, vyměnit životy. Ale ne za jeho vlastní, ale za život Hag-Tar!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_12");	//Člověk zabije zrádce - Ur-Thrall nechat lidi!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_13");	//Co?! A jak to mám udělat? Je obklopen řadami nižších skřetů.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_14");	//Přece nebudou jen přihlížet, až zaútočím na jejich generála.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_15");	//Člověk nemusí mít strach!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_16");	//Člověk mít pravdu... Ur-Thrall dát člověku svůj talisman - Totem síly! Je symbolem moci Ur-Thrall.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_17");	//Žádný skřet se neodváží zaútočit na člověk, když ho bude nést.
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Nevěřím ti.",dia_orc_8550_urnazul_urhan_no);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Dobře! Souhlasím.",dia_orc_8550_urnazul_urhan_Ok);
};

func void dia_orc_8550_urnazul_urhan_no()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_No_01_01");	//Vypadám snad jako idiot? Chceš se zbavit nepřítele i vraha jedním tahem.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_No_01_02");	//Hmmm... (zamyšleně) Pak mi člověk nedáva na výběr!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_No_01_03");	//Přikážu svým vojákům člověka zabít, člověk zemřít.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_No_01_04");	//Jdete na špatného chlapa!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhan_Ok()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_Ok_01_01");	//Dobře! Souhlasím.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_Ok_01_02");	//Pak tedy člověk vzít talisman a jít zabít Hag-Tar!
	B_GiveInvItems(self,other,itmi_orcmaintotem,1);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_Ok_01_04");	//Jak říkáš.
	URNAZULGIVETASK = TRUE;
	B_LogEntry(TOPIC_KILLURTRALL,"Rozhodl jsem se informovat vůdce skřetů o zradě a plánu jeho zabití - řekl mi, abych Hag-Tara zabil! Když to udělám, propustí Garonda a jeho muže. Ur-Thrall mi dal talisman - totem síly, který potvrzuje jeho moc. Pak na mě skřeti nezaůtočí a Hag-Tar bude muset přijmout výzvu.");
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_URHANKILLDONE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhankilldone_condition;
	information = dia_orc_8550_urnazul_urhankilldone_info;
	permanent = FALSE;
	description = "Hag-Tar je mrtvý.";
};

func int dia_orc_8550_urnazul_urhankilldone_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (KILLHAGTARURTRALL == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhankilldone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_01");	//Hag-Tar je mrtvý.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_02");	//Být dobrá zpráva. Ur-Thrall být šťastný!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_03");	//A co naše dohoda - pustíš uvězňené paladiny?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_04");	//Nejdřív člověk vrátit talisman moci. Pak mluvit o lidech.
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLURTRALL,"Řekl jsem Ur-Thrallovi o smrti Hag-Tara. Myslím, že teď už paladiny pustí.");
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
	Info_AddChoice(dia_orc_8550_urnazul_urhankilldone,"Nechám si ho pro sebe.",dia_orc_8550_urnazul_urhankilldone_no);

	if(Npc_HasItems(hero,itmi_orcmaintotem) >= 1)
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhankilldone,"Tady.",dia_orc_8550_urnazul_urhankilldone_Ok);
	};
};

func void dia_orc_8550_urnazul_urhankilldone_no()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_01");	//Proč? Nechám si ho pro sebe, je to užitečná věc.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_02");	//Cože?!... (vztekle) Drzý člověk! CHROTOK YABART!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Obávám se, že teď budou skřeti jen stěží souhlasit aby vydali Garonda a jeho muže.");
	};
	BOGNARREFUSETALK = TRUE;
	Kurgan.aivar[93] = TRUE;
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhankilldone_Ok()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ok_01_01");	//Tady.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ok_01_02");	//Dobře! Ur-Thrall nechat lidi jít, jak slíbil.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ok_01_04");	//Děkuji, náčelníku.
	CANFREEPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Paladinové jsou teď svobodní! Musím je o tom informovat.");
	};
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
};

//---------------------------Gor Kar-------------------------------

instance DIA_ORC_7550_GORKAR_EXIT(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_exit_condition;
	information = dia_ORC_7550_GORKAR_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_7550_GORKAR_exit_condition()
{
	return TRUE;
};

func void dia_ORC_7550_GORKAR_exit_info()
{
	AI_StopProcessInfos(self);
};

var int GorKarFM;

instance DIA_ORC_7550_GORKAR_NOHIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_nohifirst_condition;
	information = dia_ORC_7550_GORKAR_nohifirst_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_7550_GORKAR_nohifirst_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_nohifirst_info()
{
	if(GorKarFM == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_01");	//KUTAR GOR DAR DRAK!
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_02");	//KRAT BUR ŠAR DIR?
		AI_Output(other,self,"DIA_Orc_7550_GorKar_NoHiFirst_01_03");	//Um... Co to říkáš?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_04");	//MORRA TUP DUR... (zavrtí hlavou) GORKAR STAR KAR OR...
		GorKarFM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_05");	//MORRA GOR! GORKAR RAT...
	};

	AI_StopProcessInfos(self);
};

instance DIA_ORC_7550_GORKAR_HIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_hifirst_condition;
	information = dia_ORC_7550_GORKAR_hifirst_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_ORC_7550_GORKAR_hifirst_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarInv == FALSE))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_hifirst_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	if((Hlp_IsItem(itm,ITAR_ORCARMOR) == TRUE) || (Hlp_IsItem(itm,ITAR_ORCARMOR_DEX) == TRUE) || (Hlp_IsItem(itm,ITAR_SHAMANROBE) == TRUE))
	{
		if(GorKarFM == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_01");	//(zlostně) Co tu chceš, Morra? Ty přišel hledat svou smrt?
		}
		else
		{
			AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_02");	//(zlostně) Zase Morra. Ty přišel hledat svou smrt?
		};

		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_03");	//Přivádí mě sem poněkud odlišná záležitost.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_04");	//CHROT DAR!... (překvapeně) Morra rozumět jazyku skřetů?! CHAR TUR RAT...
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_05");	//To tě tolik překvapilo?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_06");	//Morra mít pravdu! Gor-Kar nikdy nepotkat člověk, který by rozumět jeho řeči.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_07");	//Ale ještě víc překvapen, že člověk nosit skřetí zbroj. Gor-Kar nejdřív myslet, že člověk být skřet. Kdo ho vzít Morra?!
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_08");	//Dal mi ho Ur-Thrall, vůdce skretího klanu. Slyšel jsi o něm?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_09");	//GRAT, GRAT... (přikývne) Gor-Kar znát velký vůdce Ur-Thrall!
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_10");	//On žít hluboko v hoře a být velmi silný válečník.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_11");	//Nicméně, Gor-Kar nechápe, proč by velký vůdce dát člověk taková zbroj.
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_12");	//Je to dlouhý příběh, skřete. Ale ve zkratce, pomáhal jsem Ur-Thrallovi s jednou velmi delikátní záležitostí.
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_14");	//A jako projev své úcty a vděčnosti mi dal tuto zbroj.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_15");	//NUR DAR... (zmatenost) Gor-Kar nikdy takové neslyšet!
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_16");	//Lidé vždy být nepřítel, a bratři jich vždy zabít a pak jíst.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_17");	//Ale jestli sám velký vůdce pod horou respektovat člověk, Gor-Kar nezabije Morra.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_18");	//Pokud on neudělat nic špatného.
		GorKarInv = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_01");	//Zase ty, Morro... (rozzlobeně) Pořád tady hledat svou smrt?
		AI_StopProcessInfos(self);
	};
};

instance DIA_ORC_7550_GORKAR_NoArmor(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_NoArmor_condition;
	information = dia_ORC_7550_GORKAR_NoArmor_info;
	permanent = FALSE;
	description = "A kdybych neměl tuhle zbroj?";
};

func int dia_ORC_7550_GORKAR_NoArmor_condition()
{
	if(GorKarInv == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_NoArmor_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_01");	//A kdybych neměl tuhle zbroj?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_02");	//Pak Gor-Kar zabít Morra... (rozzlobeně) Všechny lidé mají být jeho nepřítelem!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_03");	//Takže se mnou opravdu mluvíš jen kvůli němu?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_04");	//CHAR RA?... (zavrtí hlavou) Ne! Gor-Kar jen přemýšlet, kdo být ten Morra a proč nosit zbroj skřetů.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_05");	//Pokud by to Gor-Kar nezajímat, pancíř nezachránit člověk před smrtí.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_06");	//Ostatní bratři také zabít Morra, když ho uvidět!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_07");	//Takže jsem měl prostě štěstí.
};

instance DIA_ORC_7550_GORKAR_Ulumulu(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Ulumulu_condition;
	information = dia_ORC_7550_GORKAR_Ulumulu_info;
	permanent = FALSE;
	description = "Mám Ulu-Mulu.";
};

func int dia_ORC_7550_GORKAR_Ulumulu_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE) && (Npc_HasItems(other,ITMW_2H_ORCPRESTIGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Ulumulu_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_01");	//Mám Ulu-Mulu.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_02");	//GOR AKH, KUTU... (s údivem) Co to být?!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_03");	//Cože?! Copak ty nevíš?
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_04");	//Je to znamení skřetí sily! Jeho majitele se skřeti obvykle nedotýkají.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_05");	//Gor-Kar neví co za věc člověk ukazovat.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_06");	//Gor-Kar vidět, že věc vytvořena skřety. Ale on nevědět, na co to je! 
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_07");	//Zajímavé. Vypadá to, že tě ostatní skřeti moc nezajímaj, když nevíš nic o Ulu-Mulu.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_09");	//AR GAR... (přikyvuje) Bratři Gor-Kara být jiní než ty, kteří žit ve velkém údolí.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_10");	//Skřeti žít v těchto horách od dávných dob! Tady mít svého nepřítele i svoje zvyky.
};

instance DIA_ORC_7550_GORKAR_Difference(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Difference_condition;
	information = dia_ORC_7550_GORKAR_Difference_info;
	permanent = FALSE;
	description = "Máte tady nepřítele?!";
};

func int dia_ORC_7550_GORKAR_Difference_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_Ulumulu) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Difference_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_01");	//Máte tady nepřítele?!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_02");	//Na sever od těchto hor být velký klan Ledového větru! To být náš největší nepřítel.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_03");	//Gor-Kar a jeho bratři bojovat se jejích válečníky již po mnoho zim.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_04");	//A jaké je jméno tvého klanu?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_05");	//Ohnivý kámen! Tam kdysi Gor-Kar žít.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_06");	//Chápu. A proč ses od nich oddělil?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_07");	//Bratři vždy bojovat za magickou rudu! Klan získat víc rudy - být silnější.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_08");	//Tak vy bojujete o magickou rudu? Ale proč?!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_09");	//Magická ruda být velmi silná! Šamani vzít z ní moc aby mluvit s duchy.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_10");	//Síla rudy chránit klan před nebezpečím. Proto jí potřebovat hodně!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_11");	//Náš nepřítel strážit taky hodně magické rudy!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_12");	//Pokud oni získat víc rudy, stát se ještě silnější a rychle nás zničit.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_13");	//Hmmm... No, zní to vážně.
};

instance DIA_ORC_7550_GORKAR_WhatDo(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_WhatDo_condition;
	information = dia_ORC_7550_GORKAR_WhatDo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int dia_ORC_7550_GORKAR_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_WhatDo_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_WhatDo_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_02");	//Gor-Kar hledat nové útočiště pro své bratry! Být dlouhá a náročná práce.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_WhatDo_01_03");	//Co se stalo s tvým starým domovem?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_04");	//Na starou svatyni útočit válečníci Ledového Větru! Mnoho bratrů Gor-Kar zemřít.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_05");	//Teď všichni mrtví a nikdo jiný nemůže vstoupit do chrámu.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_06");	//Skřeti tam už víc nemůžou chodit mluvit s duchy.
};

instance DIA_ORC_7550_GORKAR_TrailOrcCamp(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_TrailOrcCamp_condition;
	information = dia_ORC_7550_GORKAR_TrailOrcCamp_info;
	permanent = FALSE;
	description = "Mám jednu otázku.";
};

func int dia_ORC_7550_GORKAR_TrailOrcCamp_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_Difference) == TRUE) && (CanTrailOrcCamp == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_TrailOrcCamp_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_01");	//Mám jednu otázku.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_02");	//Co chtít člověk učit od Gor-Kar?
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_03");	//Hledám tu jistou skupinku lidí. Poslední dobou byli v malé pevnosti nedaleko odtud.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_04");	//Víš o tom něco?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_05");	//GRAT TAR... (zavrtí hlavou) Gor-Kar neznát! Nevidět tady lidi už dlouhou dobu.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_06");	//Pokud o nich někdo může vědět, být jedine Grum Lok.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_07");	//Grum Lok? Kdo je to?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_08");	//Být vůdce klanu, nejsilnější válečník z bratrů Gor-Kar!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_09");	//No, zřejmě ho budu muset navštívit.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_10");	//Pokud chce člověk prostě přijít do tábora Gor-Kar, skřeti ho zabít. Nebudou s ním mluvit bez zjevného důvodu.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_11");	//A co mám dělat?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_12");	//Morra by měl přinést něco pro bratry, za co budou ochotni naslouchat.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_13");	//Například to, co jim pomoct v boji jejich nepříteli!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_14");	//Hmmm... narážíš na magickou rudu?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_15");	//Gor-Kar myslet, že pro mnoho kusů magické rudy bratři opravdu nebíjet člověk.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_16");	//'Mnoho' je kolik?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_17");	//Gor-Kar počítat, že minimálně sto kusů. Nebo víc!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_18");	//Ale vždyť to je celá hromada rudy!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_19");	//NUR GAR... (zavrtí hlavou) Mín bratrům nebude stačit! Člověk musí rozhodnout, kolik stát jeho život.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_20");	//Dobře, pochopil jsem.
	B_LogEntry(TOPIC_MissOldFriend,"V horách, jsem se potkal s skřetího šamana Gor-Kara. Nezaútočil na mně, protože ho zaujala má výzbroj, kterou mi daroval Ur-Thrall. Po rozhovoru s ním jsem se dozvěděl, že o osudu Dariuse by mohl vědět vůdce jeho klanu - Grum Lok. Nicméně, aby se mnou skřeti mluvili, musím přinést co jim rozváže jazyk. Podle Gor-Kara by na to mohlo stačit sto kusů magické rudy. Zřejme si bude muset trochu zohýbat záda v dolu, pokud chci získat pozornost jejich vůdce.");
	GorKarShowMe = TRUE;
};

instance DIA_ORC_7550_GORKAR_Perm(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Perm_condition;
	information = dia_ORC_7550_GORKAR_Perm_info;
	permanent = TRUE;
	description = "Tak co, našel jsi to správné místo?";
};

func int dia_ORC_7550_GORKAR_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Perm_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Perm_01_01");	//Tak co, našel jsi to správné místo?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Perm_01_02");	//Gor-Kar pořád hledat. Člověk se nemíchat!
	AI_StopProcessInfos(self);
};

//---------------------------Strazh lagerya-------------------------------

instance DIA_GorkCampGuard_EXIT(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_exit_condition;
	information = DIA_GorkCampGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkCampGuard_exit_condition()
{
	return TRUE;
};

func void DIA_GorkCampGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkCampGuard_Hello(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_Hello_condition;
	information = DIA_GorkCampGuard_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkCampGuard_Hello_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarShowMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkCampGuard_Hello_info()
{
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_01");	//(překvapeně) KRAT DAR! Poprvé vidět, že jídlo samotné přijít ke skřetům!
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_02");	//Zdá se, že dnes duchové obzvlášť šlechetní, když jej k nám poslat.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_03");	//Nyní Morra rychle zemřít! A pak bratři jeho sníst... Musí být chutné maso.
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_01_04");	//Počkej, skřete! Můžeš mě nejdřív vyslechnout?
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_05");	//(překvapeně) GORA DAR! Jídlo je také schopno mluvit řečí skřetů?!
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_01_06");	//Už dost údivu! Přišel jsem si promluvit s tvým vůdcem Grum Lokem.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_07");	//Morra vědět o Grum Lok?! (zmateně) Co Morra chtít od vůdce?
	Info_ClearChoices(DIA_GorkCampGuard_Hello);
	Info_AddChoice(DIA_GorkCampGuard_Hello,"To se tě netýká, skřete.",DIA_GorkCampGuard_Hello_No);

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkCampGuard_Hello,"(ukázat magickou rudu)",DIA_GorkCampGuard_Hello_Ore);
	};
};

func void DIA_GorkCampGuard_Hello_Ore()
{
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_01");	//Tady - přináším sto kusů magické rudy.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_02");	//Chci ji předat tvému vůdci jako malý dárek.
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_03");	//BAR TAK... Magická ruda! Mnoho rudy! Být dobře, bratři potřebovat hodně magické rudy.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_04");	//Takže můžu jít?
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_05");	//Morra může jít k vůdci a bratři se ho nedotýkat.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_06");	//A kde najdu Grum Loka?
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_07");	//Člověk jít dál a hledat ve středu velkou jeskyni - tam být vůdce.
	PassGrumLok = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkCampGuard_Hello_No()
{
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_No_01_01");	//To se tě netýká, skřete.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_No_01_02");	//Pak bratři zabít Morra!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

//---------------------------Vozhd' gornykh orkov-------------------------------

instance DIA_GorkOrcBoss_EXIT(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_exit_condition;
	information = DIA_GorkOrcBoss_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkOrcBoss_exit_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkOrcBoss_Hello(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Hello_condition;
	information = DIA_GorkOrcBoss_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkOrcBoss_Hello_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_Hello_info()
{
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_01_01");	//DAR TUK! (vztekle) Kdo pustit sem Morra?!
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_01_02");	//Přinesl jsem ti dárek, vůdce.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_01_03");	//UR MORA DAR... (se zájmem) Morra přinést dar pro Grum Lok? Co to být?
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
	Info_AddChoice(DIA_GorkOrcBoss_Hello,"Obávám se, že ho nemám u sebe.",DIA_GorkOrcBoss_Hello_No);

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkOrcBoss_Hello,"Zde je sto kusů magické rudy pro tebe.",DIA_GorkOrcBoss_Hello_Ore);
	};
};

func void DIA_GorkOrcBoss_Hello_No()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_No_01_01");	//Obávám se, že ho nemám u sebe.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_No_01_02");	//Pak Morra teď zemřít!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkOrcBoss_Hello_Ore()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_Ore_01_01");	//Zde je sto kusů magické rudy pro tebe.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,100);
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_02");	//Morra přinést Grum Lok magickou rudu?! Být dobře... moc dobře.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_03");	//Dar se líbit Grum Lok! Teď nezabít Morra.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_04");	//Avšak, pořád nechápe, proč to člověk dělat.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_05");	//A proč sem přijít?!
	GrumLokAgreed = TRUE;
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
};

instance DIA_GorkOrcBoss_Talk(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Talk_condition;
	information = DIA_GorkOrcBoss_Talk_info;
	permanent = FALSE;
	description = "Hledám tu malou skupinu lidí.";
};

func int DIA_GorkOrcBoss_Talk_condition()
{
	if((GrumLokAgreed == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Talk_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_04");	//Hledám tu malou skupinu lidí. Naposledy byli v malé pevnosti na východě.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_05");	//Víš o tom něco?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_06");	//Hmmm... (zamyšleně) Takže Morra hledat svoje lidi, a přišel sem.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_07");	//Grum Lok o tom něco vědět. No on nic nebude říkat lidem!
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_08");	//Ale proč?! To ani ruda, kterou jsem přinesl ti nerozváže jazyk?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_09");	//Ruda být dobrá! Ale být trochu málo... (zavrtí hlavou)
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_10");	//Člověk vždy být nepřítel Grum Lok! Proto se musí ujistit, že jemu může důvěřovat.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_11");	//Morra musí přinést důkaz pro Grum Lok! Pak Grum Lok pomůže člověk.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_12");	//A jaký důkaz potřebuješ?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_13");	//Člověk přinést hlavu mého nepřítele! Hlavu jednoho ze starších klanu Ledového větru.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_14");	//Pak on věřit člověk a mluvit s ním o jeho lidech.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_15");	//Dobře, dobře! A kde najdu nějakého z jejich starších?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_16");	//Jít do klanu Ledového větru a zabít staršího být špatný nápad...
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_17");	//Morra může zemřít! Být mnoho silných válečníků nepřítele.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_18");	//Grum Lok zná malý tábor na severu.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_19");	//Člověk může vystoupat tudy a hledat tam staršího.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_20");	//Dobře, zkusím to.
	MIS_GrumLockProve = LOG_Running;
	Log_CreateTopic(TOPIC_GrumLockProve,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_Running);
	B_LogEntry(TOPIC_GrumLockProve,"Mluvil jsem s vůdcem Grum Lokem. Pokud se chci dozvědět něco o osudu Dariuse musím si nejdřív získat jeho důvěru. Požádal mě, abych mu přinesl válečnou kořist - hlavu jednoho ze starších klanu Ledového větru. Jen pak mi Grum Lok řekne co ví o mích lidech.");
};

instance DIA_GorkOrcBoss_TalkGood(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_TalkGood_condition;
	information = DIA_GorkOrcBoss_TalkGood_info;
	permanent = FALSE;
	description = "Tady je hlava starešiny!";
};

func int DIA_GorkOrcBoss_TalkGood_condition()
{
	if((MIS_GrumLockProve == LOG_Running) && (Npc_HasItems(other,ItAt_OlderHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_TalkGood_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_GorkOrcBoss_TalkGood_01_01");	//Tady je hlava starešiny!
	B_GiveInvItems(other,self,ItAt_OlderHead,1);
	Npc_RemoveInvItems(self,ItAt_OlderHead,1);
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_02");	//GRAT GRAT... (uctivě) Člověk nelže! On přinést hlavu nepřítele Grum Lok.
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_03");	//On znát toho starešinu - nazývat Mork-Ut. Zabít mnoho bratří Grum Lok.
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_04");	//Oni teď být pomstěni! Nyní Grum Lok respektovat člověk a důvěřovat mu.
	MIS_GrumLockProve = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_SUCCESS);
	B_LogEntry(TOPIC_GrumLockProve,"Přinesl jsem Grum Lokovi hlavu stařešiny z klanu Ledového větru. Myslím, že teď už začne mluvit.");
}; 

instance DIA_GorkOrcBoss_Darius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Darius_condition;
	information = DIA_GorkOrcBoss_Darius_info;
	permanent = FALSE;
	description = "Takže co moji lidé?";
};

func int DIA_GorkOrcBoss_Darius_condition()
{
	if((MIS_GrumLockProve == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Darius_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Darius_01_01");	//Takže co moji lidé?
	AI_Output(self,other,"DIA_GorkOrcBoss_Darius_01_02");	//Grum Lok slíbit člověk, Grum Lok dodržet své slovo...
	AI_StopProcessInfos(self);
	DariusInsert = TRUE;
	Wld_InsertNpc(SLD_852_Darius,"ORC_DARIUS");

};

instance DIA_GorkOrcBoss_Clans(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Clans_condition;
	information = DIA_GorkOrcBoss_Clans_info;
	permanent = FALSE;
	description = "Jsou tu jestě další klany skřetů?";
};

func int DIA_GorkOrcBoss_Clans_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Clans_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Clans_01_01");	//Jsou tu jestě další klany skřetů?
	AI_Output(self,other,"DIA_GorkOrcBoss_Clans_01_02");	//Daleko v horách být ještě hodně skřetích klanů.
	AI_Output(self,other,"DIA_GorkOrcBoss_Clans_01_03");	//Ale oni nechodit sem! Být velmi dlouhá cesta přes hory.
};

instance DIA_GorkOrcBoss_War(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_War_condition;
	information = DIA_GorkOrcBoss_War_info;
	permanent = FALSE;
	description = "Proč bojujete s klanem Ledového větru?";
};

func int DIA_GorkOrcBoss_War_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_War_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_01");	//Proč bojujete s klanem Ledového větru?
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_02");	//Chtějí zachvátit naši zem! Grum Lok a bratři ji chránit.
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_03");	//Proč si myslíte, že je vaše?
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_04");	//Můj klan první obsadit tyto hory, žít tady mnoho zim, stavět mnoho chrámů svých předků.
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_05");	//Pak přijít klan Ledového větru! Začít zabíjet mé bratry a zničit náš obětní oltář.
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_06");	//Grum Lok vztek, bratři vztek! My dát slib zničit je všechny.
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_07");	//Teď oni být jeho úhlavní nepřítel. Grum Lok hodně k jejich smrti více než kdokoli jiný!
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_08");	//Rozumím.
};

instance DIA_GorkOrcBoss_WarDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarDo_condition;
	information = DIA_GorkOrcBoss_WarDo_info;
	permanent = FALSE;
	description = "Proč neútočíte na jejich tábor?";
};

func int DIA_GorkOrcBoss_WarDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_War) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarDo_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_WarDo_01_01");	//Proč neútočíte na jejich tábor?
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_02");	//Být velmi nebezpečné... (zavrtí hlavou) Pokud budeme útočit, šaman Ledového Větru využít sílu magické rudy.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_03");	//Nepřítel má hodně magické rudy! Mnoho bratří Grum Lok pak zemře.
	AI_Output(other,self,"DIA_GorkOrcBoss_WarDo_01_04");	//A jakým způsobem používají magickou rudu?
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_05");	//Jejich šaman vyvolat duchy, aby udělili obrovskou sílu jejich válečníkům, když být blízko k magické rudě.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_06");	//Válečníci nepřítele pak velmi zuřivý a silný! Bratři Grum Lok je neporazit.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_07");	//Člověk tam nechodit sám. Jinak rychle zemřít!
};

instance DIA_GorkOrcBoss_Ruda(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Ruda_condition;
	information = DIA_GorkOrcBoss_Ruda_info;
	permanent = FALSE;
	description = "Ve tvém klanu máte taky hromadu rudy!";
};

func int DIA_GorkOrcBoss_Ruda_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Ruda_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Ruda_01_01");	//Ve tvém klanu máte taky hromadu rudy!
	AI_Output(self,other,"DIA_GorkOrcBoss_Ruda_01_02");	//Ale náš šaman nezná jejich tajemství... (zavrtí hlavou) Neví jak používat sílu magické rudy.
	AI_Output(self,other,"DIA_GorkOrcBoss_Ruda_01_03");	//To ale nepřítel nevědět! Proto mají strach sem přijít.
	AI_Output(other,self,"DIA_GorkOrcBoss_Ruda_01_04");	//Aha, tak takhle to je.
};

instance DIA_GorkOrcBoss_WhatDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDo_condition;
	information = DIA_GorkOrcBoss_WhatDo_info;
	permanent = FALSE;
	description = "A jak je teda chcete porazit?";
};

func int DIA_GorkOrcBoss_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDo_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_01");	//A jak je teda chcete porazit?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_02");	//Je třeba vzít jejich kouzlo rudy! Pak bratři Grum Lok porazit svého nepřítele.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_03");	//Grum Lok ale neví, jak to udělat. Možná, že člověk zná?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_04");	//Grum Lok dát Morra jeho nejcennější dar, jestli on pomůže zničit magickou rudu nepřítele!
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_05");	//A to nejcennější - co je to?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_06");	//Černá ruda, velmi vzácné, hodně černé rudy!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_07");	//Nebo pak může sám vybrat odměnu.
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_08");	//Budu přemýšlet o tvém návrhu.
	MIS_ClansWar = LOG_Running;
	Log_CreateTopic(TOPIC_ClansWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_Running);
	B_LogEntry(TOPIC_ClansWar,"Grum Lok mi slíbil štědrou odměnu, když mu pomůžu porazit klan Ledového větru. Problém je v tom, že válečníky nepřátelského klanu chrání magická ruda. Pokud se mi podaří připravit je o tuto výhodu, Grum Lok bude konečně schopen zaútočiť.");
};

instance DIA_GorkOrcBoss_WhatDoDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDoDone_condition;
	information = DIA_GorkOrcBoss_WhatDoDone_info;
	permanent = FALSE;
	description = "Váš nepřítel ztratil sílu magické rudy.";
};

func int DIA_GorkOrcBoss_WhatDoDone_condition()
{
	if((MIS_ClansWar == LOG_Running) && (MagicPlace05 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDoDone_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_01");	//Tvůj nepřítel brzy ztratí sílu magické rudy.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_02");	//Morra být naprosto jistý?!
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_03");	//Můžeš poslat své vojáky a podívat se.
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_04");	//A bude lepší neztrácet čas, ať ji nenashromáždí znovu!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_05");	//Hmmm... (zamyšleně) Potom Grum Lok myslí, že lepší moment k útoku nebýt.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_06");	//On okamžitě poslat své nejlepší válečníky!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_07");	//Pokud chce, člověk se může také zúčastnit bitvy. Pomoct bratrům Grum Lok porazit svého nepřítele.
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_08");	//To sem měl taky v plánu.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_09");	//Pak Morra neztrácet čas! Jít a pomáhat bratrům Grum Lok.
	B_LogEntry(TOPIC_ClansWar,"Řekl jsem Grum Lokovi, že se mi podařilo vzít všechnu sílu magické rudy klanu Ledového větru. Nyní je potřeba se tam vypravit s jeho válečníky a zničit tábor nepřítele.");
	LessMagicPower = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_10");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_11");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_21");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_23");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_22");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_12");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_13");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_14");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_15");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_04");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCPWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_05");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_19");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_20");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_09");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_18");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_16");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_17");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_08");
};

instance DIA_GorkOrcBoss_WarWin(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarWin_condition;
	information = DIA_GorkOrcBoss_WarWin_info;
	permanent = FALSE;
	description = "Vůdce klanu Ledového větru je mrtvý.";
};

func int DIA_GorkOrcBoss_WarWin_condition()
{
	if((MIS_ClansWar == LOG_Running) && (LessMagicPower == TRUE) && (MorkOrcBossIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarWin_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_GorkOrcBoss_WarWin_01_01");	//Vůdce klanu Ledového větru je mrtvý.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_02");	//CHROBOR YARAT... (s úlevou) Být nejlepší zpráva pro Grum Lok!
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_03");	//Jeho nepřítel být mrtvý a tato země opět naše.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_04");	//Grum Lok pomstít své bratry a děkovat Morra, za jeho pomoc.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_05");	//NUR GAT... (s úctou)
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,10);
	AI_PlayAni(self,"T_GREETGRD");
	MIS_ClansWar = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_ClansWar,"Řekl jsem Grum Lokovi, že jeho nepřítel je poražen. Vůdce byl šťastný jako dítě, které dostalo hračku.");

};

instance DIA_GorkOrcBoss_FreeDar(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDar_condition;
	information = DIA_GorkOrcBoss_FreeDar_info;
	permanent = FALSE;
	description = "Co chceš výměnou za život tvých vězňů?";
};

func int DIA_GorkOrcBoss_FreeDar_condition()
{
	if((NeedDariusFree == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDar_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_01");	//Co chceš výměnou za život tvých vězňů?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_02");	//GROK TAR... (zamyšleně) Grum Lok myslí, že život je lidských vézňů být velmi drahé.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_03");	//Morra by měl dát Grum Lok velmi cennou věc, aby on souhlasil je propustit.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_04");	//Mám přinést další magickou rudu?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_05");	//Ne. Grum Lok už nepotřebuje.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_06");	//Tentokrát Morra přinést Grum Lok velkou kůži z bílý horský trol.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_07");	//Tato zvěr velmi vzácná a kůže být velmi cenná!
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_08");	//Morra ji přinést Grum Lok, a on pak pustit lidské vézně.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_09");	//A kde ten trol žije?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_10");	//Velké zvíře žít v obrovské jeskyni, tam kde být vysoká hora.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_11");	//Jsme v horách. Můžeš to trochu upřesnit?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_12");	//Grum Lok mluvit o hoře, která být nedaleko od starého tábora lidí.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_13");	//Člověk by měl hledat zvěr tam! hora být velká, Morra ho rychle najít.
	MIS_FreePrice = LOG_Running;
	Log_CreateTopic(TOPIC_FreePrice,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_Running);
	B_LogEntry(TOPIC_FreePrice,"Grum Lok souhlasil propustit Dariuse výměnou za velkou kůži bílého horského trola.");
};

instance DIA_GorkOrcBoss_FreeDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDarius_condition;
	information = DIA_GorkOrcBoss_FreeDarius_info;
	permanent = FALSE;
	description = "Tady je tvoje kůže.";
};

func int DIA_GorkOrcBoss_FreeDarius_condition()
{
	if((MIS_FreePrice == LOG_Running) && (Npc_HasItems(other,ItAt_WhiteTroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDarius_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_01");	//Tady je tvoje kůže.
	B_GiveInvItems(other,self,ItAt_WhiteTroll,1);
	Npc_RemoveInvItems(self,ItAt_WhiteTroll,1);
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_02");	//Teď propustíš Dariuse?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDarius_01_03");	//Dobře... (vážně) Lidský vězeň teď být volný!
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDarius_01_04");	//On se může vrátit do svého klanu.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_05");	//Děkuji, náčelníku.
	MIS_FreePrice = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_SUCCESS);
	B_LogEntry(TOPIC_FreePrice,"Přinesl jsem Grum Lokovi kůži bílého trola, a on souhlasil, že nechá Dariuse jít. Starý přítel je teď osvobozen...");
};

instance DIA_GorkOrcBoss_Perm(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Perm_condition;
	information = DIA_GorkOrcBoss_Perm_info;
	permanent = TRUE;
	description = "Jak to jde, vůdče?";
};

func int DIA_GorkOrcBoss_Perm_condition()
{
	if(MIS_FreePrice == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Perm_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Perm_01_01");	//Jak to jde, vůdče?

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_Perm_01_02");	//Všechno v pořádku, Morra!
	}
	else
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_Perm_01_03");	//Dokud nepřítel žít, všechno být špatně.
	};
};

instance DIA_GorkOrcBoss_NeedPathDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDarius_condition;
	information = DIA_GorkOrcBoss_NeedPathDarius_info;
	permanent = FALSE;
	description = "Bude potřebovat doprovod.";
};

func int DIA_GorkOrcBoss_NeedPathDarius_condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDarius_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_01");	//Bude potřebovat doprovod.

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_02");	//Morra pomohl Grum Lok porazit jeho největší nepřítel!
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_03");	//On dát člověku několik válečníků aby vyprovodit Morra dolů z hor.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_04");	//Děkuju.
		DariusHasPath = TRUE;
		B_LogEntry(TOPIC_MissOldFriend,"Vůdce Grum Lok souhlasil, že dá Dariusovi několik vojáků aby ho vyprovodili z hor. Je načase promluvit si Dariusem.");
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_05");	//Grum Lok nepomůže Morra... (zavrtí hlavou)
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_06");	//Nemůže teď dát válečníky aby lidem ukázat cestu.
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_07");	//Kdyby nepřítel zaútočit, Grum Lok bude potřebovat hodně válečníků na obranu tábora!
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_08");	//Když porazil svého nepřítele, pak Grum Lok pomůže.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_09");	//Rozumím.
		B_LogEntry(TOPIC_MissOldFriend,"Vůdce Grum Lok mi dá průvodčí četu pouze v případě, že nepřátelský klan Ledového větru bude zničen.");
		NeedDeastoyWind = TRUE;
	};
};

instance DIA_GorkOrcBoss_NeedPathDariusDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDariusDone_condition;
	information = DIA_GorkOrcBoss_NeedPathDariusDone_info;
	permanent = FALSE;
	description = "Teď už mi dáš doprovod?";
};

func int DIA_GorkOrcBoss_NeedPathDariusDone_condition()
{
	if((NeedDeastoyWind == TRUE) && (MIS_MissOldFriend == LOG_Running) && (MIS_ClansWar == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDariusDone_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDariusDone_01_01");	//Teď už mi dáš doprovod?
	AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDariusDone_01_02");	//Morra pomohl Grum Lok porazit jeho největší nepřítel!
	AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDariusDone_01_03");	//On dát člověku několik válečníků aby vyprovodit Morra dolů z hor.
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDariusDone_01_04");	//Děkuju.
	DariusHasPath = TRUE;
	B_LogEntry(TOPIC_MissOldFriend,"Vůdce Grum Lok souhlasil, že dá Dariusovi několik vojáků aby ho vyprovodili z hor. Je načase promluvit si Dariusem.");
};