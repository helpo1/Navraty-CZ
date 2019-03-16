/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

ItWr_DexTrait - zamezeno nesplnitelnosti úkolu
func void ZS_Dead - itmw_1h_Crest (cyrilice -> latinka)

*/



var int RitualShaman_01;
var int RitualShaman_02;
var int RitualShaman_03;
var int RitualShaman_04;
var int RitualShaman_05;
var int RitualShaman_06;
var int RitualShaman_07;
var int RitualShaman_08;
var int RitualShaman_09;
var int Ginnok_Guard_01;
var int Ginnok_Guard_02;
var int Ginnok_Guard_03;
var int Ginnok_Guard_04;
var int Ginnok_Guard_05;
var int Ginnok_Guard_06;
var int GomezWSIsDead_01;
var int GomezWSIsDead_02;
var int GomezWSIsDead_03;
var int GomezWSIsDead_04;
var int GomezWSIsDead_05;
var int GomezWSIsDead_06;
var int GomezWSIsDead_07;
var int GomezWSIsDead_08;
var int GomezWSIsDead_09;
var int GomezWSIsDead_10;
var int GomezWSIsDead_11;
var int GomezWSIsDead_12;
var int GomezWSIsDead_13;
var int GomezWSIsDead_14;
var int GomezWSIsDead_15;



func void B_LogBeast(var C_Npc Beast)
{
	var string concatText;

	if(Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)
	{
		if(Gobbo_Green_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Goblin'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_GREEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_GREEN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Jsou to zlí a mrňaví Goblini. Tito malí bastardi jsou vždycky v houštině a útočí najednou. Pokud narazíte na skupinku takových tvorů a vaše zbraň je klacek, je lepší se jim skrýt před zraky, když zaútočíte na skupinu, jste téměř bez šance...");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Green_B1 >= 15) && (Gobbo_Green_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Goblin'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Hlavní výhody: jsou extrémně rychlý, díky čemuž se obtížně zraňují zbraní nablízko");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Slabina: mají velmi malou ochranu proti střelám, magii a ohni");
				AI_Print(concatText);
				Gobbo_Green_B2 = TRUE;
			}
			else if((Gobbo_Green_B1 >= 30) && (Gobbo_Green_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Goblin'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Taktika boje: Goblini se často formují do skupin, zvláště když se usadí ve velkých jeskyních, v takových případech se stávají obzvláště nebezpečnými. Nejlepší je, vylákat je po jednom a ustřílet z dálky z luku nebo kuše, i když nejsou velcí, v počtu více než tří jedinců představují značnou sílu.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Gobbo_Green_B3 = TRUE;
			};
		};

		Gobbo_Green_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) && (Beast.guild != GIL_MEATBUG) && (Hlp_GetInstanceID(Beast) != Hlp_GetInstanceID(Rabbit)) && (Hlp_GetInstanceID(Beast) != Hlp_GetInstanceID(Rabbit_02)))
	{
		if(Scavenger_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Mrchožrout'");
			Log_CreateTopic(TOPIC_BEAST_SCAVENGER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SCAVENGER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Tyto obrovské a divoké bezkřídlí ptáci jsou ve skutečnosti jedním z nejslabších obyvatel Khorinisu. Jak říká jejich jméno, lovit moc neumí a většinou jí trávu, pokud v blízkosti není mrtvé tělo. Většina mrchožroutů žije na loukách, nedaleko lidských osad, v lesech a v blízkosti bažin. Jediná věc, která může způsobit potíže pro začátečníka je hromada mrchožroutů, kteří se často nachází v hejnu. Nicméně, jejich miniaturní hloupý mozek vám dovolí vylákat mrchožroty jeden po druhém. Taktika boje proti těmto ptákům je jednoduchá - jakýkoli druh zbraně je zabije.");
			AI_Print(concatText);
		}
		else
		{
			if((Scavenger_B1 >= 15) && (Scavenger_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Mrchožrout'");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Hlavní výhody: je schopen běžet rychle a tvrdě udeřit s zobákem.");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Slabina: má velmi slabou ochranu před jakoukoli zbraní, kouzlu a ohni");
				AI_Print(concatText);
				Scavenger_B2 = TRUE;
			}
			else if((Scavenger_B1 >= 30) && (Scavenger_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Mrchožrout'");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Slabina: mrchozrouti udržují hejna, ale nekomunikují se mezi sebou. Proto je přilákejte jednoho po druhém.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Scavenger_B3 = TRUE;
			};
		};

		Scavenger_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		if(Wolf_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Vlk'");
			Log_CreateTopic(TOPIC_BEAST_WOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WOLF,"Vlci jsou jedni z nejznámějších zvířat na světě. Žijí téměř všude: od skalnatých hor a hustých lesů po travnaté pláně. Jejich kožich je obvykle zbarven ve světle šedé barvě, se špinavými bílými a černými skvrnami. Vlci jsou komunikativní zvířata, žijí ve smečckách. Každá smečka má vůdce - jeto nejsilnější a nejodvážnější vlk. Při lovu jejich síla spočívá v jejich skupinovém lovu. Osamělýho vlka lze jednoduše zabít, ale celou smečku bude těžké porazit i pro zkušeného lovce. Vlk ve smečce nebude nikdy lovit sám, smečka se kněmu vždycky přidá.Vlci napadají skupinově a útočí na nepřátele ostrými tesáky. Jedí maso z kořisti, kterou jsou schopni ulovit - nejčastěji loví ovce nebo mrchožrouty.Lovci ocení vlčí kůži kvůli kožešině a taky jejich tesáky.");
			AI_Print(concatText);
		}
		else
		{
			if((Wolf_B1 >= 10) && (Wolf_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Vlk'");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Hlavní výhody: dokážou rychle běžet, mají dobrou ochranu před zbraněmi, vlci útočí ve smečce");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Slabina: má malou ochranu proti střelám, magii a ohni");
				AI_Print(concatText);
				Wolf_B2 = TRUE;
			}
			else if((Wolf_B1 >= 20) && (Wolf_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Vlk'");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Taktika boje: nejprve byste měli vylákat prvního (nejsilnějšího) vlka z hejna zabít ho a pak celou smečku vyhladit nejlépe po jednom.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Wolf_B3 = TRUE;
			};
		};

		Wolf_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
	{
		if(Snapper_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Chňapavec'");
			Log_CreateTopic(TOPIC_BEAST_SNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SNAPPER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SNAPPER,"Chňapavec - dravé bytosti, starobylé monstra,kteří tu žijí dlouhou dobu. Jejich typickýmrysem nemají přední končetiny. Místo toho maj velmi silné zadní nohy, které umožňují chňapavci rychle uniknout a bezlítostně zaútočit. Útočí velkou rychlostí, trhají oběť velkou tlamou plnými ostrých zubů. Chňapavci sídlí u okrajů lesů, travnatých plání a horských oblastí s kamennou půdou. Jejich hlavní výhodou oproti ostatním je skupinový lov. Chňapavci se udržují kolem 3-5 jedinců. Pokud je jeden z nich napaden, jeho kamarádi mu přijdou napomoc, takže šance na ústup je velmi malá. Žerou vše, co dokážou ulovit. Jejich útok je velmi krvelačný, protože útočí ve skupinách. Ovce,stejně jako vlčí mláďata - ví své.");
			Log_AddEntry(TOPIC_BEAST_SNAPPER,"Žije i jiný druh chňapavce - takzvaný Dračí chňapavec. Jeto dokonalý zabiják! Jeho tesáky jsou ostřejší než břitva, jeho svaly jsou silnější než kámen a ocas na jednu ránu vám může přerazit všechny kosti v těle. Buďte opatrní, pokud se ho rozhodnete napadnout...");
			AI_Print(concatText);
		}
		else
		{
			if((Snapper_B1 >= 10) && (Snapper_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Chňapavec'");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Hlavní výhody: je schopen běžet velmi rychle, má dobrou ochranu před krátkými a dlouhými zbraněmi, naútočí sám a nenachává kořist utéct");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Slabina: slabá ochrana proti magii");
				AI_Print(concatText);
				Snapper_B2 = TRUE;
			}
			else if((Snapper_B1 >= 20) && (Snapper_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Chňapavec'");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Taktika boje: ustřílet je z luku není snadné - pohybují se příliš rychle a raději se pohybují v hejnu, při boji s nimi jsou osvědčené meče a sekery, čím silnější - tím lepší.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Snapper_B3 = TRUE;
			};
		};

		Snapper_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
	{
		if(ShadowBeast_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Stínová šelma'");
			Log_CreateTopic(TOPIC_BEAST_SHADOWBEAST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SHADOWBEAST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Stínová šelma - zrod temnoty, skutečná hrůza hustých lesů a jeskyní. Tyto obrovské chlupaté příšery s rohem se zjevují z ničeho nic a zmizí stejně tak. Opravdu, Stínová šelma je jeden z nejvíce nejnebezpečnejších dravců Khorinisu. Stínová šelma ráda žije v jeskyních, kde zatáhnou svou kořist, nakonec se jeskyně stane skutečným hřbitovem jak pro čtyřnohé, tak pro dvounohé obyvatele a živočichy Khorinisu. Dále se vyskytují v pohoří, hustých lesech a bažinách, kde nesvítí sluneční světlo, což činí tyto příšery obzláště nebezpečné. Mají silnou kůži, drápy, z nichž neodolá skoro žádná zbroj, střed s touto bytostí končí většinou smrtí.");
			AI_Print(concatText);
		}
		else
		{
			if((ShadowBeast_B1 >= 5) && (ShadowBeast_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Stínová šelma'");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Hlavní výhody: má obrovskou útočnou sílu, velkou ochranu před zbraněmi na blízko a velké zdraví");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Slabina: slabá ochrana proti různým zbraním a magii, nemá ráda denní světlo");
				AI_Print(concatText);
				ShadowBeast_B2 = TRUE;
			}
			else if((ShadowBeast_B1 >= 10) && (ShadowBeast_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Stínová šelma'");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Taktika boje: délka a síla zbraní, které používáte, ale taky vaše reakce - to je základ, který se rozhodne v boji se Stínovou šelmou. Bez dobré zbroje raději nechte tuto příšeru na pokoji.");
				AI_Print(concatText);
				hero.protection[PROT_EDGE] += 1;
				REALPROTEDGE += 1;
				AI_Print(PRINT_LEARNPROTEDGE);
				ShadowBeast_B3 = TRUE;
			};
		};

		ShadowBeast_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR)
	{
		if(Alligator_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Aligátor'");
			Log_CreateTopic(TOPIC_BEAST_ALLIGATOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ALLIGATOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Aligátoři žijí v blízkosti vodních výklenků nebo přímo v nich, takže nebuďte překvapeni, pokud vedle řeky nebo oázy vás napadne tento plaz... Obvykle je aligátor těžko vidět z dálky, neboť se skrývá buď ve vodě, nebo v nějakém jiném přírodním úkrytu - třeba ve trávě. Spatřit víc než jednoho Aligátora na jednom místě je dosti vzácné.");
			AI_Print(concatText);
		}
		else
		{
			if((Alligator_B1 >= 3) && (Alligator_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Aligátor'");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Hlavní výhody: dobrá ochrana před všemi typy zbraní na blízko, jeho silná čelist jeschopná prokousnout jakoukoli zbroj, a to i několikrát.");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Slabina: má malou ochranu proti magii a ohni");
				AI_Print(concatText);
				Alligator_B2 = TRUE;
			}
			else if((Alligator_B1 >= 5) && (Alligator_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Aligátor'");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Taktika boje: Nejlepší je použít oheň nebo magii proti Aligátorovi. Nestřílejte na něj vaše šipky a šípy, protože jejich tvrdá kůže je pro ně prakticky neproniknutelná.");
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Alligator_B3 = TRUE;
			};
		};

		Alligator_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER)
	{
		if(Blattcrawler_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kudlanka'");
			Log_CreateTopic(TOPIC_BEAST_BLATTCRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLATTCRAWLER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Obří kudlanka se nejčastěji nachází v jižní části ostrova Khorinisu.Je velmi nebezpečná kvůli délce její tlapky, která může snadno prorazit i dobře odolné zbroje. Potkat ji samotnou je téměř nemožné, což samo o sobě činí z tohoto hmyzu ještě nebezpečnějšího nepřítele.");
			AI_Print(concatText);
		}
		else
		{
			if((Blattcrawler_B1 >= 10) && (Blattcrawler_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kudlanka'");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Hlavní výhody: dobrá ochrana proti všem typům zbraní na blízko");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Slabina: slabá ochrana proti střelám, ohni a magii");
				AI_Print(concatText);
				Blattcrawler_B2 = TRUE;
			}
			else if((Blattcrawler_B1 >= 20) && (Blattcrawler_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kudlanka'");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Taktika boje: Lze jednoduše a bezpečně ustřílet kudlanku z luku nebo kuše, ale pokud jde o boj zblízka, je lepší si udržet si kudlanku dál od těla, skrz její silné pařáty.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Blattcrawler_B3 = TRUE;
			};
		};

		Blattcrawler_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)
	{
		if(Bloodhound_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Lovecký pes'");
			Log_CreateTopic(TOPIC_BEAST_BLOODHOUND,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODHOUND,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Tvor, který žije v dalece odlehlých oblastech, jako jsou horské jeskyně nebo pouštní skály. Je velmi agresivní a aktivní, tato šelma nespustí z očí nikoho, kdo se kní jen přiblíží. Vzhled tohoto stvoření vypadá divně kvůli tenké struktuře jeho těla a malé hlavě na dlouhém krku. Ale i přes své tělo má velmi silné nohy, které mu umožňují rychle běžet a daleko skákat. Barva kůže - hnědá s odstíny šedé a černé. Loveckého psa je těžké zabít kvůli jeho rychlosti, což mu dává velkou výhodu.");
			AI_Print(concatText);
		}
		else
		{
			if((Bloodhound_B1 >= 3) && (Bloodhound_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Lovecký pes'");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Hlavní výhody: má neuvěřitelnou nárazovou sílu a poměrně dobrou ochranu před zbraněmi, kouzlu a ohni.");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Slabina: nemá moc velké zdraví");
				AI_Print(concatText);
				Bloodhound_B2 = TRUE;
			}
			else if((Bloodhound_B1 >= 5) && (Bloodhound_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Lovecký pes'");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Taktika boje: měli byste použít taktiku zásah-ústoup, protože Lovecký pes vám nedá šanci dvakrát po sobě ho zasáhnout.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Bloodhound_B3 = TRUE;
			};
		};

		Bloodhound_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		if(Gobbo_Black_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Černý goblin'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_BLACK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Černí goblini jsou silnější, chytřejší, lstivější než obyčejní goblini a často obydlují ty nejlepší místa - nejteplejší jeskyně a upravené cesty. Žijí i s gobliny a útočí ve skupinkách - objeví se z temného zákoutí, celá tlupa, hbytě se sformují a přitom skřehotají, komunikují. Jak uvidí nepřítele, neváhaj a zaútočí. Jedince není těžké zabít, ale nikdo se nikdy nesetkal se samotným černým goblinem. Stejně jako obyčejní goblini využívají svou malou a hbytou postavu. V bitvě se pokoušejí obklíčit nepřítele. Jelikož se pohybují velmi rychle, po celou dobu se snaží útočit zezadu - není jednoduché je pak zranit. Navíc, pokud vylakáte a zabijete goblina, kterého potkáte, další se na vás hnedka vrhnou! Často ochraňují v tlupě goblinů tzv. Gobliní válečníky, ti zřejmě plní roli vůdců v černých a goblinských tlup. Jsou silnější než ostatní goblini, používají silnejší zbraně a někdy vlastní i lepši zbroj.");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Black_B1 >= 15) && (Gobbo_Black_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý goblin'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Hlavní výhody: rychlost a obratnost má za následek, že černýho goblina je obtížné zasáhnout zbraní krátkou i dlouhou; mají lepší zbraně než obyčejní goblini, někteří z nich jsou chráněni lehkým pancířem");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Slabina: spiš slabší ochranu proti střelám, kouzlům a ohni");
				AI_Print(concatText);
				Gobbo_Black_B2 = TRUE;
			}
			else if((Gobbo_Black_B1 >= 30) && (Gobbo_Black_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý goblin'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Taktika boje: s černym goblinem se bojuje stejně jako s klasickým. Jen je silnejší.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Gobbo_Black_B3 = TRUE;
			};
		};

		Gobbo_Black_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)
	{
		if(Icewolf_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ledový vlk'");
			Log_CreateTopic(TOPIC_BEAST_ICEWOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEWOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Na rozdíl od obyčejných vlků žijí tato zvířata výhradně v ledových a zasněžených oblastech. Mají zvláště bílou barvu srsti, někdy s odstíny šedé, což jim dodává ochranu barvu v jejich přirozeném prostředí. Mají červené oči, které jsou obzvlášť děsivé. Stejně jako ostatní vlci, ledový vlci žijí ve velkých smečkách, ale občas se vyskutují i samy. Lovit ve smečce jim dává velkou výhodu proti jejich kořisti. Ledový vlci jsou mnohem silnější než obyčejní vlci a jejich tlama je plná ostrých tesáků. Díky své síle a loveckým dovednostem mohou ulovit zvíře, které chtějí. Téměř každého ledového zvířete tvoří součást potravního řetězce většinou jeleni a divočáci. Tato zvířata jsou pro ně dravci, protože se téměř nikdy nevyskytují po jednom atak nemaj pro ním sebemenší šanci.");
			AI_Print(concatText);
		}
		else
		{
			if((Icewolf_B1 >= 5) && (Icewolf_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ledový vlk'");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Hlavní výhody: je schopen běžet rychle, má dobrou ochranu před zbraněmi na blízko a více zdraví oproti normálním vlkům.");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Slabina: slabá ochrana proti střelám, magii a ohni");
				AI_Print(concatText);
				Icewolf_B2 = TRUE;
			}
			else if((Icewolf_B1 >= 10) && (Icewolf_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ledový vlk'");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Taktika boje: Ledové vlky je lepší zabít jeden po druhém, v tlupě jsou nebezpeční.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Icewolf_B3 = TRUE;
			};
		};

		Icewolf_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_KEILER)
	{
		if(Keiler_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Divočák'");
			Log_CreateTopic(TOPIC_BEAST_KEILER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_KEILER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_KEILER,"Divočáci se nacházejí téměř všude - na cestách, v lesech, v horském terénu, v jeskyních, v blízkosti vodních přehrad a na jiných místech. V poušti a mrazu se nevyskytují. Ostré jako čepel jsou jeho tesáky jeto chlouba divočáků - u samců dosahují opravdu obrovské velikosti, mojí schopnost roztrat nepřítele. Divočáci jsou extrémně agresivní a útočí hned, jakmile někoho ucítí. Občas je sám a někdy taky ne.");
			AI_Print(concatText);
		}
		else
		{
			if((Keiler_B1 >= 10) && (Keiler_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Divočák'");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Hlavní výhody: dobrá obrana proti zbrani na blízko, když útočí je neuvěřitelně agresivní");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Slabina: slabší ochrana proti střelám, kouzlu a ohni");
				AI_Print(concatText);
				Keiler_B2 = TRUE;
			}
			else if((Keiler_B1 >= 20) && (Keiler_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Divočák'");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Taktika boje: je lepší použít luk nebo kuši. V boji na blízko jsou tyto potvory silné a můžou vám zasadit smrtelný úder.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Keiler_B3 = TRUE;
			};
		};

		Keiler_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		if(Zombie_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Zombie'");
			Log_CreateTopic(TOPIC_BEAST_ZOMBIE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ZOMBIE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Zombie - Beliarovi psi - nezáviděníhodná budoucnost těch, kteří během svého života učinili více špatných skutků než těch lepších. Jejich duch se nedobrovolně vrací z temnoty a je vystaven trestu tím, že je v hnilobném těle. Muka budou trvat tak dlouho, dokud budou podporována temnou magií. Zombie mají úžasný čich, bez problémů se pohybují v temných místech. Je jim jedno jaké zranění utrpí - jejich tělo nic necítí po celou dobu. Jejich duše lze osvobodit tím, že jim useknete hlavu od těla, rozsekáte jejich tělo, zničíte nebo spálíte jejich kostru. Křik při rozsekání zombie znamená, že duše je osvobozená od těla a může tak konečně najít klid.");
			AI_Print(concatText);
		}
		else
		{
			if((Zombie_B1 >= 10) && (Zombie_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Zombie'");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Hlavní výhody: absolutně necítí bolest, což jim umožňuje neustále útočit na svou oběť");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Slabina: extrémně slabá ochrana proti požáru");
				AI_Print(concatText);
				Zombie_B2 = TRUE;
			}
			else if((Zombie_B1 >= 20) && (Zombie_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Zombie'");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Taktika boje: Nejdůležitější věcí je, že zombie necítí bolest. Nepřestanou útočit dokud vás nezabijí. Vaše reakce musí být bleskové a používejte rychlé protiútoky - to je hlavní záruka úspěchu v bitvě s těmito monstry.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Zombie_B3 = TRUE;
			};
		};

		Zombie_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ORCBITER)
	{
		if(OrcBiter_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kousavec'");
			Log_CreateTopic(TOPIC_BEAST_ORCBITER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCBITER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCBITER,"Menší lovci, ale jsou to rychlý zabijáci. Jsou vzdáleně příbuzní chňapavcům a ještěrům, žijí převážně v malých horských údolí pokryté zeleni a velké trávy, sem tam se nachází i menší stáda těchto příšer. Nejsou zrovna moc nebezpeční, ale radši zůstávají v hejnech atím se stávají silnějším. Jedí rádi mrchožrouty a občas můžete vidět, jak se s nimi honí, ale spíš jen pro zábavu. Mají rady taky lidské ostatky. Kromě toho se v hejnu cítí mnohem více sebevědomněji než samotní.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcBiter_B1 >= 5) && (OrcBiter_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kousavec'");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Hlavní výhody: jsou rychlý v běhu");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Slabina: malá ochrana před všemi druhy zbraní a magie");
				AI_Print(concatText);
				OrcBiter_B2 = TRUE;
			}
			else if((OrcBiter_B1 >= 10) && (OrcBiter_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kousavec'");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Taktika boje: Když se rozběhne kvám, nachystejte si zbraň. Jeho útoku se můžete buď vyhnout, apak zaútočit a nebo ho zabijte hned.");
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				OrcBiter_B3 = TRUE;
			};
		};

		OrcBiter_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_RAZOR)
	{
		if(Razor_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Břitva'");
			Log_CreateTopic(TOPIC_BEAST_RAZOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_RAZOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_RAZOR,"Břitva - je příšera masožravého druhu. Stejně jako chňapavci, tato zvířata loví v hejnu. Jsou však mnohem děsivější a to nejen pro začátečníky, ale i pro zkušené válečníky. Břitva vyniká v rychlosti, síle a agresi, břitvy jsou neustále vzteklá zvířata, zaútočí na všechno, co se hýbe, ať je to zvíře, člověk nebo jen strom. Loví i když nejsou hladoví - jen aby uspokojili svou vášeň za zabít. Čím víc jich je ve smečce, tím jsou nebezpečnější pro všechny okolo.");
			AI_Print(concatText);
		}
		else
		{
			if((Razor_B1 >= 5) && (Razor_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Břitva'");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Hlavní výhody: vynikající ochrana před zbraněmi a ohni");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Slabina: má jen malou ochranu před magií");
				AI_Print(concatText);
				Razor_B2 = TRUE;
			}
			else if((Razor_B1 >= 10) && (Razor_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Břitva'");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Taktika boje: Na břitvy platí střelba z luku a kuše, jsou citlivé na magii Vody. Pokud si myslíte, že snadno zvítězíte tak jste na omylu. Připravte se na obtížnou a rychlou bitvu! Pokud do 15 sekund nezabijete všechny z tlupy, budou vás mít k snídani. Ani nebudou mít problém pozdřít vaši zbroj.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Razor_B3 = TRUE;
			};
		};

		Razor_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_GHOST)
	{
		if(Ghost_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Přízrak'");
			Log_CreateTopic(TOPIC_BEAST_GHOST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GHOST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GHOST,"Přízrakem se stává ten, kdo zemřel násilnou smrtí. Můžete se s nimi setkat na hřbitovech nebo v domcích, ve kterých žili když jejich duše byly ještě živé. Čarodějové a šamani se neustále hádají o tom, zda se duše skutečně vyskytuje po smrti v jiném světě, kde je čeká věčná radost nebo utrpení. Obě skupiny však souhlasí s tím, co se stane s duší, která z nějakého důvodu zůstává v našem světě: stanou se přízraky. Podle nářeků těchto stvoření jim nelze závidět jejich osud.");
			AI_Print(concatText);
		}
		else
		{
			if((Ghost_B1 >= 3) && (Ghost_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Přízrak'");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Hlavní výhody: absolutně imunní vůči zbraním krátkého dosahu nebo šípům a šipkám, pokud nejsou vyrobeny ze stříbra");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Slabina: slabší ochrana před magií a ohni");
				AI_Print(concatText);
				Ghost_B2 = TRUE;
			}
			else if((Ghost_B1 >= 5) && (Ghost_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Přízrak'");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Taktika boje: proti přízrakům lze jen použít zbraně ze stříbra nebo obyčejné kouzlo.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Ghost_B3 = TRUE;
			};
		};

		Ghost_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_STONEGUARDIAN)
	{
		if(Stoneguardian_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kamenný strážce'");
			Log_CreateTopic(TOPIC_BEAST_STONEGUARDIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGUARDIAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Kamenní strážci, oživené pomocí kouzla, chrání chrámy a obydlí Stavitelů před zloději a vykradače. Jejich vzhled vystraší většinu zlodějů. Ti, kteří se nebojí pohledu na tyto velké bytosti stejně brzo zemřou, protože je roztrahají jejich kamenné silné ruce.");
			AI_Print(concatText);
		}
		else
		{
			if((Stoneguardian_B1 >= 10) && (Stoneguardian_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenný strážce'");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Hlavní výhody: téměř imunní vůči normální zbraní, má dobrou obranu proti magii a ohni");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Slabina: malá ochrana proti jakékoli tupé zbrani");
				AI_Print(concatText);
				Stoneguardian_B2 = TRUE;
			}
			else if((Stoneguardian_B1 >= 20) && (Stoneguardian_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenný strážce'");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Taktika boje: Nečekejte, až tento kamenný obr udeří první, může to být pro vás poslední rána. Buď nebo použijte kouzlo, abyste ho rychle zničili nebo ho rozdrťte drtičem kamene.");
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Stoneguardian_B3 = TRUE;
			};
		};

		Stoneguardian_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_STONEPUMA)
	{
		if(StonePuma_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kamenná puma'");
			Log_CreateTopic(TOPIC_BEAST_STONEPUMA,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEPUMA,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Pumy zpravidla žijí na jižním území Khorinisu. Nemají prakticky žádné nepřátele v jejich životním prostředí. Její ostré zuby a drápy spojené spolu obrovskou rychlostí pohybu nedávají nepříteli skoro žádnou šanci na útěk. To vše je třeba vzít v úvahu, abyste se nestali její další obětí. Pumy zřídka žijí v hejnech ale raději loví samy.");
			AI_Print(concatText);
		}
		else
		{
			if((StonePuma_B1 >= 3) && (StonePuma_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenná puma'");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Hlavní výhody: obrovská rychlost pohybu, dobrá ochrana před zbraněmi na blízko");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Slabina: malá ochrana před střelnou zbraní, magií a ohni");
				AI_Print(concatText);
				StonePuma_B2 = TRUE;
			}
			else if((StonePuma_B1 >= 5) && (StonePuma_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenná puma'");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Taktika boje: Nejlepší je použít luk nebo kuši, abyste ustříleli pumu z dálky, než se k vám dostane.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				StonePuma_B3 = TRUE;
			};
		};

		StonePuma_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if(SwampDrone_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Močálový trubec'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPDRONE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPDRONE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Močálový trubec je velký létající hmyz zelené barvy s jedovatým žihadlem. Obvykle žijí ve velkých močálech. Oči Močálového trubce jsou málo vyvynuté, ale čich je velmi dobře vyvynut, takže vycítí kořist z dálky. Poté co objeví vhodnou oběť zaútočí na ni svým jedovatým žihadlem, aby nemohla klást odpor a bránit se.");
			AI_Print(concatText);
		}
		else
		{
			if((SwampDrone_B1 >= 5) && (SwampDrone_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Močálový trubec'");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Hlavní výhody: mohou způsobit těžkou otravu");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Slabina: má velmi malou ochranu před jakýmkoliv typem zbraní, magii a ohni");
				AI_Print(concatText);
				SwampDrone_B2 = TRUE;
			}
			else if((SwampDrone_B1 >= 10) && (SwampDrone_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Močálový trubec'");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Taktika boje: nejsnazší způsob, jak zničit Močálového trubce, je pomocí luku, kuše nebo kouzla.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				SwampDrone_B3 = TRUE;
			};
		};

		SwampDrone_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
	{
		if(Swampgolem_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Bažinný golem'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Tyto bláznivé bažinné potvory mají neuvěřitelnou sílu, jsou schopny používat magii. Někdy je těžké je vidět mezi bažinami a houštím, což činí tyto obry nebezpečnější protívníky ve srovnání s jinými golemy.");
			AI_Print(concatText);
		}
		else
		{
			if((Swampgolem_B1 >= 5) && (Swampgolem_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Bažinný golem'");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Hlavní výhody: má vynikající ochranu proti šípům a šipkám, dobrou ochranu proti tupé zbrani, ohni a magii");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Slabina: má velmi malou ochranu před sečnou zbraní");
				AI_Print(concatText);
				Swampgolem_B2 = TRUE;
			}
			else if((Swampgolem_B1 >= 10) && (Swampgolem_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Bažinný golem'");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Taktika boje: Boj na blízko je nejlepší způsob, jak překonat tuto hromadu hlíny, bláta a kořenů. Nejúčinnější jsou sečné zbraně.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Swampgolem_B3 = TRUE;
			};
		};

		Swampgolem_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	{
		if(BloodFly_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Krvavá moucha'");
			Log_CreateTopic(TOPIC_BEAST_BLOODFLY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODFLY,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Krvavé mouchy jsou zlí létajcí ďablíci, hnoho z nich se shromažďuje u zdroje vody, které najdou. Se svými dlouhými, zakřivenými žihadly vpouštějí jedovatou krev do každého, kdo se odváží přiblížit k jejich blízkosti. Charakteristický vír jejich průsvitných křídel zažene na útěk všechny malé zvířata. Krvavé mouchy nejsou příliš silní nepřátelé, ale pokaždé napadne oběť celý roj, poté ji obklopí ze všech stran.");
			AI_Print(concatText);
		}
		else
		{
			if((BloodFly_B1 >= 15) && (BloodFly_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Krvavá moucha'");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Hlavní výhody: mohou způsobit otravu");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Slabina: malá ochrana před jakoukoli zbrani, magii a ohni");
				AI_Print(concatText);
				BloodFly_B2 = TRUE;
			}
			else if((BloodFly_B1 >= 30) && (BloodFly_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Krvavá moucha'");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Taktika boje: Nejlepší je zabít Krvavou mouchu z luku, kuše nebo pomocí kouzla. Zaútočit na ni mečem se moc nedoporučuje, aspoň do té doby dokud neméte těžkou zbroj, které vás jistě ochrání před jejím otráveným žihadlem.");
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				BloodFly_B3 = TRUE;
			};
		};

		BloodFly_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	{
		if(Demon_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Démon'");
			Log_CreateTopic(TOPIC_BEAST_DEMON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DEMON,"Démon — je stvoření z posmrtného života, světa smrti a strachu od Beliara. Existuje hodně druhů démonů, ale pouze ti nejmenší a nejslabší dovolí lidem, aby je mohly vyvolat a poté můžou věrně sloužit svým panům. Tito těžcí bojovníci jsou schopni udělat mnoho problémů i silnému a odvážnému hrdinovy. Démoni patří mezi nejnebezpečnější a silnější obyvatele tohoto světa. Jako magické bytosti jsou velmi dobře chráněni a obdařeni silou, nebezpečnou pro téměř všechny druhy nepřátel.");
			AI_Print(concatText);
		}
		else
		{
			if((Demon_B1 >= 5) && (Demon_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Démon'");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Hlavní výhody: neuvěřitelná síla, vynikající ochrana proti jakékoli druhu zbraně, kouzlům a ohně, obrovské zdraví, na dálku útočí magií");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Slabina: - není -");
				AI_Print(concatText);
				Demon_B2 = TRUE;
			}
			else if((Demon_B1 >= 10) && (Demon_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Démon'");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Taktika boje: nenechat se zásáhnout nebo mu zabránit seslání kouzla, jinak bude výsledek boje prakticky jasný.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Demon_B3 = TRUE;
			};
		};

		Demon_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		if(DemonLord_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Arcidémon'");
			Log_CreateTopic(TOPIC_BEAST_DEMON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Arcidémoni jsou velitélé hordy démonů a jsou druhem elity z jiného světa. Jsou příliš silní na to, aby je člověk mohl porazit v boji. Takováto bitva nemůže dopadnout pro člověka nikdy dobře. Jsou to hrozní bojovníci - silní, obratní, agresivní a zcela nezranitelní proti normální zbrani. Meče, sekery, palcáty - vše jen zlomí, sotva se jich dotknou, šipky a šípy shoří ještě při letu. Pouze silný válečník nebo mág má šanci vyhrát boj na život a smrt s Arcidémonem.");
			AI_Print(concatText);
		}
		else
		{
			if((DemonLord_B1 >= 5) && (DemonLord_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Arcidémon'");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Hlavní výhody: neuvěřitelná síla, vynikající ochrana proti jakýkoli druhu zbrani, kouzlu a ohni, obrovské zdraví, útočí magií na dálku");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Slabina: - není -");
				AI_Print(concatText);
				DemonLord_B2 = TRUE;
			}
			else if((DemonLord_B1 >= 10) && (DemonLord_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Arcidémon'");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Taktika boje: jakákoli chyba v bitvě s Arcidémonem vás bude stát život. Snažte se ji neudělat!");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				DemonLord_B3 = TRUE;
			};
		};

		DemonLord_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DRACONIAN)
	{
		if(Draconian_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ještěran'");
			Log_CreateTopic(TOPIC_BEAST_DRACONIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRACONIAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Ještěřani — Jedná se o rasu dvounohých humanoidních plazů podobný ještěrům. Nosí podomácku vyrobené červené pancéřování, stejně zbarvené jako jejich šupiny, jsou vyzbrojeny velkou čepelí, kterou používají v boji. Jejich jazyk je pro lidi nepochopitelný, protože se skládá ze syčení a chrčení. Jsou také extrémně agresivní vůči nepřátelům a napadají je podobně jako Skřeti. Jsou vysoce inteligentní - mohou dokonce vymýšlet vlastní zbraně a zbroje, stejně jako plnit složité povinnosti, jako je hlídání dračích vajec nebo hlédání cenností pro jejich pány.");
			AI_Print(concatText);
		}
		else
		{
			if((Draconian_B1 >= 15) && (Draconian_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ještěran'");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Hlavní výhody: obrovská síla, vynikající ochrana proti jakékoli zbrani, magii a ohni, inteligentní");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Slabina: - není -");
				AI_Print(concatText);
				Draconian_B2 = TRUE;
			}
			else if((Draconian_B1 >= 30) && (Draconian_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ještěran'");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Taktika boje: vaše rychlé reakce a vysoká dovednost vaší zbrani jsou jediným klíčem k vítězstvím nad těmito tvory.");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Draconian_B3 = TRUE;
			};
		};

		Draconian_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_BLACK) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_RED) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD))
	{
		if(Dragon_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Drak'");
			Log_CreateTopic(TOPIC_BEAST_DRAGON_FIRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGON_FIRE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Draci jsou starověké bytosti, jsou to téměř polobozi. Kdysi jich bylo tisíce, ale postupně, po dobu tisíců let přírodních katastrof a bitev, zmizely až do okamžiku, kdy se podle lidí staly o něco více než legendou. Jedná se o extrémně nebezpečné stvoření, schopné rychle obnovit své zdraví, stejně jako obrovské magické schopnosti, sílu a temnou moc včetně svých duševních schopností.");
			AI_Print(concatText);
		}
		else
		{
			if((Dragon_B1 >= 3) && (Dragon_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Drak'");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Hlavní výhody: obrovské škody způsobené magií a ohněm, neuvěřitelná ochrana před jakoukoli zbrani, kouzlu a ohni, draci jsou inteligentní");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Slabina: - není -");
				AI_Print(concatText);
				Dragon_B2 = TRUE;
			}
			else if((Dragon_B1 >= 5) && (Dragon_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Drak'");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Taktika boje: dobrá ochrana proti ohni a magii je jediný způsob, jak zůstat naživu při setkání s drakem.");
				AI_Print(concatText);
				Dragon_B3 = TRUE;
			};
		};

		Dragon_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
	{
		if(DragonSnapper_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Dračí chňapavec'");
			Log_CreateTopic(TOPIC_BEAST_DRAGONSNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGONSNAPPER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Dračí chňapavec - jedna z nejstrašnějších stvůr a ideální stroj na zabíjení, rychle běhá, daleko skáče a má ničivý útok. Vypadá jako skutečný dravec, typicky má dračí chapadla. Obecně vypadají stejně jako obyčejní Chňapavci, ale mají několik jiných charakteristických rysů. Například ostré rohy na hlavě a mnoho dlouhých drápů na tlapkách. Stejně jako Chňapavci, dračí běží na silných zadních nohách. Barva kůže Dračích chňapavců je tmavě hnědá, jejich rohy jsou špinavě žluté. Nacházejí se téměř všude: ve skalnatých horách a na zelených plání; vyskytují ve skupinkách několika jedinců, ale pár také není neobvyklý. Jejich potravou se stává vše, co se jim dostane do cesty - nejčastěji mrchožrouti, vlci a ovce. Hlavní zbraní těchto predátorů je tlama plná ostrých zubů. Tyto stvoření jsou velmi rychlé: nejdřív svou rychlostí překvapí nepřátele a pak způsobí první úder smrti.");
			AI_Print(concatText);
		}
		else
		{
			if((DragonSnapper_B1 >= 10) && (DragonSnapper_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Dračí chňapavec'");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Hlavní výhody: obrovská rychlost pohybu a útočná síla, vynikající ochrana proti všem druhu zbrani a ohni, obrovské zdraví");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Slabina: slabá ochrana proti magii");
				AI_Print(concatText);
				DragonSnapper_B2 = TRUE;
			}
			else if((DragonSnapper_B1 >= 20) && (DragonSnapper_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Dračí chňapavec'");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Taktika boje: díky neuvěřitelné síle a rychlosti jsou jedním z nejnebezpečnějších nepřátel! Proto je lepší, aby málo zkušený válečník utekl předtím, než ho Dračí chňapavec ucítí, jinak bude pozdě, pak už neutečete :).");
				AI_Print(concatText);
				hero.protection[PROT_EDGE] += 1;
				REALPROTEDGE += 1;
				AI_Print(PRINT_LEARNPROTEDGE);
				DragonSnapper_B3 = TRUE;
			};
		};

		DragonSnapper_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		if(FireGolem_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ohnivý golem'");
			Log_CreateTopic(TOPIC_BEAST_FIREGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Skládající se z roztavené horniny a čistého ohně, nezraní je klasické zbraně, neznají únavu, a nikdy neustoupí - tito tvorové by byly ideální vojáci, pokud alespoň jeden mág je dokázal přimět, aby ho poslechly. Skládají se z poloviční magie. Magie jim pomáhá udržet jejich tekuté tělo v elementy ohně, které se propojují s kouřovým kamenem, což jim umožňuje jejich použití v boji. Z úlomků původního plamene mohou spálit nepřítele do doutnajcích zbytků popela. Nejsou ani zdaleka tak silní a vytrvalí jako jejich bratři z kamene. Ještě nikdo na světě je dosud neporazil v boji na blízko - oheň, který je pokrývá, je příliš horký na to, aby byla nějaká možnost je poškodit.");
			AI_Print(concatText);
		}
		else
		{
			if((FireGolem_B1 >= 3) && (FireGolem_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ohnivý golem'");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Hlavní výhody: velké poškození, velké zdraví, odolné vůči ohni");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Slabiny: má slabou ochranu proti magii");
				AI_Print(concatText);
				FireGolem_B2 = TRUE;
			}
			else if((FireGolem_B1 >= 6) && (FireGolem_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ohnivý golem'");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Taktika boje: rychlé protiútoky jsou hlavní a téměř jediný způsob, jak se vypořádat s golemy. Také, když budete muset čelit ohnivému golemu, nezapomeňte použít silné kouzla magie Vody.");
				AI_Print(concatText);
				hero.protection[PROT_FIRE] += 1;
				REALPROTFIRE += 1;
				AI_Print(PRINT_LEARNPROTFIREZ);
				FireGolem_B3 = TRUE;
			};
		};

		FireGolem_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
	{
		if(FireWaran_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ohnivý ještěr'");
			Log_CreateTopic(TOPIC_BEAST_FIREWARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREWARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Tito plazové milují teplo a klid. Nejčastěji jsou na písečné pláži u moře, avšak teplé traviny v odpoledních hodinách jsou pro tyto úžasná zvířata stejně příjemné. Na rozdíl od ještěrů jsou Ohnivý ještěři velmi silný protivník. Není to jen pevná kůže a téměř dokonalá imunita vůči kouzlům Ohni. Faktem je, že ještěří oheň dokáže udělat to, co nemůže udělat žádné jiné stvoření v celém Khorinisu - plivají oheň a za pár vteřin přemění nepřítele na popel.");
			AI_Print(concatText);
		}
		else
		{
			if((FireWaran_B1 >= 5) && (FireWaran_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ohnivý ještěr'");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Hlavní výhody: téměř imuní vůči magii Ohně a zranění ohněm");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Slabiny: má slabou ochranu proti střelám a magii (kromě ohnivé)");
				AI_Print(concatText);
				FireWaran_B2 = TRUE;
			}
			else if((FireWaran_B1 >= 10) && (FireWaran_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ohnivý ještěr'");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Taktika boje: Nepřibližujte si je k sobě blíž než je nutné. Zamezte tomu aby na vás dýchla oheň - prostě zhoříte! Odstřelte ji z dálky z luku nebo ji zničtě nějakým vodním kouzlem.");
				AI_Print(concatText);
				hero.protection[PROT_FIRE] += 1;
				REALPROTFIRE += 1;
				AI_Print(PRINT_LEARNPROTFIREZ);
				FireWaran_B3 = TRUE;
			};
		};

		FireWaran_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
	{
		if(Giant_Bug_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Polní škůdce'");
			Log_CreateTopic(TOPIC_BEAST_GIANT_BUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GIANT_BUG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Tito škůdci - přerostlý hmyz jse jmenuje podle pšeničných polí, které je jejich přirozené prostředí. Rolníci neustále válčí s Polnímy škůdci, protože ničí jejich úrodu. Polní škůdci jsou obvykle světle hnědé, ale jejich plášť je trochu tmavší. Mají oválné tělo, vysokou a pevnou skořápku, tykadla jsou dlouhá a tenká. Počet těchto bytostí závisí zpravidla na velikosti pole, na kterém žijí. Čím větší orná oblast - tím více škůdců na ní. Krmí se hlavně obilovinami, ale i některé bylinky spapají. Polní škůdci útočí předními tlapky. Snaží se zmást cíl, při útoku se pohybují se ze strany na stranu.");
			AI_Print(concatText);
		}
		else
		{
			if((Giant_Bug_B1 >= 10) && (Giant_Bug_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Polní škůdce'");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Hlavní výhody: - nejsou -");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Slabost: má velmi malou ochranu proti střelám, magii a ohnivím kouzlům");
				AI_Print(concatText);
				Giant_Bug_B2 = TRUE;
			}
			else if((Giant_Bug_B1 >= 20) && (Giant_Bug_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Polní škůdce'");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Taktika boje: Polní škůdce by neměl být problém ani pro obyčejného zelenáče, který by ho mohl snadno sejmout zbraní na blízko.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Giant_Bug_B3 = TRUE;
			};
		};

		Giant_Bug_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE)
	{
		if(Gobbo_Shaman_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Gobliní šaman'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_MAGE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Goblini velmi ctí své šamany za své magické schopnosti, avšak jejich znalosti magie jsou malé. Neumí víc než jedno kouzlo. Což vám poskytuje jistou strategickou výhodu.");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Shaman_B1 >= 3) && (Gobbo_Shaman_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Gobliní šaman'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Hlavní výhody: používá magické runy");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Slabost: má velmi malou ochranu proti střelám, magii a ohni");
				AI_Print(concatText);
				Gobbo_Shaman_B2 = TRUE;
			}
			else if((Gobbo_Shaman_B1 >= 5) && (Gobbo_Shaman_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Gobliní šaman'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Taktika boje: je nejlepší je ustřílet z luku nebo kuše. Navíc v boji z blízka prakticky nepředstavují žádné nebezpečí.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Gobbo_Shaman_B3 = TRUE;
			};
		};

		Gobbo_Shaman_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_HARPY)
	{
		if(Harpie_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Harpyje'");
			Log_CreateTopic(TOPIC_BEAST_HARPY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_HARPY,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_HARPY,"Nechutně létající tvory hnízdící ve starých kamenných zříceninách a na vrcholcích nejvyšších hor. V Khorinisu se vypráví hrozné příběhy harpyjí, které berou děti z postýlek, poté je sežerou nebo usmrtí během svých hrozných rituálů. Samozřejmě, že to není nic víc než legenda, ale zrnko pravdy v něm je stále existuje: Harpyje přitahuje vše co se leskne a ve svých hnízdech často hromadí spoustu úplně zbytečných věcí, jiskřivých a třpytivých na slunečním světlu. Nejsou moc silné nebo aktivní, ale jsou skvělé při létání a samotářky to nejsou. Pokud na vás zaútočí hejno, nebude snadné se mu ubránit.");
			AI_Print(concatText);
		}
		else
		{
			if((Harpie_B1 >= 5) && (Harpie_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Harpyje'");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Hlavní výhody: může létat, má magický útok na dálku");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Slabosti: slabá obrana proti magii a ohni");
				AI_Print(concatText);
				Harpie_B2 = TRUE;
			}
			else if((Harpie_B1 >= 10) && (Harpie_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Harpyje'");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Taktika boje: Harpyje může být snadno probodnuta mečem, to ale harpyje nedovolí, bude se mu vyhýbat, takže nejlepší řešení je ustřílení harpyje z luku nebo kuše. Kouzlem je to též možné, hlavně ohnivé ji krásně šežehne na popel.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Harpie_B3 = TRUE;
			};
		};

		Harpie_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		if(IceGolem_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ledový golem'");
			Log_CreateTopic(TOPIC_BEAST_ICEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Tito golemové se vzniknou, když se kouzlo vzduch spojí s nejčistší vodou horských jezer a zmrazí ji, čímž se stává kapalnou látkou, která ještě není tekutá, ale vznikne pevná látka podobná želé. Stejně jako jejich ohnivý bratři, nejsou moc aktivní, ale na rozdíl od nich, tenhle druh golema je velmi silný a boj na blízko s ním bude těžký. Krom toho, jako Ohnivý golemové, jsou téměř imunní vůči všem magickým zbraním - uvíznou v jejich těle, aniž by došlo k jejich poškození. Pouze silná kouzla Ohně můžou roztavit vodu ztuhlou magickou silou a zničit je. Ale pozor: smícháním magie Vody a vzduchu vznikají extrémní účinky: jsou schopni hodit na nepřítele kusy ledu, což způsobí vážné zranění.");
			AI_Print(concatText);
		}
		else
		{
			if((IceGolem_B1 >= 5) && (IceGolem_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ledový golem'");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Hlavní výhody: velké poškození, velké zdraví, imunní vůči téměř všem kouzlům");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Slabost: malá ochrana proti ohni");
				AI_Print(concatText);
				IceGolem_B2 = TRUE;
			}
			else if((IceGolem_B1 >= 10) && (IceGolem_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ledový golem'");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Taktika boje: Jen silná ohnivá kouzla dokážou roztavit vodu ztuhlou magickou silou a zničit ho.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				IceGolem_B3 = TRUE;
			};
		};

		IceGolem_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_LURKER)
	{
		if(Lurker_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Číhavec'");
			Log_CreateTopic(TOPIC_BEAST_LURKER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_LURKER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_LURKER,"Tito obojživelníci vedou poklidný život a nelze je potkat daleko od jezírek a potoků. Voda jim dává vše, co potřebují po celý život. Jsou schopni trávit a válet se po celý den podél břehu jezera, ochutnávájí šťavnaté kořeny vodních rostlin a příležitostně se potápí pro lahoudnou rybičku. Umí plavat a přitom se potápějí. Jsou schopni zůstat pod vodou nekonečně dlouho. Ale navzdory své lásce k vodě raději stráví noc v suché a teplé jeskyni, kde čas od času kladou vajíčka a tím zvyšují svoji populaci.");
			AI_Print(concatText);
		}
		else
		{
			if((Lurker_B1 >= 10) && (Lurker_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Číhavec'");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Hlavní výhody: dobrá ochrana proti zbraním na blízko");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Slabina: malá ochrana proti střelám, magii a ohni");
				AI_Print(concatText);
				Lurker_B2 = TRUE;
			}
			else if((Lurker_B1 >= 20) && (Lurker_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Číhavec'");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Taktika boje: Chňapavci nejsou nějak silní nepřátelé, nežijí v hejnu jsou samotáři. Jsou trošku odolní vůči zbraním na blízko, ale i tak byste je měli zdolat vcelku snadno.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Lurker_B3 = TRUE;
			};
		};

		Lurker_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
	{
		if(Minecrawler_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Důlní červ'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Další várka z temnoty, temné magie od Beliara, Důlní červy jsou potvory, které žijí hluboko pod zemí. Není jasno, proč svýmy chapadly každého napadnou. Lidé se domnívají, že to dělají proto, že se poté dostanou ke svému pánu Beliarovy aby je uvolnil ze svých služeb, jiní si myslí, že Beliar řekl svým věrným sluhům, aby střežily toto uzemí před lidmi a všemy ostatnímy, aby ho nikdo nemohl rušit. Druhá varianta je vcelku logická, většina znich se usadí u ložisek magického rudy, aby tím způsobily spoustu problémů kopáčům, kterými se velmi rádi krmí a jsou pro ně dostupná potrava. Nejpravděpodobněji ale hledají místa, která jsou hluboko v dolech, ale kopáči kteří kutají rudu jim zasahují do teroteria. Krmí se pravděpodobně houbami a plísní, která roste po stěnách jeskyní, protože nikdo nikdy neviděl Důlního červa, který by vylezl vem z jeskyně, kde je další potencionální potrava.");
			AI_Print(concatText);
		}
		else
		{
			if((Minecrawler_B1 >= 15) && (Minecrawler_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Důlní červ'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Hlavní výhody: dobrá ochrana před zbraněmi");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Slabina: slabá ochrana proti magii a ohni");
				AI_Print(concatText);
				Minecrawler_B2 = TRUE;
			}
			else if((Minecrawler_B1 >= 30) && (Minecrawler_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Důlní červ'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Taktika boje: Důlní červi jsou silní nepřátelé, jejich kusadla jsou schopné rozkousnout člověka na polovinu, avšak zbroj z jejich krunýřů je nejtvrdší ze světa zvířat. Zkušený valečník si s ním jistě poradí. Navíc jsou zcela bezbranní proti magii a to by mělo být využito.");
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				Minecrawler_B3 = TRUE;
			};
		};

		Minecrawler_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SPIDER)
	{
		if(Spider_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Pavouk'");
			Log_CreateTopic(TOPIC_BEAST_SPIDER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SPIDER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SPIDER,"Pavouk má velikost dospělého psa. Nachází se často v hustých a odlehlých lesích, kde spřádá tenkou, sotva viditelnou - ale úžasně silnou pavučinu. Uvězněná oběť je odsouzena ke smrti - poté pavouk čeká až jeho večeře bude připravená, než se pěkně rozloží, pavouk do ni vstříkne jed smíchaný s žaludeční kyselinou - poté nechá působit jeho enzymy, až zvíře nebo člověk ztratí vědomí stává se jeho chutným a výživným papáním.");
			AI_Print(concatText);
		}
		else
		{
			if((Spider_B1 >= 5) && (Spider_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Pavouk'");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Hlavní výhody: dobrá ochrana před téměř každým poškozením, vyjma magického, okamžitě a rychle zaútočí");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Slabina: Má slabou ochranu proti magii");
				AI_Print(concatText);
				Spider_B2 = TRUE;
			}
			else if((Spider_B1 >= 10) && (Spider_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Pavouk'");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Taktika boje: při střetu s pavoukem, je lepší použít delší zbraň, aby se zabránilo pavoučímu kousnutí.");
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				Spider_B3 = TRUE;
			};
		};

		Spider_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
	{
		if(MinecrawlerWarrior_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Válečník důlních červů'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Válečník důlních červů — toto jsou skuteční bojovníci! Jsou silní a vytrvalí. Na tyto podzemní tvory by sám Beliar mohl být pyšný. Pokud Důlní červ překousne člověka na polovinu, pak Válečník důlních červů roztrhne v pohodě šestipalcovou ocelovou tyč na kusy. Jejich tlusté oplátované krunýře je spolehlivě chrání před krátkými a dlouhými zbraněmi. Jejich jedinou slabostí je zranitelnost vůči magii a ohni. Byla by chyba se spoléhat na svou sílu: tyto bytosti jsou velmi agresivní a vyjmečně jsou samy. Než se do nich pustíte 2x si to rozmyslete.");
			AI_Print(concatText);
		}
		else
		{
			if((MinecrawlerWarrior_B1 >= 5) && (MinecrawlerWarrior_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Válečník důlních červů'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Hlavní výhody: vynikající ochrana před meči a zbrani všeho druhu");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Slabina: slabá ochrana proti magii a ohni");
				AI_Print(concatText);
				MinecrawlerWarrior_B2 = TRUE;
			}
			else if((MinecrawlerWarrior_B1 >= 10) && (MinecrawlerWarrior_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Válečník důlních červů'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Taktika boje: je nejlepší použít silná kouzla, pokud je nemáte vylákejte je jedenoho po druhým, a proveďte rychlý útok. Důležité je, aby vás kusadla válečníka nezasáhla: může vás to stát život.");
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				MinecrawlerWarrior_B3 = TRUE;
			};
		};

		MinecrawlerWarrior_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_OREBUG)
	{
		if(OreBug_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Rudný důlní červ'");
			Log_CreateTopic(TOPIC_BEAST_OREBUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OREBUG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_OREBUG,"Jeden z druhů červovitých, které žijí v místech kde se nachází hodně rudných žil. Na rozdíl od svých bratrů mají silnější krunýř, který je pevně chrání před jakýmkoli poškozením, včetně kouzlů a ohně. Jejich velké drápy drtí kameny až na prášek.");
			AI_Print(concatText);
		}
		else
		{
			if((OreBug_B1 >= 10) && (OreBug_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Rudný důlní červ'");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Hlavní výhody: vynikající ochrana před jakýmkoliv poškozením");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Slabina: - neni -");
				AI_Print(concatText);
				OreBug_B2 = TRUE;
			}
			else if((OreBug_B1 >= 20) && (OreBug_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Rudný důlní červ'");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Taktika boje: musíte se s nimi vypořadat po svém atak je poslat do jiného světa. Pokud nejste opatrní, zašlou tam vás bez nějakých větších potíží.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				OreBug_B3 = TRUE;
			};
		};

		OreBug_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
	{
		if(Molerat_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Krysokrt'");
			Log_CreateTopic(TOPIC_BEAST_MOLERAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MOLERAT,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MOLERAT,"Kříženec mezi krtkem a krysou, který vyrostl na obrovskou velikost. Pokrytá holou růžovou kůží je potvora vybavena dvojitou sadou ostrých zubů, volně umístěnými v obrovské, téměř kruhové čelisti. Krysokrti mojí rádi suché a prostorné jeskyně, ve kterých roste mnoho jedlých hub. Houby ale nejí, není to býložravec. Pokud vejdete na jeho území, může vás pěkně pokousat. Je pravda, že Krysokrt nerad útočí, vyčká jestli neopustíte jeho teritorium, a jestli ne - napadne vás.");
			AI_Print(concatText);
		}
		else
		{
			if((Molerat_B1 >= 10) && (Molerat_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Krysokrt'");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Hlavní výhody: - nejsou -");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Slabina: Má velmi slabou obranu proti zbraním na blízko i proti magii a ohni");
				AI_Print(concatText);
				Molerat_B2 = TRUE;
			}
			else if((Molerat_B1 >= 20) && (Molerat_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Krysokrt'");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Taktika boje: Krysokrti jsou nebezpeční pouze pro zelenáče a amatéry, zkušenější bojovník je rozseká na cimpr campr.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Molerat_B3 = TRUE;
			};
		};

		Molerat_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		if(Skeleton_Mage_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kostlivý mág'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_MAGE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Pokud se zkušený válečník stane po smrti kostlivcem, pak lidští mágové jsou Kostlivý mágové. Stejně jako v životě, tak po smrti Kostlivý mágové tvoří jakousi strukturu posmrtného života - řídí ho, bojují po boku kostlivců a pomáhájí jim. Umí vyvolat nové kostlivce. Až dosud není jasné, kde takové bytosti berou energii k existenci.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Mage_B1 >= 5) && (Skeleton_Mage_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kostlivý mág'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Hlavní výhody: vynikající ochrana před skoro všemi druhy zbraní");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Slabina: menší obrana proti ohni");
				AI_Print(concatText);
				Skeleton_Mage_B2 = TRUE;
			}
			else if((Skeleton_Mage_B1 >= 10) && (Skeleton_Mage_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kostlivý mág'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Taktika boje: stejně jako všem koslivcům, drtivé zbraně mu způsobí vetší škody než sečné. Stejně jako na všechny kostlivce je ohnivé kouzlo dobrá volba.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Skeleton_Mage_B3 = TRUE;
			};
		};

		Skeleton_Mage_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		if(StoneGolem_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kamenný golem'");
			Log_CreateTopic(TOPIC_BEAST_STONEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Kamenný golem — bytosti vytvořené magií. Vyskytují velmi málo a jen na několika místech v Khorinisu, kde působí síla magie s kameny vrcholky hor. Seskupují je do sebe a vytváří tak nejzvlášnější stvoření na světě. Tyto kamenné bytosti neznají bolest, strach, pocit únavy a mají velkou sílu a obratnost. Pronásledují svou kořist až do konce boje. Jsou odolní vůči mečům, sekyrám, šípům a magii. Porazit je lze pouze těžkým kladivem nebo podobnou zbraní, která dokáže zničit kámen, který tvoří základ kamenných golemů.");
			AI_Print(concatText);
		}
		else
		{
			if((StoneGolem_B1 >= 5) && (StoneGolem_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenný golem'");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Hlavní výhody: vynikající ochrana před většinou druhů zbraní a magie");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Slabina: Má velmi malou ochranu před tupými zbraněmi");
				AI_Print(concatText);
				StoneGolem_B2 = TRUE;
			}
			else if((StoneGolem_B1 >= 10) && (StoneGolem_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kamenný golem'");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Taktika boje: jen těžká kamenná kladiva nebo jiná kladiva mohou rozbít šutry, které tvoří základ kamenných golemů.");
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				StoneGolem_B3 = TRUE;
			};
		};

		StoneGolem_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) || (Beast.aivar[AIV_MM_REAL_ID] == ID_DESERTSHARK))
	{
		if(Swampshark_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Močálový žralok'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPSHARK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPSHARK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Jen těžko lze zařadit tyto obrovská zvířata do skupiny živých bytostí, není jasné jak jejich tělo funkuje. S největší pravděpodobností jsou to obojživelníci, i když se mohou rovnat i hadům. Močálový žralok jak tušíte, žije výhradně jen v bažinách v mělké vodě, kterou prohřívá slunce. Krmí se tím, co se v bažině obvykle nachází, pravděpodobně - filtrují vodu a bahno při hledání živin, malých rostlin a živočiců.");
			AI_Print(concatText);
		}
		else
		{
			if((Swampshark_B1 >= 5) && (Swampshark_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Močálový žralok'");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Hlavní výhody: vynikající ochrana před zbraněmi");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Slabiny: slabá obrana proti magii a ohni");
				AI_Print(concatText);
				Swampshark_B2 = TRUE;
			}
			else if((Swampshark_B1 >= 10) && (Swampshark_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Močálový žralok'");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Taktika boje: jsou těžšímy protivníky, nejsou rychlý, ale nezbavíte se jich, jako smrt pronásledují svou oběť co jim síly stačí. Když uvidíte, že k vám blíží Močálový žralok, je lepší, abyste neriskovali - nechte je od sebe co nejdál. Pevné pláty překrývající celé jejich dlouhé tělo jsou tvrdé a jen válečník s velkou silou, vyzbrojený silným ostrým mečem, jim dokáže proniknout. Šípy a šipky je nepoškodí a nemá smysl pokoušet se ustřílet je. Není jednoduché je zasáhnout i s kouzlem, ale možné to je; nemají moc slabin.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Swampshark_B3 = TRUE;
			};
		};

		Swampshark_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL)
	{
		if(Troll_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Trol'");
			Log_CreateTopic(TOPIC_BEAST_TROLL,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_TROLL,"Trol — Největší a nejpomaleji se pohybující zvíře v Khorinisu, jsou velcí už jako mláďata, v dospělosti dosahují gigantických rozměrů. Trol je velmi těžký nepřítel, který není až tak silný a obratný, ale jeho ochrana a stabilita je smrtící. Je schopen vás svoji pěstí odhodit. Nemůže být zabit z luku nebo kuše - šípy a šipky se do něj jen zapíchnou a zůstanou husté kůži ve vrstvě tuku. Má téměř absolutní ochranu proti kouzlům, zraní ho jen ta nejsilnější.");
			AI_Print(concatText);
		}
		else
		{
			if((Troll_B1 >= 5) && (Troll_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Trol'");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Hlavní výhody: má neuvěřitelnou ráznou sílu, vynikající obranu téměř proti jakékoli zbrani");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Slabina: příliš pomalá rychlost jeho útoku");
				AI_Print(concatText);
				Troll_B2 = TRUE;
			}
			else if((Troll_B1 >= 10) && (Troll_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Trol'");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Taktika boje: trolové jsou velmi pomalí, pokud zaútočí, aby vám dal ránu, budete mít dost času se jí vyhnout a ještě ho přitom zranit. Nejlepší je, se dostat za jeho záda a udeřit ho dřív než se otočí. Až se otočí, zopakujte protiútok. Důležité je vyhnout se jeho ráně, ta se pro vás může snadno stát smrtící.");
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				Troll_B3 = TRUE;
			};
		};

		Troll_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_OGRE)
	{
		if(Ogre_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Zlobr'");
			Log_CreateTopic(TOPIC_BEAST_OGRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OGRE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_OGRE,"Zlobři se většinou nacházejí v lese a obývají jeskyně. Zlobři se zřídka vyskytují samy, ale i samotný zlobr je nebezpečný, protože jeho rány jsou bolestivé a přesné.");
			AI_Print(concatText);
		}
		else
		{
			if((Ogre_B1 >= 5) && (Ogre_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Zlobr'");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Hlavní výhody: vysoká odolnost před poškozením, používá silnou zbraň a má vysoké zdraví");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Slabina: - není -");
				AI_Print(concatText);
				Ogre_B2 = TRUE;
			}
			else if((Ogre_B1 >= 10) && (Ogre_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Zlobr'");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Taktika boje: dobrý nápad je zaútočit na něj dlouhým mečem nebo ho ustřílet z dálky");
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Ogre_B3 = TRUE;
			};
		};

		Ogre_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK_CAVE) || (Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK_ICE))
	{
		if(Troll_Black_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Černý trol'");
			Log_CreateTopic(TOPIC_BEAST_TROLL_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL_BLACK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Černý trol - je nejsilnější ze všech živých tvorů! Jeho vzhled může vhánět strach i pro nejodvážnější lovce. Na rozdíl od běžného trola je jeho barva světle černá a odstíny jsou šedé. Černí trolové jsou větší, silnější a děsivější než normální trolové. Jejich ruce jsou jako obrovská kladiva, které mohou rozdrtit nepřítele na jedninou silnou ránu. Jejich hlava s tlamou plnou obrovských zubů a jasných bílých očí je pozoruhodná. Na hlavě má dva velké rohy. Černí trolové žijí jednotlivě ve skalnatém terénu s několika stromy které se kolem nich rostou. Objevují se u jeskyň, ve kterých často chrání cenné poklady. Jsou na vrcholu potravinového řetězce, je nejlepší predátor ze všech, jí všechno, má na to čas, z jeho pařátů nic neunikne. Nemá přirozené nepřátele.");
			AI_Print(concatText);
		}
		else
		{
			if((Troll_Black_B1 >= 3) && (Troll_Black_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý trol'");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Hlavní výhody: má neuvěřitelnou ráznou sílu, vynikající ochranu proti jakékoli zbrani, kouzlu i ohni");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Slabina: příliš pomalá rychlost jeho útoku");
				AI_Print(concatText);
				Troll_Black_B2 = TRUE;
			}
			else if((Troll_Black_B1 >= 5) && (Troll_Black_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý trol'");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Taktika boje: trolové jsou velmi pomalí, pokud zaútočí, aby vám dal ránu, budete mít dost času se jí vyhnout a ještě ho přitom zranit. Nejlepší je, abyste se dostal za jeho záda a udeřil ho než se otočí. A až se otočí,zopakujte protiútok.");
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				Troll_Black_B3 = TRUE;
			};
		};

		Troll_Black_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_WARG)
	{
		if(Warg_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Warg'");
			Log_CreateTopic(TOPIC_BEAST_WARG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARG,"Warg - zvíře s tmavými chlupy, silné a bezsoucitu. Snadno se pozná jasně černými chlupy a má tmavě červený oči. Wargové žijí v hustým lese, v blízkosti bažin a jeskyní. Když nemají v blízkosti co lovit opuští les a jdou na lov mimo své území. Stejně jako většina predátorů, v jejich stravě figuruje hlavně maso. Vlci jsou jejich obvyklá kořist. Wargové se zdržují ve smečkách o několika jedinců. Mezi obyvateli Khorinisu jsou wargové dosti známí kvůli jejich agresivitě, jakmile spatří člověka, do posledni kapky krve ho zežere. Často jsou ochočeny skřety, kteří je používají jako hlídací psy.");
			AI_Print(concatText);
		}
		else
		{
			if((Warg_B1 >= 10) && (Warg_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Warg'");
				Log_AddEntry(TOPIC_BEAST_WARG,"Hlavní výhody: rychle běží, má vynikající ochranu poti zbraním, málo kdy jsou samy a skoro vždycky se nachází ve smečce");
				Log_AddEntry(TOPIC_BEAST_WARG,"Slabina: slabá ochrana proti magii a ohni");
				AI_Print(concatText);
				Warg_B2 = TRUE;
			}
			else if((Warg_B1 >= 20) && (Warg_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Warg'");
				Log_AddEntry(TOPIC_BEAST_WARG,"Taktika boje: vylákejte ze smečky jednoho warga zabíjte ho a potom zase dalšího, atak dále");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Warg_B3 = TRUE;
			};
		};

		Warg_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		if(Skeleton_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Kostlivec'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON,"Kostlivec — jsou ostatky lidí, kteří byli pohřbeni na prokletém místě nebo je po smrti nikdo neočistil od zla. Nemůžou být považování pozůtatky původní osoby, protože z mysli clověka nezůstalo v těchto hromadách kostí vůbec nic. Přestotu tu mají nějaké své poslání. Samozřejmě vtom má prsty temná magie od Beliara. To on je vytahuje z hrobů aby mu sloužily. V jejich kulaté, třpitící se na slunci lebce mají jedinou myšlenku: zabít každého, kdo není nemrtvý - a přeněst tak dalšího vojáka na svou stranu.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_B1 >= 15) && (Skeleton_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kostlivec'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Hlavní výhody: mají silný měč skterým umí slušně zacházet, mají i zbroj, naprostou imunitu vůči sečným zbraním, šípům a šipek");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Slabina: slabá ochrana proti drtivé zbrani");
				AI_Print(concatText);
				Skeleton_B2 = TRUE;
			}
			else if((Skeleton_B1 >= 30) && (Skeleton_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Kostlivec'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Taktika boje: existuje několik triků, jak s ním vypořádat: šipky je nezraní a kouzla je dostatečně nepoškodí, ale drtivé zbraně jako kladivo nebo palice mu způsobí destruktivní poškození narozdíl třeba od mečů a sekyr.");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Skeleton_B3 = TRUE;
			};
		};

		Skeleton_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)
	{
		if(OrcWarrior_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Skřetí válečník'");
			Log_CreateTopic(TOPIC_BEAST_ORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Skřeti — inteligentní rasa Khorinisu a jediná schopná se srovnávat s lidmi a lidskou kulturou. Mnozí věří, že skřeti, na rozdíl od lidí, zplodil Beliar, ale tento názor není až tak pravdivý. Samozřejmě, že je logické si to myslet. Pokud lidi stvořil Innos, Skřeti přišli z vůle Temného boha, ale neexistuje důkaz že tomu tak je a původ skřetů - je to otázka jejíž odpoveď je tisíce let nevysvětlena. Skřetí válečník je nejdůležitějsí a nejčatější bojovník za Skřety. Dobře vědí co dělají, jejich zbroj v boji se může rovnat té lidské. Při střetu může mít problém i vycvičený válečnik, avšak amatéra čeká okamžitá smrt. Většinou útočí stylem - jedeme všichni na jednoho - se skupinkou tří až pěti skřetů to nebudete mít nikdy lehké.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcWarrior_B1 >= 15) && (OrcWarrior_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Skřetí válečník'");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Hlavní výhody: mají výborné útočné zbraně, nosí zbroj, jsou inteligentní, útočí ve skupinách");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Slabina: slabší obrana proti magii a ohni");
				AI_Print(concatText);
				OrcWarrior_B2 = TRUE;
			}
			else if((OrcWarrior_B1 >= 30) && (OrcWarrior_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Skřetí válečník'");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Taktika boje: největší slabost mají vůči šipům a magii, ale budete muset použít silnější kouzlo, slabé ho jen rozzuří, ale neublíží mu.");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				OrcWarrior_B3 = TRUE;
			};
		};

		OrcWarrior_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD)
	{
		if(Skeleton_Lord_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Temný rytíř'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Jeskyně, zahalené do tmy starověké kletby, pusté rašeliniště, starověká místa bitev, neprodyšný prales u prostřed lesů, a všude okolo kde se dějí děsivé věci. Existuje mnoho míst, kde se můžete setkat s Temným rytířem, jeto bývalý a statečný válečník, který se po smrti proměnil v monstrum, které nezná slitování. I když je možné o nich říkat že jsou ‚po smrti? Koneckonců, jejich tělo je dávno mrtvé a duše ho dávno opustila, tyto pozůstatky jsou však prokleté na základě temné magie. Toto je věc cti pro každého vojáka - připravit takové bytosti, oto poslední co znich zbylo a roprášit zbytky tohoto stvoření do větru. I když je to velmi náročný úkol! Koneckonců, toto je elita posmrtného života");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Lord_B1 >= 10) && (Skeleton_Lord_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Temný rytíř'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Hlavní výhody: dobře ovládají zbraně, mají silné zbroje, totální odolnost vůči sečné zbrani, šípů a šipek, dobrá ochrana před magií a ohni");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Slabina: - není -");
				AI_Print(concatText);
				Skeleton_Lord_B2 = TRUE;
			}
			else if((Skeleton_Lord_B1 >= 20) && (Skeleton_Lord_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Temný rytíř'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Taktika boje: budete potřebovat všechny své síly a schopnosti porazit tohoto skutečně mrtvého nepřítele.");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Skeleton_Lord_B3 = TRUE;
			};
		};

		Skeleton_Lord_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		if(Skeleton_Priest_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Prokletý kněz'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_PRIEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_PRIEST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Prokletý kněz - je extrémně nebezpečným soupeřem, používá útočné kouzlo na dálku a dobře využívá svoji hůl v boji. Navíc každý kontakt s ním způsobí ohromnou bolest, protože je obklopen ochrannou aurou prokletí!");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Priest_B1 >= 5) && (Skeleton_Priest_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Prokletý kněz'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Hlavní výhody: vyborně ovládá zbraně a kouzla, je nezranitelný proti sečné zbrani, šípů a šipkám, ma slušnou ochranu před magií");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Slabina: - není -");
				AI_Print(concatText);
				Skeleton_Priest_B2 = TRUE;
			}
			else if((Skeleton_Priest_B1 >= 10) && (Skeleton_Priest_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Prokletý kněz'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Taktika boje: nejlepší je použít silné kouzlo nebo oheň");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Skeleton_Priest_B3 = TRUE;
			};
		};

		Skeleton_Priest_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DARKGUARD)
	{
		if(DarkGuard_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Démonikon'");
			Log_CreateTopic(TOPIC_BEAST_DARKGUARD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DARKGUARD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Démonikon — silný démon z jiné dimenze, vytvořil ho Beliar, nikdy se neměl v Khorinisu vyskytnout.");
			AI_Print(concatText);
		}
		else
		{
			if((DarkGuard_B1 >= 5) && (DarkGuard_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Démonikon'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Hlavní výhody: rychlý a velmi silný útok, dokonalá ochrana proti všem typům poškození");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Slabiny: - nejsou -");
				AI_Print(concatText);
				DarkGuard_B2 = TRUE;
			}
			else if((DarkGuard_B1 >= 10) && (DarkGuard_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Démonikon'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Taktika boje: v boji s tímto typem démonů je nejlepší použít delší zbraň, abyste se udrželi daleko od jeho ostrých pařátů.");
				AI_Print(concatText);
				DarkGuard_B3 = TRUE;
			};
		};

		DarkGuard_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	{
		if(Waran_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Ještěr'");
			Log_CreateTopic(TOPIC_BEAST_WARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARAN,"Ještěr — další z obrovských plazů, mají rádi teplej písek a žár slunce. Nejčastěji se nacházejí na písečných plážích poblíž vodních úkazů - jako každý plaz, potřebují teplo, světlo a vodu, osídlují hlavně místa, která jsou dobře vyhřátá v noci a nejsou příliš studená. Jsou to masožravci a zjevně považují člověka za nejlepší kořist ze všech, které existují, takže bude lepší, abyste se k nim nepřibližovaly. Ale jsou to spíše průměrní predátoři. Je snadné je zabít, na rozdíl od jejich ohnivých bratrů.");
			AI_Print(concatText);
		}
		else
		{
			if((Waran_B1 >= 10) && (Waran_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ještěr'");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Hlavní výhody: dobrá ochrana před zbraněmi na blízko");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Slabina: malá obrana proti střelám, magii a ohni");
				AI_Print(concatText);
				Waran_B2 = TRUE;
			}
			else if((Waran_B1 >= 20) && (Waran_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Ještěr'");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Taktika boje: je snadné je zabít, na rozdíl od jejich ohnivých kamarádů. Hlavní věc je se nenechat pokousat, a to ostatní je jen otázkou vaší techniky.");
				AI_Print(concatText);
				Waran_B3 = TRUE;
			};
		};

		Waran_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		if(OrcElite_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Černý skřetí válečník'");
			Log_CreateTopic(TOPIC_BEAST_ORCELITE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCELITE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCELITE,"Černý skřetí válečník - elitní vrchol nepřátelských válečníků. Jsou mnohem silnější a odolnější než obyčejní skřeti, jsou dokonale vyzbrojeni zbraněmi. Nosí těžké skřetí zbroje a velí společnosti skřetů.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcElite_B1 >= 10) && (OrcElite_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý skřetí válečník'");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Hlavní výhody: jsou hodně silní, mají vynikající ochranu před jakékoli zbrani, je inteligentní a má dokonale silné zbraně na blízko");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Slabina: slabší ochrana proti ohni a magii");
				AI_Print(concatText);
				OrcElite_B2 = TRUE;
			}
			else if((OrcElite_B1 >= 20) && (OrcElite_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Černý skřetí válečník'");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Taktika boje: v boji jsou velmi dobří a je opravdu obtížné porazit je. Jen silný hrdina s kvalitním mečem může zdolat jeho pevnou zbroj");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				OrcElite_B3 = TRUE;
			};
		};

		OrcElite_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(OrcShaman_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Skřetí šaman'");
			Log_CreateTopic(TOPIC_BEAST_ORCSHAMAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCSHAMAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Magie je jen jedna a skřeti ve svých chrámech používají stejné techniky a rituály jako lidé v klášterech a laboratořích. Lidé, kteří jsou schopni ovládat magii, se nazývají mágy. Skřeti, jsou součastí čtyř složek tohoto světa, jeden znich jsou šamani. Šamani nebo-li synové duchů, aspoň tedy v řeči skřetů, se starají o kulturu a řád Skřetů. V tomto jsou skřeti jako lidé. Když v zemi lidí vládne král, mágové hrají velkou roli při jeho rozhodování a činech. U skřetů je to tak, že pokud s někým jejich šaman nesouhlasí, tak se ho neptá a během chvíle ho zpopelní. Obě skupiny mágů tedy mají velký důraz na rozhudnítí svého vedení.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcShaman_B1 >= 10) && (OrcShaman_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Skřetí šaman'");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Hlavní výhody: schopnost používat ohnivá kouzla");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Slabina: slabá obrana proti dlouhým typu zbraní");
				AI_Print(concatText);
				OrcShaman_B2 = TRUE;
			}
			else if((OrcShaman_B1 >= 20) && (OrcShaman_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Skřetí šaman'");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Taktika boje: Zde jsou dvě možnosti: buď se kryjete atím se vyhýbáte se jejich ohnivým koulím, do té doby než se kněmu dostanete a rozdáte si to s ním tváří v tvář. Další možnost je ho roztřílet lukem nebo kuší, dejte pozor ale na jejich přesné ohnivé koule. Šamani jsou docela odolní vůči magií - jen ohnivá kouzla jim můžou způsobit nějakou menší škodu.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				OrcShaman_B3 = TRUE;
			};
		};

		OrcShaman_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR) || (Beast.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCSHAMAN))
	{
		if(UndeadOrcWarrior_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Nemrtvý skřet'");
			Log_CreateTopic(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Pokud se ti nejlepší válečníci - usmrceni lidé promění v kostlivce, nebojácní válečníci skřetů, kteří zemřou se někdy stanou nesmrtelnými válečníky ve formě nemrtvých. Jsou pořád ve střehu, vždy připraveni zničit vetřelce, ani na minutu nezamouří oči a na oplátku nechtějí nic. Vůbec nic...");
			AI_Print(concatText);
		}
		else
		{
			if((UndeadOrcWarrior_B1 >= 5) && (UndeadOrcWarrior_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Nemrtvý skřet'");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Hlavní výhody: obrovská síla, vyborná odolnost vůči jakékoli zbraní, inteligentní, dokonale ovládá zbraně na blízko");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Slabina: slabší ochrana proti ohni a magii");
				AI_Print(concatText);
				UndeadOrcWarrior_B2 = TRUE;
			}
			else if((UndeadOrcWarrior_B1 >= 10) && (UndeadOrcWarrior_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Nemrtvý skřet'");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Taktika boje: je to tuhý nepřítel a boj s ním bude zvlášt obtížný.");
				AI_Print(concatText);
				UndeadOrcWarrior_B3 = TRUE;
			};
		};

		UndeadOrcWarrior_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SANDGOLEM)
	{
		if(SandGolem_B1 == FALSE)
		{
			concatText = "Přidán záznam do bestiáře - '";
			concatText = ConcatStrings(concatText,"Písečná smršť'");
			Log_CreateTopic(TOPIC_BEAST_SANDGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SANDGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Je to směs písku a větru, vytvořené magií z tohoto světa. Někdy je nejde odlišit od malé písečné bouře, ale běda těm, kteří takovou chybu dělají. Trest bude následovat okamžitě...");
			AI_Print(concatText);
		}
		else
		{
			if((SandGolem_B1 >= 2) && (SandGolem_B2 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Písečná smršť'");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Hlavní výhody: jsou imunní vůči jakémukoli fyzickému poškození");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Slabiny: slabší ochrana vůči ohni a magii");
				AI_Print(concatText);
				SandGolem_B2 = TRUE;
			}
			else if((SandGolem_B1 >= 3) && (SandGolem_B3 == FALSE))
			{
				concatText = "Přidán záznam do bestiáře - '";
				concatText = ConcatStrings(concatText,"Písečná smršť'");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Taktika boje: pokud jste mág, máte štěstí. V pokud ne, je čas si udělat zásobu kozelných svitků. Bez nich nemůžete tuto bytost porazit.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				SandGolem_B3 = TRUE;
			};
		};

		SandGolem_B1 += 1;	
	};
};

func void b_givebonusforelitemonster(var int bunusho6)
{
	var string concattextbonus;

	hero.lp = hero.lp + bunusho6;
	concattextbonus = ConcatStrings(PRINT_BONUSLP_2,IntToString(bunusho6));
	concattextbonus = ConcatStrings(concattextbonus,PRINT_BONUSLP_8);
	AI_Print(PRINT_BONUSLP_1);
	AI_Print(concattextbonus);
	Snd_Play("CS_BOSSKILL");
};

func void ZS_Dead()
{
	var C_Npc outter;
	var C_Npc her;
	var C_Npc HD01;
	var C_Npc HD02;
	var C_Npc HD03;
	var C_Npc HaniarD;
	var C_Npc CorGalomDemon;
	var int skillbonus;
	var string concatText;
	var string concatexttext;
	var int permvaluexp;
	var int randvaluexp;
	var int randindexstrmonster;
	var int bonuslpgivehero;
	var C_Item otherweap;
	var int DayGonezStop;
	var int RanSumm;
	
	self.aivar[AIV_MM_RoamEnd] = FALSE;
	Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
	Ext_RemoveFromSlot(self,"BIP01 L HAND");
	Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre))
	{
		Snd_Play("OGRE_DIE");
	};
	if(self.guild == GIL_DRAGON)
	{
		Snd_Play("DRAGON_WRATH_01");
	};
	if(self.guild <= GIL_SEPERATOR_HUM)
	{
		self.bodymass = FALSE;
	};
	if((Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroTRANS == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		B_LogBeast(self);
		B_RuneProcCheck(self,other);
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE)
	{
		Npc_RemoveInvItems(self,ItMi_GoblinRune,Npc_HasItems(self,ItMi_GoblinRune));
		Npc_RemoveInvItems(self,ItMw_1h_Gobbo_Hammer,Npc_HasItems(self,ItMw_1h_Gobbo_Hammer));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GOBBO_BLACK_UNIQ))
	{
		Npc_RemoveInvItems(self,ItMw_1H_GoblinTotem,Npc_HasItems(self,ItMw_1H_GoblinTotem));
	};
	if(Npc_HasItems(self,ItMw_2H_Axe_L_01) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		Npc_RemoveInvItems(self,ITMW_2H_DOOMSWORD_PreElite,Npc_HasItems(self,ITMW_2H_DOOMSWORD_PreElite));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE_OM)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(self.guild == GIL_ZOMBIE)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon,Npc_HasItems(self,ItMw_DS_MonWeapon));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_ExElite) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(self,ItMw_DS_MonWeapon_ExElite));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_Elite) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_Elite,Npc_HasItems(self,ItMw_DS_MonWeapon_Elite));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_Med) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_Med,Npc_HasItems(self,ItMw_DS_MonWeapon_Med));
	};
	if(Npc_HasItems(self,ItLsFireTorch) >= 1)
	{
		Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
	};
	if(Npc_HasItems(self,ItRw_Ass_2x2) >= 1)
	{
		Npc_RemoveInvItems(self,ItRw_Ass_2x2,Npc_HasItems(self,ItRw_Ass_2x2));
	};
	if(Npc_HasItems(self,ItMw_1h_Sld_Sword) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
	};

	otherweap = Npc_GetReadiedWeapon(other);

	if(Hlp_IsItem(otherweap,ItMW_Addon_Stab01) == TRUE)
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	}
	else if((Hlp_IsItem(otherweap,itmw_beliarsuperweapon_2h) == TRUE) || (Hlp_IsItem(otherweap,itmw_beliarsuperweapon_1h) == TRUE) || (Hlp_IsItem(otherweap,ItMW_Addon_Stab02) == TRUE))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",self,self,0,0,0,FALSE);
	}
	else if(Hlp_IsItem(otherweap,ItMW_Addon_Stab03) == TRUE)
	{
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,self,0,0,0,FALSE);
	}
	else if(Hlp_IsItem(otherweap,ItMW_Addon_Stab04) == TRUE)
	{
		Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",self,self,0,0,0,FALSE);
	};
	if(Npc_IsPlayer(other) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(other);
	};
	if((C_NpcIsUndead(self) == FALSE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (self.guild != GIL_Giant_Rat) && (self.guild != GIL_BLOODFLY) && (self.guild != GIL_WARAN) && (self.guild != GIL_MINECRAWLER) && (self.guild != GIL_MEATBUG) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ghost_senyak_demon)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(senyak_demon)) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		if((MoraUlartuIsOn[1] == TRUE) && (self.aivar[89] == FALSE))
		{
			CreateInvItems(self,ItMi_StoneSoul,1);
			self.aivar[89] = TRUE;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1077_Addon_Bandit)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_709_Rethon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1070_Addon_Paul)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_315_Kasernenwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_453_Buerger)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1095_Addon_Crimson)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_714_Jan)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_314_Mortis)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8013_joru)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8009_viran)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet_DI)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_809_bennet_li)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_412_Harad)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4106_Dobar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4107_Parlaf)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4100_Brutus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_457_Brian)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1099_Addon_Huno)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xbs_7513_darrion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_908_Hodges)))
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
		Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
		Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if((KreolIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)))
	{
		KreolIsDead = TRUE;
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_InsertNpc(skeleton_kreol_04,"FP_ROAM_DG_BELIAR_01");
		Wld_InsertNpc(skeleton_kreol_01,"FP_ROAM_DG_BELIAR_02");
		Wld_InsertNpc(skeleton_kreol_02,"FP_ROAM_DG_GUARD");
		Wld_InsertNpc(skeleton_kreol_01,"DG_MAGE");
		Wld_InsertNpc(skeleton_kreol_01,"OW_FOGDUNGEON_12");
		Wld_InsertNpc(skeleton_kreol_03,"OW_FOGDUNGEON_13");
		Wld_InsertNpc(skeleton_kreol_01,"DG_MAGE_GUARD_02");
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,Lesser_Skeleton,1,500);
		Wld_SpawnNpcRange(hero,Skeleton,1,500);

		if((DO_KnowAboutDO == FALSE) && (MIS_DarkOrden == LOG_Running))
		{
			MIS_DarkOrden = LOG_Failed;
			Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_OBSOLETE);
		};
		if(MIS_INNOSWILL == LOG_Running)
		{
			B_LogEntry(TOPIC_INNOSWILL,"Tak tohle byl poslední posel Beliara, o kterém vím. Splnil jsem tedy úkol od Innose?");
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE) && (Npc_GetDistToNpc(self,other) <= 500))
	{
		POISONED = TRUE;
	};
	if(self.aivar[93] == FALSE)
	{
		self.aivar[AIV_RANSACKED] = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		self.mission[4] = 4;
	};

	B_StopLookAt(self);
	AI_StopPointAt(self);

	if((self.aivar[AIV_VictoryXPGiven] == FALSE) && (Npc_IsPlayer(self) == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		//--------schetchiki-------------------------

		if((self.guild >= 24) && (self.level > 0))
		{
			MonsterKilled += 1;
		};
		if((self.guild <= GIL_SEPERATOR_HUM) && (self.level > 0) && (self.aivar[93] == FALSE))
		{
			PeopleKilled += 1;
		};
		if((InnosBonus == FALSE) && ((self.guild == GIL_SKELETON) || (self.guild == GIL_DEMON)))
		{
			InnosBonusCount += 1;
		};
		if((BeliarBonus == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.guild != GIL_DMT) && (CurrentLevel != PRIORATWORLD_ZEN) && (self.aivar[93] == FALSE))
		{
			BeliarBonusCount += 1;
		};
		if((BeliarBonus == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.guild != GIL_BDT) && (CurrentLevel == PRIORATWORLD_ZEN) && (self.aivar[93] == FALSE))
		{
			BeliarBonusCount += 1;
		};
		if((self.aivar[93] == FALSE) && ((self.npcType == NPCTYPE_PALMORA) || (self.guild == GIL_PAL) || (self.guild == GIL_NOV) || (self.guild == GIL_KDF)))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 5;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;

			if(self.npcType == NPCTYPE_PALMORA)
			{
				CountPalmora += 1;
			};
		};
		if((self.aivar[93] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.guild != GIL_BDT) && (self.guild != GIL_DMT))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		};
		if((self.guild == GIL_BDT) && (self.aivar[93] == FALSE) && (CurrentLevel != PRIORATWORLD_ZEN))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 10;
		};
		if((self.guild == GIL_DRAGON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(dragon_black)))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 20;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 20;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 10;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SKELETON_LORD_KELTUZED)))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 5;
		};
		if((C_NpcIsUndead(self) == TRUE) || (self.guild == GIL_DEMON) || (self.guild == GIL_DMT))
		{
			SkelCountKarma = SkelCountKarma + 1;

			if(SkelCountKarma >= 20)
			{
				INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
				SkelCountKarma = FALSE;
			};
		};

		//--------schetchiki-------------------------

		if(self.level > 0)
		{
			if(SBMODE == TRUE)
			{
				permvaluexp = self.level * XP_PER_VICTORY;

				if(BELIARCURSEYOU == TRUE)
				{
					permvaluexp = permvaluexp / 2;
				}
				else if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == TRUE) && (other.guild <= GIL_SEPERATOR_HUM))
				{
					permvaluexp = permvaluexp / 2;
				};
			}
			else
			{
				permvaluexp = self.level * XP_PER_VICTORY;
			};
			if((self.guild == GIL_MEATBUG) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit_02)))
			{
				permvaluexp = 1;
			};

			self.aivar[AIV_VictoryXPGiven] = TRUE;

			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait))
			{
				if(self.aivar[90] == TRUE)
				{
					b_giveplayerxpquiet(permvaluexp);
				}
				else
				{
					B_GivePlayerXP(permvaluexp);
				};
			};
			if(DarkMessianArmorEquipped == TRUE)
			{
				if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
				{
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 2) / 100);

					if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
					{
						hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
			if(WaterRobeBonus == TRUE)
			{
				if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + ((hero.attribute[ATR_MANA_MAX] * 2) / 100);

					if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
					{
						hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
					};
				};
			};
			if(BloodArmorBonus == TRUE)
			{
				if(ATR_STAMINA[0] < ATR_STAMINA_MAX[0] * 10)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] + ((ATR_STAMINA_MAX[0] * 20) / 100);

					if(ATR_STAMINA[0] > ATR_STAMINA_MAX[0] * 10)
					{
						ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
					};
				};
			};
			if(BeliarChosenEquipped == TRUE)
			{
				if(CountBelChos < 2)
				{
					RanSumm = Hlp_Random(100);

					if(RanSumm >= 50)
					{
						if(Npc_IsPlayer(other) && (self.aivar[90] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM))
						{
							CountBelChos += 1;
							Wld_SpawnNpcRange(other,Summoned_Skeleton_Warrior_Chosen,1,500);
						}
						else if(Npc_IsPlayer(other) && (self.aivar[90] == FALSE) && ((self.guild == GIL_ORC) || (self.guild == GIL_SEPERATOR_ORC) || (self.guild == GIL_FRIENDLY_ORC)))
						{
							CountBelChos += 1;
							Wld_SpawnNpcRange(other,Summoned_Skeleton_Orc,1,500);
						};
					};
				};
			};
			if((CraitIsUp == TRUE) && (Npc_GetDistToNpc(Crait,hero) < 2500))
			{
				if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Crait))
				{
					CraitExpLvl = CraitExpLvl + permvaluexp;
				}
				else
				{
					CraitExpLvl = CraitExpLvl + (permvaluexp / 2);
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Dragon))
	{
		if(HeroDragonLook == TRUE)
		{
			Wld_StopEffect("DRAGONLOOK_FX");	
			HeroDragonLook = FALSE;
		};
	};

	//------------------------trigerry------------------------------------------------------------------------------------------

	if((self.aivar[93] == FALSE) && (self.vars[6] == FALSE))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sleeper_Old)) && (SleeperOldIsDead == FALSE) && (SleeperStone == TRUE))
		{
			SleeperOldIsDead = TRUE;

			if(MIS_SleeperBack == LOG_Running)
			{
				MIS_SleeperBack = LOG_Success;
				Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Success);
				B_LogEntry(TOPIC_SleeperBack,"Zabil jsem Spáče! Už nikdy nebude moct tenhle svět ohrozit.");
			};
		};
		if(!C_NpcIsUndead(self) && (self.guild != GIL_ORC) && (self.guild != GIL_DRACONIAN) && (self.guild != GIL_MEATBUG) && (self.guild != GIL_DEMON) && (self.guild != GIL_SWAMPGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM))
		{
			if((self.guild == GIL_Alligator) || (self.guild == GIL_MINECRAWLER) || (self.guild == GIL_WARAN) || (self.guild == GIL_BLOODFLY))
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD1",self,self,0,0,0,FALSE);
			};
		};
		if((self.guild == GIL_Stoneguardian) && (MEETWITHSTONEGUARD == FALSE))
		{
			MEETWITHSTONEGUARD = TRUE;
		};
		if((self.aivar[90] == TRUE) && (self.aivar[95] == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AmasRaf)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AmasSah)))
			{
				if(self.level >= 500)
				{
					bonuslpgivehero = 5;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 300)
				{
					bonuslpgivehero = 4;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 200)
				{
					bonuslpgivehero = 3;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 100)
				{
					bonuslpgivehero = 2;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level > 0)
				{
					bonuslpgivehero = 1;
					b_givebonusforelitemonster(bonuslpgivehero);
				};

				self.aivar[95] = TRUE;
			};
		};
		if((self.guild == GIL_ORC) && (GUARDIANSISDEFEATED == FALSE) && (KAPITELORCATC == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			if(Npc_GetDistToWP(other,"NW_CITY_MERCHANT_PATH_11") <= 32000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					};
				};
			}
			else if(Npc_GetDistToWP(other,"NW_PATH_TO_MONASTERY_09") <= 12000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					};
				};
			}
			else if(Npc_GetDistToWP(other,"NW_BIGFARM_ORC_SAFE") <= 15000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Nevím co se děje. Když jsem napadl skřeta udeřil do mne blesk!");
					};
				};
			};
		};
		if(C_IAmCanyonRazor(self) == TRUE)
		{
			CanyonRazorBodyCount = CanyonRazorBodyCount + 1;

			if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
			{
				B_CountCanyonRazor();
			};
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_ORCBF) && (STOPBIGBATTLE == FALSE))
		{
			ALLBIGFIGHTERSORC = ALLBIGFIGHTERSORC + 1;

			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				IAMKILLORCSBB = IAMKILLORCSBB + 1;
			};
			if(ALLBIGFIGHTERSORC >= 150)
			{
				B_GivePlayerXP(5000);
				STOPBIGBATTLE = TRUE;
				HUMANSWINSBB = TRUE;
				MIS_ORсGREATWAR = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_ORсGREATWAR,LOG_SUCCESS);
				B_LogEntry(TOPIC_ORсGREATWAR,"Vyhráli jsme bitvu - porazili jsme obrovskou armádu skřetů! Teď musíme osvobodit město a zabít skřety v okolí.");
				Wld_SendTrigger("EVT_TRIGGER_ORCMARCH");
				b_changehp(SLD_800_Lee);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
		{
			if(CountBelChos > 0)
			{
				CountBelChos -= 1;
			};
		};
		if((self.aivar[98] == TRUE) && (STOPBIGBATTLE == FALSE))
		{
			ALLBIGFIGHTERSHUMAN = ALLBIGFIGHTERSHUMAN + 1;

			if(ALLBIGFIGHTERSHUMAN >= (OVERALLBIGFIGHTERSHUMAN - HUMANBIGFIGHTERSNODEAD))
			{
				STOPBIGBATTLE = TRUE;
				ORCSWINSBB = TRUE;
				MIS_ORсGREATWAR = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORсGREATWAR);
				Wld_SendTrigger("EVT_TRIGGER_ORCMARCH");
				b_orcsattackfarm();
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog)) && (KILLCLAWREVENGE == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KILLCLAWREVENGE = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog)) && (CLAWISDEAD == FALSE))
		{
			CLAWISDEAD = TRUE;
			if(MIS_RECOVERDOG == LOG_Running)
			{
				MIS_RECOVERDOG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RECOVERDOG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1320_Addon_Greg))
		{
			GREGADWISDEAD = TRUE;
			if(MIS_PIRATENEEDSHIP == LOG_Running)
			{
				MIS_PIRATENEEDSHIP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_PIRATENEEDSHIP);
			};
		};
		if((MIS_HeroOrcJoin == LOG_Running) && (self.guild == GIL_ORC) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			if(ORCRESPECT > 0)
			{
				ORCRESPECT = ORCRESPECT - 1;
				AI_Print("Respekt skřetů - 1");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_119_Assasin))
		{
			GonsalesNWIsDead = TRUE;			
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin))
		{
			GonsalesIsDead = TRUE;			
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1085_Addon_Bloodwyn))
		{
			CreateInvItems(self,ItMi_Addon_Bloodwyn_Kopf,1);
			BLOODWYNISDEAD = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;
		};


		//----------------------okhota za golovami---------------------------------------

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1060_Dexter)) && (DexterIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_DexterHead,1);
			DexterIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;
		    CreateInvItems(self,ItWr_DexTrait,1);
			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Dexter je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1460_Nestor)) && (NestorIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_NestorHead,1);
			NestorIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Nestor, přezdívaný 'Kanibal', je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10620_Bandit_L)) && (KriksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_KriksHead,1);
			KriksIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Kriks, přezdívaný 'Břitva', je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10621_Bandit_L)) && (BartIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_BartHead,1);
			BartIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Bart, přezdívaný 'Skrček', je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10622_Bandit_L)) && (SkironIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_SkironHead,1);
			SkironIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Skiron, přezdívaný 'Řezník', je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10623_Bandit_L)) && (RocksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_RocksHead,1);
			RocksIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Vůdce banditů Roks, přezdívaný 'Čipera', je mrtvý. Za jeho hlavu dostanu zaplaceno.");
			};
		};

		//----------------------okhota za golovami---------------------------------------

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_184_Adept))
		{
			HoakinIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Psicamp))
		{
			DemonPsicampIsDead = TRUE;

			if((MIS_PsicampDemon == LOG_Running) && (Npc_IsDead(ORC_8216_TorDal) == TRUE))
			{
				MIS_PsicampDemon= LOG_Success;
				Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Success);
				B_LogEntry(TOPIC_PsicampDemon,"Démon v bažinách je mrtvý! Jeho smrtí jsem dost pomohl skřetům. nad se něčím odmění.");	
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_127_Osair)) && (OsairIsDead == FALSE))
		{
			OsairIsDead = TRUE;

			if(OsairAttackMe == TRUE)
			{
				NoGonsaHereMe = TRUE;
				B_LogEntry(TOPIC_MasiafStory,"Osair je mrtvý! Takže bratrstvo Masyaf ztratilo dalšího převora. Co na to poví Gonzales?");
			};

			if(HideMeetCamera == TRUE)
			{
				HD01 = Hlp_GetNpc(Haniar_Demon_01);
				HD02 = Hlp_GetNpc(Haniar_Demon_02);
				HD03 = Hlp_GetNpc(Haniar_Demon_03);

				HD01.attribute[ATR_STRENGTH] = 400;
				HD02.attribute[ATR_STRENGTH] = 400;
				HD03.attribute[ATR_STRENGTH] = 400;

				HD01.attribute[ATR_HITPOINTS_MAX] = 4000;
				HD01.attribute[ATR_HITPOINTS] = HD01.attribute[ATR_HITPOINTS_MAX];
				HD02.attribute[ATR_HITPOINTS_MAX] = 4000;
				HD02.attribute[ATR_HITPOINTS] = HD02.attribute[ATR_HITPOINTS_MAX];
				HD03.attribute[ATR_HITPOINTS_MAX] = 4000;	
				HD03.attribute[ATR_HITPOINTS] = HD03.attribute[ATR_HITPOINTS_MAX];
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_137_Adept)) && (MasGiveKeyPri == FALSE))
		{
			CreateInvItems(self,ItKe_Masiaf_Prision,1);
			MasGiveKeyPri = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_125_Tiamant)) && (TiamantIsDead == FALSE))
		{
			TiamantIsDead = TRUE;
			CreateInvItems(self,ItWr_DualFight,1);

			if(MIS_PW_FollowGoldOre == LOG_Success)
			{
				B_StartOtherRoutine(Ass_126_Haniar,"Start");
				B_StartOtherRoutine(Ass_127_Osair,"Start");
				B_StartOtherRoutine(Ass_128_Nrozas,"Start");
				B_StartOtherRoutine(Ass_144_Adept,"Start");
				B_StartOtherRoutine(Ass_145_Adept,"Start");
				B_StartOtherRoutine(Ass_146_Adept,"Start");
				B_StartOtherRoutine(Ass_147_Adept,"Start");
				B_StartOtherRoutine(Ass_148_Adept,"Start");
				B_StartOtherRoutine(Ass_149_Adept,"Start");
				B_StartOtherRoutine(Ass_138_Adept,"Start");
				B_StartOtherRoutine(Ass_139_Adept,"Start");
				B_StartOtherRoutine(Ass_140_Adept,"Start");
				B_StartOtherRoutine(Ass_141_Adept,"Start");
				B_LogEntry(TOPIC_MasiafStory,"Haniar zabil Tiamanta! S prstem v nose. Na to, že Tiamant byl považován za nejlepšího bojovníka bratrstva to je divné!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_186_SLAVEOBSSEK))
		{
			GoldSlave_01_IsDead = TRUE;

			if((GoldSlave_01_IsDead == TRUE) && (GoldSlave_02_IsDead == TRUE) && (GoldOreHelpCome == FALSE))
			{
				OsairInRage = TRUE;

				if(MIS_PW_FollowGoldOre == LOG_Running)
				{
					B_LogEntry(TOPIC_PW_FollowGoldOre,"Všichni otroci jsou mrtví! Osair nebude mít radost");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_387_SLAVEOBSSEK))
		{
			GoldSlave_02_IsDead = TRUE;

			if((GoldSlave_01_IsDead == TRUE) && (GoldSlave_02_IsDead == TRUE) && (GoldOreHelpCome == FALSE))
			{
				OsairInRage = TRUE;

				if(MIS_PW_FollowGoldOre == LOG_Running)
				{
					B_LogEntry(TOPIC_PW_FollowGoldOre,"Všichni otroci jsou mrtví! Osair nebude mít radost.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_129_DeadNrozas))
		{
			//Wld_SendTrigger("EVT_ASS_DEMON_FIRSTLOCK_HIDE");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_7550_GORKAR))
		{
			if((MIS_MissOldFriend == LOG_Running) && (GorKarShowMe == FALSE))
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
				FinishSTLSD = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_858_Bret))
		{
			BretNWIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_857_Darius))
		{
			DariusNWIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_853_Bret))
		{
			BretIsDead = TRUE;

			if((MIS_MissOldFriend == LOG_Running) && (CanTrailOrcCamp == FALSE))
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
				FinishSTLSD = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_CAVE_UNIQ)) && (UturIsDead == FALSE))
		{
			UturIsDead = TRUE;
	
			if(MIS_EvilTroll == LOG_Running)
			{
				B_LogEntry(TOPIC_EvilTroll,"Zabil jsem obrovského jeskynního trola, jak Netbek říkal.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FIREGOLEM_UNIQ)) && (MagolemusIsDead == FALSE))
		{
			MagolemusIsDead = TRUE;
			AI_Print(PRINT_TEMPLETASK_03_DONE);
			B_LogEntry(TOPIC_AdanosCrone,"Innosovo stvoření bylo zničeno...");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1084_Addon_Senyan))
		{
			if(Senyan_Called == TRUE)
			{
				Senyan_Erpressung = LOG_SUCCESS;
				Log_SetTopicStatus(Topic_Addon_Senyan,LOG_SUCCESS);
				B_LogEntry(Topic_Addon_Senyan,"Senyan je mrtvý. Naše spolupráce skončila!");
			}
			else
			{
				Senyan_Erpressung = LOG_FAILED;
				B_LogEntry_Failed(Topic_Addon_Senyan);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_432_Moe))
		{
			MOEISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_989_reinar))
		{
			Npc_RemoveInvItems(self,ItMw_Orkschlaechter,Npc_HasItems(self,ItMw_Orkschlaechter));
			Npc_RemoveInvItems(self,ItMw_Schlachtaxt,Npc_HasItems(self,ItMw_Schlachtaxt));
			Npc_RemoveInvItems(self,ItMw_Sturmbringer,Npc_HasItems(self,ItMw_Sturmbringer));
			Npc_RemoveInvItems(self,ItMw_Berserkeraxt,Npc_HasItems(self,ItMw_Berserkeraxt));
			Npc_RemoveInvItems(self,ItMw_Drachenschneide,Npc_HasItems(self,ItMw_Drachenschneide));
			Npc_RemoveInvItems(self,ItMw_Addon_Betty,Npc_HasItems(self,ItMw_Addon_Betty));
			Npc_RemoveInvItems(self,itmw_2h_urizel,Npc_HasItems(self,itmw_2h_urizel));
			Npc_RemoveInvItems(self,itmw_2h_urizel_nomagic,Npc_HasItems(self,itmw_2h_urizel_nomagic));
			Npc_RemoveInvItems(self,itmw_2h_weltenspalter,Npc_HasItems(self,itmw_2h_weltenspalter));
			Npc_RemoveInvItems(self,itmw_1h_Crest,Npc_HasItems(self,itmw_1h_Crest));
			Npc_RemoveInvItems(self,itmw_scorpionspec,Npc_HasItems(self,itmw_scorpionspec));
			Npc_RemoveInvItems(self,itmw_normardsword,Npc_HasItems(self,itmw_normardsword));
			Npc_RemoveInvItems(self,itmw_2h_dragonmaster,Npc_HasItems(self,itmw_2h_dragonmaster));
			Npc_RemoveInvItems(self,itmw_2h_katana,Npc_HasItems(self,itmw_2h_katana));
			Npc_RemoveInvItems(self,ItMw_Drakesaebel,Npc_HasItems(self,ItMw_Drakesaebel));

			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1357_Addon_Garett))
		{
			Npc_RemoveInvItems(self,ItMw_OldPiratensaebel,Npc_HasItems(self,ItMw_OldPiratensaebel));
			Npc_RemoveInvItems(self,ItMw_Piratensaebel,Npc_HasItems(self,ItMw_Piratensaebel));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_1h_01,Npc_HasItems(self,ItMW_Addon_Hacker_1h_01));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_1h_02,Npc_HasItems(self,ItMW_Addon_Hacker_1h_02));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_2h_01,Npc_HasItems(self,ItMW_Addon_Hacker_2h_01));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_2h_02,Npc_HasItems(self,ItMW_Addon_Hacker_2h_02));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR1hAxe,Npc_HasItems(self,ItMw_Addon_PIR1hAxe));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR1hSword,Npc_HasItems(self,ItMw_Addon_PIR1hSword));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR2hAxe,Npc_HasItems(self,ItMw_Addon_PIR2hAxe));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR2hSword,Npc_HasItems(self,ItMw_Addon_PIR2hSword));
			Npc_RemoveInvItems(self,ItMw_Schiffsaxt,Npc_HasItems(self,ItMw_Schiffsaxt));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8013_joru))
		{
			Npc_RemoveInvItems(self,ItMw_Sense,Npc_HasItems(self,ItMw_Sense));
			Npc_RemoveInvItems(self,ItMw_Nagelkeule,Npc_HasItems(self,ItMw_Nagelkeule));
			Npc_RemoveInvItems(self,ItMw_Nagelkeule2,Npc_HasItems(self,ItMw_Nagelkeule2));
			Npc_RemoveInvItems(self,ItMw_Streitkolben,Npc_HasItems(self,ItMw_Streitkolben));
			Npc_RemoveInvItems(self,ItMW_Addon_Keule_1h_01,Npc_HasItems(self,ItMW_Addon_Keule_1h_01));
			Npc_RemoveInvItems(self,ITMW_1H_MACE_BANDOS_107,Npc_HasItems(self,ITMW_1H_MACE_BANDOS_107));
			Npc_RemoveInvItems(self,ItMw_Zweihaender1,Npc_HasItems(self,ItMw_Zweihaender1));
			Npc_RemoveInvItems(self,ItMw_Zweihaender2,Npc_HasItems(self,ItMw_Zweihaender2));
			Npc_RemoveInvItems(self,ItMw_Zweihaender4,Npc_HasItems(self,ItMw_Zweihaender4));
			Npc_RemoveInvItems(self,ItMw_2H_Claymore,Npc_HasItems(self,ItMw_2H_Claymore));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(tpl_8005_gornakosh))
		{
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_823_Khaled))
		{
			Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword_New,Npc_HasItems(self,ItMw_1h_Sld_Sword_New));
			Npc_RemoveInvItems(self,ItMw_2h_Sld_Sword,Npc_HasItems(self,ItMw_2h_Sld_Sword));
			Npc_RemoveInvItems(self,ItMw_1h_Sld_Axe,Npc_HasItems(self,ItMw_1h_Sld_Axe));
			Npc_RemoveInvItems(self,ItMw_Bartaxt,Npc_HasItems(self,ItMw_Bartaxt));
			Npc_RemoveInvItems(self,ItMw_Doppelaxt,Npc_HasItems(self,ItMw_Doppelaxt));
			Npc_RemoveInvItems(self,ItMw_2h_Sld_Axe,Npc_HasItems(self,ItMw_2h_Sld_Axe));
			Npc_RemoveInvItems(self,ItMw_Streitaxt1,Npc_HasItems(self,ItMw_Streitaxt1));
			Npc_RemoveInvItems(self,ItMw_Streitaxt2,Npc_HasItems(self,ItMw_Streitaxt2));
			Npc_RemoveInvItems(self,ItMw_Streitaxt3,Npc_HasItems(self,ItMw_Streitaxt3));
			Npc_RemoveInvItems(self,ITMW_2H_G3A_ORCAXE_02,Npc_HasItems(self,ITMW_2H_G3A_ORCAXE_02));
			Npc_RemoveInvItems(self,ItMw_Kriegshammer1,Npc_HasItems(self,ItMw_Kriegshammer1));
			Npc_RemoveInvItems(self,ItMw_Kriegshammer2,Npc_HasItems(self,ItMw_Kriegshammer2));
			Npc_RemoveInvItems(self,ItMw_2H_Warhammer,Npc_HasItems(self,ItMw_2H_Warhammer));
			Npc_RemoveInvItems(self,ItRw_Bow_L_01,Npc_HasItems(self,ItRw_Bow_L_01));
			Npc_RemoveInvItems(self,ItRw_Bow_L_03,Npc_HasItems(self,ItRw_Bow_L_03));
			Npc_RemoveInvItems(self,ItRw_Bow_H_02,Npc_HasItems(self,ItRw_Bow_H_02));
			Npc_RemoveInvItems(self,ItRw_Bow_H_04,Npc_HasItems(self,ItRw_Bow_H_04));
			Npc_RemoveInvItems(self,ItRw_Crossbow_M_02,Npc_HasItems(self,ItRw_Crossbow_M_02));
			Npc_RemoveInvItems(self,ItRw_Crossbow_H_02,Npc_HasItems(self,ItRw_Crossbow_H_02));
			Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
			Npc_RemoveInvItems(self,ItBE_Addon_Leather_01,Npc_HasItems(self,ItBE_Addon_Leather_01));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bau_900_Onar))
		{
			if(TELEPORTFRIENDSLOST == TRUE)
			{
				PlayVideo("RET2_BlackScreen.bik");
				ExitSession();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_418_Gritta))
		{
			GRITTAMEDEAD = TRUE;
		};
		if((self.guild == GIL_ORC) && (MIS_KILLTHEMALL == LOG_Running))
		{
			COUNTKILLORCS = COUNTKILLORCS + 1;

			if(COUNTKILLORCS >= 50)
			{
				MIS_KILLTHEMALL = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_SUCCESS);
				B_LogEntry(TOPIC_KILLTHEMALL,"Myslím že jsem zabil dostatek skřetů pro šíření paniky v jejich řadách.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ILARAH))
		{
			Snd_Play("HAOSDEAD");
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
			ALLGUARDIANSNOLEADERISDEAD = TRUE;
			CircleFightIlArah = FALSE;

			if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (STONNOSISDESTOYED == TRUE))
			{
				ALLGUARDIANSKILLED = TRUE;
				GUARDIANSISDEFEATED = TRUE;
				MIS_GUARDIANS = LOG_Success;
				Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Success);
				B_LogEntry(TOPIC_GUARDIANS,"Povedlo se mi porazit všechny Strážce! Teď už pro svět nejsou hrozbou...");

				if(MIS_STRANGETHINGS == LOG_Running)
				{
					MIS_STRANGETHINGS = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS)) && (DemonHaosIsDead == FALSE))
		{
			DemonHaosIsDead = TRUE;
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12971_stonnos))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			STONNOSISDESTOYED = TRUE;
			B_StartOtherRoutine(self,"TOT");
			AI_Teleport(self,"TOT");

			if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (STONNOSISDESTOYED == TRUE))
			{
				ALLGUARDIANSKILLED = TRUE;
				GUARDIANSISDEFEATED = TRUE;

				MIS_GUARDIANS = LOG_Success;
				Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Success);
				B_LogEntry(TOPIC_GUARDIANS,"Povedlo se mi porazit všechny Strážce! Teď už pro svět nejsou hrozbou...");

				if(MIS_STRANGETHINGS == LOG_Running)
				{
					MIS_STRANGETHINGS = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
				};
			};
		};
		if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_299_Sergio)))
		{
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			SERGIOISDEAD = TRUE;
			B_StartOtherRoutine(PAL_299_Sergio,"TOT");
			AI_Teleport(PAL_299_Sergio,"TOT");
			Wld_InsertNpc(skeleton_lord_serdah,Npc_GetNearestWP(hero));
		};
		if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_serdah)))
		{
			B_KillNpc(PAL_299_Sergio);
			SERDAHISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord))
		{
			INUBISISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_121_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_122_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_123_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_124_Adept)))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_121_Adept))
			{
				ADEPT_1_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_122_Adept))
			{
				ADEPT_2_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_123_Adept))
			{
				ADEPT_3_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_124_Adept))
			{
				ADEPT_4_DEAD = TRUE;
			};
			if((ADEPT_1_DEAD == TRUE) && (ADEPT_2_DEAD == TRUE) && (ADEPT_3_DEAD == TRUE) && (ADEPT_4_DEAD == TRUE) && (AssInvasionStop == FALSE))
			{
				AssInvasionStop = TRUE;
				B_LogEntry(TOPIC_PrioratStart ,"Templářům se podařilo odrazit útok na tábor sběračů! Pár mrtvých bylo... Řeknu to Baalu Namibovi.");
			};
		};

		//-------------------epik danzh---------------------------------

		if((PaleCrawlerIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler)))
		{
			PaleCrawlerFight = FALSE;
			PaleCrawlerIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother,"Tahle potvora musí mít něco společného s Ile'Silem. Měl bych mu to říct...");
			};
		};
		if((AraharPlagueIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague)))
		{
			AraharPlagueFight = FALSE;
			AraharPlagueIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother,"Tahle zombie byla nějak silnější. Mám od ní klíč. Měl bych se podívat okolo, jestli ho nemůžu někde použít...");
			};
		};
		if((ShadowGuardOneIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne)))
		{
			ShadowGuardOneIsDead = TRUE;

			if((ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
			{
				ShadowGuardFight = FALSE;

				if(MIS_Miss_Brother == LOG_Running)
				{
					B_LogEntry(TOPIC_Miss_Brother,"Tihle temní strážci tu nejsou jen tak. Vypadá to, že tu něco střeží...");
				};
			};
		};
		if((ShadowGuardTwoIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardTwo)))
		{
			ShadowGuardTwoIsDead = TRUE;

			if((ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
			{
				ShadowGuardFight = FALSE;

				if(MIS_Miss_Brother == LOG_Running)
				{
					B_LogEntry(TOPIC_Miss_Brother,"Tihle temní strážci tu nejsou jen tak. Vypadá to, že tu něco střeží...");
				};
			};
		};
		if((SoulKeeperIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper)))
		{
			SoulKeeperFight = FALSE;
			SoulKeeperIsDead = TRUE;
		};
		if((FiarasIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV)))
		{
			Wld_SendTrigger("EVT_FIRETREE");
			FiarasFight = FALSE;
			FiarasIsDead = TRUE;
		};
		if((EkronIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)))
		{
			Wld_SendTrigger("EVT_ENTERHRAM_TRIGGER");
			Npc_ExchangeRoutine(NONE_1813_Ilesil,"TreeIsDead");
			AI_Teleport(NONE_1813_Ilesil,"WDS_LAVA_CASTLEYARD_01");
			EkronFight = FALSE;
			EkronIsDead = TRUE;
		};
		if((SkelBroDexIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)))
		{
			SkelBroDexIsDead = TRUE;
			SkelBroDexFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
				Wld_PlayEffect("spellFX_Teleport_RING",NONE_1813_Ilesil,NONE_1813_Ilesil,0,0,0,FALSE);
			};
		};
		if((SkelBroStrIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)))
		{
			SkelBroStrIsDead = TRUE;
			SkelBroStrFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
			};
		};
		if((SkelBroMagIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)))
		{
			SkelBroMagIsDead = TRUE;
			SkelBroMagFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_01))
		{
			AraharPlagueSpawn_01 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_02))
		{
			AraharPlagueSpawn_02 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_03))
		{
			AraharPlagueSpawn_03 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_04))
		{
			AraharPlagueSpawn_04 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_05))
		{
			AraharPlagueSpawn_05 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_01))
		{
			SoulKeeperSpawn_01 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_02))
		{
			SoulKeeperSpawn_02 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_03))
		{
			SoulKeeperSpawn_03 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_04))
		{
			SoulKeeperSpawn_04 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_05))
		{
			SoulKeeperSpawn_05 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_06))
		{
			SoulKeeperSpawn_06 = FALSE;
		};
		if((ChelDrakIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)))
		{
			Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
			Wld_SendTrigger("EVT_BOSSMAMAGE_TRIGGER");	
			ChelDrakIsDead = TRUE;
			B_LogEntry(TOPIC_Miss_Brother,"Zabil jsem lorda Chel'Draka. Zdá se, že tu nebyl jen tak. Hlídal tu něco?");
		};
		if((IlesilIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilesil_Evil)))
		{
			Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
			Wld_SendTrigger("EVT_EXITBOSS_TRIGGER");	
			IlesilIsDead = TRUE;
			MIS_Miss_Brother = LOG_Success;
			Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Success);
			B_LogEntry_Quiet(TOPIC_Miss_Brother,"Ile'Sil je mrtev! Nemůže chránit svého bratra. Teď bych měl bych odtud odejít...");	

			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
			{
				Wld_InsertItem(ItAr_BloodRobe,"FP_ITEM_LW_PRIZE_01");
				Wld_InsertItem(ItMw_Staff_Blood,"FP_ITEM_LW_PRIZE_02");
			}
			else
			{
				if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
				{
					Wld_InsertItem(ItAr_BloodArmor,"FP_ITEM_LW_PRIZE_01");

					if(hero.HitChance[NPC_TALENT_2H] > hero.HitChance[NPC_TALENT_1H])
					{
						Wld_InsertItem(ItMw_Sword_Blood,"FP_ITEM_LW_PRIZE_02");
					}
					else
					{
						Wld_InsertItem(ItMw_Axe_Blood,"FP_ITEM_LW_PRIZE_02");
					};
				}
				else
				{
					Wld_InsertItem(ItMw_Speer_Blood,"FP_ITEM_LW_PRIZE_01");
					Wld_InsertItem(ItRw_Bow_Blood,"FP_ITEM_LW_PRIZE_02");
				};
			};
		};

		//------------------lyudi lagerya--------------------------------

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6134_valeran)) && (ValeranIsDead == FALSE))
		{
			ValeranIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4303_Addon_Erol)) && (ErolIsDead == FALSE))
		{
			ErolIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_1117_Straefling)) && (HuntyIsDead == FALSE))
		{
			HuntyIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41111_huntynw)) && (HuntyNWIsDead == FALSE))
		{
			HuntyNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41110_grimesnw)) && (GrimesNWIsDead == FALSE))
		{
			GrimesNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_986_viper)) && (ViperIsDead == FALSE))
		{
			ViperIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4132_Talbin_NW)) && (TalbinNWIsDead == FALSE))
		{
			TalbinNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_984_Niclas)) && (NiclasIsDead == FALSE))
		{
			NiclasIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4301_Addon_Farim)) && (FarimIsDead == FALSE))
		{
			FarimIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_471_Edda)) && (EddaIsDead == FALSE))
		{
			EddaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_360_Miliz)) && (GuardOneIsDead == FALSE))
		{
			GuardOneIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_361_Miliz)) && (GuardTwoIsDead == FALSE))
		{
			GuardTwoIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WolfMIsDead == FALSE))
		{
			WolfMIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8111_Soeldner)) && (GuardThreeIsDead == FALSE))
		{
			GuardThreeIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8112_Soeldner)) && (GuardFourIsDead == FALSE))
		{
			GuardFourIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) && (CarlIsDead == FALSE))
		{
			CarlIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_980_Sagitta)) && (SagittaIsDead == FALSE))
		{
			SagittaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bau_987_snipes)) && (SnipesIsDead == FALSE))
		{
			SnipesIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_438_Alrik)) && (AlrikIsDead == FALSE))
		{
			AlrikIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6132_gayvern)) && (GayvernIsDead == FALSE))
		{
			GayvernIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_41200_Bilgot)) && (BilgotNWIsDead == FALSE))
		{
			BilgotNWIsDead = TRUE;
		};

		//------------------lyudi lagerya--------------------------------

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_494_Attila)) && (AttilaIsDead == FALSE))
		{
			AttilaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) && (Cave_DemonHall_Gate == FALSE))
		{
			Wld_SendTrigger("EVT_DOOMHALL");

			if(MIS_MasiafStory == LOG_Running)
			{
				MIS_MasiafStory = LOG_Success;
				Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Success);
				B_LogEntry(TOPIC_MasiafStory,"Haniar je mrtvý! Vypadá to, že Gonzalez z části napravil své skutky před Innosem a bratrstvo Masyaf přestalo existovat.");
			};

			Cave_DemonHall_Gate = TRUE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)))
		{
			B_Attack(other,hero,AR_KILL,1);
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY)) && (CorGalom_Demon_Gate == FALSE))
		{
			Wld_SendTrigger("EVT_CORGALOM_DOOR");
			CorGalom_Demon_Gate = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_01))
		{
			DemonCor01IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_02))
		{
			DemonCor02IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_03))
		{
			DemonCor03IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) && (PW_Exit == FALSE))
		{
			Wld_SendTrigger("EVT_EXIT_PWWORLD");
			B_StartOtherRoutine(NONE_1190_Assasin,"TOT");

			if(MIS_PrioratStart == LOG_Running)
			{
				MIS_PrioratStart = LOG_Success;
				Log_SetTopicStatus(TOPIC_PrioratStart,LOG_Success);
				B_LogEntry(TOPIC_PrioratStart,"Všech únosů se účastnil náš starý přítel - Cor Kalom! Temná magie mu dala sílu démona a tím pak ovlivňoval celé bratrstvo podle své mysli. Tento slepý fanatik unášel novice a prováděl na nich hrozné pokusy. Při jednom experimentu byl Cor Kalom skoro zabit v chrámu. Teď je tomu konec! Musíme si pospíšit... a dát vědět Baalovi Namibovi, že Bratrstvo je od teď v bezpečí.");
			};
			
			PW_Exit = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_128_Nrozas)) && (NrozasIsDead == FALSE))
		{
			NrozasIsDead = TRUE;

			if(MIS_TrueBattle == LOG_Running)
			{
				MIS_TrueBattle = LOG_Success;
				Log_SetTopicStatus(TOPIC_TrueBattle,LOG_Success);
				B_LogEntry(TOPIC_TrueBattle,"Zabil jsem Nrozase v boji Pravdy! Další převor odešel na druhý svět...");
				B_StartOtherRoutine(Ass_144_Adept,"Start");
				B_StartOtherRoutine(Ass_145_Adept,"Start");
				B_StartOtherRoutine(Ass_146_Adept,"Start");
				B_StartOtherRoutine(Ass_147_Adept,"Start");
				B_StartOtherRoutine(Ass_148_Adept,"Start");
				B_StartOtherRoutine(Ass_149_Adept,"Start");
				B_StartOtherRoutine(Ass_138_Adept,"Start");
				B_StartOtherRoutine(Ass_139_Adept,"Start");
				B_StartOtherRoutine(Ass_140_Adept,"Start");
				B_StartOtherRoutine(Ass_141_Adept,"Start");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_170_Adept)) && (HasimKilled == FALSE))
		{
			HasimKilled = TRUE;

			if(MIS_HasimKill == LOG_Running)
			{
				B_LogEntry(TOPIC_HasimKill,"Hasim je mrtvý. Teď můžu říct Tiamantovi, že úkol je hotov.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8514_farrok))
		{
			ELITEGENERALORICISDEAD_01 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetího velitele Nar-Shaga.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetí velitele, čas informovat Orika.");
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_SleeperIns)) && (SleeperActive == FALSE))
		{
			Wld_InsertNpc(SLEEPER_OLD,"TPL_395");
			SleeperActive = TRUE;

			if(SleeperStone == FALSE)
			{
				AI_StartState(hero,ZS_MagicSleep,0,"");
			};

			if((MIS_SleeperBack == LOG_Running) && (NeedSleeperStone == FALSE) && (SleeperStone == FALSE))
			{
				B_LogEntry(TOPIC_SleeperBack,"Spáč je zpět! Když se na něj podívám hned usnu. Teď ho nemůžu porazit! Musím si mluvit s Netbekem...");
				NeedSleeperStone = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8515_nurshak))
		{
			ELITEGENERALORICISDEAD_02 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetího velitele Nur-Shaka.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetí velitele, čas informovat Orika.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8516_tumpak))
		{
			ELITEGENERALORICISDEAD_03 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetího velitele Tum-Paka.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetí velitele, čas informovat Orika.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8517_durkash))
		{
			ELITEGENERALORICISDEAD_04 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetího velitele Dur-Kashe.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Zabil jsem skřetí velitele, čas informovat Orika.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Undead_TT))
		{
			B_GivePlayerXP(1000);
			Wld_SendTrigger("TT_MAINGATE_ROOM_1");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_01))
		{
			DEMONDAGOTISDEAD_01 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE;
				Wld_InsertItem(itru_teleportdagot,"FP_STAND_DI_GUARDIAN_01");
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry(TOPIC_GUARDIANS,"Zázrakem jsem se ubránil Dagothovým démonům. Nyní je třeba myslet dál?");
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_120_Adept)) && (FirstAssas == FALSE))
		{
			FirstAssas = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_02))
		{
			DEMONDAGOTISDEAD_02 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE;
				Wld_InsertItem(itru_teleportdagot,"FP_STAND_DI_GUARDIAN_01");
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry(TOPIC_GUARDIANS,"Zázrakem jsem se ubránil Dagothovým démonům. Nyní je třeba myslet dál?");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_03))
		{
			DEMONDAGOTISDEAD_03 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE;
				Wld_InsertItem(itru_teleportdagot,"FP_STAND_DI_GUARDIAN_01");
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry(TOPIC_GUARDIANS,"Zázrakem jsem se ubránil Dagothovým démonům. Nyní je třeba myslet dál?");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_04))
		{
			DEMONDAGOTISDEAD_04 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE;
				Wld_InsertItem(itru_teleportdagot,"FP_STAND_DI_GUARDIAN_01");
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry(TOPIC_GUARDIANS,"Zázrakem jsem se ubránil Dagothovým démonům. Nyní je třeba myslet dál?");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_01))
		{
			WATERRITUALZOMBIEISDEAD_01 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_02))
		{
			WATERRITUALZOMBIEISDEAD_02 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_03))
		{
			WATERRITUALZOMBIEISDEAD_03 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_04))
		{
			WATERRITUALZOMBIEISDEAD_04 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_01))
		{
			WATERRITUALDARKSKELETONISDEAD_01 = TRUE;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_02))
		{
			WATERRITUALDARKSKELETONISDEAD_02 = TRUE;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_03))
		{
			WATERRITUALDARKSKELETONISDEAD_03 = TRUE;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualknightdeath_01))
		{
			WATERRITUALKNIGHTDEATHISDEAD_01 = TRUE;
			if((THIRDWAVEMONSTERSTART == TRUE) && (THIRDWAVEMONSTERSTOP == FALSE) && (WATERRITUALKNIGHTDEATHISDEAD_01 == TRUE) && (WATERRITUALKNIGHTDEATHISDEAD_02 == TRUE))
			{
				THIRDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualknightdeath_02))
		{
			WATERRITUALKNIGHTDEATHISDEAD_02 = TRUE;
			if((THIRDWAVEMONSTERSTART == TRUE) && (THIRDWAVEMONSTERSTOP == FALSE) && (WATERRITUALKNIGHTDEATHISDEAD_01 == TRUE) && (WATERRITUALKNIGHTDEATHISDEAD_02 == TRUE))
			{
				THIRDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualskeletonlord))
		{
			WATERRITUALSKELETONLORDISDEAD = TRUE;
			if((FORTHWAVEMONSTERSTART == TRUE) && (FORTHWAVEMONSTERSTOP == FALSE))
			{
				FORTHWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdemon))
		{
			WATERRITUALDEMONISDEAD = TRUE;
			if((FIFTHWAVEMONSTERSTART == TRUE) && (FIFTHWAVEMONSTERSTOP == FALSE))
			{
				FIFTHWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_general_nw))
		{
			ULTIMATEELITEORKNWFLGISDEAD = TRUE;
			HORINISISFREE = TRUE;

			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if(MIS_HORINISFREE == LOG_Running)
			{
				MIS_HORINISFREE = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_HORINISFREE,LOG_SUCCESS);
				B_LogEntry(TOPIC_ORсGREATWAR,"Zabil jsem velitele skřetů, kteří vedli jednotky v Khorinisu. Skřeti už nebudou klást odpor, ztratily svý vůdce... měl bych je pozabíjet ještě ve městě.");
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Caracust)) && (KillCaracust == FALSE))
		{
			B_GivePlayerXP(3000);
			KillCaracust = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_22))
		{
			ELITEORKNWFLGISDEAD_22 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Zlikvidoval jsem skřety obléhající klášter. Pyrokar bude potěšen.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1801_Fingers)) && (FingersIsDead == FALSE))
		{
			FingersIsDead = TRUE;

			if(MIS_FingersOpenDoor == LOG_Running)
			{
				MIS_FingersOpenDoor = LOG_Failed;
				B_LogEntry_Failed(TOPIC_FingersOpenDoor);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Shadowbeast_Loa_01))
		{
			ShadowbeastLoa01 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Shadowbeast_Loa_02))
		{
			ShadowbeastLoa02 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_33))
		{
			ELITEORKNWFLGISDEAD_33 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Zlikvidoval jsem skřety obléhající klášter. Pyrokar bude potěšen.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_34))
		{
			ELITEORKNWFLGISDEAD_34 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Zlikvidoval jsem skřety obléhající klášter. Pyrokar bude potěšen.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_35))
		{
			ELITEORKNWFLGISDEAD_35 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Zlikvidoval jsem skřety obléhající klášter. Pyrokar bude potěšen.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_23))
		{
			ELITEORKNWFLGISDEAD_23 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_24))
		{
			ELITEORKNWFLGISDEAD_24 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_25))
		{
			ELITEORKNWFLGISDEAD_25 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_27))
		{
			ELITEORKNWFLGISDEAD_27 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_28))
		{
			ELITEORKNWFLGISDEAD_28 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_29))
		{
			ELITEORKNWFLGISDEAD_29 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_30))
		{
			ELITEORKNWFLGISDEAD_30 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_32))
		{
			ELITEORKNWFLGISDEAD_32 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DarkZhnez)) && (DarkZhnezIsDead == FALSE))
		{
			DarkZhnezIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_36))
		{
			ELITEORKNWFLGISDEAD_36 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon4_nwchkflg_03))
		{
			SUPERELITEORKNWFLGISDEAD_03 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Undead)) && (DragonUndeadIsDead == FALSE))
		{
			DragonUndeadIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire)) && (DragonFireIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_FIRE");
			Snd_Play("DRAGON_WRATH_02");
			DragonFireIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Ice)) && (DragonIceIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_ICE");
			Snd_Play("DRAGON_WRATH_02");
			DragonIceIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Swamp)) && (DragonSwampIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_SWAMP");
			Snd_Play("DRAGON_WRATH_02");
			DragonSwampIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Rock)) && (DragonRockIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_STONE");
			Snd_Play("DRAGON_WRATH_02");
			DragonRockIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire_Island)) && (DragonRedIsDead == FALSE))
		{
			DragonRedIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chk_gate))
		{
			Wld_SendTrigger("EVT_OC_MAINGATE_P2_TRIGGER");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_26))
		{
			ELITEORKPASSISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2500_garond))
		{
			GARONDNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2510_oric))
		{
			ORICNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2520_parcival))
		{
			PARCIVALNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2170_marcos))
		{
			MARCOSNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_75230_albert))
		{
			ALBERTNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2680_udar))
		{
			UDARNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_91680_natan))
		{
			NATANNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_udar))
		{
			FLAG_ORCS_UDAR_01 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_01))
		{
			FLAG_ORCS_UDAR_02 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_02))
		{
			FLAG_ORCS_UDAR_03 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_03))
		{
			FLAG_ORCS_UDAR_04 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_04))
		{
			FLAG_ORCS_UDAR_05 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_05))
		{
			FLAG_ORCS_UDAR_06 = TRUE;
		};
		if((MIS_NATANDOLG == LOG_Running) && (FLAG_ORCS_UDAR_01 == TRUE) && (FLAG_ORCS_UDAR_02 == TRUE) && (FLAG_ORCS_UDAR_03 == TRUE) && (FLAG_ORCS_UDAR_04 == TRUE) && (FLAG_ORCS_UDAR_05 == TRUE) && (FLAG_ORCS_UDAR_06 == TRUE) && (UDARORCSTRAPISDONE == FALSE))
		{
			B_LogEntry(TOPIC_NATANDOLG,"Tento trik funkuje! Uvidíme co Nathan řekne...");
			UDARORCSTRAPISDONE = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(stonegolem_osta))
		{
			OSTAISDEAD = TRUE;

			if(MIS_XARDASTASKSFOUR == LOG_Running)
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Zničil jsem strážce temné věže.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			OberDementorIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_117_nergal))
		{
			NERGALISDEAD = TRUE;

			if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASRITUALFAIL == TRUE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Dokázal jsem svoji moc nekromanta nyní s Nekronomikonem.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(scavenger_sprint))
		{
			if(MIS_HUNTERCHALLANGE == LOG_Running)
			{
				B_StartOtherRoutine(hun_741_falk,"Start");
			};
		};
		if((CassiaIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_447_Cassia)))
		{
			CassiaIsDead = TRUE;
		};
		if((RamirezIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_445_Ramirez)))
		{
			RamirezIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_Lord_Milten))
		{
			B_StartOtherRoutine(PC_Mage_OW,"Start");
			B_StartOtherRoutine(VLK_4100_Brutus,"Start");
			B_StartOtherRoutine(VLK_4101_Waffenknecht,"Start");
			B_StartOtherRoutine(VLK_4102_Waffenknecht,"Start");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (TrollYoungPW == FALSE))
		{
			TrollYoungPW = TRUE;

			if((PoisonResult == FALSE) && (NoTrollPoison == FALSE))
			{
				B_LogEntry(TOPIC_PW_PoisonNrozas,"Zabil jsem trola, na kterém jsem mohl vyzkoušet jed. Bude problém najít jiného...");
				NoTrollPoison = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETONMAGE_STRANGECAVE)) && (StrangeCaveMageIsDead == FALSE))
		{
			StrangeCaveMageIsDead = TRUE;
			B_LogEntry(TOPIC_StrangeCave,"Už vím co je špatné na této jeskyni...");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_01)) && (FIRETESTMONSTERONEISDEAD == FALSE))
		{
			FIRETESTMONSTERONEISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Prošel jsem Zkouškou Ohně. Čas informovat Strážce Keliose.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_02)) && (FIRETESTMONSTERTWOISDEAD == FALSE))
		{
			FIRETESTMONSTERTWOISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Prošel jsem Zkouškou Ohně. Čas informovat Strážce Keliose.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_03)) && (FIRETESTMONSTERTHREEISDEAD == FALSE))
		{
			FIRETESTMONSTERTHREEISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Prošel jsem Zkouškou Ohně. Čas informovat Strážce Keliose.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(CastlemineDMT)) && (CastlemineDMTIsDead == FALSE))
		{
			CastlemineDMTIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1271_Dementor)) && (CastlemineDMTMasterIsDead == FALSE))
		{
			CastlemineDMTMasterIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_04)) && (FIRETESTMONSTERFOURISDEAD == FALSE))
		{
			FIRETESTMONSTERFOURISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Prošel jsem Zkouškou Ohně. Čas informovat Strážce Keliose.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_05)) && (FIRETESTMONSTERFIVEISDEAD == FALSE))
		{
			FIRETESTMONSTERFIVEISDEAD = TRUE;
			Snd_Play("LevelUp");
			CreateInvItems(hero,itmi_firestone,1);

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Prošel jsem Zkouškou Ohně. Čas informovat Strážce Keliose.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6027_taliasan))
		{
			if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (GIVEXARDASSEEKBOOK == FALSE))
			{
				TALIASANISDEAD = TRUE;
				B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Gallahad je mrtvý. Je třeba informovat Xardase.");
			};
		};
		if((Talbin_NW_InCamp == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4132_Talbin_NW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4130_Talbin))))
		{
			Talbin_NW_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4148_Gestath)) && (GestatIsDead == FALSE))
		{
			GestatIsDead = TRUE;
		};
		if((Gestath_InCamp == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4149_Gestath)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4148_Gestath))))
		{
			Gestath_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((Bartok_InCamp == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_440_Bartok)))
		{
			Bartok_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((MIS_PW_FollowGoldOre == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_184_Adept)) && (OsairWarriorWait == FALSE))
		{
			OsairWarriorWait = TRUE;
		};
		if(MIS_NewHunters == LOG_Running)
		{
			if(FalkHunters == FALSE)
			{
				MIS_NewHunters = LOG_OBSOLETE;
				Log_SetTopicStatus(TOPIC_NewHunters,LOG_OBSOLETE);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sleeper))
		{
			Snd_Play("SLEEPER_DIE");
			LIDEMONISDEAD = TRUE;

			if(MIS_MILTENANCIENT == LOG_Running)
			{
				outter = Hlp_GetNpc(pc_mage_li);
				outter.aivar[AIV_PARTYMEMBER] = FALSE;
				B_StartOtherRoutine(outter,"Cave");
				AI_GotoNpc(outter,hero);
				B_KillNpc(demonlord_li_1);
				B_KillNpc(demonlord_li_2);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_3320_Stadtwache))
		{
			CreateInvItems(self,ItMi_DeadManHead,1);
			self.aivar[AIV_StoryBandit] = TRUE;
		};
		if((TPLBalamDead == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8100_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8101_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8102_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8103_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8104_TEMPLER))))
		{
			if((AssasinsAttackCamp == TRUE) && (AssInvasionStop == FALSE))
			{
				TPLBalamDead = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_01))
		{
			Ginnok_Guard_01 = TRUE;

			if((Ginnok_Guard_01 == TRUE) && (Ginnok_Guard_02 == TRUE))
			{
				
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 30000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_02))
		{
			Ginnok_Guard_02 = TRUE;

			if((Ginnok_Guard_01 == TRUE) && (Ginnok_Guard_02 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 30000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_03))
		{
			Ginnok_Guard_03 = TRUE;

			if((Ginnok_Guard_03 == TRUE) && (Ginnok_Guard_04 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 20000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_STRF) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			PlayerIsPrioratFake = TRUE;

			if(MIS_MasiafStory == LOG_Running)
			{
				B_LogEntry(TOPIC_MasiafStory,"Stínové nebudou moc rádi, když zabiju jejich otroky. Asi se nebudu moct už vydávat za jednoho znich. Musím si o tom promluvit s Gonzalezem.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_04))
		{
			Ginnok_Guard_04 = TRUE;

			if((Ginnok_Guard_03 == TRUE) && (Ginnok_Guard_04 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 20000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_05))
		{
			Ginnok_Guard_05 = TRUE;

			if((Ginnok_Guard_05 == TRUE) && (Ginnok_Guard_06 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 10000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_06))
		{
			Ginnok_Guard_06 = TRUE;

			if((Ginnok_Guard_05 == TRUE) && (Ginnok_Guard_06 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 10000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_keltuzed))
		{
			KelTuzedIsDead = TRUE;
			Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Snd_Play("ZOM_DIE");
			B_KillNpc(skeleton_knight_death_01);
			B_KillNpc(skeleton_knight_death_02);
			B_KillNpc(skeleton_knight_death_03);
			B_KillNpc(skeleton_knight_death_04);
			Wld_SendTrigger("EVENT_DAKATGATE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_171_Adept)) && (NarugIsDeadNow == FALSE))
		{
			NarugIsDeadNow = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Archol)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DARKTOWER_SKELETON_LORD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_mirat)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord)))
		{
			Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Snd_Play("ZOM_DIE");

			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Ginnok == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)))
			{
				Wld_SendTrigger("GINNOK_GATE_ENTER");
				KillDeadPal_Ginnok = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Zabil jsem šíleného pána Ginnocka!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Serdah == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_mirat)))
			{
				KillDeadPal_Serdah = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Zabil jsem pána Mirata!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Innubis == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord)))
			{
				KillDeadPal_Innubis = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Zabil jsem pána Innubise!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Dexsar == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DARKTOWER_SKELETON_LORD)))
			{
				KillDeadPal_Dexsar = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Zabil jsem pána Ulzara!");
			};
			if((KillDeadPal_Serdah == TRUE) && (KillDeadPal_Innubis == TRUE) && (KillDeadPal_Dexsar == TRUE) && (KillDeadPalAll == FALSE))
			{
				KillDeadPalAll = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_kadar))
		{
			if((MIS_HROMANINQUEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_kadar)))
			{
				Wld_SendTrigger("HROMANIN_GATE");
				MIS_HROMANINQUEST = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_SUCCESS);
				B_LogEntry(TOPIC_HROMANINQUEST,"Rozluštil jsem tajemství Chromaninu! Za vším byl Kadar, jeho strážce. Nu, tím hůř pro něj...");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4201_Wirt)) && (WirtIsDead == FALSE))
		{
			WirtIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8160_Ragnar)) && (RagnarIsDead == FALSE))
		{
			RagnarIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)) && (EstebanIsDead == FALSE))
		{
			EstebanIsDead = TRUE;
			CreateInvItems(self,ITKE_Addon_Esteban_01,1);
			CreateInvItems(self,ItMi_Addon_Stone_01,5);
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Stone)) && (AvatarStoneIsDead == FALSE))
		{
			AvatarStoneIsDead = TRUE;
			B_LogEntry(TOPIC_ORCSECRET,"Zabil jsem ledovou potvoru.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Zabil jsem všechny prastaré bytosti, které vytvořili Strážci! Bez ochranného kouzla, je možné, že skřeti už nejsou nezranitelní. Musím o tom říct Leemu!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire)) && (AvatarFireIsDead == FALSE))
		{
			AvatarFireIsDead = TRUE;
			B_LogEntry(TOPIC_ORCSECRET,"Zabil jsem ohnivého atronarcha.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Zabil jsem všechny prastaré bytosti, které vytvořili Strážci! Bez ochranného kouzla, je možné, že skřeti už nejsou nezranitelní. Musím o tom říct Leemu!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water)) && (AvatarWaterIsDead == FALSE))
		{
			AvatarWaterIsDead = TRUE;
			B_LogEntry(TOPIC_ORCSECRET,"Zabil jsem ledovou potvoru.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Zabil jsem všechny prastaré bytosti, které vytvořili Strážci! Bez ochranného kouzla, je možné, že skřeti už nejsou nezranitelní. Musím o tom říct Leemu!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XranFreg)) && (XranFregIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_EGEZARTDOOR");

			if(MIS_XRANFREG == LOG_Running)
			{
				MIS_XRANFREG = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_XRANFREG,LOG_SUCCESS);
				B_LogEntry(TOPIC_XRANFREG,"Zabil jsem Fregaraha! Jeho duch odešel do zapomnění.");
			};

			XranFregIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORKELITE_ADDON4_CHKFLG_29)) && (FreeMineGeneralIsDead == FALSE))
		{
			FreeMineGeneralIsDead = TRUE;

			if(MIS_ScoutNewMine == LOG_Running)
			{
				B_LogEntry(TOPIC_ScoutNewMine,"Dostal jsem se k veliteli skřetů nového tábora. Myslím, že teď skřeti odejdou! Musím o tom informovat Garonda.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond))
		{
			GARONDISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8104_TEMPLER)) && (MIS_TrainInCamp == LOG_Running))
		{
			B_LogEntry_Failed(TOPIC_TrainInCamp);
			MIS_TrainInCamp = LOG_Failed;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_251_Oric))
		{
			ORICISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_252_Parcival))
		{
			PARCIVALISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_268_Udar))
		{
			UDARISDEAD = TRUE;
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2680_udar))
		{
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_217_Marcos))
		{
			MARCOSISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7523_albert))
		{
			ALBERTISDEAD = TRUE;

			if(MIS_DRAKARBROKE == LOG_Running)
			{
				MIS_DRAKARBROKE = LOG_Failed;
				B_LogEntry_Failed(TOPIC_DRAKARBROKE);
			};
			if(MIS_ORCORDER == LOG_Running)
			{
				MIS_ORCORDER = LOG_Failed;
				Log_CreateTopic(TOPIC_ORCORDER,LOG_OBSOLETE);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9168_natan))
		{
			NATANISDEAD = TRUE;
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_91680_natan))
		{
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01))
		{
			HaniarDemon01IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02))
		{
			HaniarDemon02IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03))
		{
			HaniarDemon03IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7518_ritter))
		{
			PAL_7518_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7519_ritter))
		{
			PAL_7519_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7520_ritter))
		{
			PAL_7520_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7521_ritter))
		{
			PAL_7521_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7522_ritter))
		{
			PAL_7522_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7524_ritter))
		{
			PAL_7524_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_253_Wache))
		{
			PAL_253_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_257_Ritter))
		{
			PAL_257_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9165_ritter))
		{
			PAL_9165_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9166_ritter))
		{
			PAL_9166_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9167_ritter))
		{
			PAL_9167_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_700_Sylvio) && (MIS_SylvioDebts == LOG_Running) && (SylvioIsDead == FALSE))
		{
			SylvioIsDead = TRUE;
			B_LogEntry(Topic_SylvioDebts,"Ten lakomý bastard, Sylvio, je mrtvý! Všechno jeho zlato teďka jen mě. Měl bych se s Rathfortem domluvit...");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_337_Mika))
		{
			MIKAISDEAD = TRUE;

			if(MikaGiveKey == FALSE)
			{
				CreateInvItems(self,ItKe_Constantino,1);
				MikaGiveKey = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Rug))
		{
			TrollBrother_01 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Trag))
		{
			TrollBrother_02 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Brog))
		{
			TrollBrother_03 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_salandril))
		{
			ORCWARRIORSALANDRILISDEAD = TRUE;
			if((MIKATELLORKSGO == TRUE) && (MIKATELLORKSDONE == FALSE) && (mika.aivar[AIV_PARTYMEMBER] == TRUE) && (MIKAISDEAD == FALSE))
			{
				MIKATELLORKSDONE = TRUE;
				mika.aivar[AIV_PARTYMEMBER] = FALSE;
				B_StartOtherRoutine(mika,"Start");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_702_Rod))
		{
			DJG_ROD_ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_703_Cipher))
		{
			DJG_CIPHER_ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_713_Biff))
		{
			DJG_BIFF_ISDEAD = TRUE;
			if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
			{
				if(MIS_KILLDRAGONHUNTER == LOG_Running)
				{
					KILLCOUNTDJG = KILLCOUNTDJG + 1;
					if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
					{
						ALLDRGHUNTERSISDEAD = TRUE;
						B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
					};
				}
				else if(KILLGLOBALCOUNTDJG < 1)
				{
					KILLGLOBALCOUNTDJG = 0;
				}
				else
				{
					KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_708_Kurgan))
		{
			DRGHUNTER01ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6667_RitualShaman))
		{
			RitualShaman_01 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6668_RitualShaman))
		{
			RitualShaman_02 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6669_RitualShaman))
		{
			RitualShaman_03 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6670_RitualShaman))
		{
			RitualShaman_04 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6671_RitualShaman))
		{
			RitualShaman_05 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6672_RitualShaman))
		{
			RitualShaman_06 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6673_RitualShaman))
		{
			RitualShaman_07 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6674_RitualShaman))
		{
			RitualShaman_08 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6675_RitualShaman))
		{
			RitualShaman_09 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_XASH_GOR.flags = FALSE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1812_Dementor)) && (RoscoeDMTIsDead == FALSE))
		{
			RoscoeDMTIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_710_Kjorn))
		{
			DRGHUNTER02ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_711_Godar))
		{
			DRGHUNTER03ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_712_Hokurn))
		{
			DRGHUNTER04ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Zabil jsem všechny drakobijce.");
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_01))
		{
			CASTLEFLAGBACK_01 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_02))
		{
			CASTLEFLAGBACK_02 = TRUE;

			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Werewolf))
		{
			WerewolfIsDead = TRUE;

			if(MIS_WolfAndMan == LOG_Running)
			{
				MIS_WolfAndMan = LOG_Failed;
				B_LogEntry_Failed(TOPIC_WolfAndMan);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_03))
		{
			CASTLEFLAGBACK_03 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_04))
		{
			CASTLEFLAGBACK_04 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_05))
		{
			CASTLEFLAGBACK_05 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Anti_Hero)) && (BossTear == FALSE))
		{
			Wld_SendTrigger("EVT_TEARDOOR");
			Wld_SendTrigger("EVT_TT_TO_AV");
			BossTear = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_605_Opolos)) && (OpolosIsDead == FALSE))
		{
			OpolosIsDead = TRUE;

			if(MIS_Xardas_LastStand_Done == LOG_Running)
			{
				B_LogEntry(TOPIC_XARDAS_DEMON,"Zabil jsem novice mágů Ohně.");
			};
		};
		if((IlArahDemonIsDead_01 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_01)))
		{
			IlArahDemonIsDead_01 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_02 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_02)))
		{
			IlArahDemonIsDead_02 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_03 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_03)))
		{
			IlArahDemonIsDead_03 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_04 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_04)))
		{
			IlArahDemonIsDead_04 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Doom)) && (DruidDoomIsDead == FALSE))
		{
			DruidDoomIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Despair)) && (DruidDespairIsDead == FALSE))
		{
			DruidDespairIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Agony)) && (DruidAgonyIsDead == FALSE))
		{
			DruidAgonyIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah))
		{
			ImarahIsDead = TRUE;
			ImarahStarts = FALSE;
			tmpImarahCount = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan))
		{
			if(MIS_CHALLANGEORC != LOG_Running)
			{
				CASTLEFLAGBACK_06 = TRUE;
				if(MIS_KILLURTRALL == LOG_Running)
				{
					if(URNAZULGIVETASK == FALSE)
					{
						MIS_KILLURTRALL = LOG_OBSOLETE;
						Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_OBSOLETE);
						BOGNARREFUSETALK = TRUE;
						Kurgan.aivar[93] = TRUE;
					}
					else
					{
						KILLHAGTARURTRALL = TRUE;
						B_LogEntry(TOPIC_KILLURTRALL,"Zabil jsem Hag-Tara! Teď musím informovat Ur-Thralla o tom, aby paladiny propustil.");
					};
				};
				if(MIS_KILLDRAGONHUNTER == LOG_Running)
				{
					MIS_KILLDRAGONHUNTER = LOG_OBSOLETE;
					Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_OBSOLETE);
					BOGNARREFUSETALK = TRUE;
					Kurgan.aivar[93] = TRUE;
				};
			}
			else if((URHANSPEAKBEFOREBATTLE == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				URHANBEATEN = TRUE;
				B_LogEntry(TOPIC_CHALLANGEORC,"Zabil jsem Hag-Tara!");
			}
			else
			{
				CASTLEFLAGBACK_06 = TRUE;
				MIS_CHALLANGEORC = LOG_OBSOLETE;
				BOGNARREFUSETALK = TRUE;
				Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_OBSOLETE);
			};
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že štěstí bylo tentokrát na mé straně! Zrušil celé škály rozkazů skřetů v pevnosti, nevypadá že skřeti ji budou moci ubrání až do konce.");
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Orcmine))
		{
			ORCMINEKILL_01 = TRUE;

			if((ORCMINEKILL_01 == TRUE) && (ORCMINEKILL_02 == TRUE))
			{
				B_LogEntry(TOPIC_LowLevel,"Zničil jsem zlo v hlubokém dolu!");
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_stoneshpere))
		{
			ORCMINEKILL_02 = TRUE;

			if((ORCMINEKILL_01 == TRUE) && (ORCMINEKILL_02 == TRUE))
			{
				B_LogEntry(TOPIC_LowLevel,"Zničil jsem zlo v hlubokém dolu!");
			};

		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			CraitIsUp = FALSE;
			Mount_Up = FALSE;
			CraitCanUp = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_Clan_Boss))
		{
			OrcsClan_CHK_01 = TRUE;
	
			if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcClanBossLetterDeliver == FALSE) && (OrcTraitor == FALSE))
			{
				OrcFailInvte = TRUE;
				B_LogEntry(TOPIC_HeroOrcJoin_T2,"Vůdce klanu Vysoké skály je mrtvý... Zdá se, že jsem neuspěl v úkolu Ur-Karrase.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Muritan_South))
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Zabil jsem Muritana! Teďka zbývá jen vyjmout jedovaté tesáky a vzít je do města Ur-Karrasovi do města skřetů.");
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS2 = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Zabil jsem Muritana! Nejsem však schopný vyjmout jeho jedovaté tesáky a vzít je do skřetího města Ur-Karrase ve městě Skřetů, protože nevím jak je odstranit z jeho těla. Zdá se, že budu muset najít a zabít ještě jednoho z nich a nesmím zapomnět naučit se vyjmout jeho tesáky!");
					Wld_InsertNpc(Muritan_North,"NW_TROLLAREA_RUINS_22");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Muritan_North))
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Našel jsem dalšího Muritana a zabil ho! Teď si vemu jeho jedovaté tesáky a donesu je k Ur-Karrasovi.");
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS3 = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Našel jsem dalšího Muritana a zabili ho! Ale neumím vzít jeho tesáky. Asi jsem nesplnil Ur-Karrasův úkol... Nemyslím si, že by to rád slyšel.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6666_Xash_Gor))
		{
			HashGorIsDead = TRUE;
			Wld_SendTrigger("EVT_ORCGRYRD_HASHGOR");
			
			if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (NagDumgarInsert == FALSE))
			{
				B_LogEntry(TOPIC_NagDumgar,"Zabil jsem nejvyššího šamana Hash-Gora! Vemu z něj rituální nůž a donesu ho Ur-Thrallovi.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8568_NagDumgar)) && (NagDumgarInsertDone == TRUE))
		{
			NagDumgarIsDead = TRUE;

			if(MIS_NagDumgar == LOG_Running)
			{
				B_LogEntry(Topic_NagDumgar,"Zabil jsem démona Nag-Dumgara! Nebylo to jednoduché, ale zvládl jsem to. Je čas vrátit k Ur-Thrallovi. Myslím, že tato zpráva ho potěší...");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcWarrior_Harad))
		{
			OrcWarriorHaradIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_5500_WoundedOrc))
		{
			UrKarrasIsDead = TRUE;

			if(MIS_Orcwayhero == LOG_Running)
			{
				B_LogEntry_Failed(Topic_Orcwayhero);
				MIS_Orcwayhero = LOG_Failed;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Shadow_Priest_Quardimon))
		{
			QvardemonIsDead = TRUE;

			if(MIS_Qvardemon == LOG_Running)
			{
				MIS_Qvardemon = LOG_Success;
				Log_SetTopicStatus(TOPIC_Qvardemon,LOG_Success);
				B_LogEntry(TOPIC_Qvardemon,"Zabil jsem prastarého kněze Khardimona!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul)) && (AvabulIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_ORCMOUNTAIN_HRAM_DOOR");
			AvabulIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (QuarhodronIsDead == FALSE))
		{
			QuarhodronIsDead = TRUE;

			B_RemoveMonster(Ancient_Warrior_Q1);
			B_RemoveMonster(Ancient_Warrior_Q2);
			B_RemoveMonster(Ancient_Warrior_Q3);
			B_RemoveMonster(Ancient_Warrior_Q4);
			B_RemoveMonster(Ancient_Warrior_Q5);
			B_RemoveMonster(Ancient_Warrior_Q6);
			B_RemoveMonster(Ancient_Warrior_Q7);
			B_RemoveMonster(Ancient_Warrior_Q8);
			B_RemoveMonster(Ancient_Warrior_Q9);

			B_RemoveNpcQuarh(Ancient_Warrior_QT1);
			B_RemoveNpcQuarh(Ancient_Warrior_QT2);
			B_RemoveNpcQuarh(Ancient_Warrior_QT3);
			B_RemoveNpcQuarh(Ancient_Warrior_QT4);
			B_RemoveNpcQuarh(Ancient_Warrior_QT5);
			B_RemoveNpcQuarh(Ancient_Warrior_QT6);
			B_RemoveNpcQuarh(Ancient_Warrior_QT7);
			B_RemoveNpcQuarh(Ancient_Warrior_QT8);
			B_RemoveNpcQuarh(Ancient_Warrior_QT9);

			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q1);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q2);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q3);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q4);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q5);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q6);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q7);
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q8);

			B_RemoveMonster(SKELETON_WARRIOR_AV_Q1);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q2);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q3);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q4);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q5);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q6);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q7);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q8);

			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q1);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q2);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q3);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q4);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q5);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q6);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q7);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q8);

			B_RemoveMonster(Skeleton_Shadow_Priest_Q1);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q2);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q3);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q4);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q5);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q6);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q7);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q8);

			if(MIS_JarCurse == LOG_Running)
			{
				MIS_JarCurse = LOG_Success;
				Log_SetTopicStatus(TOPIC_JarCurse,LOG_Success);
				B_LogEntry(Topic_JarCurse,"Zabil jsem starého velitele, Quarhodrona!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrkElite_Addon2_Gonez))
		{
			if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == TRUE))
			{
				DayGonezStop = Wld_GetDay();

				if(DayGonezStop > DayGonezStart)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T2,"Našel jsem posla skřetů a zabil ho! Zdá se však, že jsem s jeho vyhledáním příliš otálel a podařilo se mu předat Ur-Karrasovi zprávu o mé zradě.");
				}
				else
				{
					UrKarrasGonezIsDead = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T2,"Našel jsem posla skřetů a zabil ho! Myslím, že teď už nikdo neřekne Ur-Karrasovi o mé zradě.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss))
		{
			StoneBossIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_1))
		{
			FLAG_ORCS_CHK_01 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_2))
		{
			FLAG_ORCS_CHK_02 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_3))
		{
			FLAG_ORCS_CHK_03 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_4))
		{
			FLAG_ORCS_CHK_04 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_5))
		{
			FLAG_ORCS_CHK_05 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_6))
		{
			FLAG_ORCS_CHK_06 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_7))
		{
			FLAG_ORCS_CHK_07 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_8))
		{
			FLAG_ORCS_CHK_08 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_9))
		{
			FLAG_ORCS_CHK_09 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_10))
		{
			FLAG_ORCS_CHK_10 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_11))
		{
			FLAG_ORCS_CHK_11 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_12))
		{
			FLAG_ORCS_CHK_12 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_13))
		{
			FLAG_ORCS_CHK_13 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_14))
		{
			FLAG_ORCS_CHK_14 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_15))
		{
			FLAG_ORCS_CHK_15 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_16))
		{
			FLAG_ORCS_CHK_16 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_17))
		{
			FLAG_ORCS_CHK_17 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_18))
		{
			FLAG_ORCS_CHK_18 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_19))
		{
			FLAG_ORCS_CHK_19 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_20))
		{
			FLAG_ORCS_CHK_20 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_21))
		{
			FLAG_ORCS_CHK_21 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_22))
		{
			FLAG_ORCS_CHK_22 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_23))
		{
			FLAG_ORCS_CHK_23 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_24))
		{
			FLAG_ORCS_CHK_24 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_25))
		{
			FLAG_ORCS_CHK_25 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_26))
		{
			FLAG_ORCS_CHK_26 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_27))
		{
			FLAG_ORCS_CHK_27 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_28_withkey))
		{
			FLAG_ORCS_CHK_28 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon4_chkflg_drakar_capitan))
		{
			FLAG_ORCS_DRAKAR = TRUE;

			if(MIS_SylvioDrakar == LOG_Running)
			{
				FLAG_ORCS_DRAKAR_02 = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORKELITE_CHKFLG_SYLVIODRAKAR_CAPITAN))
		{
			FLAG_ORCS_DRAKAR_02 = TRUE;
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8550_urnazul)) && (ORCLEADERISDEAD == FALSE))
		{
			ORCLEADERISDEAD = TRUE;

			if(MIS_URNAZULRAGE == LOG_Running)
			{
				MIS_URNAZULRAGE = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_OBSOLETE);
			};
			if(MIS_KILLURTRALL == LOG_Running)
			{
				if(KILLHAGTARURTRALL == TRUE)
				{
					MIS_KILLURTRALL = LOG_OBSOLETE;
					Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_OBSOLETE);
					BOGNARREFUSETALK = TRUE;
					Kurgan.aivar[93] = TRUE;
				}
				else
				{
					B_LogEntry(TOPIC_KILLURTRALL,"Zabil jsem Ur-Thralla. Čas informovat Ur-Hana!");
				};
			};
			if(MIS_BELIARWILL == LOG_Running)
			{
				B_LogEntry(TOPIC_BELIARWILL,"Zabil jsem vůdce skřetů, Ur-Thralla! Belirova moc je velká!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_01))
		{
			FLAG_ORCSLAVE_01 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_02))
		{
			FLAG_ORCSLAVE_02 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_03))
		{
			FLAG_ORCSLAVE_03 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_04))
		{
			FLAG_ORCSLAVE_04 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_05))
		{
			FLAG_ORCSLAVE_05 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_06))
		{
			FLAG_ORCSLAVE_06 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_07))
		{
			FLAG_ORCSLAVE_07 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_08))
		{
			FLAG_ORCSLAVE_08 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Všichni skřetí otroci jsou mrtví. Je čas vrátit se k Albertovi.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8565_urgrom)) && (UrGromIsDead == FALSE))
		{
			UrGromIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_601_Igaraz)) && (IgarazIsDead == FALSE))
		{
			IgarazIsDead = TRUE;

			if(MIS_Igaraz_OneMoreChance == LOG_Running)
			{
				MIS_Igaraz_OneMoreChance = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_IGARANZ_NEW);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7518_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7519_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7520_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GuardChamber_Demon_Portal)) && (HaosPortalIsOpen == FALSE))
		{
			Wld_SendTrigger("EVT_HAOSPORTAL");
			HaosPortalIsOpen = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7521_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) && (ArenaFightNow == TRUE) && (ArenaBattle_01 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) && (ArenaFightNow == TRUE) && (ArenaBattle_02 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) && (ArenaFightNow == TRUE) && (ArenaBattle_03 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GorkOrcBoss_Rest))
		{
			GorkOrcBossIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_ClansWar = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ClansWar);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_852_Darius))
		{
			DariusIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_ClansWar = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ClansWar);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8571_HashTor))
		{
			if(MIS_HashTorRule == LOG_Running)
			{
				MIS_HashTorRule = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORCWEAPON);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4107_Parlaf)) && (ParlafIsDead == FALSE))
		{
			ParlafIsDead = TRUE;
			
			if((ParlafFind == TRUE) && (ParlafOnPlace == FALSE))
			{
				ParlafNoExcort = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak))
		{
			self.aivar[AIV_StoryBandit] = TRUE;
			UrTakIsDead = TRUE;

			if((MIS_HashTorRule == LOG_Running) && (OFStyle == FALSE))
			{
				MIS_HashTorRule = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORCWEAPON);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MorkOrcBoss_Rest))
		{
			MorkOrcBossIsDead = TRUE;

			if(MIS_ClansWar == LOG_Running)
			{
				B_LogEntry(TOPIC_ClansWar,"Vůdce klanu Ledového větru je mrtvý! Musím o tom informovat Grum Loka.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) && (ArenaFightNow == TRUE) && (ArenaBattle_04 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) && (ArenaFightNow == TRUE) && (ArenaBattle_05 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)) && (ArenaFightNow == TRUE) && (ArenaBattle_06 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7522_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7523_ALBERT)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7524_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp,"Zabil jsem všechny paladiny na pobřeží, jak mi nařídil Ur-Karras.");
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			Wld_SendTrigger("TRG_CORGALOM_MAGICWALL");
			B_LogEntry(TOPIC_PrioratStart,"Mocný démon padl a magická bariéra, která zatarasila mojí cestu, je pryč - teď je cesta volná!");
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_600_Pedro_DI))
		{
			DI_CHECK_PEDRO = TRUE;

			if((MIS_Gorax_KillPedro == LOG_Running) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				B_GivePlayerXP(500);
				MIS_Gorax_KillPedro = LOG_SUCCESS;
				MIS_TraitorPedro = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
				B_LogEntry(TOPIC_TraitorPedro,"Zabil jsem Pedra. Serpentes bude spokojen.");
			}
			else if(!Npc_IsPlayer(other) && (MIS_Gorax_KillPedro == LOG_Running))
			{
				B_GivePlayerXP(250);
				MIS_Gorax_KillPedro = LOG_SUCCESS;
				MIS_TraitorPedro = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
				B_LogEntry(TOPIC_TraitorPedro,"Pedro je mrtvý a teď už není důležitý co se zde stalo!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4250_Jorgen))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JORGENBACKNW == TRUE) && (JORGENISDEAD == FALSE))
			{
				JORGENISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Elite_Boss)) && (ItarIsDead == FALSE))
		{
			ItarIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadWolf)) && (YelaIsDead == FALSE))
		{
			YelaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasRaf)) && (AmasRafIsDead == FALSE))
		{
			AmasRafIsDead = TRUE;
			self.aivar[95] = TRUE;

			if((AmasRafIsDead == TRUE) && (AmasSahIsDead == TRUE))
			{
				Wld_SendTrigger("EVT_BIGPYRAMIDDOOR_01");
				Wld_SendTrigger("CAM_BIGPYRAMIDDOOR");
				bonuslpgivehero = 3;
				b_givebonusforelitemonster(bonuslpgivehero);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasSah)) && (AmasSahIsDead == FALSE))
		{
			AmasSahIsDead = TRUE;
			self.aivar[95] = TRUE;

			if((AmasRafIsDead == TRUE) && (AmasSahIsDead == TRUE))
			{
				Wld_SendTrigger("EVT_BIGPYRAMIDDOOR_01");
				Wld_SendTrigger("CAM_BIGPYRAMIDDOOR");
				bonuslpgivehero = 3;
				b_givebonusforelitemonster(bonuslpgivehero);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq)) && (IzulgIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_GATEIN_INNER_02");
			Wld_SendTrigger("EVT_GATEIN_INNER_01");
			Wld_SendTrigger("EVT_GATEIN_INNER");
			IzulgIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack)) && (JackMainIsDead == FALSE))
		{
			if((MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == FALSE))
			{
				MIS_HauntedLighthouse = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HauntedLighthouse);
			};
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JACKBACKNW == TRUE) && (JACKISDEAD == FALSE))
			{
				JACKISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};

			JackMainIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanIsDead == FALSE))
		{
			StefanIsDead = TRUE;

			if((MIS_HauntedLighthouse == LOG_Running) && (StefanCanFight == TRUE) && (FinishStoryLH == FALSE))
			{
				FinishStoryLH = TRUE;
				MIS_HauntedLighthouse = LOG_Success;
				Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);

				if(JackMainIsDead == TRUE)
				{
					B_LogEntry(TOPIC_HauntedLighthouse,"Zničil jsem všechny duchy v majáku. Lidé už nejsou ohroženi... Škoda, že Jack je po smrti.");
				}
				else
				{
					B_LogEntry(TOPIC_HauntedLighthouse,"Zničil jsem všechny duchy v majáku. Lidé už nejsou ohroženi...");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_713_Biff_NW))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BIFFBACKNW == TRUE) && (BIFFISDEAD == FALSE))
			{
				BIFFISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (GIRIONBACKNW == TRUE) && (GIRIONISDEAD == FALSE))
			{
				GIRIONISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BENNETBACKNW == TRUE) && (BENNETISDEAD == FALSE))
			{
				BENNETISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (WOLFBACKNW == TRUE) && (WOLFISDEAD == FALSE))
			{
				WOLFISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion_DI))
		{
			DI_CHECK_GIRION = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Fighter_DI))
		{
			DI_CHECK_FIGHTER = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Mage_DI))
		{
			DI_CHECK_MAGE = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Psionic_DI))
		{
			DI_CHECK_PSIONIC = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Thief_DI))
		{
			DI_CHECK_THIEF = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_800_Lee_DI))
		{
			DI_CHECK_LEE = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_801_Torlof_DI))
		{
			DI_CHECK_TORLOF = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet_DI))
		{
			DI_CHECK_BENNET = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf_DI))
		{
			DI_CHECK_WOLF = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4250_Jorgen_DI))
		{
			DI_CHECK_JORGEN = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_439_Vatras_DI))
		{
			DI_CHECK_VATRAS = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack_DI))
		{
			DI_CHECK_JACK = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_449_Lares_DI))
		{
			DI_CHECK_LARES = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(djg_705_angar_li))
		{
			LI_CHECK_ANGAR = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(djg_713_biff_li))
		{
			LI_CHECK_BIFF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nov_600_pedro_li))
		{
			LI_CHECK_PEDRO = TRUE;
			if(MIS_HELPPEDRO == LOG_Running)
			{
				MIS_HELPPEDRO = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HELPPEDRO);
			};
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_207_girion_li))
		{
			LI_CHECK_GIRION = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_fighter_li))
		{
			LI_CHECK_FIGHTER = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_mage_li))
		{
			LI_CHECK_MAGE = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_psionic_li))
		{
			LI_CHECK_PSIONIC = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_thief_li))
		{
			LI_CHECK_THIEF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_800_lee_li))
		{
			LI_CHECK_LEE = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_801_torlof_li))
		{
			LI_CHECK_TORLOF = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_809_bennet_li))
		{
			LI_CHECK_BENNET = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_811_wolf_li))
		{
			LI_CHECK_WOLF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_4250_jorgen_li))
		{
			LI_CHECK_JORGEN = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_439_vatras_li))
		{
			LI_CHECK_VATRAS = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_444_jack_li))
		{
			LI_CHECK_JACK = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_449_lares_li))
		{
			LI_CHECK_LARES = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Zdá se, že jsem mluvil s každým. Nyní je třeba informovat kapitána.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_404_Lutero))
		{
			if(MIS_TRADEGUILD == LOG_Running)
			{
				MIS_TRADEGUILD = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_TRADEGUILD);
			};
			if(MIS_BENGARORDER == LOG_Running)
			{
				MIS_BENGARORDER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_OBSOLETE);
			};
			if(MIS_JORAHELP == LOG_Running)
			{
				MIS_JORAHELP = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_JORAHELP,LOG_OBSOLETE);
			};
			if(MIS_CHURCHDEAL == LOG_Running)
			{
				MIS_CHURCHDEAL = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			};
			if(MIS_RARETHINGS == LOG_Running)
			{
				MIS_RARETHINGS = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_OBSOLETE);
			};
			if(MIS_BLACKBRENDI == LOG_Running)
			{
				MIS_BLACKBRENDI = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_OBSOLETE);
			};
			if(MIS_TRADEHELPER == LOG_Running)
			{
				MIS_TRADEHELPER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_OBSOLETE);
			};
			if(MIS_PALADINFOOD == LOG_Running)
			{
				MIS_PALADINFOOD = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_OBSOLETE);
			};
			if(MIS_SARAHTOGUILD == LOG_Running)
			{
				MIS_SARAHTOGUILD = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_OBSOLETE);
			};
			if(MIS_ONARBUSINESS == LOG_Running)
			{
				MIS_ONARBUSINESS = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_OBSOLETE);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_116_mud))
		{
			MUDISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_409_Zuris))
		{
			ZURISISDEAD = TRUE;

			if(MIS_JORAHELP == LOG_Running)
			{
				B_LogEntry(TOPIC_JORAHELP,"Zabil jsem Zurise, bylo to jediné řešení!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_705_Angar))
		{
			ANGARISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6130_benchel))
		{
			BENCHELISDEAD = TRUE;
			if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE) && (BENCHELFOLLOWME == FALSE))
			{
				B_LogEntry(TOPIC_BLACKBRENDI,"Banditi zabili Benchela, Lutero nebude rád.");
			}
			else if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE) && (BENCHELFOLLOWME == TRUE))
			{
				B_LogEntry(TOPIC_BLACKBRENDI,"Benchel je mrtvý! Lutero mě asi nepochválí.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9000_bandit))
		{
			BENCHELBANDIT0ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9001_bandit))
		{
			BENCHELBANDIT1ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9002_bandit))
		{
			BENCHELBANDIT2ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9003_bandit))
		{
			BENCHELBANDIT3ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9004_bandit))
		{
			BENCHELBANDIT4ISDEAD = TRUE;
		};
		if((BENCHELBANDIT0ISDEAD == TRUE) && (BENCHELBANDIT1ISDEAD == TRUE) && (BENCHELBANDIT2ISDEAD == TRUE) && (BENCHELBANDIT3ISDEAD == TRUE) && (BENCHELBANDIT4ISDEAD == TRUE) && (BENCHELISDEAD == FALSE))
		{
			BENCHELTELLTHANKS = TRUE;
			B_StartOtherRoutine(vlk_6130_benchel,"RestAfterFight");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1075_Addon_Fortuno))
		{
			FORTUNOISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerzombie))
		{
			CORRISTOSENDKILLDEMONDONE = TRUE;
			B_LogEntry(TOPIC_RESCUEGOMEZ,"V kryptě jsem se setkal s nemrtvým nekromantem. Skončil jsem jeho nemrtvou existenci. Nyní je čas vrátit se ke Corristovi.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6123_nigelband_03))
		{
			NIGELBANDITISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
		{
			Npc_RemoveInvItems(self,ItMi_IEDudelGelb,Npc_HasItems(self,ItMi_IEDudelGelb));
			Npc_RemoveInvItems(self,ItLsTorchFirespit,Npc_HasItems(self,ItLsTorchFirespit));
			CHIEFKILLERISDEAD = TRUE;

			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				CHIEFKILLERISDEADX = TRUE;
			};
			if((MIS_GUILDKILL == LOG_Running) && (GUILDKILLKNOWNLOC == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				B_LogEntry(TOPIC_GUILDKILL,"Zabil jsem Asmala.");
			};
			if((BANDHANS_MAIN == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running) && (GOLDRECOVEREDHANS == FALSE))
			{
				GOLDRECOVEREDHANS = TRUE;
				CreateInvItems(self,ItMi_Gold,5000);
			};
			if(TROUBLEWITHASMAL == TRUE)
			{
				CreateInvItems(self,ItMi_Gold,5000);

				if(MIS_KILLTARGETFINAL == LOG_Running)
				{
					MIS_KILLTARGETFINAL = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
					B_LogEntry(TOPIC_KILLTARGETFINAL,"Hansův gang je minulost. Nyní je čas skoncovat s Asmalem.");
				};
			};
			if((MIS_KILLWAY == LOG_Running) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				MIS_KILLWAY = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLWAY,LOG_SUCCESS);

				if(CANBEKILLMASTER == TRUE)
				{
					B_LogEntry(TOPIC_KILLWAY,"Zabil jsem Asmala. Nyní jsem hlavou cechu vrahů!");
					BEKILLMASTER = TRUE;
				}
				else
				{
					B_LogEntry(TOPIC_KILLWAY,"Zabil jsem Asmala, možná unáhleně ale už je pozdě.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6112_hans))
		{
			BANDHANS_MAIN = TRUE;

			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
			if((CHIEFKILLERISDEADX == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running) && (GOLDRECOVEREDHANS == FALSE))
			{
				GOLDRECOVEREDHANS = TRUE;
				CreateInvItems(self,ItMi_Gold,5000);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_110_Urshak))
		{
			URSHAKISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6109_luis))
		{
			KILLTARGET1 = TRUE;
			if(MIS_KILLTARGET1 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET1,"Poslal jsem Lehmara na věčný odpočinek.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_484_Lehmar))
		{
			KILLTARGET2 = TRUE;
			LehmarIsDead = TRUE;

			if(MIS_KILLTARGET2 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET2,"Poslal jsem Lehmara na onen svět a nezapomněl jsem mu poslat pozdrav od Asmala.");
			};
			if((MIS_LemarTheft == LOG_Running) && (Npc_HasItems(hero,ItMi_ParlanRelic_MIS) == FALSE))
			{
				MIS_LemarTheft = LOG_FAILED;
				B_LogEntry_Failed(Topic_LemarTheft);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_468_Canthar))
		{
			KILLTARGET3 = TRUE;
			if(MIS_KILLTARGET3 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET3,"Canthar je mrtvý! Žádná velká ztráta...");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6110_nigel))
		{
			KILLTARGET4 = TRUE;
			if(MIS_KILLTARGET4 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET4,"Zabil jsem Nigela.");
				if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == FALSE))
				{
					B_LogEntry(TOPIC_KILLTARGET4,"Nyní vím, kde jsou Nigelovi peníze.");
				}
				else if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE))
				{
					B_LogEntry(TOPIC_KILLTARGET4,"Nigel je mrtvý a já mu vzal peníze od banditů. Asi bych to měl říct Asmalovi. Nigel se nezadlužil a peníze...");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_6111_rudar))
		{
			KILLTARGET5 = TRUE;
			if(MIS_KILLTARGET5 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET5,"Rudar je mrtvý. Čas návratu k Asmalovi.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6113_hansband_01))
		{
			BANDHANS_CH01 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6114_hansband_02))
		{
			BANDHANS_CH02 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6115_hansband_03))
		{
			BANDHANS_CH03 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6116_hansband_04))
		{
			BANDHANS_CH04 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6117_hansband_05))
		{
			BANDHANS_CH05 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6118_hansband_06))
		{
			BANDHANS_CH06 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6119_hansband_07))
		{
			BANDHANS_CH07 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				HANSKILL = HANSKILL + 1;
			};
		};
		if((BANDHANS_MAIN == TRUE) && (BANDHANS_CH01 == TRUE) && (BANDHANS_CH02 == TRUE) && (BANDHANS_CH03 == TRUE) && (BANDHANS_CH04 == TRUE) && (BANDHANS_CH05 == TRUE) && (BANDHANS_CH06 == TRUE) && (BANDHANS_CH07 == TRUE))
		{
			KILLTARGETFINAL = TRUE;
			
			if(GuideGuildsToCamp == FALSE)
			{
				B_StartOtherRoutine(drpymonte,"GoToBandit1");
				B_StartOtherRoutine(theflail,"GoToBandit2");
				B_StartOtherRoutine(lutter,"GoToBandit3");
				B_StartOtherRoutine(flex,"GoToBandit4");
				B_StartOtherRoutine(charlotte,"GoToBandit5");
				B_StartOtherRoutine(announcer,"GoToBandit6");
				GuideGuildsToCamp = TRUE;
			};
			if((CHIEFKILLERISDEADX == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running))
			{
				B_GivePlayerXP(1000);
				MIS_KILLTARGETFINAL = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
				MIS_KILLWAY = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_KILLWAY);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
		{
			DRPYMONTEISDEAD = TRUE;

			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				DRPYMONTEISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1391_Addon_InExtremo_TheFlail))
		{
			THEFLAILISDEAD = TRUE;
			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				THEFLAILISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
		{
			LUTTERISDEAD = TRUE;
			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				LUTTERISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1396_Addon_InExtremo_Flex))
		{
			FLEXISDEAD = TRUE;
			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				FLEXISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1397_addon_inextremo_charlotte))
		{
			CHARLOTTEISDEAD = TRUE;
			if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
			{
				CHARLOTTEISDEADX = TRUE;
			};
		};
		if((CHARLOTTEISDEAD == TRUE) && (FLEXISDEAD == TRUE) && (LUTTERISDEAD == TRUE) && (THEFLAILISDEAD == TRUE) && (DRPYMONTEISDEAD == TRUE) && (CHIEFKILLERISDEADX == TRUE) && (GUILDKILLISDEAD == FALSE))
		{
			GUILDKILLISDEAD = TRUE;
			if((MIS_GUILDKILL == LOG_Running) && (GUILDKILLKNOWNLOC == TRUE))
			{
				B_LogEntry(TOPIC_GUILDKILL,"Pochopil jsem cestu vrahů.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_316_Wambo)) && (WAMBOISDEAD == FALSE))
		{
			if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
			{
				b_changeguild(pir_1398_addon_inextremo_announcer,GIL_VLK);
				AI_StandupQuick(other);
				Npc_ClearAIQueue(other);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");

				if(Npc_GetDistToWP(hero,"NW_CITY_KILLWAMBO_01") <= 1500)
				{
					KILLCANJOIN = TRUE;
				}
				else
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			}
			else
			{
				if(JOINKILLERS == FALSE)
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			};
		
			WAMBOISDEAD = TRUE;

			if(MIS_KILLWAMBO == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLWAMBO,"Wambo je mrtvý! Je čas se vrátit za Asmalem.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6120_lemarguard))
		{
			ShramIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_600_Pedro))
		{
			if(MIS_HELPPEDRO == LOG_Running)
			{
				MIS_HELPPEDRO = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HELPPEDRO);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			DemonPWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon))
		{
			SenyakIsDead = TRUE;

			if((DESTOYSENYAKSOUL == FALSE) && (USEMORAULARTU == TRUE))
			{
				Npc_RemoveInvItems(self,itmi_stonesoul,1);
				CreateInvItems(self,itmi_stonesoul_senyak,1);
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Chytil jsem duši arcidémona Senyaka.");
				Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_SUCCESS);
				MIS_GOLDDRAGONPORTAL = LOG_SUCCESS;
			}
			else
			{
				Npc_RemoveInvItems(self,itmi_stonesoul,1);
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Arcidémon Senyak je mrtvý!");
				Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_SUCCESS);
				MIS_GOLDDRAGONPORTAL = LOG_SUCCESS;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME == LOG_Running))
		{
			INSANEKILLDONE = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demon_sendsenyak)) && (SENYAK_SENDPACK1 == TRUE) && (TALKSENYAK == FALSE))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE;
			SENYAK_SENDPACK1 = FALSE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_1)) && (SENYAK_SENDPACK2 == TRUE) && (TALKSENYAK == FALSE))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE;
			SENYAK_SENDPACK2 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(darkskeleton1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(darkskeleton2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_2)) && (SENYAK_SENDPACK3 == TRUE) && (TALKSENYAK == FALSE))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE;
			SENYAK_SENDPACK3 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton3_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_3)) && (SENYAK_SENDPACK4 == TRUE) && (TALKSENYAK == FALSE))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE;
			SENYAK_SENDPACK4 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie3_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie4_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SWAMPDRONE))
		{
			her = Hlp_GetNpc(PC_Hero);
			if(Npc_GetDistToNpc(self,other) < 300)
			{
				if((other.flags & NPC_FLAG_IMMORTAL) == 0)
				{
					if(other.guild == GIL_DRAGON)
					{
						other.attribute[ATR_HITPOINTS] -= 25;
					}
					else
					{
						other.attribute[ATR_HITPOINTS] -= 50;
					};
				};
			};
			if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(her))
			{
				if(Npc_GetDistToNpc(self,her) < 300)
				{
					her.attribute[ATR_HITPOINTS] -= 50;
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_Sylvio))
		{
			SYLVIOOW_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
		{
			Diego_IsDead = TRUE;
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_12987_Ituseld)) && (ItuseldIsDead == FALSE))
		{
			ItuseldIsDead = TRUE;
			B_LogEntry(TOPIC_DarkWeb,"Nebyl to snadný boj! Ale nakonec se mi podařilo porazit toho šamana. Vezmu si hlavu jako důkaz pro lorda Hagena. Teprve teď jsem si uvědomil, že Lothar neměl šanci přežít proti tak silnému nepříteli...");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1298_darkmage))
		{
			DARKMAGE_ISDEAD = TRUE;
			if(MIS_ORCTEMPLE != LOG_Running)
			{
				Log_CreateTopic(TOPIC_ORCTEMPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_Running);
			};
			if(Kapitel >= 5)
			{
				B_LogEntry(TOPIC_ORCTEMPLE,"Nekromant, se kterým jsem se setkal v Spáčově chrámu, již není hrozbou - je mrtvý. Našel jsem u něj i svého starého přítele - mocný meč Uriziel, se kterým jsem se kdysi postavil Spáči. Myslím, že teď už jsem konečně připraven utkat se s draky.");
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_SUCCESS);
				MIS_ORCTEMPLE = LOG_SUCCESS;
			}
			else
			{
				B_LogEntry(TOPIC_ORCTEMPLE,"Nekromant, se kterým jsem se setkal v Spáčově chrámu, již není hrozbou - je mrtvý. Našel jsem u něj i svého starého přítele - mocný meč Uriziel, se kterým jsem se kdysi postavil Spáči.");
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_SUCCESS);
				MIS_ORCTEMPLE = LOG_SUCCESS;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(alef_soul))
		{
			ALEFISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(riordian_zombie))
		{
			RIORDANEVILDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_1)) && (GomezWSIsDead_01 == FALSE))
		{
			if(GOMEZSOULTALK_1 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_01 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_2)) && (GomezWSIsDead_02 == FALSE))
		{
			if(GOMEZSOULTALK_2 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_02 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_3)) && (GomezWSIsDead_03 == FALSE))
		{
			if(GOMEZSOULTALK_3 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_03 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_4)) && (GomezWSIsDead_04 == FALSE))
		{
			if(GOMEZSOULTALK_4 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_04 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_5)) && (GomezWSIsDead_05 == FALSE))
		{
			if(GOMEZSOULTALK_5 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!.");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_05 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_6)) && (GomezWSIsDead_06== FALSE))
		{
			if(GOMEZSOULTALK_6 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_06 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_7)) && (GomezWSIsDead_07 == FALSE))
		{
			if(GOMEZSOULTALK_7 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_07 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_8)) && (GomezWSIsDead_08 == FALSE))
		{
			if(GOMEZSOULTALK_8 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_08 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_9)) && (GomezWSIsDead_09 == FALSE))
		{
			if(GOMEZSOULTALK_9 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_09 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_10)) && (GomezWSIsDead_10 == FALSE))
		{
			if(GOMEZSOULTALK_10 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_10 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_11)) && (GomezWSIsDead_11 == FALSE))
		{
			if(GOMEZSOULTALK_11 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_11 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_12)) && (GomezWSIsDead_12 == FALSE))
		{
			if(GOMEZSOULTALK_12 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_12 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_13)) && (GomezWSIsDead_13 == FALSE))
		{
			if(GOMEZSOULTALK_13 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Duchové ve Starém dole Gomezovi odpustili! Nyní je třeba vrátit se na hrad a získat odpuštění od mágů Ohně!");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_13 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_14)) && (GomezWSIsDead_14 == FALSE))
		{
			if(GOMEZSOULTALK_14 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Zabil jsem většinu duchů aniž bych si s nimi promluvil o Gomezovi. Rudobaron tak zůstane navěky proklet! A já už nikdy nezískám figurky pro Lutera! Je třeba vrátit se do města a informovat ho.");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_14 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_15)) && (GomezWSIsDead_15 == FALSE))
		{
			if(GOMEZSOULTALK_15 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = "Zabil jsem ducha.";
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Zabil jsem většinu duchů aniž bych si s nimi promluvil o Gomezovi. Rudobaron tak zůstane navěky proklet! A já už nikdy nezískám figurky pro Lutera! Je třeba vrátit se do města a informovat ho.");
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_15 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_4))
		{
			Wld_SendTrigger("EVT_TPL_07_MSGFILTER_TO_PRIESTDOOR");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_hr))
		{
			Wld_SendTrigger("EVT_TPL_LASTEVENT_SLEEPERGATE_01");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_darkshpere)) && (SHEMRON_DEMON_INS == FALSE))
		{
			Wld_InsertNpc(shemron_demon,"FP_ROAM_MT_SHEMRON");
			SHEMRON_DEMON_INS = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader1))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem jednoho z nejvyšších skřetích šamanů - Varrag-Shatana.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader2))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem jednoho z nejvyšších skřetích šamanů - Varrag-Kazorga.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader3))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem jednoho z nejvyšších skřetích šamanů - Varrag-Hashora.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader4))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem jednoho z nejvyšších skřetích šamanů - Varrag-Nazula.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader5))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem jednoho z nejvyšších skřetích šamanů - Varrag-Hatashe.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_adw_leader))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Zabil jsem vůdce hordy Ur-Katana.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_103_dragon_gold))
		{
			DragonGoldIsDead = TRUE;

			if((KNOWS_CRESTMAKE == FALSE) && (MIS_GOLDDRAGONPORTAL == LOG_Running))
			{
				B_LogEntry_Failed(TOPIC_GOLDDRAGONPORTAL);
				MIS_GOLDDRAGONPORTAL = LOG_FAILED;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie_addon_gomez))
		{
			Wld_InsertNpc(none_104_gomez,"OC_EBR_DARK_ROOM_IN");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10022_Addon_Miguel))
		{
			MIGUEL_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1080_Addon_Tom))
		{
			TOM_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10014_Addon_Thorus))
		{
			THORUS_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1098_Addon_Snaf))
		{
			SNAF_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1086_Addon_Scatty))
		{
			SCATTY_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fisk))
		{
			FISK_ISDEAD = TRUE;
			if(MIS_RATFORDFISK == LOG_Running)
			{
				MIS_RATFORDFISK = LOG_OBSOLETE;
			};
		};
		if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			self.aivar[AIV_KilledByPlayer] = TRUE;

			if((self.guild < GIL_SEPERATOR_HUM) && (self.guild != GIL_KDM) && (self.guild != GIL_DMT) && (self.guild != GIL_BDT) && (self.aivar[AIV_DropDeadAndKill] == FALSE))
			{
				MadKillerCount = MadKillerCount + 1;
			};
			if((self.guild == GIL_GIANT_BUG) && (MIS_Fester_KillBugs == LOG_Running))
			{
				Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
			};
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swamprat)) && (MIS_KrokoJagd == LOG_Running))
			{
				AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled + 1;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ramon))
			{
				Player_HasTalkedToBanditCamp = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Franco))
			{
				if(MIS_HlpLogan == LOG_Running)
				{
					MIS_HlpLogan = LOG_OBSOLETE;
				};
				if(MIS_HlpEdgor == LOG_Running)
				{
					MIS_HlpEdgor = LOG_OBSOLETE;
				};
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fortuno))
			{
				Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
			};
			if(self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE_OM)
			{
				OLDMINEZCOUNT = OLDMINEZCOUNT + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GoldMinecrawler))
		{
			if((Minecrawler_Killed >= 9) && (Bloodwyn_Spawn == FALSE))
			{
				B_StartOtherRoutine(Bloodwyn,"MINE");
				AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
				Bloodwyn_Spawn = TRUE;
			}
			else
			{
				Minecrawler_Killed = Minecrawler_Killed + 1;
			};
		};

		B_DeletePetzCrime(self);
		self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	};
	if(self.vars[6] == FALSE)
	{
		B_GiveTradeInv(self);
		B_ClearRuneInv(self);

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6027_taliasan))
		{
			B_ClearBookInv(self);
		};

		AI_UnequipWeapons(self);
		self.aivar[AIV_TAPOSITION] = FALSE;

		if(self.aivar[93] == FALSE)
		{
			if(self.aivar[AIV_DeathInvGiven] == FALSE)
			{
				B_GiveDeathInv(self);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Dragon)))
		{
			DragonRegenFast = FALSE;
		};

		self.vars[6] = TRUE;
	};
	if((self.aivar[AIV_StoryBandit] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		self.aivar[AIV_StoryBandit] = TRUE;
	};
};

func int ZS_Dead_loop()
{
	if(self.aivar[93] == TRUE)
	{
		self.aivar[92] = TRUE;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		return LOOP_END;
	}
	else
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan)) && (URHANSPEAKBEFOREBATTLE == TRUE) && (URHANBEATEN == TRUE) && (MIS_CHALLANGEORC == LOG_Running))
		{
			return LOOP_END;
		};
		if(self.aivar[AIV_TAPOSITION] == FALSE)
		{
			B_DragonKillCounter(self);
			self.aivar[AIV_TAPOSITION] = TRUE;
		};

		return LOOP_CONTINUE;
	};

	return LOOP_CONTINUE;
};

func void zs_dead_end()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_EnemyOverride] = TRUE;
		AI_StartState(self,ZS_MM_Rtn_DragonRest,0,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (RavenAway == FALSE))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		Npc_PerceiveAll(self);
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 1;

		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			self.aivar[AIV_MM_RoamEnd] = FALSE;
			Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(self,"BIP01 L HAND");
			Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
		};

		Npc_ClearAIQueue(self);
		AI_Standup(self);
		Npc_PerceiveAll(self);
		AI_PlayAniBS(self,"T_STAND_2_WOUNDED",BS_UNCONSCIOUS);
		AI_StartState(self,ZS_Unconscious,0,"");
	};
};
