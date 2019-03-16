
instance DIA_XOR_12205_TERINAKS_EXIT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 999;
	condition = dia_xor_12205_terinaks_exit_condition;
	information = dia_xor_12205_terinaks_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xor_12205_terinaks_exit_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XOR_12205_TERINAKS_HALLO(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 5;
	condition = dia_xor_12205_terinaks_hallo_condition;
	information = dia_xor_12205_terinaks_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_xor_12205_terinaks_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_hallo_info()
{
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_00");	//Hmm... Tvá osoba je mi známa, smrtelníku!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_03");	//Ach, ano... Já (smích) už jsem si vzpomněl! Jsi ten, kterého Strážci poslali bojovat s démonem.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_05");	//Od té doby neuplynulo zrovna málo času... Asi jsi to nedělal jen tak.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_HALLO_01_06");	//Byl to úkol jednoho Stážce.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_07");	//A splnil jsi ho, že?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_HALLO_01_08");	//Ano, Stonnos mě přijal a jsem teď jeden z vás!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_11");	//I když jsem trochu překvapen, že se ti to podařilo dosáhnout za tak krátkou dobu.
};


instance DIA_XOR_12205_TERINAKS_WHOYOU(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_whoyou_condition;
	information = dia_xor_12205_terinaks_whoyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_xor_12205_terinaks_whoyou_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_whoyou_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_WhoYou_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_01");	//Jmenuji se Tarinaks a jsem instruktor Asgardů, vojáků elementů.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_WhoYou_01_02");	//Kdo jsou Asgardové?!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_06");	//V první řadě bys měl vědět, že základní smysl Asgarda je nést vědění Strážců.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_07");	//Každý z nás jsme jejich služebníci, plnící boží vůli...
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_08");	//... a také jsme připraveni obětovat život pro tyto účely.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_09");	//Konáme činy, které jsou hodné vojáka elementů a smysl našeho života je služba Tvůrcům!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_10");	//Asgardové jsou také osobní strážci Strážců a zajišťujeme jejich odpočinek v těchto síních.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_12");	//Stejně jako všichni, i Tvůrci mají své nepřátele, kteři jsou vždy připraveni.
};


instance DIA_XOR_12205_TERINAKS_CANTEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_canteachme_condition;
	information = dia_xor_12205_terinaks_canteachme_info;
	permanent = FALSE;
	description = "Co mě můžeš naučit?";
};


func int dia_xor_12205_terinaks_canteachme_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_canteachme_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_CanTeachMe_01_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_CanTeachMe_01_01");	//Je toho hodně, ale já cvičím pouze Asgardy a ty, jež si vybrali tuto cestu.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_CanTeachMe_01_02");	//Ty ještě ne, takže o tom nebudeme mluvit!
};


instance DIA_XOR_12205_TERINAKS_PERM(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 4;
	condition = dia_xor_12205_terinaks_perm_condition;
	information = dia_xor_12205_terinaks_perm_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_xor_12205_terinaks_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_perm_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Perm_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Perm_01_01");	//Vše je jak má být, nikdo se sem nemůže dostat.
};


instance DIA_XOR_12205_TERINAKS_TEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_teachme_condition;
	information = dia_xor_12205_terinaks_teachme_info;
	permanent = FALSE;
	description = "Poslali mě za tebou Strážci.";
};


func int dia_xor_12205_terinaks_teachme_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teachme_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_00");	//Poslali mě za tebou Strážci.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_01");	//Dobrá... (vážně) A co ode mne tvůrci chtějí?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_02");	//Chtějí, abys byl můj instruktor, protože jsem si vybral cestu boje!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_03");	//Pokud je to jejich vůle, budu jím.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_04");	//Nicméně cesta válečníka neznamená, že jím jsi.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_05");	//Je to velká čest hodná jen elity. Musíš si to zasloužit!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_08");	//Ve tvém životě by měl být jen jeden smysl - služba tvůrcům!
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_12");	//A v čem mě můžeš cvičit?!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_13");	//Samozřejmě, že v umění boje!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_14");	//Pro Asgarda je to základní disciplína, ve které ho nikdo neporazí.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_18");	//Také ti umožníme poznat tajemství nejlepších zbrojí světa.
	B_LogEntry(TOPIC_GUARDIANS,"Promluvil jsem s Tarinaksem - nyní bude můj učitel a instruktor.");
	TARINAKSTEACHME = TRUE;
};


instance DIA_XOR_12205_TERINAKS_BEXOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_bexor_condition;
	information = dia_xor_12205_terinaks_bexor_info;
	permanent = FALSE;
	description = "Jak se stanu Asgardem?";
};


func int dia_xor_12205_terinaks_bexor_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_bexor_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BeXOR_01_00");	//Jak se stanu Asgardem?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_01");	//Velmi jednoduše - stačí porazit v boji jednoho z nás.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_03");	//Všechno, ale bude to dost nepříjemné - na tvém místě bych tak moc nepospíchal!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_04");	//Ale pokud budeš připraven někoho vyzvat, dej mi vědět a vše zařídím.
	B_LogEntry(TOPIC_GUARDIANS,"Abych se stal plnohodnotným Asgardem, musím porazit jednoho z nich. Jestli prohraju, nic se neděje, prostě budu dál cvičit a pak ho vyzvu znovu. Až budu chtít, mám dát vědět Tarinaksovi.");
};


var int chalangeharadrimfirsttime;

instance DIA_XOR_12205_TERINAKS_BATTLE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battle_condition;
	information = dia_xor_12205_terinaks_battle_info;
	permanent = TRUE;
	description = "Jsem připraven vyzvat jednoho z vás!";
};


func int dia_xor_12205_terinaks_battle_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == FALSE) && (TARINAKSTEACHME == TRUE) && (CHALANGEHARADRIMSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battle_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_01_00");	//Jsem připraven vyzvat jednoho z vás!
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_01");	//Dobrá, dobrá... Jsi si jistý?!
		Info_ClearChoices(dia_xor_12205_terinaks_battle);
		Info_AddChoice(dia_xor_12205_terinaks_battle,"No, ne tak úplně.",dia_xor_12205_terinaks_battle_no);
		Info_AddChoice(dia_xor_12205_terinaks_battle,"Ano, jsem.",dia_xor_12205_terinaks_battle_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_02");	//Ha, ha, ha... (pochybovačný smích) Nechtěj mě rozesmát! Ještě nejsi připraven!
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_04");	//Protože jsi stále slabý na to, abys byl hoden utkat se s Asgardem v aréně!
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_05");	//Umožním ti boj až budu vidět, že jsi schopen ho vyhrát.
		AI_StopProcessInfos(self);
	};
};

func void dia_xor_12205_terinaks_battle_no()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_No_01_00");	//No, ne tak úplně.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_No_01_01");	//Pak přijď až budeš připraven.
	Info_ClearChoices(dia_xor_12205_terinaks_battle);
};

func void dia_xor_12205_terinaks_battle_ok()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_Ok_01_00");	//Ano, jsem.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_01");	//Dobrá, pak na tebe už jeden z válečníků čeká.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_02");	//Vyhraj a budeš přijat mezi nás!

	if(CHALANGEHARADRIMFIRSTTIME == FALSE)
	{
		AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_Ok_01_03");	//Kde přesně mě bude čekat?!
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_04");	//Teleportační kámen vprostřed síní tě přenese do arény.
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_05");	//Nyní jdi! Čeká tě boj.
		CHALANGEHARADRIMFIRSTTIME = TRUE;
	};

	CHALANGEHARADRIMSTART = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_XOR_12205_TERINAKS_BATTLEWIN(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battlewin_condition;
	information = dia_xor_12205_terinaks_battlewin_info;
	permanent = FALSE;
	description = "Vyhrál jsem.";
};

func int dia_xor_12205_terinaks_battlewin_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == TRUE) && (TARINAKSTEACHME == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battlewin_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_01_00");	//Vyhrál jsem.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_01");	//Dobrá, je vidět, že sis z mých lekcí něco odnesl.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_03");	//Porazit Asgarda v čestném boji může jen Asgard, takže jsi dokázal, že jsi hoden být jedním z nás!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_05");	//Není nutné děkovat (smích)! Zasloužil sis to.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_06");	//Jako výraz uznání přijmi tento meč, meč Asgarda!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_07");	//Tuto zbraň může užívat jen člen našeho svatého Kruhu.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_08");	//Stane se tvou součástí a bude představovat moudrost Tvůrců ve světě!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_09");	//Nicméně než ti ho dám, odpověz mi na jednu otázku.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_10");	//Preferuješ jednoruční nebo obouruční zbraně?
	BEHARADRIM = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry(TOPIC_GUARDIANS,"Mistr Tarinaks ze mě učinil Asgarda!");
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin,"Jednoruční.",dia_xor_12205_terinaks_battlewin_1h);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin,"Obouruční.",dia_xor_12205_terinaks_battlewin_2h);
};

func void dia_xor_12205_terinaks_battlewin_1h()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_1H_01_00");	//Jednoruční.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_1H_01_01");	//Dobrá, vem si tuto čepel - nechť tvá odvaha je odvahou Asgarda!
	CreateInvItems(self,itmw_1h_xaradrim,1);
	B_GiveInvItems(self,other,itmw_1h_xaradrim,1);
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};

func void dia_xor_12205_terinaks_battlewin_2h()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_2H_01_00");	//Obouruční.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_2H_01_01");	//Dobrá, vem si tuto čepel - nechť tvá odvaha je odvahou Asgarda!
	CreateInvItems(self,itmw_2h_xaradrim,1);
	B_GiveInvItems(self,other,itmw_2h_xaradrim,1);
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};


instance DIA_XOR_12205_TERINAKS_ARMOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_armor_condition;
	information = dia_xor_12205_terinaks_armor_info;
	permanent = FALSE;
	description = "A co nějaká zbroj?";
};


func int dia_xor_12205_terinaks_armor_condition()
{
	if((BEHARADRIM == TRUE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_armor_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_01_00");	//A co nějaká zbroj?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_01_01");	//Říkal jsi, že mě můžeš naučit ji vykovat.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_02");	//Samozřejmě, nezapomněl jsem - každý Asgard má právo ji nosit!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_03");	//Jsou dva typy zbroje, jejichž tajemství ti můžu vyjevit.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_04");	//Nicméně ti můžu říci pouze jedno, takže vybírej pozorně.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_05");	//Takže, kterou si vybereš?
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
	Info_AddChoice(dia_xor_12205_terinaks_armor,"Rudná zbroj Temnoty (500 nebo více obratnosti)",dia_xor_12205_terinaks_armor_dark);
	Info_AddChoice(dia_xor_12205_terinaks_armor,"Rudná zbroj Světla (500 nebo více síly)",dia_xor_12205_terinaks_armor_light);
};

func void dia_xor_12205_terinaks_armor_dark()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_Dark_01_00");	//Chci zbroj Temnoty.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Dark_01_01");	//Dobrá, nyní ti vysvětlím jak ho vytvořit.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Dark_01_02");	//A nezapomeň, že je to velká čest.
	AI_Print("Naučeno: Kovářství - 'Rudná zbroj Temnoty'");
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[34] = TRUE;
	PLAYER_TALENT_SMITH_34 = TRUE;
	B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE TEMNOTY: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x uhlí, černá perla a adamant.");
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

func void dia_xor_12205_terinaks_armor_light()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_Light_01_00");	//Beru zbroj Světla.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Light_01_01");	//Dobrá, nyní ti vysvětlím jak ho vytvořit.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Light_01_02");	//A nezapomeň, že je to velká čest.
	AI_Print("Naučeno: Kovářství - 'Rudná zbroj Světla'");
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[33] = TRUE;
	PLAYER_TALENT_SMITH_33 = TRUE;
	B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE SVĚTLA: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x křemen, akvamarín a adamant.");
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

instance DIA_XOR_12205_TERINAKS_ADAMANT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_ADAMANT_condition;
	information = dia_xor_12205_terinaks_ADAMANT_info;
	permanent = FALSE;
	description = "Co se týče zbroje...";
};

func int dia_xor_12205_terinaks_ADAMANT_condition()
{
	if((PLAYER_TALENT_SMITH[33] == TRUE) || (PLAYER_TALENT_SMITH[34] == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_ADAMANT_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_00");	//Co se týče zbroje...
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_01");	//Na její vykování je potřeba nějaký adamant. Co to je?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_02");	//To je velmi vzácný kov, zřejmě božského původu. Všechny zbroje Asgardů jsou z něj vyrobeny.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_03");	//A kde ho seženu?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_04");	//Většinou se nalézá v místech velkého soustředění magické energie.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_05");	//Jenom velmi silná magie dokáže přetvořit obyčejnou rudu v tento neocenitelný kov.
	B_LogEntry(TOPIC_ARMORTEACHER,"Podle Tarinakse můžu adamant nalézt v místech, kde se soustředí ohromné množství magické energie.");
};

instance DIA_XOR_12205_TERINAKS_PERMTASK(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_permtask_condition;
	information = dia_xor_12205_terinaks_permtask_info;
	permanent = FALSE;
	description = "Máš pro mě nějaké úkoly?";
};

func int dia_xor_12205_terinaks_permtask_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_permtask_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_PermTask_01_00");	//Máš pro mě nějaké úkoly?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_PermTask_01_01");	//Obávám se, že ne - promluv se Strážci.
};


instance DIA_XOR_12205_TERINAKS_TEACH_MELEE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 7;
	condition = dia_xor_12205_terinaks_teach_melee_condition;
	information = dia_xor_12205_terinaks_teach_melee_info;
	permanent = TRUE;
	description = "Trénuj mě v boji nablízko.";
};

func int dia_xor_12205_terinaks_teach_melee_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_melee_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Melee_01_00");	//Trénuj mě v boji nablízko.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Melee_01_01");	//Dobrá, co se chceš naučit?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
};

func void dia_xor_12205_terinaks_teach_melee_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
};

func void dia_xor_12205_terinaks_teach_melee_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};


instance DIA_XOR_12205_TERINAKS_TEACH_RANGED(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 8;
	condition = dia_xor_12205_terinaks_teach_ranged_condition;
	information = dia_xor_12205_terinaks_teach_ranged_info;
	permanent = TRUE;
	description = "Trénuj mě v boji nadálku.";
};


func int dia_xor_12205_terinaks_teach_ranged_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_ranged_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Ranged_01_00");	//Trénuj mě v boji nadálku.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Ranged_01_01");	//Co chceš umět?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
};

func void dia_xor_12205_terinaks_teach_ranged_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
};

func void dia_xor_12205_terinaks_teach_ranged_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

instance DIA_XOR_12205_TERINAKS_TEACH_SKILLS(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 9;
	condition = dia_xor_12205_terinaks_teach_skills_condition;
	information = dia_xor_12205_terinaks_teach_skills_info;
	permanent = TRUE;
	description = "Chci zlepšit své dovednosti.";
};

func int dia_xor_12205_terinaks_teach_skills_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_skills_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Skills_01_00");	//Chci zlepšit své dovednosti.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Skills_01_01");	//A jaké?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
};

func void dia_xor_12205_terinaks_teach_skills_str_1()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_str_5()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_1()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_5()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

