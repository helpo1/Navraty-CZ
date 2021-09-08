/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int DIA_Orc_8551_Leitenent_DeadHead_condition - upraveny podmínky dialogu

*/




instance DIA_ORC_8551_LEITENENT_EXIT(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_exit_condition;
	information = dia_orc_8551_leitenent_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8551_leitenent_exit_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hello_condition;
	information = dia_orc_8551_leitenent_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8551_leitenent_hello_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_hello_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_01");	//Stát!...
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_02");	//Kam jako člověk jít? Člověk nikam!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Info_18_03");	//Co je to za místo, že tam nemůžu?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_04");	//Hala vůdců. Hala Ur-Thralla - Velkého kmenového vůdce a silného vojáka.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Info_18_05");	//Musím ale nutně mluvit s Ur-Thrallem, je to velmi důležité!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_06");	//Co chce člověk Ur-Thrallovi?
	MEETFARROK = TRUE;
	Info_ClearChoices(dia_orc_8551_leitenent_hello);
	Info_AddChoice(dia_orc_8551_leitenent_hello,"Nevím.",dia_orc_8551_leitenent_hello_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello,"Mám zprávu od Hag-Tara!",dia_orc_8551_leitenent_hello_hagtar);
	};
	if((MIS_ORCTEMPLE == LOG_Running) && (MIS_KILLURTRALL == FALSE))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello,"Je to ohledně Spáčova chrámu v údolí!",dia_orc_8551_leitenent_hello_hram);
	};
};

func void dia_orc_8551_leitenent_hello_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_01");	//Je to ohledně Spáčova chrámu v údolí. Patrně s ním máte nějaké potíže.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_02");	//Tak co? Pustíš mě dovnitř?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_20");	//Člověk mluví o velkém Spáčově chrámu?! (přemýšlí) Ano, to by mohlo Ur-Thralla zajímat.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_21");	//Dovnitř tě ale stejně nepustím.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_22");	//Ale proč?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_23");	//Skřeti ti nedůveřovat tolik aby tě Farrok pustil k velkému vůdci!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_24");	//Pokud se člověk přesto pokusí vztoupit do paláce - skřeti ho zabít! Ulu-Mulu nepomůže!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_25");	//Možná, ale nemohl bys mě přece jen pustit?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_26");	//Ne!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin,"Abych se dostal k Ur-Thrallovi, musím si získat respekt a důvěru skřetů.");
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_HagTar_18_01");	//Mám zprávu od Hag-Tara!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_02");	//Tak co? Pustíš mě dovnitř?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_HagTar_18_03");	//Hmm... (přemýšlí) Já znát Hag-Tar - být velký bojivník.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_04");	//Dóbrá, člověk jít dál! Ale opatrně!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_05");	//Když rozhněvá Ur-Thralla - člověk zemřít. Ulu-Mulu nepomůže!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_01");	//Nevím.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_02");	//Tak jdi zpět!... (hrozivě)
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_03");	//Ani Ulu-Mulu ti nepomůže, když se pokusíš vniknout do haly vůdců!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_04");	//Nemohl bys mě přece jen pustit?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_05");	//Ne!
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLOTWO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hellotwo_condition;
	information = dia_orc_8551_leitenent_hellotwo_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_orc_8551_leitenent_hellotwo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MEETFARROK == TRUE) && (PASSORKCHAMBER == FALSE) && ((MIS_HeroOrcJoin == FALSE) || (MIS_KILLURTRALL == LOG_Running)))
	{
		return TRUE;
	};
};

func void dia_orc_8551_leitenent_hellotwo_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Info_18_01");	//Stát! (hrozivě) Nerozuměl jsi?
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Info_18_02");	//Pust mne za vůdcem!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_06");	//Hmmm... A důvod?
	Info_ClearChoices(dia_orc_8551_leitenent_hellotwo);
	Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"Nevím.",dia_orc_8551_leitenent_hellotwo_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"Mám zprávu od Hag-Tara!",dia_orc_8551_leitenent_hellotwo_hagtar);
	};
	if((MIS_ORCTEMPLE == LOG_Running) && (MIS_KILLURTRALL == FALSE))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"Je to ohledně Spáčova chrámu v údolí!",dia_orc_8551_leitenent_hellotwo_hram);
	};
};

func void dia_orc_8551_leitenent_hellotwo_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_01");	//Je to ohledně Spáčova chrámu v údolí. Patrně s ním máte nějaké potíže.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_02");	//Tak co? Pustíš mě dovnitř?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_20");	//Člověk mluví o velkém Spáčově chrámu?! (přemýšlí) Ano, to by mohlo Ur-Thralla zajímat.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_21");	//Dovnitř tě ale stejně nepustím.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_22");	//Ale proč?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_23");	//Skřeti ti nedůveřovat tolik aby tě Farrok pustil k velkému vůdci!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_24");	//Pokud se člověk přesto pokusí vztoupit do paláce - skřeti ho zabít! Ulu-Mulu nepomůže!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_25");	//Možná, ale nemohl bys mě přece jen pustit?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_26");	//Ne!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin,"Abych se dostal k Ur-Thrallovi, musím si získat respekt a důvěru skřetů.");
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_01");	//Mám zprávu od Hag-Tara!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_02");	//Tak co? Pustíš mě dovnitř?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_03");	//Hmm... (přemýšlí) Já znát Hag-Tar - být velký bojivník.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04");	//Dóbrá, člověk jít dál! Ale opatrně!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05");	//Když rozhněvá Ur-Thralla - člověk zemřít. Ulu-Mulu nepomůže!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_01");	//Nevím.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_02");	//Tak jdi zpět!... (hrozivě)
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_03");	//Ani Ulu-Mulu ti nepomůže, když se pokusíš vniknout do haly vůdců!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_04");	//Nemohl bys mě přece jen pustit?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_05");	//Ne!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_Respect(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_Respect_condition;
	information = DIA_Orc_8551_Leitenent_Respect_info;
	permanent = TRUE;
	description = "Jeké je mé uznání mezi skřety?";
};

func int DIA_Orc_8551_Leitenent_Respect_condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_Respect_Info()
{
	var string concatText;

	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Respect_01_00");	//Jeké je mé uznání mezi skřety?

	if(ORCRESPECT >= 80)
	{
		B_GivePlayerXP(2000);
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_01");	//(úctivě) Farrok myslí, že si člověk vysloužil velký respekt mezi mými bratry.
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin,"Získal jsem dostatečné uznání mezi skřety. Farrok mě teď pusti k Ur-Thrallovi.");
	}
	else if(ORCRESPECT >= 70)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_02");	//(schválení) Farrok vidí, že pro mnoho z mých bratrů se člověk stal váženým.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_03");	//Stále to ale není dost abych tě pustil k vůdci.
	}
	else if(ORCRESPECT >= 50)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_04");	//(zamyšleně) Člověk musí udělat více, aby získal respekt mých bratrů.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_05");	//Teprve pak dokáže, že je hoden setkat se s Ur-Thrallem!
	}
	else if(ORCRESPECT >= 25)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_07");	//(s politováním) Bratři zatím nevideli člověk dost na to aby vědeli jestli mu mohou důvěřovat.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_08");	//Člověk se musí více projevit!
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_10");	//(s opovržením) Farrok myslí, že vůbec žádné!
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_11");	//Člověk by měl jít za bratry a zeptat se co pomoct...
	};

	concatText = ConcatStrings("Uznání mezi skřety - ",IntToString(ORCRESPECT));
	concatText = ConcatStrings(concatText,"/100");
	AI_Print(concatText);
};

instance DIA_Orc_8551_Leitenent_RespectDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_RespectDone_condition;
	information = DIA_Orc_8551_Leitenent_RespectDone_info;
	permanent = FALSE;
	description = "Takže teď mě pustíš za Ur-Thrallem?";
};

func int DIA_Orc_8551_Leitenent_RespectDone_condition()
{
	if((MIS_HeroOrcJoin == LOG_Success) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_RespectDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_RespectDone_18_01");	//Takže teď mě pustíš za Ur-Thrallem?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04");	//Dobře, člověk může jít. Ale být velmi opatrný!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05");	//Když rozhněvá Ur-Thralla - člověk zemřít. Ulu-Mulu nepomůže!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHead(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHead_condition;
	information = DIA_Orc_8551_Leitenent_DeadHead_info;
	permanent = FALSE;
	description = "A ty sám pro mě nemáš nějakou práci?";
};

func int DIA_Orc_8551_Leitenent_DeadHead_condition()
{
	// if((MIS_HeroOrcJoin == LOG_Running) && (PASSORKCHAMBER == FALSE))
	if((MEETFARROK == TRUE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHead_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_01");	//A ty sám pro mě nemáš nějakou práci?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_02");	//Člověk chce získat respekt Farrok? (uznale) No dobře, dát mu úkol.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_03");	//Člověk přinést trofej od nepřítele skřetů. Jedine tak získat uznání.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_04");	//A co to má být?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_05");	//(zamyšleně) Například hlava válečníka lidí! Nebo ucho...
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_06");	//Ale musí být čerstvé... Nenosit pro Farrok shnilý kus masa!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_07");	//A neco méně krvelačného?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_08");	//Člověk to nedokáže, přesto se ptá.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_09");	//Rozhodnout sám... jestli chtít respekt Farrok nebo ne!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_10");	//Budu o tom přemýšlet.
	MIS_DeadHead = LOG_Running;
	Log_CreateTopic(TOPIC_DeadHead,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Running);
	B_LogEntry(TOPIC_DeadHead,"Farrok chce, abych mu přinesl nepřátelskou trofej. Vhodná je prý hlava jednoho z vojáků lidí. Hmmm, to co žádá vůbec není vtipné!");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHeadDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHeadDone_condition;
	information = DIA_Orc_8551_Leitenent_DeadHeadDone_info;
	permanent = FALSE;
	description = "Tady je tvá trofej!";
};

func int DIA_Orc_8551_Leitenent_DeadHeadDone_condition()
{
	if((MIS_DeadHead == LOG_Running) && (Npc_HasItems(other,ItMi_DeadManHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHeadDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_01");	//Tady je tvá trofej!
	B_GiveInvItems(other,self,ItMi_DeadManHead,1);
	Npc_RemoveInvItems(self,ItMi_DeadManHead,1);
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_02");	//Mmm... (uznale) Dobře! Vypadá to že člověk hlavu uříznul nedávno.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_03");	//Takhle jsi to chtěl?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_04");	//Ano... Teď Farrok respektovat člověk! 
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_05");	//Vidět, že nemá rád lidi stejně jako Farrok.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Uznání mezi skřety + 10");
	};

	MIS_DeadHead = LOG_Success;
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Success);
	B_LogEntry(TOPIC_DeadHead,"Přinesl jsem Farrokovi hlavu jednoho z dezertérů. Myslím, že je docela spokojen.");
	AI_StopProcessInfos(self);
};