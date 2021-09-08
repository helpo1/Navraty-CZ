
instance DIA_SENYAK_DEMON_EXIT(C_Info)
{
	npc = senyak_demon;
	nr = 999;
	condition = dia_senyak_demon_exit_condition;
	information = dia_senyak_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_senyak_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_senyak_demon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAK_DEMON_HELLO(C_Info)
{
	npc = senyak_demon;
	nr = 1;
	condition = dia_senyak_demon_hello_condition;
	information = dia_senyak_demon_hello_info;
	important = TRUE;
};


func int dia_senyak_demon_hello_condition()
{
	return TRUE;
};

func void dia_senyak_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	Npc_RemoveInvItems(self,ITMI_DRAGONGOLDGORN,1);
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_00");	//... (vrčí) KDO SE OPOVAŽUJE RUŠIT MŮJ KLID?!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_01");	//(zkoumání) Ubohý clovíček, opravdu ses opovažil to udělat?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_02");	//Ano, to já jsem tě vyvolal!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_03");	//PROČ JSI TO UDĚLAL?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_04");	//To asi neuhádneš, démone?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_05");	//Zavolal jsem tě, abych tě zabil, a tak skoncoval s terorem, kterým hodláš zničit svět...
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_06");	//... (smích) TY SES MI ROZHODL POSTAVIT?!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_07");	//Arrgh!... (vrčí) Ty ses musel zbláznit, když si myslíš, že na to máš dost síly!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_08");	//VÍŠ KDO JÁ JSEM?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_09");	//Jasně, že vím. takže se nemusíš namáhat s představením sebe sama, Senyaku!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_10");	//Arrgh!... (vrčí) I když znáš moje jméno, tvoje činy stále hovoří o tom, že nevíš, kdo před tebou stojí!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_11");	//Vyzvi mě... Nesmrtelné stvoření ­ božské temnoty Beliara a nejmocnějšího démona... Arrgh!... (vrčí)
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_12");	//Tohle je sebevražda! Je od tebe pošetilé si myslet, že mě můžeš porazit.
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_13");	//Možná si uvědomíš, že tohle jsou poslední okamžiky tvého života...

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE) || Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20))
	{
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_14");	//... (vrčí)
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_15");	//Co je?
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_16");	//... (napjatě hledí) Cítím, že máš věc, která mi patří!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_17");	//Jestli myslíš Beliarův dráp, mýlíš se - teď patří mě!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_18");	//MŮJ DRÁP! On a já - jsme jeden celek, je to moje druhá podstata, moje podstata!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_19");	//No, to máš blbé. Právě teď ho nemůžeš vidět!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_20");	//Ne nadlouho! Až ti vyrvu srdce z těla a vysaju tvou duši - bude opět můj!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_21");	//Arrgh!... (vrčí) Hloupý smrtelníku! Měl bych ti poděkovat za tento dárek.
	}
	else
	{
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_22");	//Arrgh!... (vrčí) Jak snadno ti mohu vyrvat srdce ze tvé hrudi a vysát s tebe tvou duši!
	};
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_23");	//Neobávej se! Smrt je méně bolestivá a strašná než se může zdát.
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_24");	//Nebudeš mít žádnou možnost zaznamenat, že jsi už dávno zemřel!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_25");	//Už teď si můžeš být jistý, že už dávno mrtvý jsi! Arrgh!... (vrčí)
	Info_ClearChoices(dia_senyak_demon_hello);
	Info_AddChoice(dia_senyak_demon_hello,"Dost keců! Je čas dát se do práce...",dia_senyak_demon_hello_ok);

	if(MoraUlartuIsOn[1] == TRUE)
	{
		Info_AddChoice(dia_senyak_demon_hello,"(použít Mora Ulartu)",dia_senyak_demon_hello_mora);
	};
};

func void dia_senyak_demon_hello_ok()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Ok_01_00");	//Dost keců! Je čas dát se do práce...
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Ok_01_01");	//Chceš tak rychle zemřít? Je to tvoje právo, smrtelníku
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Ok_01_02");	//Kdo z nás dvou zemře, to se ještě uvidí!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Ok_01_03");	//Arrgh!... (vrčí)
	TALKSENYAK = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};

func void dia_senyak_demon_hello_mora()
{
	AI_PlayAni(other,"T_PRACTICEMAGIC2");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_00");	//Arrgh!... (vrčí)
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Mora_01_01");	//Tak co, démone!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_02");	//... (vrčí) Podcenil jsem tě! Myslím, že vím, co bude následovat, ubohý červe!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_03");	//Ale i tak se ti nepodaří mě porazit nebo zničit mou duši!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_04");	//Kromě toho, budeš ničím až umřeš! Arrgh!... (vrčí)
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_05");	//Mora Ulartu ti nepomůže!
	USEMORAULARTU = TRUE;
};

