
instance DIA_Pedro_DI_EXIT(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 999;
	condition = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_DI_YOU(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 2;
	condition = DIA_Pedro_DI_YOU_Condition;
	information = DIA_Pedro_DI_YOU_Info;
	description = "Zrádce!";
};


func int DIA_Pedro_DI_YOU_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Zrádce! Tak jsem tě našel.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Nemůžeš si myslet, že tě teď ušetřím jen kvůli tomu, že jsem paladin.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Mnozí ze žoldáků zaprodali svou duši Beliarovi. Já ale ze zabíjení radost nemám. No, u tebe to bude výjimka.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Ze všech zrádců světa, ty jsi ten nejhorší.
	};
	if(hero.guild == GIL_KDW)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_0A");	//Jak jsi mohl udělat takovou věc... Nemohu tomu uvěřit a to ne jen jako služebník Adana!
	};
	if(hero.guild == GIL_KDM)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_0B");	//Sice jsem služebník Temného boha, ale zradu netoleruji!
	};
	if((hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_0C");	//Bratrstvo se nezajímá o záležitosti bohů, ale tento čin si zaslouží jen opovržení!
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Měl bych tě prostě zabít.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//Počkej, prosím... Očarovali mě. Nikdy bych sám od sebe klášter Innose nezradil.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Ani nevíš, co jsem si poslední dny vytrpěl. Ty hlasy v hlavě... Nešlo jim odolat.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Vůdce skřetů mě celé dny mučil... Prosím, věř mi, není to má vina.
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Vyklop, co víš.",DIA_Pedro_DI_YOU_verschon);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Nechci nic slyšet, teď zemřeš.",DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Dej mi aspoň jediný důvod, proč ti věřit.",DIA_Pedro_DI_YOU_grund);

	if(MIS_Gorax_KillPedro == LOG_Running)
	{
		Info_AddChoice(DIA_Pedro_DI_YOU,"Serpetens mi nařídil zabít tě.",DIA_Pedro_DI_YOU_Serpentes);
	};
};

func void DIA_Pedro_DI_YOU_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Dej mi aspoň jediný důvod, proč ti věřit.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(prosí) Nech mě žít, můžu ti říct věci, které nás odsud můžou dostat...
};


var int PedroDI_Flee;

func void DIA_Pedro_DI_YOU_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//Nechci nic slyšet, teď zemřeš.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//Bohové, odpusťte mi...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	B_Attack(self,other,AR_NONE,1);
	PedroDI_Flee = LOG_Running;
};

func void DIA_Pedro_DI_YOU_Serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Serpetens mi nařídil zabít tě, jestli tě najdu.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(plačtivě) Pořád se můžu hodit, vždyť to víš.
};

func void DIA_Pedro_DI_YOU_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Vyklop, co víš.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//Samozřejmě! Řeknu ti úplně vše, jen mi prosím slib, že mě dostaneš z tohohle ostrova!
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Víš co, prostě tě zabiju.",DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU,"Dobře, pojď za mnou, jdeme na loď.",DIA_Pedro_DI_YOU_FollowShip);
};


var int MIS_Pedro_DI_FollowShip;

func void DIA_Pedro_DI_YOU_FollowShip()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//Dobře, pojď za mnou, jdeme na loď.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Díky, nebudeš litovat.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_Running;

	if(MIS_Gorax_KillPedro == LOG_Running)
	{
		B_LogEntry(Topic_Gorax_KillPedro,"Rohzodl jsem se ušetřit Pedra. Udělal jsem ale správně?!");
	};
};


instance DIA_Pedro_DI_ArrivedAtShip(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 4;
	condition = DIA_Pedro_DI_ArrivedAtShip_Condition;
	information = DIA_Pedro_DI_ArrivedAtShip_Info;
	description = "Jsme tu!";
};


func int DIA_Pedro_DI_ArrivedAtShip_Condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_Pedro_DI_FollowShip == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Jsme tu!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//Nádherná loď, jsi skutečný vůdce.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Přestaň, řekni, co potřebuju vědět.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Samozřejmě, kde mám začít?
	Info_ClearChoices(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Slyšel jsem dost.",DIA_Pedro_DI_ArrivedAtShip_Back);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Jak se dostanu z tohoto ostrova?",DIA_Pedro_DI_ArrivedAtShip_Innere);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Jaké další příšery jsou na tomhle ostrově?",DIA_Pedro_DI_ArrivedAtShip_Monster);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Co je s tím skřetím vůdcem?",DIA_Pedro_DI_ArrivedAtShip_OrkOberst);
};

func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Co je s tím skřetím vůdcem?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Ta stvůra mne připravila o poslední paprsek naděje.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//A mučením se ze mně snažil dostat pozice paladinů na Khorinisu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Samozřejmě, že jsem mu ani mnoho říct nemohl. Vždyť jsem novic, co já o tom vím.
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	{
		Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip,"Skřetí plukovník je mrtvý.",DIA_Pedro_DI_ArrivedAtShip_OberstTot);
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//Jaké další příšery jsou na tomhle ostrově?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//Během dne můžeš často vidět ještěřany. Obvykle s sebou nesou velmi velké vejce.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Neviděl jsem přesně, ale myslím, že se chystají opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Jak se dostanu z tohoto ostrova?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//V trůnním sále plukovníka skřetů mají tajnou chodbu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Brali mě tam pokaždé, když chtěl mě chtěl vyslíchat. Viděl jsem, jak to funguje.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Jeden z šamanu spustil mechanismus otočením pochodně visící na stěnách haly.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//Hmmm. Myslím, že poprvé otočil pochodní nalevo a pak v pravo, ale nepamatuji si přesně.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//A pak se najednou otevřela tajna chodba, která vede hluboko do hory.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Kam přesně tento průchod vede, nevím.
};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Plukovník skřetů je mrtvý.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Mrtvý? Chvála Innosovi, na jeho obličej nikdy nezapomenu.
};

func void DIA_Pedro_DI_ArrivedAtShip_Back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Slyšel jsem dost. Najdi si tu místo a buď užitečný.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Nechť tě ochraňuje Innos, budu se za tebe modlit.

	if((Vatras_IsOnBoard != LOG_SUCCESS) && (MIS_Gorax_KillPedro == LOG_Running))
	{
		B_GivePlayerXP(100);
		MIS_Gorax_KillPedro = LOG_SUCCESS;
		Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_SUCCESS);
		B_LogEntry(Topic_Gorax_KillPedro,"Pedro zůstane na naší lodi. Myslím, že má právo rozhodnout se o svém vlastním osudu. Ať ho soudí samotní mágové Ohně.");

		if(MIS_TraitorPedro == LOG_Running)
		{
			MIS_TraitorPedro = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
		};
	};

	PEDROWITHUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Pedro_DI_PERM(C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 5;
	condition = DIA_Pedro_DI_PERM_Condition;
	information = DIA_Pedro_DI_PERM_Info;
	permanent = TRUE;
	description = "Unavený?";
};


var int PedroDI_TalkNomore;

func int DIA_Pedro_DI_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU) && (PedroDI_TalkNomore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_PERM_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Unavený?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PedroDI_Flee == LOG_Running)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Chceš přinést polštář?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Ušetři mne prosím.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//Hmm.
			B_GivePlayerXP(XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if(UndeadDragonIsDead == TRUE)
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Jsem vyčerpaný.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Trochu se vyspi, brzy vyplujeme.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Díky, dobrou noc.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//Dobře, díky.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//Prosím, nezabíjej mě!
		AI_StopProcessInfos(self);
	};
};

