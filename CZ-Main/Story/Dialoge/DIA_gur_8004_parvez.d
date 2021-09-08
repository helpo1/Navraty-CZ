
instance DIA_BAALPARVEZ_EXIT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 999;
	condition = dia_baalparvez_exit_condition;
	information = dia_baalparvez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalparvez_exit_condition()
{
	return TRUE;
};

func void dia_baalparvez_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalparvez_PICKPOCKET(C_Info)
{
	npc = gur_8004_parvez;
	nr = 900;
	condition = dia_baalparvez_PICKPOCKET_Condition;
	information = dia_baalparvez_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalparvez_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void dia_baalparvez_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
	Info_AddChoice(dia_baalparvez_PICKPOCKET,Dialog_Back,dia_baalparvez_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalparvez_PICKPOCKET,DIALOG_PICKPOCKET,dia_baalparvez_PICKPOCKET_DoIt);
};

func void dia_baalparvez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};

func void dia_baalparvez_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};


instance DIA_BAALPARVEZ_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_sleeper_condition;
	information = dia_baalparvez_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Spáč s tebou!";
};


func int dia_baalparvez_notalk_sleeper_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalParvez_NoTalk_Sleeper_01_00");	//Spáč s tebou!
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_NOTALK_IMP(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_imp_condition;
	information = dia_baalparvez_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Všechno v pořádku, příteli?";
};


func int dia_baalparvez_notalk_imp_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalParvez_NoTalk_Imp_01_00");	//Všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_SPECIALJOINT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjoint_condition;
	information = dia_baalparvez_specialjoint_info;
	permanent = TRUE;
	important = FALSE;
	description = "(Nabídnout připravený Přivolávač snů)";
};

func int dia_baalparvez_specialjoint_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK) && (Npc_HasItems(other,itmi_specialjoint) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjoint_info()
{
	AI_Output(other,self,"DIA_BaalParvez_SpecialJoint_01_00");	//Tady, mistře! Skromný dárek od vašeho věrného žáka...
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,itmi_specialjoint,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	AI_Output(self,other,"DIA_BaalParvez_SpecialJoint_01_01");	//Mmmmmmm...
	IDOLPARVEZ_YES = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_BAALPARVEZ_SPECIALJOINTOK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjointok_condition;
	information = dia_baalparvez_specialjointok_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalparvez_specialjointok_condition()
{
	if((IDOLPARVEZ_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjointok_info()
{
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_00");	//Ve jménu Spáče! Měl jsem vidění!
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_01");	//Bylo to neuvěřitelné! Viděl jsem, že jsme se setkali s novým bratrem, který nebyl jako všichni před ním.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_02");	//Něco pro nás udělal... V rukou držel meč a sestupoval po širokém schodištir. Tady vize končí.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_03");	//Byl ti podobný. Kdo jsi? Co chceš?
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_04");	//Chci se přidat k Bratrstvu a žádám o souhlas, mistře.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_05");	//Přeješ si být tedy novicem Bratrstva? Hmm... (vytrvale hledí) Kdo tě ke mně poslal?
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_06");	//Poslal mě Baal Orun. Řekl mi, že potřebuju váš souhlas.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_07");	//Takže Baal Orun tě ke mně poslal... Nicméně, musíš mi prokázat, že jsi hoden nosit roušku novice.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_08");	//Udělej mi laskavost - prokaž nám svou loajalitu a poté budeš mít můj souhlas.
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_09");	//Jak mohu prokázat svou loajalitu?
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_10");	//Nejvíce ze všeho potřebujeme nové duše, které by pochopily pravdu a chtěly by vstoupit do Bratrstva.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_11");	//Pokud dokážeš přesvědčit jednoho z nevěřících ke vstupu do Bratrstva, prokážeš tím svou touhu sloužit Bratrstvu.
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_12");	//Kde mohu takového člověka najít?
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_13");	//Ve městě. Tam žije spousta lidí ve strachu a lžích a jsou z toho unaveni. Jejich duše touží po osvícení a podpoře.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_14");	//Myslím, že bys měl hledat právě tam. Jinde bys nemusel být tak úspěšný. Mimo město totiž žijí spíše banditi a různí barbaři.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_15");	//Skončíš-li své hledání, vrať se ke mně. Promluvíme si o tvém přijetí do Bratrstva!
	Log_CreateTopic(TOPIC_NOVICECANJOIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_Running);
	B_LogEntry(TOPIC_NOVICECANJOIN,"Baal Parvez chce, abych přivedl nové novice. Je to šance získat dobré postavení a také souhlas důležitý pro přijetí do Bratrstva.");
	MIS_NOVICECANJOIN = LOG_Running;
};


instance DIA_BAALPARVEZ_VALENTINOJOIN(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_valentinojoin_condition;
	information = dia_baalparvez_valentinojoin_info;
	permanent = FALSE;
	important = FALSE;
	description = "Tento člověk hledá osvícení, mistře!";
};


func int dia_baalparvez_valentinojoin_condition()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	if((MIS_NOVICECANJOIN == LOG_Running) && (other.guild == GIL_SEK) && (Npc_GetDistToNpc(self,Valentino) < 500))
	{
		return TRUE;
	};
};

func void dia_baalparvez_valentinojoin_info()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	Valentino.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_GotoNpc(Valentino,self);
	AI_TurnToNPC(Valentino,self);
	AI_Output(other,self,"DIA_BaalParvez_ValentinoJoin_01_00");	//Tento člověk hledá osvícení, mistře!
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_01");	//Kohopak si to ke mě přivedl? Je hoden?
	AI_Output(other,self,"DIA_BaalParvez_ValentinoJoin_01_02");	//Nepochybuji, že potřebuje duchovního rádce, mistře.
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_03");	//Dobrá tedy. Od tohoto okamžiku se stal jedním z mých žáků.
	AI_TurnToNPC(self,Valentino);
	AI_TurnToNPC(Valentino,self);
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_04");	//Budeš ke mně chodit každý den a poslouchat, co ti řeknu. Tvá duše se dá ještě zachránit.
	AI_TurnToNPC(self,other);
	Npc_ExchangeRoutine(VLK_421_Valentino,"JoinPsiCamp");
	Npc_ExchangeRoutine(gur_8004_parvez,"JoinPsiCamp");
	MIS_NOVICECANJOIN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_SUCCESS);
	B_LogEntry(TOPIC_NOVICECANJOIN,"Valentino je nyní žákem Baala Parveze. Splnil jsem pokyny Guru.");
	B_GivePlayerXP(250);
};


instance DIA_BAALPARVEZ_AGREED(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_agreed_condition;
	information = dia_baalparvez_agreed_info;
	permanent = FALSE;
	important = FALSE;
	description = "Mistře! Přeji si stát se členem Bratrstva.";
};


func int dia_baalparvez_agreed_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (PARVEZAGREED == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_agreed_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalParvez_Agreed_01_00");	//Mistře! Přeji si stát se členem Bratrstva.
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_01");	//Dobrá. Prokázal jsi, že jsi hoden!
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_02");	//Běž za Baalem Orunem a zeptej se ho na roušku novice Bratrstva.
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_03");	//Teď jdi. Musím se věnovat útrapám nového žáka.
	AI_TurnToNPC(self,VLK_421_Valentino);
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_04");	//Následuj mě žáku.
	B_LogEntry(TOPIC_PSICAMPJOIN,"Baal Parvez souhlasí se mým vstupen do Bratrstva.");
	PARVEZAGREED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_runemagicnotwork_condition;
	information = dia_baalparvez_runemagicnotwork_info;
	permanent = FALSE;
	description = "Jak to vypadá s vašimi magickými runami?";
};


func int dia_baalparvez_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalParvez_RuneMagicNotWork_01_00");	//Jak to vypadá s vašimi magickými runami?
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_01");	//Bohužel, špatně... (smutně) Naše magické runy zeslábly a nejsou schopny kouzlit!
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_02");	//Všichni jsme nepříjemně překvapení touto okolností, ale nic s tím neuděláme.
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_03");	//A není známo, co by to mohlo způsobit?!
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Ani Guru Bratrstva už svou runovou magií nevládnou.");
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BaalParvez_PrioratStart(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = DIA_BaalParvez_PrioratStart_condition;
	information = DIA_BaalParvez_PrioratStart_info;
	permanent = FALSE;
	description = "Poslal mě Baal Namib.";
};

func int DIA_BaalParvez_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_BaalParvez_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_00");	//Poslal mě Baal Namib.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_01");	//(povzdech)
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_02");	//Jde o ty ztracené novice. Nevíš o tom něco?
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_03");	//No jelikož víš o tom co se děje, tak ti zřejmě Baal Namib důvěřuje.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_04");	//Chceš li znát odpvěď na svoji otázku, tak ti můžu říc jen tolik, ve městě nejsou.
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_05");	//Jseš si jistej?
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_06");	//Absolutně! Nikdy by neprošli bez povšimnutí kolem městské stráže. A samozřejmě bych o tom něco věděl.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_07");	//Jestli mě nevěříš, můžeš se přesvědčit sám.
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_08");	//Dobře, budu tlumočit Baalu Namibovi tvoje slova!
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_09");	//(vzdech)
	PsiCamp_04_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Podle Baala Parveze, se ve městě ztracený novicové nenacházej.");
};
