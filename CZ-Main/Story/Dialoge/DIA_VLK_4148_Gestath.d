
instance DIA_Gestath_EXIT(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 999;
	condition = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(suše) Pěkná zbroj!
	};
	AI_StopProcessInfos(self);
};

var int GestatCanBecameHunt;

instance DIA_Gestath_HALLO(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_HALLO_Condition;
	information = DIA_Gestath_HALLO_Info;
	description = "Jak se vede?";
};


func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(úsečně) Máš kuráž, že jsi sem přišel. Nezabloudil jsi náhodou?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO,"Co je tady k vidění?",DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO,"Co tady děláš?",DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//Ta zbroj, co máš na sobě, je parádní.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//To teda jo, a taky těžko k sehnání. Je udělaná z krunýřů důlních červů - vyrobil mi ji jistý Wolf.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//Dřív jsem býval v téhle kolonii trestancem. Dal jsem mu pár krunýřů důlních červů a za pár dní už svou práci dokončil. Ten chlap je šikovnej.
	Wolf_ProduceCrawlerArmor = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,Dialog_Back,DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO,"Kde je ten Wolf teď?",DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//Kde je ten Wolf teď?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//Už jsem ho nějakou dobu neviděl. Tenkrát byl žoldákem tady v kolonii.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Počítám, že se tu někde potuluje s ostatními.
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Chci si něco vydělat.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Tady, uprostřed pustiny?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Jsem lovec. Specializuji se na to, co se loví jen těžko.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Ohniví ještěři, důlní červi, dračí chňapavci - prostě všechno, co nikdo jiný neloví. To vždycky dobře vynáší.
	GestatCanBecameHunt = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,"Ta zbroj, co máš na sobě, je parádní.",DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Co je tady k vidění?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Hromada ještěrů, skřetů a bůhvíčeho ještě. A to jsem zatím ani nebyl moc daleko na pláni.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//A tobě bych to taky neradil. To, co tam žije, opravdu nevypadá moc přátelsky.
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};

instance DIA_Gestath_Drachen(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_Drachen_Condition;
	information = DIA_Gestath_Drachen_Info;
	permanent = TRUE;
	description = "Dokážeš taky vyvrhnout draka?";
};

var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Dokážeš taky vyvrhnout draka?
	AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Jasně, proč ne?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_TEACHHUNTING(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 12;
	condition = DIA_Gestath_TEACHHUNTING_Condition;
	information = DIA_Gestath_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Vysvětli mi, jak vyvrhnout zvířata.";
};

func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;

func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Vysvětli mi, jak vyvrhnout zvířata.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Proč ne? Mám dost volného času.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Co bys rád věděl?
		};
		Info_AddChoice(DIA_Gestath_TEACHHUNTING,Dialog_Back,DIA_Gestath_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjmutí ohnivého jazyka",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání krunýřů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání rohů dračích chňapavců",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání dračích šupin",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Získávání dračí krve",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//V tuto chvíli nevím, co bych tě ještě mohl naučit.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Ohnivému ještěrovi lze vyříznout jazyk jediným tahem nože, když ho přitom druhou rukou opatrně přidržuješ.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Červí krunýře musíš oddělovat dostatečně silným nožem.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Kusadla jsou v lebkách polních škůdců a důlních červů vrostlá poměrně hluboko. Proto si s nimi musíš chvíli pohrát, než se ti podaří je dostat ven.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Nejlepší místo, kde začít s vyjímáním rohu dračího chňapavce, je střed čela. Přitom musíš používat dost masivní nůž.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Dračí šupiny lze vyjmout velmi těžko, ale ve chvíli, kdy už si začneš myslet, že to nezvládneš, zčistajasna z dračího hřbetu konečně odpadnou.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Chceš-li získat krev, zaměř se na drakovo břicho. Najdi měkké místo a pak je probodni ostrým nožem.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};


instance DIA_Gestath_PICKPOCKET(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 900;
	condition = DIA_Gestath_PICKPOCKET_Condition;
	information = DIA_Gestath_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gestath_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,Dialog_Back,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

instance DIA_GESTATH_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_bonusminecrawlerplates_condition;
	information = dia_gestath_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "Mám jeden dotaz.";
};

func int dia_gestath_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Gestath_BonusMineCrawlerPlates_01_95");	//Mám jeden dotaz.
	AI_Output(other,self,"DIA_Gestath_BonusMineCrawlerPlates_01_02");	//Řekni, je zbroj, kterou si lovec vyrobí z vlastnoručně stažených červích plátů lepší než obyčejná?
	AI_Output(self,other,"DIA_Gestath_BonusMineCrawlerPlates_01_03");	//Ano, to je! Zbroj je silnější a lehčí.
	AI_Output(self,other,"DIA_Gestath_BonusMineCrawlerPlates_01_04");	//Nevím přesně, jak to funguje... (zamyšleně) Ale hlavně je potřeba tomu věřit!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_GESTATH_HUNTCAMP(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_HUNTCAMP_condition;
	information = dia_gestath_HUNTCAMP_info;
	permanent = FALSE;
	description = "Začíná to tady být dost nebezpečné, nemyslíš?";
};

func int dia_gestath_HUNTCAMP_condition()
{
	if((MIS_NewHunters == LOG_Running) && (GestatCanBecameHunt == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_HUNTCAMP_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_01");	//Začíná to tady být dost nebezpečné, nemyslíš?
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_02");	//(suše) A co?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_03");	//Ty se nebojíš, že tě chytí skřeti?
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_04");	//Skřeti? Hmmm... (zamyšleně) O tom jsem zatím nepřemýšlel.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_05");	//Zajímavé! Celé údolí je jich plné a ty nejsi vystrašen?
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_06");	//Jak to říct. (tiše) Jednoho zvládnu bez problémů, ale oni jsou jen zřídka osamotě.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_07");	//Víš, popravdě jsem přemýšlel nad návratem do Khorinisu.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_08");	//Ale co tam budu dělat s prázdnýma kapsama?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_09");	//Jsem si jistý, že pro někoho jako ty to nebude problém.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_10");	//Co máš na mysli?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_11");	//V Khorinisu je tábor lovců. Mohl by ses k nim přidat.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_12");	//A nebudeš muset řešit, kde sehnat peníze.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_13");	//A oni jen tak najednou nabírají nové lidi?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_14");	//Určitě se tam pro tebe najde místo.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_15");	//Falk rád přijme tak zkušeného lovce jako jsi ty.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_16");	//Jestli je to opravdu tak... pak to za pokus stojí.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_17");	//Koneckonců nemám co ztratit.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_18");	//Takže se vidíme v táboře, na druhé straně průsmyku.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_19");	//Jasan! Hodně štěstí...
	GestatBecameHunt = TRUE;
	B_LogEntry(TOPIC_NewHunters,"Lovec Gestath se připojí k táboru lovců.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

instance DIA_GESTATH_HARPIE(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_gestath_harpie_condition;
	information = dia_gestath_harpie_info;
	permanent = FALSE;
	description = "A pročpak tam stojíš?";
};

func int dia_gestath_harpie_condition()
{
	if((Kapitel >= 3) && (MIS_RUKVAIA == FALSE) && Npc_KnowsInfo(hero,DIA_Gestath_HALLO))
	{
		return TRUE;
	};
};

func void dia_gestath_harpie_info()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_01");	//A pročpak tam stojíš?
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_02");	//Jestli jsou skřeti dosti bystrí nato, aby vylezli na skálu, je z tebe sekaná.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_03");	//Jo ja vím, ja vím. Včera jsem videl jako ich prošlo směrem k pevnosti alespoň padesát.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_04");	//Ledva jsem stihnul uhasit oheň. Myslel jsem si, že mne zbadali.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_05");	//Tak proč si stále tady?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_06");	//Mám jeden rozpracovaný úkol- lovím Rukvayu!
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_07");	//A to je...
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_08");	//Rukvaya - to je královna zdejších harpyjí! Je mnohem vetší a silnější než ostatní.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_09");	//Zvěst je, že její pařáty dokážou přeťat ocelovou zbroj!
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_10");	//Nabudúce narazíš na skřety a nebudeš nadšenej.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_11");	//Pravda, je to nebezpečné. Ale jeden obchodník mi nabídl takovou sumu za srdce bestie, že jsem nemohl odmítnout.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_12");	//Kolik?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_13");	//Promiň, ale to se neříka.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_14");	//Nuž, hodně zdaru!
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_15");	//Počkej. (váhavo) Nedávno jsem videl jak Rukvaya roztrhala na cimpr campr dva elitné černé skřeti.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_16");	//Děsivý pohled, to ti řeknu. Takže bez někoho pomoci to asi vzdám.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_17");	//A co dostanu, když ti pomohu?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_18");	//Na začátek mi pňines srdce té bestie. Pak si mužeme promluvit o odměne.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_19");	//Pravděpodobne pár ubohých stoviek zlatých. No nemám pravdu?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_20");	//Chlape, nesnažím se tě podvést... (vážně) Dones mi srdce bestie a veř mi, nebudeš litovat!
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_21");	//Dobrá! Rátej se mnou. Pujdu se podívat po té tvé krásce.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_22");	//Ehm, mimochodem, kde má hnízdo?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_23");	//Co ja vím, je to v starém hradě na západ odsud.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_24");	//Buď opatrnej! Kromě ní tam žijí také jiná monstra.
	Wld_InsertNpc(harpie_uniq,"FP_ROAM_DRACONIAN_184");
	MIS_RUKVAIA = LOG_Running;
	Log_CreateTopic(TOPIC_RUKVAIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_Running);
	B_LogEntry(TOPIC_RUKVAIA,"Gestath lovec nebězpečných příšer mi řekl ať ulovím Rukvayu! Je to vzácna forma harpyje. Řekl jsem, že mu pomohu a donesu mu její srdce. Hnízdit by měla kdesi v oblasti staré pevnosti.");
};

instance DIA_VLK_4148_GESTATH_RUKVAIA(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_vlk_4148_gestath_rukvaia_condition;
	information = dia_vlk_4148_gestath_rukvaia_info;
	permanent = FALSE;
	description = "Zabil jsem tu tvou krasavici!";
};

func int dia_vlk_4148_gestath_rukvaia_condition()
{
	if((MIS_RUKVAIA == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other,ITAT_GARPIISERDCE) >= 1))
	{
		return TRUE;
	};
};

func void dia_vlk_4148_gestath_rukvaia_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_01_01");	//Zabil jsem tu tvou krasavici!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_02");	//(nedočkavo) A co její srdce, máš ho?
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_01_03");	//Jo, ale ne tak rychle kámo. Na začátek si promluvme o mé odměne.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_04");	//Jo, si muž kterej nezpomíná... Nuž, jakou odměnu bys chtěl?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_05");	//Mužu ti nabídnout, patnáct stovek zlatých, magický lektvar nebo celkem dobrou zbraň.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Chci peníze!",dia_vlk_4148_gestath_rukvaia_money);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Vemu si ten lektvar.",dia_vlk_4148_gestath_rukvaia_zelia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Dej mi tu zbraň.",dia_vlk_4148_gestath_rukvaia_weapons);
};

func void dia_vlk_4148_gestath_rukvaia_money()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_00");	//Chci peníze!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_01");	//Dobře. (efektně) Na- ber!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_02");	//Patnáct stovek zlatých - to nie je zlé číslo, ale risk bol velký, nebol?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_03");	//A teď mi dej srdce.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Jasně! Tady máš.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Možná si ho nechám pro sebe.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_zelia()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_zelia_01_00");	//Vemu si ten magickej lektvar.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_zelia_01_01");	//Dobře. (efektně) Na- ber!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_03");	//A teď mi dej srdce.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Jasně! Tady máš.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Možná si ho nechám pro sebe.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_weapons()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_00");	//Dej mi tu zbraň.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_01");	//Dobře. (efektně) Na- ber! Moje stará obouručná sekyra.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_02");	//Je ukovaná majstrovsky. Síce je ťežká, ale zpusobuje nemalé zranenia aj cez zbroj.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_03");	//Netušíš kolik rozbila skřetích lebek. (úškrn)
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_04");	//A teď mi dej srdce.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Jasně! Tady máš.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Možná si ho nechám pro sebe.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_serdceyes()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_00");	//Jasně! Tady máš.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_01");	//Výtečne... Potešení s tebou jednat kámo!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUKVAIA,"Odevzdal jsem srdce krásavice Gestathovi, stála mi ta odmena vubec zato?");
};

func void dia_vlk_4148_gestath_rukvaia_serdceno()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_00");	//Možná si ho nechám pro sebe.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_01");	//(nahněvaně) Rozhodol ses mne podvést? Uhm, vydrž, ja nejsem tak tolerantní.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};

instance DIA_GESTATH_LostPaladins(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = DIA_GESTATH_LostPaladins_Condition;
	information = DIA_GESTATH_LostPaladins_Info;
	permanent = FALSE;
	description = "Neviděls zde nejaké paladiny?";
};

func int DIA_GESTATH_LostPaladins_Condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITEL < 4) && (	AlbertGroup == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GESTATH_LostPaladins_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_00");	//Neviděls zde nejaké paladiny?
	AI_Output(self,other,"DIA_GESTATH_LostPaladins_01_01");	//Ale jó, pár dní vzad tudy prošla malá skupinka.
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_02");	//A kam jeli?
	AI_Output(self,other,"DIA_GESTATH_LostPaladins_01_03");	//Skrz most, v smeře skřetí palisády.
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_04");	//Dík.
	B_LogEntry(TOPIC_LostPaladins,"Lovec Gestath videl malou skupinu paladinu překračovat most smerujúc k velké skřetí palisáde. No bezva.");
};

//--------------------------------------------Gestat v Khorinise------------------------------------------------------------------------

instance DIA_Gestath_NW_EXIT(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 999;
	condition = DIA_Gestath_NW_EXIT_Condition;
	information = DIA_Gestath_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gestath_NW_PICKPOCKET(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 900;
	condition = DIA_Gestath_NW_PICKPOCKET_Condition;
	information = DIA_Gestath_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Gestath_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,Dialog_Back,DIA_Gestath_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_NW_PICKPOCKET_DoIt);
};

func void DIA_Gestath_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

func void DIA_Gestath_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

instance DIA_Gestath_NW_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 2;
	condition = dia_Gestath_NW_bonusminecrawlerplates_condition;
	information = dia_Gestath_NW_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "Mám jeden dotaz.";
};

func int dia_Gestath_NW_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_Gestath_NW_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_95");	//Mám jeden dotaz.
	AI_Output(other,self,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_02");	//Řekni, je zbroj, kterou si lovec vyrobí z vlastnoručně stažených červích plátů lepší než obyčejná?
	AI_Output(self,other,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_03");	//Ano, to je! Zbroj je silnější a lehčí.
	AI_Output(self,other,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_04");	//Nevím přesně, jak to funguje... (zamyšleně) Ale hlavně je potřeba tomu věřit!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_Gestath_NW_Drachen(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 3;
	condition = DIA_Gestath_NW_Drachen_Condition;
	information = DIA_Gestath_NW_Drachen_Info;
	permanent = TRUE;
	description = "Dokážeš taky vyvrhnout draka?";
};

func int DIA_Gestath_NW_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Dokážeš taky vyvrhnout draka?
	AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Jasně, proč ne?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_NW_TEACHHUNTING(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 12;
	condition = DIA_Gestath_NW_TEACHHUNTING_Condition;
	information = DIA_Gestath_NW_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Vysvětli mi, jak vyvrhnout zvířata.";
};

func int DIA_Gestath_NW_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Vysvětli mi, jak vyvrhnout zvířata.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Proč ne? Mám dost volného času.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Co bys rád věděl?
		};

		Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,Dialog_Back,DIA_Gestath_NW_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání ohnivých jazyků",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_NW_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání krunýřů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_NW_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání rohů dračích chňapavců",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání dračích šupin",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_NW_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Získávání dračí krve",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_NW_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//V tuto chvíli nevím, co bych tě ještě mohl naučit.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Ohnivému ještěrovi lze vyříznout jazyk jediným tahem nože, když ho přitom druhou rukou opatrně přidržuješ.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Červí krunýře musíš oddělovat dostatečně silným nožem.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Kusadla jsou v lebkách polních škůdců a důlních červů vrostlá poměrně hluboko. Proto si s nimi musíš chvíli pohrát, než se ti podaří je dostat ven.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Nejlepší místo, kde začít s vyjímáním rohu dračího chňapavce, je střed čela. Přitom musíš používat dost masivní nůž.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Dračí šupiny lze vyjmout velmi těžko, ale ve chvíli, kdy už si začneš myslet, že to nezvládneš, zčistajasna z dračího hřbetu konečně odpadnou.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Chceš-li získat krev, zaměř se na drakovo břicho. Najdi měkké místo a pak je probodni ostrým nožem.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

instance DIA_VLK_4149_GESTATH_RUKVAIA(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 1;
	condition = DIA_VLK_4149_GESTATH_RUKVAIA_condition;
	information = DIA_VLK_4149_GESTATH_RUKVAIA_info;
	permanent = FALSE;
	description = "Zabil jsem tu tvou krasavici!";
};

func int DIA_VLK_4149_GESTATH_RUKVAIA_condition()
{
	if((MIS_RUKVAIA == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other,ITAT_GARPIISERDCE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_01_01");	//Zabil jsem tu tvou krasavici!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_02");	//(nedočkavo) A co její srdce, máš ho?
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_01_03");	//Jo, ale ne tak rychle kámo. Na začátek si promluvme o mé odměne.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_04");	//Jo, si muž kterej nezpomíná... Nuž, jakou odměnu bys chtěl?
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_05");	//Mužu ti nabídnout, patnáct stovek zlatých, magický lektvar nebo celkem dobrou zbraň.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Chci peníze!",DIA_VLK_4149_GESTATH_RUKVAIA_money);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Vezmu si ten lektvar.",DIA_VLK_4149_GESTATH_RUKVAIA_zelia);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Dej mi tu zbraň.",DIA_VLK_4149_GESTATH_RUKVAIA_weapons);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_money()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_00");	//Chci peníze!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_01");	//Dobře. (efektně) Na- ber!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_02");	//Patnáct stovek zlatých - to nie je zlé číslo, ale risk bol velký, nebol?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_03");	//A teď mi dej srdce.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Jasně! Tady máš.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Možná si ho nechám pro sebe.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_zelia()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_00");	//Vemu si ten magickej lektvar.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_01");	//Dobře. (efektně) Na- ber!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_02");	//A teď mi dej srdce.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Jasně! Tady máš.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Možná si ho nechám pro sebe.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_weapons()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_00");	//Dej mi tu zbraň.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_01");	//Dobře. (efektně) Na- ber! Moje stará obouručná sekyra.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_02");	//Je ukovaná majstrovsky. Síce je ťežká, ale zpusobuje nemalé zranenia aj cez zbroj.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_03");	//Netušíš kolik rozbila skřetích lebek. (úškrn)
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_04");	//A teď mi dej srdce.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Jasně! Tady máš.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Možná si ho nechám pro sebe.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_00");	//Jasně! Tady máš.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_01");	//Výtečne... Potešení s tebou jednat kámo!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUKVAIA,"Odevzdal jsem srdce krásavice Gestathovi, stála mi ta odmena vubec zato?");
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceno()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_00");	//Možná si ho nechám pro sebe.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_01");	//(nahněvaně) Rozhodol ses mne podvést? Uhm, vydrž, ja nejsem tak tolerantní.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};