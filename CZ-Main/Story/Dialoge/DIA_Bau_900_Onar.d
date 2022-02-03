/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

(2x) CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Onar_EXIT(C_Info)
{
	npc = Bau_900_Onar;
	nr = 999;
	condition = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Onar_Hallo(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Onar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_Hallo_Info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Kdo tě sem pustil?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Co děláš na mé farmě?!
	OnarFM = TRUE;
};


instance DIA_Onar_PERM(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent = TRUE;
	description = "Je tady na farmě všechno v pořádku?";
};


func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DIA_Onar_PERM_Info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Je tady na farmě všechno v pořádku?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Nechápu, co se staráš. Ty tady nepracuješ!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Samozřejmě doufám, že ano! Za to přece platím!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Uděláš nejlíp, když zajdeš za Torlofem a požádáš ho o nějakou práci.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Jo, jasně. Jen si běž lovit ty své draky.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Tady žádní pokrytci z kláštera nejsou vítáni!
		if(other.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Onar_PERM_14_07");	//Zdá se mi, že máš něco s jazykem. Je PŘÍLIŠ dlouhý!
			AI_Output(other,self,"DIA_Onar_PERM_14_08");	//Á, sám služebník Innose. Jak znepokojivé...
		};
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Naše pohostinnost se na královská vojska nevztahuje.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_07");	//Zdá se mi, že máš něco s jazykem. Je PŘÍLIŠ dlouhý!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_08");	//Á, sám služebník Adana. Jak znepokojivé...
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_09");	//(chvějící se hlas) ... A-ano, v pořádku.
	};
};


instance DIA_Onar_Work(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent = FALSE;
	description = "Chci pro tebe pracovat!";
};


func int DIA_Onar_Work_Condition()
{
	if((Lee_SendToOnar == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};

	return FALSE;
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Chci pro tebe pracovat!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Teď nepotřebuju žádného dalšího nádeníka.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Moji lidé se starají o všechno sami.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Nemáš tady co dělat, takže vypadni!
};


instance DIA_Onar_WorkAsSld(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent = FALSE;
	description = "Chci se stát žoldákem!";
};


func int DIA_Onar_WorkAsSld_Condition()
{
	if((Lee_SendToOnar == FALSE) && (hero.guild == GIL_NONE) && (Onar_WegenSldWerden == FALSE) && Npc_KnowsInfo(other,DIA_Onar_Work))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Chci se stát žoldákem!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ty? Žoldák? Nenech se vysmát! Pokud bys jako žoldák za něco stál, musel by mi o tom Lee něco říct.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//A teď mi zmiz z očí a to rychle!
	Onar_WegenSldWerden = TRUE;
};


instance DIA_Onar_Aufstand(C_Info)
{
	npc = Bau_900_Onar;
	nr = 3;
	condition = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že jste se vzbouřili proti městu, je to pravda?";
};

func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Slyšel jsem, že jste se vzbouřili proti městu, je to pravda?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//Teď mě poslouchej. Zdědil jsem tuhle farmu a tuhle půdu po svém otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//A on ji zase zdědil po SVÉM otci.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Nedovolím těm nenažranejm královskejm pitomcům odjet s tím vším jen proto, aby nakrmili tu svojí armádu budižkničemů.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Ta válka se skřety nikdy neskončí. A kde budeme my? Mezi prvními, co padnou.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Ne - raději budu svou farmu bránit sám! Peníze, které takhle našetřím, mi zaplatí celou armádu.
};


instance DIA_Onar_WegenPepe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 4;
	condition = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent = FALSE;
	description = "Díky Bullcovi teď máte o pár ovcí míň.";
};


func int DIA_Onar_WegenPepe_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Díky Bullcovi teď máte o pár ovcí míň.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//O čem to mluvíš? Kdo je Bullco?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Jeden ze žoldáků.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Proč by mě to mělo zajímat? Jestli má zálusk na moje ovce, bude se muset zodpovídat Leeovi.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Tak co mě otravuješ s takovejma nepodstatnejma hloupostma?
	Onar_WegenPepe = TRUE;
};


instance DIA_Onar_WegenSekob(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent = FALSE;
	description = "Přišel jsem kvůli Sekobovu nájmu...";
};


func int DIA_Onar_WegenSekob_Condition()
{
	if(MIS_Sekob_RedeMitOnar == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Přišel jsem kvůli Sekobovu nájmu...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//A proč s tím ksakru lezeš za mnou? Dej ty peníze Torlofovi.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Proč si zatraceně myslíš, že to je TVOJE starost?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Chci se stát žoldákem. Výběr nájemného je součástí zkoušky.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Ale Sekob nemá žádný peníze. Už jsem mu to nandal.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Řekl, že to bylo kvůli špatné sklizni...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(řve) Ty pitomče! Myslíš, že nechá ty peníze jen tak někde povalovat? Někam je ukryl!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Ty snad víš, kolik napršelo? Špatná úroda - TO TEDA!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Běž a vymlať z něj ty prachy.
	Onar_WegenSekob = TRUE;
};


var int onartomm;
var int onartomm1;

instance DIA_Onar_LeeSentMe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent = FALSE;
	description = "Poslal mě Lee. Chci tady pracovat jako žoldák!";
};


func int DIA_Onar_LeeSentMe_Condition()
{
	if((Lee_SendToOnar == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Poslal mě Lee. Chci tady pracovat jako žoldák!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Už mi o tom řekl.
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//Když jsem tě poprvé viděl, neměl jsem o tobě valné mínění.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale když si Lee myslí, že to zvládneš, jsem ochoten dát ti šanci.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_08");	//Přijď zítra v poledne, budu tě potřebovat.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_09");	//A zatím se můžeš postarat o potvory v okolí krypty.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_10");	//A pak se uvidí jestli jsi co k čemu.
	ONARTOMM = Wld_GetDay();
	ONARTOMM1 = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"Onar mě očekává zítra v poledne, bude pro mě mít nějaký úkol. Zatím se mám postarat o monstra v okolí krypty.");
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_LEESENTMEPASS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepass_condition;
	information = dia_onar_leesentmepass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_leesentmepass_condition()
{
	if(((ONARTOMM + 1) == Wld_GetDay()) && (other.guild == GIL_NONE) && Wld_IsTime(11,45,12,15))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_onar_leesentmepass_info()
{
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_01");	//Á, tady jsi! Už je čas.
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_02");	//Podíváme se, k čemu jsi dobrej.
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_03");	//Doprovodíš moje děvčata a nedej Innos, aby se jim něco stalo.
	ONARTOMM1 = 5;
	B_LogEntry(TOPIC_BecomeSLD,"Onar mě pověřil doprovodem svých děvčat.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"StartPass");
	B_StartOtherRoutine(BAU_911_Elena,"StartPass");
};

instance DIA_ONAR_LEESENTMEPASSGO(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassgo_condition;
	information = dia_onar_leesentmepassgo_info;
	permanent = FALSE;
	description = "Asi jsem něco špatně pochopil...";
};


func int dia_onar_leesentmepassgo_condition()
{
	if(((ONARTOMM1 == 6) || (ONARTOMM1 == 5)) && !Npc_IsDead(BAU_910_Maria) && !Npc_IsDead(BAU_911_Elena))
	{
		return TRUE;
	};
};

func void dia_onar_leesentmepassgo_info()
{
	if(GLOBAL_FARM_ATTACK >= 10)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_01");	//Běž mi z očí, ty mizerný bastarde!
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//A pokud jde o ostatní věci, promluv si s Leem.
	}
	else if(ONARTOMM1 == 5)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_08");	//Kde jsou moje děvčata, ty bastarde?!
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_09");	//Nedokážeš splnit ani jednoduchej úkol!
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale jestli Lee věří v tvoje schopnosti, myslím, že ti dám šanci.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//Koneckonců, on je zodpovědný za tvé činy, tak se chop svých povinností.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale nesnaž se se mnou vydrbat! Ostatní služebné a rolníky nech na pokoji a ať tě ani nenapadne tady něco ukrást.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//Teď si jdi promluvit s Leem.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//Musíme si taky promluvit o tvé mzdě.
		ONARTOMM1 = 15;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD,"Onar byl velmi nešťastný, ale dal mi jeho schválení a nyní mi nic nebrání vstoupit do řad žoldáků.");
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_02");	//Výborně, znamená to, že vše proběhlo bez problémů? Tak to jsi splnil moje podmínky.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//Pokud jde o ostatní věci, promluv si s Leem.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//Nyní si promluvíme o výši tvého platu.
		ONARTOMM1 = 20;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD,"Onar byl velmi potěšen a dal mi svůj souhlas. Nyní mi nic nebrání vstoupit do řad žoldáků.");
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};


instance DIA_ONAR_LEESENTMEPASSNO(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassno_condition;
	information = dia_onar_leesentmepassno_info;
	permanent = FALSE;
	description = "Přišel jsem!";
};


func int dia_onar_leesentmepassno_condition()
{
	if(((ONARTOMM + 1) <= Wld_GetDay()) && (other.guild == GIL_NONE) && (ONARTOMM1 == 1) && !Wld_IsTime(11,45,12,15) && (ONARTOMM1 != 5))
	{
		if(((ONARTOMM + 1) == Wld_GetDay()) && Wld_IsTime(0,0,12,15))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
};

func void dia_onar_leesentmepassno_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMePassNO_15_00");	//Přišel jsem!
	AI_Output(self,other,"DIA_Onar_LeeSentMePassNO_14_01");	//A co?! Opozdil ses!
	AI_Output(self,other,"DIA_Onar_LeeSentMePassNO_14_02");	//Nedokážeš splnit jednoduchej úkol!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Ale jelikož ti Lee věří, tak ti dám šanci.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//Koneckonců za tebe zodpovídá. Tak se ujmi svých povinností.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Ale nesnaž se se mnou vydrbat! Ostatní služebné a rolníky nech na pokoji a ať tě ani nenapadne tady něco ukrást.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//Pokud jde o ostatní věci, promluv si s Leem.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//Nyní si promluvíme o výši tvého platu.
	ONARTOMM1 = 15;
	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"Onar byl na mě naštvaný, ale dal mi svůj souhlas. Teď už nic nebrání abych se přidal k žoldákům.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};

var int Onar_SOLD_Day;
var int Onar_SOLD_XP;

instance DIA_Onar_HowMuch(C_Info)
{
	npc = Bau_900_Onar;
	nr = 7;
	condition = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent = FALSE;
	description = "Ohledně mého žoldu...";
};


func int DIA_Onar_HowMuch_Condition()
{
	if(Onar_Approved == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_HowMuch_Info()
{
	var int temp1;
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Tak co je s tím žoldem?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Fajn, podívejme...
	SOLD = 50;

	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Nemám o tobě zrovna valné mínění.
		SOLD = SOLD - 10;
	};
	if(Onar_WegenSekob == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Nemáš moc rozumu. To se hned pozná podle tý věci se Sekobem.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_Farm > 1) || ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Už jsi tu nejednou způsobil problémy.
		SOLD = SOLD - 10;
	};
	if((Onar_WegenPepe == TRUE) && ((Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//A pořád do mě hlučíš nesmysly.
		SOLD = SOLD - 10;
	};
	if(ONARTOMM1 == 20)
	{
		SOLD = SOLD + 15;
	};
	if(ONARTOMM1 == 15)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_08");	//Jsi lenoch a sklerotik.
		AI_Output(self,other,"DIA_Onar_HowMuch_14_09");	//Tvá práce je k ničemu.
		SOLD = 0;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Nech mě chvíli přemýšlet...
	temp1 = other.level * SOLD;

	if(temp1 == 0)
	{
		SOLD = 10;
	};
	if(temp1 <= 250)
	{
		SOLD = 50;
	};
	if((temp1 > 250) && (temp1 <= 500))
	{
		SOLD = 100;
	};
	if((temp1 > 500) && (temp1 <= 750))
	{
		SOLD = 150;
	};
	if((temp1 > 750) && (temp1 <= 1000))
	{
		SOLD = 200;
	};
	if(temp1 > 1000)
	{
		SOLD = 250;
	};

	B_Say_Gold(self,other,SOLD);
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Co říkáš?
	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch,"V pořádku.",DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch,"To není zrovna moc...",DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch,
		ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 30, FALSE), "Za den?"),
		// "Za den?",
		DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//Za den?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Co ti to napadlo? Za týden! Vážně ti to moc nepálí.

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self,"DIA_Onar_HowMuch_New_00_02");	//Mohl bych být větším přínosem pro tvou farmu, ale mám problémy s vybavením.
		AI_Output(self,other,"DIA_Onar_HowMuch_New_00_03");	//Beliar tě vem! Dobře! Žold můžeš dostávat každý den.
		AI_Output(self,other,"DIA_Onar_HowMuch_New_00_04");	//Ale už dál neplácej nesmysly.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"U Onara si svůj žold můžu vyzvednout, kdykoli se mi to bude hodit.");
		Info_ClearChoices(DIA_Onar_HowMuch);
		SOLD = SOLD + 20;
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Pojď si pro své peníze.
		AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Nebudu ti je nosit.
	};
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//To není zrovna moc...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Jasně, jestli chceš, můžeš u mě pracovat zadarmo.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Mimochodem, tohle je všechno, co dostaneš!
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"U Onara si svůj žold můžu vyzvednout, kdykoli se mi to bude hodit.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//V pořádku!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Také si to myslím. Teď běž k Leeovi.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"U Onara si svůj žold můžu vyzvednout, kdykoli se mi to bude hodit.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

var int OnarPissOffGold;

instance DIA_Onar_CollectGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 8;
	condition = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent = TRUE;
	description = "Dej mi můj žold!";
};

func int DIA_Onar_CollectGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Onar_HowMuch) && (OnarPissOffGold == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Dej mi můj žold!

	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	///Platím žoldákům, ne drakobijcům.
		OnarPissOffGold = TRUE;
	}
	else if(Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Neplníš dobře svou práci!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Ptal jsem se Torlofa, jak ti to jde. A říkal, že ti trvá věčnost, než něco uděláš.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Nebudu plýtvat penězi na darmošlapy.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Teď budeš několik týdnů makat bez nároku na žold! To tě možná naučí.
	}
	else if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Slyšel jsem, žes to zpackal. Nejdřív zajdi za Leem a dej tu věc do pořádku.
	}
	else if(Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Zbláznil ses?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Nejdřív budeš pár dní pracovat pro mě. Žold budeš dostávat vždycky následující den.
	}
	else if(Wld_GetDay() > Onar_SOLD_Day)
	{
		if(other.exp > Onar_SOLD_XP)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(zkroušeně) No dobrá. Tady je tvůj žold.
			B_GiveInvItems(self,other,ItMi_Gold,SOLD);
			B_Say_Gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Co? Nedělal jsi nic jiného, než že ses poflakoval kolem? Teda když jsi zrovna nespal!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Za to ti platit nebudu!
		};
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};

instance DIA_Onar_MariaGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 9;
	condition = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent = FALSE;
	description = "Maria si myslí, že jsem nedostal dost.";
};

func int DIA_Onar_MariaGold_Condition()
{
	if(Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria si myslí, že jsem nedostal dost.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//CO?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Říkala, že bys mě měl platit více.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(remcá) Ta ženská taky musí do všeho strkat nos.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Řekla ti kolik?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Ne.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Dobrá, počínaje příštím žoldem budeš dostávat o 50 zlatých víc.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Ale ani o zlaťák víc, jasný?
	SOLD = SOLD + 50;
};


var int Onar_SellSheep;

instance DIA_Onar_WannaSheep(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_WannaSheep_Condition;
	information = DIA_Onar_WannaSheep_Info;
	permanent = TRUE;
	description = "Chci koupit ovci!";
};


func int DIA_Onar_WannaSheep_Condition()
{
	if(Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Chci koupit ovci!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//Tak co s tím lezeš sem? Vidíš tu snad nějakou ovci?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Já...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Jestli chceš koupit ovci, zajdi na pastvinu, je napravo od mého domu.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Pepe ti nějakou prodá.
	if(Npc_IsDead(Pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Pepe je mrtvý, je mi líto.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Ó! V tom případě... nech mi tu za ni 200 zlatých a vezmi si ji z pastviny sám.
		Onar_SellSheep = TRUE;
	};
};


instance DIA_Onar_BuyLiesel(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_BuyLiesel_Condition;
	information = DIA_Onar_BuyLiesel_Info;
	permanent = TRUE;
	description = "Tady máš, 200 zlatých. Dej mi tu ovci.";
};


func int DIA_Onar_BuyLiesel_Condition()
{
	if(Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Tady máš, 200 zlatých. Dej mi tu ovci.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Můžeš si ji z pastviny vzít sám.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Jedna z nich za tebou určitě půjde. Většina z nich slyší na jméno Betsy.
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//Nemáš tolik zlata. Neplýtvej mým drahocenným časem.
	};
};


instance DIA_ONAR_ONARBUSINESS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = dia_onar_onarbusiness_condition;
	information = dia_onar_onarbusiness_info;
	permanent = FALSE;
	description = "Jeden obchodník ti nabízí obchod.";
};


func int dia_onar_onarbusiness_condition()
{
	if(MIS_ONARBUSINESS == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_onar_onarbusiness_info()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_00");	//Jeden obchodník ti nabízí obchod.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_01");	//Co?!... (udiveně) a jak se ten obchodník jmenuje?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_02");	//Jmenuje se Lutero. Znáš ho?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_03");	//Ano, znám ho... velké zvíře... (podrážděně) A co ode mě tak nutně potřebuje?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_04");	//Chce u tebe koupit velké množství potravin.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_05");	//CO?! (naštvaně) Přece musí vědět, že do města nic neprodávám!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_06");	//A co vlastně chce, proč bych měl dělat výjimku?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_07");	//Protože je připraven dát ti velice dobrou nabídku!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_08");	//Hmmm... (s despektem) obrací se na mě a nemá žádné podmínky?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_09");	//A já opravdu nepotřebuju nic měnit.
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Dobře, zapomeň na to.",dia_onar_onarbusiness_forget);
	Info_AddChoice(dia_onar_onarbusiness,"Tvoje podmínky?",dia_onar_onarbusiness_case);
	Info_AddChoice(dia_onar_onarbusiness,"Luterův obchod je velmi nutný!",dia_onar_onarbusiness_need);
	Info_AddChoice(dia_onar_onarbusiness,"Ty opravdu nemáš zájem o hory zlata?!",dia_onar_onarbusiness_gold);
};

func void dia_onar_onarbusiness_gold()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Gold_01_01");	//Ty opravdu nemáš zájem o hory zlata?!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_02");	//(vztekle) Takže, ty drzej zmetku. Ty si fakt myslíš, že skočím na všechno, jako pes na kost?!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_03");	//Já mám tolik zlata, o čem by se tomu tvému Luterovi ani nezdálo!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_04");	//Já mám tolik zlata, že bych si moh' koupit celé město i s těma darmožroutama, s tou paladinskou sebrankou! Tím si mužeš bejt jistej!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_05");	//A teď se kliď z mé farmy! A už sem ani nepáchni!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_need()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_01");	//Luterův obchod je velmi nutný!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_02");	//Je to jeho problém. Mě to nezajímá.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_03");	//Ale vždyť všechny tvoje stodoly přetékají jídlem.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_04");	//Proč bys mu nemohl prodat trochu jídla?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_05");	//Řekl jsem, že nemám ani v nejmenším úmyslu prodat cokoliv jemu nebo městu... Co ti na tom není jasné?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_06");	//Možná také, chcípnou hlady dřív!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_07");	//Zvlášť se to týká těch tvejch paladinů! Ať jsou sebelepší... (škodolibě)
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_08");	//Takže bude lepší, když odsud vypadneš a už mě nikdy nebudeš obtěžovat takovýma otázkama!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_09");	//Jinak ti to mí chlapi spočítají.
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_case()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Case_01_01");	//Tvoje podmínky?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_02");	//CO?!... (s opovržením) Jaké podmínky?! Řekl jsem snad, že s tebou souhlasím?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Case_01_03");	//Mám se prostě zeptat, za jakých podmínek jsi ochotný, prodat Luterovi ty potraviny.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_04");	//Jo, ten chlap... Tvá drzost mě nezajímá.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_05");	//A teď me poslouchej... Nemám žádné podmínky!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_06");	//Nebudu Luterovi prodávat všechnno, o co si řekne!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_07");	//Takže mu to můžeš vyřídit.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_08");	//A TEĎ SE KLIĎ ODTUD, NEŽ TĚ VYKLIDÍM JÁ!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_09");	//Jak jsem řekl!... (naštvaně)
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_forget()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Forget_01_01");	//Dobře, zapomeň na to.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Forget_01_02");	//Počkej... (podrážděně) Ještě jsme s tímhle rozhovorem neskončili.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Forget_01_03");	//Řekni, proč vlastně Lutero tak moc potřebuje to jídlo?!
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Nevím.",dia_onar_onarbusiness_dontknow);
	Info_AddChoice(dia_onar_onarbusiness,"Jednoduše chce vydělat na městě víc.",dia_onar_onarbusiness_deal);
	Info_AddChoice(dia_onar_onarbusiness,"Protože jsou jeho sklady prázdné.",dia_onar_onarbusiness_empty);
	Info_AddChoice(dia_onar_onarbusiness,"Jsou to potraviny pro paladiny.",dia_onar_onarbusiness_paladin);
};

func void dia_onar_onarbusiness_paladin()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Paladin_01_01");	//Jsou to potraviny pro paladiny.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_02");	//CO?! (naštvaně) No on se snad zbláznil...
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_03");	//A on si ještě myslí, že mu něco prodám?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Paladin_01_04");	//A co na to ty?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_05");	//Víš, já doteď nepřežil proto, abych prodával jídlo nepříteli...
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_06");	//Vyřiď mu to. A teď se kliď z mé farmy!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_07");	//Jak jsem řekl!... (naštvaně)
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_empty()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Empty_01_01");	//Protože jsou jeho sklady prázdné.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_02");	//JO?! Hmmm... (překvapeně) Tomu se dá jen těžko uvěřit...
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_03");	//Zejména s ohledem k tomu, že všechny ostatní farmy mu prodaly téměř všechny své potraviny a mnoho jiných věcí.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_04");	//Víš, já si prostě myslím, že se mě snažíš převést a oklamat.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_05");	//A hlavně nemám rád lháře!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_06");	//Takže odsud vypadni ty ubohej podvodníku!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_07");	//Jinak ti to mí chlapi spočítají!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_08");	//Jak jsem řekl!... (naštvaně)
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_dontknow()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_DontKnow_01_01");	//Nevím.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_02");	//Jo?! Hmmm... (překvapeně) to je zvláštní!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_03");	//Pošle tě za mnou a ani ti neřekne proč?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_04");	//Víš, já si myslím, že si ze mě prostě utahuješ!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_05");	//A to se mi ani trochu nelíbí... (naštvaně)
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_06");	//Takže se mi kliď z očí, nebo zavolám své chlapy, aby tě odtud vyhodily.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_07");	//Už jsem ti řekl vše.
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_deal()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Deal_01_01");	//Prostě chce jen vydělat víc na potřebách města.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_02");	//Hmmm... (potměšile) Á, vidím, že Lutero je stále obchodník!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Deal_01_03");	//A překvapuje tě to?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_04");	//Vůbec!... To bych se neodvážil!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_05");	//Dobře... a má poslední otázka. Řekni mi, proč nepřišel sám a poslal tebe?
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Protože je můj pán!",dia_onar_onarbusiness_dntknw);
	Info_AddChoice(dia_onar_onarbusiness,"On je příliš významná osoba, aby vyřizoval takové záležitosti.",dia_onar_onarbusiness_secret);
	Info_AddChoice(dia_onar_onarbusiness,"To není tvoje věc.",dia_onar_onarbusiness_noneyou);
};

func void dia_onar_onarbusiness_dntknw()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_DntKnw_01_01");	//Protože je můj pán!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_02");	//Jo?! Hmmm... (překvapeně) to je zvláštní!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_03");	//Pošle tě za mnou a ani ti neřekne proč?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_04");	//Víš, já si myslím, že si ze mě prostě utahuješ!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_05");	//A to se mi ani trochu nelíbí... (naštvaně)
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_06");	//Takže se mi kliď z očí, nebo zavolám své chlapy, aby tě odtud vyhodily.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_07");	//Už jsem ti řekl vše.
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_secret()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_01");	//On je příliš významná osoba, aby vyřizoval takové záležitosti.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_02");	//Je co?!... (překvapeně) to je tvůj názor?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_03");	//Pokud by paladinové nebo městská domobrana přišli na to, že s tebou obchoduje, dřív nebo později by ho zavřeli.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_04");	//Proto nedal příležitost jakýmkoliv drbům. Poslal mě.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_05");	//A tobě se to nezdá?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_06");	//Hmmm... (zamyšleně) ano, něco mi nesedí...
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_07");	//A to?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_08");	//No, vždycky pro mě bylo zvykem, mluvit s pánem a ne se psem, uvázaným na jeho řetězu... (s opovržením)
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_09");	//Další poskok, který představuje nebezpečí a také je velice nespolehlivý!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_10");	//A taky zrovna není mým cílem, dát paladinům důvod k návštěvě...
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_11");	//A proto řekni Luterovi, že jeho nabídku odmítám.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_12");	//A s tebou už taky nepotřebuju mluvit.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_13");	//Vypadni!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Nedomluvil jsem s Onarem podmínky týkající se dodávky jídla. Je čas oznámit to Luterovi.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_noneyou()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_01");	//To není tvoje věc!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_02");	//A také přeskoč to zbytečné protahování. Už jsem z toho dost unavený!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_03");	//Jednoduše mi to řekni. Souhlasíš, nebo ne?!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_04");	//Dobře, dobře, snad nehoří!... (bezstarostně)
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_05");	//Myslím, že začínám chápat.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_06");	//Také vidím, že jsi užitečnej chlap. Pokud bude Lutero posílat takové lidi, myslím, že se klidně můžeme dohodnout!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_07");	//Takže, co mám říct Luterovi?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_08");	//V pořádku! Řekni mu, že souhlasím.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_09");	//Myslím, že se jistě nějak dohodneme.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_10");	//A vůbec se nebudu bránit nějakému tomu zlatu navíc!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_11");	//Nicméně tě varuju!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_12");	//Bude to třikrát dražší, než obvykle!
	ONARAGREED = TRUE;
	
	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_ONARBUSINESS,"Domluvil jsem s Onarem podmínky týkající se dodávky potravin. Vrátím se k Luterovi a řeknu mu to.");
	Info_ClearChoices(dia_onar_onarbusiness);
};


instance DIA_ONAR_ORCS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = dia_onar_orcs_condition;
	information = dia_onar_orcs_info;
	permanent = FALSE;
	description = "Jaká je situace?";
};


func int dia_onar_orcs_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_orcs_info()
{
	AI_Output(other,self,"DIA_Onar_Orcs_01_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_Onar_Orcs_01_01");	//Co je s tebou?!
	AI_Output(other,self,"DIA_Onar_Orcs_01_02");	//Skřeti! Nemáš strach, že by zavítali i sem, na farmu?
	AI_Output(self,other,"DIA_Onar_Orcs_01_03");	//Možná... (nervózně) A i kdyby, proč bych měl děsit své lidi?
	AI_Output(self,other,"DIA_Onar_Orcs_01_04");	//Snad si nemyslíš, že své lidi platím jen tak pro nic za nic.
	AI_Output(other,self,"DIA_Onar_Orcs_01_05");	//Ale skřeti jsou mnohem silnější, než žoldáci! Nemyslím si, že je v jejich silách zastavit celou armádu těchto zlých potvor.
	AI_Output(self,other,"DIA_Onar_Orcs_01_06");	//Pak by to znamenalo, že přišel konec... (s úsměvem) Avšak v tom případě tu nebudu sedět a čekat na vlastní smrt!
	AI_Output(self,other,"DIA_Onar_Orcs_01_07");	//Kdybych měl náhodou přesto zemřít, stane se tak zde, na polích mých předků.
	AI_Output(self,other,"DIA_Onar_Orcs_01_08");	//Věřím, že se skřetům nepostavíme s holýma rukama!
};


instance DIA_ONAR_PALADINHERE(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = dia_onar_paladinhere_condition;
	information = dia_onar_paladinhere_info;
	permanent = FALSE;
	description = "Paladinové lorda Hagena chtějí zisk z farmy.";
};


func int dia_onar_paladinhere_condition()
{
	if(MOVEFORCESCOMPLETE_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_paladinhere_info()
{
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_00");	//Paladinové lorda Hagena chtějí zisk z farmy.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_01");	//Ano, vím o tom... (podrážděně) Abych řekl pravdu, je to poprvé v mém životě, kdy z toho mám alespoň trochu radost.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_02");	//S jejich pomocí bude mnohem pravděpodobnější, že se nám podaří odrazit útoky skřetů.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_03");	//Bylo by však nejlepší, kdyby se to stalo co nejdřív.
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_04");	//Proč takový spěch?!
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_05");	//Protože moje zásoby jídla a vybavení se můžou co nevidět obrátit v prach!
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_06");	//Oni jedí. Řeknu ti, není to zrovna legrace krmit tyhle žoldáky!
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_07");	//Věřím, že tvé stodoly mají dost na to, aby nakrmily o dost víc lidí.
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_08");	//Tak si nestěžuj! Je lepší děkovat za to, že je někdo ochoten za tebe položit svůj život!
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_09");	//Je ti to jasné?
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_10");	//Hmmm... (kousavě)
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_11");	//Dobře, vidím, že mi rozumíš...
};

instance DIA_ONAR_TOWER_APP_GOOD(C_Info)
{
	npc = Bau_900_Onar;
	nr = 11;
	condition = dia_onar_tower_app_good_condition;
	information = dia_onar_tower_app_good_info;
	permanent = FALSE;
	description = "Na jih od tvé farmy je stará věž.";
};

func int dia_onar_tower_app_good_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE)) 
	{
		return TRUE;
	};
};

func void dia_onar_tower_app_good_info()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_00");	//Na jih od tvé farmy je stará věž. Neobtěžují vás černé kápě v poslední době?
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_01");	//Staráš se? No, neobtěžovali rolníky, že?
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_02");	//Díky mému zásahu, více už určitě ne.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_03");	//Ach, tak to jsi byl ty. Už jsem byl informován, že ta banda je mrtvá.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_04");	//Tady máš za námahu. A teď mě přestaň otravovat, mám práci.
	B_GiveInvItems(self,other,ItMi_Gold,25);
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_05");	//Počkej, to není všechno.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_06");	//Co ještě ode mě chceš?
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_07");	//Chtěl bych žít ve věži.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_08");	//Tak to ty. To tys promlouval k mým lidem? První Lee a pak Maria...
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_09");	//Přiznávám, že z toho, co mi řekli, jsem byl unešen.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_10");	//(rozhodnutě) Ale to nestačí na celou věž.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_11");	//Můžeš v ní žít, pokud jseš ochotnej zaplatit nájem. Sto zlatých na každý den. Souhlasíš?
	Info_ClearChoices(dia_onar_tower_app_good);
	
	if ((MARIA_APPROVES_TOWER == TRUE) && (LEE_APPROVES_TOWER == TRUE))
	{
		Info_AddChoice(dia_onar_tower_app_good,"Sto zlatých - příliš vysoká cena. (smlouvat)",dia_onar_tower_app_good_maybe);
	}
	else
	{
		Info_AddChoice(dia_onar_tower_app_good,
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, FALSE), "Sto zlatých - příliš vysoká cena. (smlouvat)"),
			// "Sto zlatých - příliš vysoká cena. (smlouvat)",
			dia_onar_tower_app_good_maybe);
	};
	
	Info_AddChoice(dia_onar_tower_app_good,"Dobře! Platí.",dia_onar_tower_app_good_yes);
	Info_AddChoice(dia_onar_tower_app_good,"Příliš drahé.",dia_onar_tower_app_good_no);
};

func void dia_onar_tower_app_good_maybe()
{
	if((RhetorikSkillValue[1] >= 50) || ((MARIA_APPROVES_TOWER == TRUE) && (LEE_APPROVES_TOWER == TRUE)))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_00");	//Sto zlatých - příliš vysoká cena.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_01");	//Ta věž ti dlouhá léta nic nepřinášela. Pár let - a spadne to sešlostí věku.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_02");	//Banditi jsou nejspíš již připraveni se tam usadit - z čehož koukají jisté problémy pro farmu.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_03");	//Navrhuji aby ses jí zbavil. Vybavení věže bude stát spousty peněz, které navrhuji dodat.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_04");	//Nemusíš hnout ani prstem, aby se situace v této oblasti zlepšila, a i přesto mě chceš obrat o peníze které mám.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_05");	//Tak jako tak, nedostaneš ode mě ani zlaťák.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_06");	//Chceš snad další problémy s bandity? Dobrovolně přijít o peníze? - Nech mi tu věž! Může tě to do budoucna stát život!
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_07");	//CO?! COŽE TO?! Jak jen se OPOVAŽUJEŠ?! JÁ TĚ -...
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_08");	//UMMM... Hmmm... No dobrá! Beliar ji vem! Stejně jsou okolo jen další problémy.
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_09");	//Nejspíš je na tebe spoleh, budu ti věřit. Ale nechci už slyšet ani slůvko o banditech v okolí!
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_10");	//Dávám ti své slovo, že nebudeš litovat.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_00");	//Dobře, tak jsme se dohodli.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_01");	//Potřebuješ ještě něco? Pokud je to nutné, mluv teď a víc mě neobtěžuj.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_02");	//Ano. Jestli v té věži chci žít normální život, musím najít ochranku.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_03");	//S největší pravděpodobností budu najímat více lidí, aby tak učinili. Možná potřebuju i někoho jiného.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_04");	//Jinými slovy, nechci tvoje žoldáky, kteří budou napadat lidi, co si přijdou na kousek koláče.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_05");	//Dobrá. Můžeš si tam vzít kohokoliv, kdo nebude rozebírat věž cihlu po cihle nebo zasahovat do prací na mých farmách.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_06");	//Ještě něco?
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Už ne.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_08");	//Pak sbohem. Doufám, že nebudu svých rozhodnutí litovat.
		B_LogEntry(TOPIC_MYNEWMANSION,"Problém s Onarem vyřešen, zbývá Hagen.");
		DECISION_TOWER_MADE = TRUE;
		DT_TOTAL_DAILY_PAYMENTS_ONAR = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_12");	//Sto zlatých - příliš vysoká cena. Šla by vyjednat sleva?
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_13");	//COO? Taková výhodná koupě? Vypadni odsud, ať už tě tu nevidím!
	};
};

func void dia_onar_tower_app_good_yes()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_yes_15_00");	//Dobře! Platí.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_00");	//Dobře, takže nad penězmi jsme se dohodli.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_01");	//Potřebuješ ještě něco ode mě? Pokud je to nutné, mluv teď a víc mě neobtěžuj.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_02");	//Ano. Jestli chci žít v té věži normální život, budu si muset najít ochranku.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_03");	//S největší pravděpodobností budu najímat více lidí, aby tak učinili. Možná potřebuju i někoho jiného.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_04");	//Jinými slovy, nechci tvoje žoldáky kteří budou napadat lidi, co si přijdou na kousek koláče.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_05");	//Dobrá. Můžeš si tam vzít kohokoliv, kdo nebude rozebírat věž cihlu po cihle nebo zasahovat do prací na mých farmách.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_06");	//Ještě něco?
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Už ne.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_08");	//Pak sbohem. Doufám, že nebudu svých rozhodnutí litovat.
	B_LogEntry(TOPIC_MYNEWMANSION,"Problém s Onarem vyřešen, ale bude to něco stát, musím to říct Hagenovi.");
	DECISION_TOWER_MADE = TRUE;
	DT_TOTAL_DAILY_PAYMENTS_ONAR = 100;
	AI_StopProcessInfos(self);
};

func void dia_onar_tower_app_good_no()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_no_15_00");	//Příliš drahé. Odmítám.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_no_14_01");	//Když si to teda nemůžeš dovolit, není zde důvod plýtvat mým časem. Vypadni!
	B_LogEntry(TOPIC_MYNEWMANSION,"Nebyl jsem schopen přesvědčit Onara. Bez jeho souhlasu se pokoušet dostat do věže bude problém.");
	MIS_MYNEWMANSION = LOG_FAILED;
	MIS_DTOLDNEWMINE = LOG_FAILED;
	AI_StopProcessInfos(self);
};
