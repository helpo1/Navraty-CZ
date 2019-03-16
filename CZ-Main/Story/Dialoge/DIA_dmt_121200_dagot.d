
instance DMT_121200_DAGOT_EXIT(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_exit_condition;
	information = dmt_121200_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
	nr = 999;
};


func int dmt_121200_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_121200_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_121200_DAGOT_TRUESTORY(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_truestory_condition;
	information = dmt_121200_dagot_truestory_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_121200_dagot_truestory_condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dmt_121200_dagot_truestory_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_01");	//Takže jak vidím zvolil jsi Beliara. To je opravdu impozantní.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_01_02");	//Strážce Dagoth?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_03");	//Jistě by tě zajímalo co tu dělám...(potichu), ale myslím že ty to víš, že takovéhle věci se nedějí jen tak.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_04");	//Zvláště v případě že se to předpokládá předem.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_06");	//A mnohem více...(jemně)... Smysl tvé existence je již dlouhou dobu vepsán v obvodu života. A změnit to není v silách nikoho.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_07");	//Ale teď myslím, že je čas, kdy musíme zasáhnout do běhu událostí, jak situace vyžaduje.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_01_08");	//Co tím myslíš?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_09");	//Myslím že tvůj úděl na tomto světě je být hrdinou. Svět potřebuje hrdiny jako ty.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_10");	//To co jsi udělal a uděláš může změnit pouze velký plán stvořitele.
	MIS_GUARDIANS = LOG_Running;
	ORCCANNOFEAR = TRUE;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"V chrámu jsem se setkal s Strážcem Dagothem. Jeho příchod mění zvrat událostí.");
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,"Velký plán stvořitele?",dmt_121200_dagot_truestory_whatplan);
};

func void dmt_121200_dagot_truestory_whatplan()
{
	var C_Npc demdag1;
	var C_Npc demdag2;
	var C_Npc demdag3;
	var C_Npc demdag4;
	demdag1 = Hlp_GetNpc(demondagot_01);
	demdag2 = Hlp_GetNpc(demondagot_02);
	demdag3 = Hlp_GetNpc(demondagot_03);
	demdag4 = Hlp_GetNpc(demondagot_04);
	demdag1.flags = 0;
	demdag2.flags = 0;
	demdag3.flags = 0;
	demdag4.flags = 0;
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_01");	//Velký plán stvořitele?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_04");	//To znamená že se změní tvář tohoto světa.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_07");	//V tomto světě existují tři bohové. Innos, Adanos a Beliar.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_08");	//Oni jsou obdařeni mocí Stvořitele.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_09");	//Ale bohužel zapomínají proč vlastně existují.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_10");	//Bojují mezi sebou a tím vedou do záhuby tento svět.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_11");	//A my, Strážci Vakhanských síní jsme se rozhodli to ukončit, aby byl svět chráněn před samovolným rozpadem, který by díky tomuto vznikl.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_14");	//Takže chcete zničit bohy?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_15");	//A všechny kteří jimi byli vytvořeni... Nikdo neunikne hněvu tvůrců.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_16");	//Ale to je šílenství! Nemyslím si že se bohové jen tak nechají!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_17");	//A co mám dělat? Oni o tom nevědí! A stejně jsou teď příliš slabí aby nám mohli vzdorovat.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_18");	//A mimochodem v téhle hře jsi i ty...(smích)... Ty jsi o tom nevěděl.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_20");	//O tomhle nemůžeš pochybovat! Tohle je tvůj osud který ti byl zvolen.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_21");	//Nebudu ti vysvětlovat skrytý význam tohoto jednání, protože brzo pochopíš...
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_22");	//'A člověk zabil bestii, jež pak vstoupila do Beliarova panství.'... Známá to slova proroctví.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_23");	//Ty říkáš že?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_24");	//Máš naprostou pravdu.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_25");	//A to je jen část toho co jsme my... Strážci! Co se stalo a co se bude dít.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_26");	//Stejně jako zničení tohoto světa tak jeho znovuzrození v podobě Stvořitele.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_27");	//Chápu a co Innos?!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_28");	//Ach ano, bůh Ohně, světla a lidí! O tom můžu říct...(arogantně)... jeho víra v lidi... jeho slabost. Kdyby se na lid tolik nespoléhal, byl by lepší! (výsměšně)
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_29");	//O něj neměj obavy. Tohle věděli i Skřeti.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_30");	//Jsem si jistý že brzy nebude nikdo kdo by se mu klaněl.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_31");	//A pak bude jeho osud zpečetěn... (smích)
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_32");	//A co skřeti? Vzhledem k tomu že jsou předmětem tvé vůle a dílem Beliara?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_33");	//Dílem Beliara? (smích) Jsou pouze jeho uctívači, nikoli jeho děti!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_34");	//Skřeti to jsou starověká stvoření jsou starší než lidstvo. Jsou těměř tak staří jako bohové...
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_35");	//Některé kmeny skřetů nemají lidi v lásce. Žárlí na ně. Mezi tyto skřety patří i kmen zde na Khorinisu... Tito skřeti by nejraději lidi stáhli z kůže zaživa!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_38");	//Jejich vlastní sekery, meče a kladiva se otočí proti nim... (výsměšně)
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_39");	//Dobře a co Adanos?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_40");	//Ten... Jako jediný bůh podle nás, Strážců, stojí za shovívavost.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_41");	//Nicméně jeho síla není moc silná aby mohla sama vést tento svět. Z toho důvodu nemůžeme riskovat.
	B_LogEntry(TOPIC_GUARDIANS,"Vše mi je jasné! Strážci Vakhanských síní přišli s bláznivím nápadem: zabít bohy. Oni věří že válka mezi Innosem a Beliarem zašla příliš daleko a že tím ponoří svět do tmy a chaosu.");
	B_LogEntry(TOPIC_GUARDIANS,"K uskutečnění jejich plánu chtějí využít mne! Mám bohy systematicky oslabovat, aby je nakonec Strážci mohli pohodlně odstranit z cesty.");
	B_LogEntry(TOPIC_GUARDIANS,"Dále jsem se dozvěděl zajímavé informace o skřetech. Existuje několik kmenů skřetů. Někteří žijí s lidmi v míru, někteří je nenávidí, a někteří proti nám, lidem, válčí. Zde na ostrově Khorinis žije kmen, který by lidi nejraději stahoval z kůže. Skřeti jsou také velcí uctívači Beliara.");
	DAGOTTRUTH_01 = TRUE;
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,"Co teď?",dmt_121200_dagot_truestory_askme);
	Info_AddChoice(dmt_121200_dagot_truestory,"A co Xardas?",dmt_121200_dagot_truestory_xardas);
};

func void dmt_121200_dagot_truestory_askme()
{
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_01");	//Co teď?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_02");	//(potichu) Smrt klepe, a volá svým rozechvělým hlasem...
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_03");	//V opačném případě to není možné! Tvá cesta končí zde.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_04");	//Takže Strážci mě chtějí zabít. To ale nebude snadné.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_05");	//O tom nepochybuji...(falešně)
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_06");	//Nicméně nevíš jak jsme silní a mocní takže nemáš v tomto boji šanci.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_07");	//Je lepší přijmout svůj osud.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_08");	//Uvidíme...
	B_LogEntry(TOPIC_GUARDIANS,"Ukázalo se, že mě Strážci Vakhanských síní chtějí mrtvého. Zdá se, že jsem pro ně nebezpečný. Tohle jsem tedy nepředpokládal.");
	DAGOTTRUTH_02 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory,"Tak ať přijdou, a pokusí se mě zabít!",dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_xardas()
{
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_Xardas_01_01");	//A co temný mág Xardas?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_02");	//Ach ano... On je... je jiný... Slouží Beliarovi, ale nežijee s ostatními temnými mágy ve Varantu. Nepodléhá představenému temných mágů. Myslí si, že je něco víc.(křičí) Tenhle mág si o sobě myslí že se rovná bohům!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_03");	//Není podivné, že se pořád motá kolem? Neměl by žít na jednom místě jako ostatní temní mágové? (potichu)Ne, on nás zradil, a za to zaplatí...
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_04");	//Ale nemůžeme pochybovat že bude stvořiteli potrestán.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_05");	//Nikdo neunikne trestu stvořitelů!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Dagoth pronesl pár slov o temném mágu Xardasovi. Zdá se že si uvědomil že Strážci jednají ve spěchu. Stále je záhadou co dělal Xardas v síních Temnoty.");
	DAGOTTRUTH_03 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory,"Tak ať přijdou, a pokusí se mě zabít!",dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_killme()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("DEM_WARN01");
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_KillMe_01_01");	//Tak ať přijdou, a pokusí se mě zabít!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_KillMe_01_02");	//Ty chceš zemřít? Náš rozhovor zkončil.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_KillMe_01_03");	//Moji služebníci se o tebe postarají.
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,Dialog_Ende,dmt_121200_dagot_truestory_killmeext);
};

func void dmt_121200_dagot_truestory_killmeext()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = TRUE;
	DAGOTTELLALL = TRUE;
};

