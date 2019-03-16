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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Гоблин'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_GREEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_GREEN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Едва ли вы найдете существо злее гоблина. Эти маленькие сволочи всегда ходят толпами и нападают сразу всем скопом. Если вы наткнулись на отряд таких существ, а вашим оружием является палка, - лучше скрыться из виду этих существ, поскольку, нападая толпой, они не оставляют шансов никому...");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Green_B1 >= 15) && (Gobbo_Green_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гоблин'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Основные преимущества: крайне ловок, вследствие чего по нему очень трудно попасть оружием ближнего боя");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Gobbo_Green_B2 = TRUE;
			}
			else if((Gobbo_Green_B1 >= 30) && (Gobbo_Green_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гоблин'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_GREEN,"Тактика боя: гоблины часто сбиваются в стаи, особенно поселяясь в больших пещерах, и в таких случаях становятся особенно опасными. Выманивать их лучше всего по одному, а отстреливать издалека из лука или арбалета, поскольку они хоть и маленькие, но в количестве большем трех представляют совсем немаленькую силу.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Падальщик'");
			Log_CreateTopic(TOPIC_BEAST_SCAVENGER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SCAVENGER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Эти огромные и свирепые бескрылые птицы на деле одни из слабейших обитателей Миртаны. Несмотря на название, эти птицы всеядны и в основном питаются травой, если поблизости нет мертвой туши. В основном падальщики обитают на лугах, неподалеку от людских поселений, в лесах и возле болот. Единственное, что может вызвать затруднения у начинающего путешественника – это кучность падальщиков, которые обычно сбиваются в стаи. Однако почти полное отсутствие интеллекта позволяет выманивать падальщиков поодиночке. Тактика борьбы с этими птицами незамысловата – подойдут любые виды оружия.");
			AI_Print(concatText);
		}
		else
		{
			if((Scavenger_B1 >= 15) && (Scavenger_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Падальщик'");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Основные преимущества: способен быстро бегать и наносить сильные удары клювом");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Уязвимые места: имеет очень слабую защиту против любого оружия, магии и огня");
				AI_Print(concatText);
				Scavenger_B2 = TRUE;
			}
			else if((Scavenger_B1 >= 30) && (Scavenger_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Падальщик'");
				Log_AddEntry(TOPIC_BEAST_SCAVENGER,"Тактика боя: падальщики держатся стаями, но общение между особями не налажено. Поэтому легко выманить одного из стаи.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Волк'");
			Log_CreateTopic(TOPIC_BEAST_WOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WOLF,"Волки - одни из самых привычных животных в мире. Они обитают практически повсеместно: от скалистых гор и дремучих лесов до травянистых равнин. Их шерсть обычно окрашена в светло-серый цвет, с грязно-белыми и черными пятнами. Волки - животные, обладающие социальной структурой, они живут в сообществах, называемых стаями. В каждой стае есть вожак - самый сильный и смелый волк. В охоте их сила заключается в их командной работе. Одинокого волка можно спокойно убить, но целую стаю будет очень сложно победить даже опытному бойцу. Волка сородичи никогда не оставят погибать, но придут ему на помощь всей стаей. Волки нападают группами, атакуя противника острыми клыками. Волки питаются мясом и охотятся на добычу, которую им удастся поймать - чаще всего мясом овец или падальщиков. Охотники ценят волков за их мех и клыки.");
			AI_Print(concatText);
		}
		else
		{
			if((Wolf_B1 >= 10) && (Wolf_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Волк'");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Основные преимущества: способен быстро бегать, имеет неплохую защиту от оружия ближнего боя, кроме этого волки охотятся и нападают стаями");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Wolf_B2 = TRUE;
			}
			else if((Wolf_B1 >= 20) && (Wolf_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Волк'");
				Log_AddEntry(TOPIC_BEAST_WOLF,"Тактика боя: для начала следует приманить одного волка из стаи, а затем убить всю группу одного за другим.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Глорх'");
			Log_CreateTopic(TOPIC_BEAST_SNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SNAPPER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SNAPPER,"Глорхи - хищные создания, древние реликты давно ушедших эпох. Их отличительной чертой является отсутствие передних лап. Вместо этого у них очень сильные задние лапы, позволяющие глорхам быстро бежать и безжалостно нападать. Они атакуют на скорости, разрывая жертву большой, усеянной острыми зубами пастью. Глорхи обитают на границе лесов, травянистых равнинах и гористых территориях с каменной почвой. Главное их преимущество перед соперниками - охота стаями. Глорхи всегда держатся по 3-5 особей. Если один из них подвергся нападению, сородичи придут ему на помощь, поэтому шанс отступить очень мал. Они питаются всем, что сумеют поймать. Их охота весьма эффективна, так как охотятся они группами. Овцы, падальщики, а также молодые волки - в их рационе.");
			Log_AddEntry(TOPIC_BEAST_SNAPPER,"Существует также еще одна разновидность глорхов - так называемый 'черный глорх'. Это идеальная машина для убийства! Их клыки острее бритвы, мышцы крепче скальной породы, а их хвост одним ударом может сломать вам все кости. Будьте осторожны, если вы решили на них поохотиться...");
			AI_Print(concatText);
		}
		else
		{
			if((Snapper_B1 >= 10) && (Snapper_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Глорх'");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Основные преимущества: способен очень быстро бегать, имеет хорошую защиту от оружия ближнего и дальнего боя, глорхи охотятся и нападают стаями");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Уязвимые места: имеет слабую защиту против магии");
				AI_Print(concatText);
				Snapper_B2 = TRUE;
			}
			else if((Snapper_B1 >= 20) && (Snapper_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Глорх'");
				Log_AddEntry(TOPIC_BEAST_SNAPPER,"Тактика боя: отстреливать их из лука нелегко — они чересчур быстро передвигаются, к тому же предпочитают двигаться стаей, поэтому в бою с ними более предпочтительны мечи и топоры, чем больше — тем лучше.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Мракорис'");
			Log_CreateTopic(TOPIC_BEAST_SHADOWBEAST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SHADOWBEAST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Мракорисы - порождения тьмы, настоящий ужас дремучих лесов и пещер. Эти огромные мохнатые монстры с рогом появляются из ниоткуда и исчезают в никуда. Поистине мракорисы – одни из самых грозных хищников Миртаны, сильнейшие из которых дадут фору даже молодым троллям. Мракорисы любят жить в пещерах, куда стаскивают свою добычу, отчего пещера становится настоящим кладбищем как четвероногим, так и двуногим созданиям. Другое излюбленное место обитания мракориса – дремучие леса и болота, куда не проникает солнечный свет, что делает этих монстров вдвойне опасными. Обладая прочнейшей шкурой, лапами, от удара которых не спасут практически никакие доспехи, эти создания не оставляют шансов на выживание простому смертному.");
			AI_Print(concatText);
		}
		else
		{
			if((ShadowBeast_B1 >= 5) && (ShadowBeast_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Мракорис'");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Основные преимущества: имеет огромную силу удара, очень хорошую защиту от оружия ближнего боя и большой запас здоровья");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Уязвимые места: имеет слабую защиту против оружия дальнего боя и магии, не любит дневной свет");
				AI_Print(concatText);
				ShadowBeast_B2 = TRUE;
			}
			else if((ShadowBeast_B1 >= 10) && (ShadowBeast_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Мракорис'");
				Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Тактика боя: длина и сила используемого вами оружия, а также несомненно ваша реакция - вот основные пункты, которые решают в бою с мракорисом. Кроме того, без хороших доспехов также не стоит становиться на пути этого чудовища.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Аллигатор'");
			Log_CreateTopic(TOPIC_BEAST_ALLIGATOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ALLIGATOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Аллигаторы обитают неподалеку от водоемов или же прямо в них, так что не удивляйтесь, если рядом с какой-нибудь рекой или оазисом внезапно нападет эта рептилия. Обычно аллигатора трудно заметить издалека, так как он прячется либо в воде, либо в каком-нибудь ином природном укрытии - траве, например. Встретить более одного крокодила в одном месте достаточно тяжело.");
			AI_Print(concatText);
		}
		else
		{
			if((Alligator_B1 >= 3) && (Alligator_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Аллигатор'");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Основные преимущества: хорошая защита от всех видов оружия ближнего боя, его мощные челюсти способны прокусить почти любую броню, довольно живуч");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Уязвимые места: имеет слабую защиту против магии и огня");
				AI_Print(concatText);
				Alligator_B2 = TRUE;
			}
			else if((Alligator_B1 >= 5) && (Alligator_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Аллигатор'");
				Log_AddEntry(TOPIC_BEAST_ALLIGATOR,"Тактика боя: лучше всего против аллигатора использовать огонь или магию. А также не стоит тратить на него драгоценные болты и стрелы, поскольку его толстая кожа практически непробиваема для них.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Богомол'");
			Log_CreateTopic(TOPIC_BEAST_BLATTCRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLATTCRAWLER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Гигантский богомол чаще всего встречается в южной части остров Хоринис. Он очень опасен из-за длины своих лап, которые без труда могут пробить даже хорошо укрепленный доспех. Поодиночке их встретить практически невозможно, что само по себе превращает это насекомое в еще более опасного противника.");
			AI_Print(concatText);
		}
		else
		{
			if((Blattcrawler_B1 >= 10) && (Blattcrawler_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Богомол'");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Основные преимущества: хорошая защита от всех видов оружия ближнего боя");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Уязвимые места: имеет слабую защиту против оружия дальнего боя, огня и магии");
				AI_Print(concatText);
				Blattcrawler_B2 = TRUE;
			}
			else if((Blattcrawler_B1 >= 20) && (Blattcrawler_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Богомол'");
				Log_AddEntry(TOPIC_BEAST_BLATTCRAWLER,"Тактика боя: проще и безопаснее всего расстреливать богомолов из лука или арбалета, однако, если дело дошло до ближнего боя, - лучше стараться удерживать богомола на расстоянии, подальше от его мощных лап.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Гул'");
			Log_CreateTopic(TOPIC_BEAST_BLOODHOUND,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODHOUND,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Создание, обитающее строго в отдаленных местностях, таких как горные пещеры или пустынные скалы. Очень агрессивный и решительный, этот зверь заставляет быть крайне внимательным и осторожным всякого, кто имеет с ним дело. Внешность гула может показаться немного причудливой из-за тонкого строения тела и низкорасположенной головы на длинной шее. Но, несмотря на особенности телосложения, у них очень сильные ноги, позволяющие им быстро бегать и далеко прыгать. Цвет кожи - коричневый с оттенками серого и черного. Гула сложно убить из-за его скорости, которая дает ему огромное преимущество.");
			AI_Print(concatText);
		}
		else
		{
			if((Bloodhound_B1 >= 3) && (Bloodhound_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гул'");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Основные преимущества: имеет невероятную силу удара и довольно неплохую защиту от оружия ближнего боя, магии и огня.");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Уязвимые места: небольшой запас здоровья");
				AI_Print(concatText);
				Bloodhound_B2 = TRUE;
			}
			else if((Bloodhound_B1 >= 5) && (Bloodhound_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гул'");
				Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"Тактика боя: следует использовать тактику 'удар-отступление', так как гул не даст вам шанса нанести удар дважды.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Черный гоблин'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_BLACK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Черные гоблины сильнее, умнее, хитрее обычных гоблинов и часто занимают лучшие места — самые теплые пещеры и самые выгодные дороги. Нередко встреча с гоблинами происходит неожиданно - выскакивая из темного угла, они, всей гурьбой и с дикими боевыми воплями, нападают на ошеломленного путника. В единственном числе не являются серьезными противниками, но еще никто и никогда не встречал одинокого черного гоблина. Как и обычные гоблины, они превратили свой маленький рост из недостатка в достоинство, и в бою стараются окружить противника. А поскольку движутся они очень быстро, все время стремясь зайти за спину, - попасть в них довольно нелегко. К тому же пока вы бьете того гоблина, что волею случая оказался перед вами, другие наносят удары вам в спину! Нередко в бандах черных гоблинов появляются так называемые 'гоблины-воины', выполняющие, судя по всему, роль вожаков в черно-гоблинских кодлах. Обладая телосложением крепче, чем у остальных сородичей, они вооружаются более смертоносным оружием и иногда даже облачаются в нечто похожее на доспехи.");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Black_B1 >= 15) && (Gobbo_Black_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный гоблин'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Основные преимущества: быстрота и проворство делают из черного гоблина очень трудную мишень для оружия как ближнего, так и дальнего боя; вооружены лучше, чем простые гоблины, некоторых из них защищают легкие доспехи");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Уязвимые места: имеет довольно слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Gobbo_Black_B2 = TRUE;
			}
			else if((Gobbo_Black_B1 >= 30) && (Gobbo_Black_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный гоблин'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_BLACK,"Тактика боя: тактика боя с черными гоблинами ничем не отличается от тактики с обычными.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Белый волк'");
			Log_CreateTopic(TOPIC_BEAST_ICEWOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEWOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEWOLF,"В отличие от обычных волков, эти звери живут исключительно в ледяных и снежных районах. У них строго белый цвет шерсти, иногда с оттенками серого, что придает им защитный цвет в их естественном окружении. Их красные глаза особенно пугающие. Как и другие волки, снежные волки живут большими стаями, за редкими исключениями. Охота стаей дает им основное преимущество против их добычи. Снежные волки значительно сильнее обычных волков, а их пасти полны острых клыков. Благодаря их силе и навыкам охоты они могут охотиться на любое животное, какое захотят. Почти каждое снежное животное входит в их меню, в основном олени и дикие вепри. Эти звери - сложные соперники для бойцов из-за того, что они почти никогда не встречаются поодиночке. Если на одного представителя стаи нападают - другие сразу же бросятся ему на помощь.");
			AI_Print(concatText);
		}
		else
		{
			if((Icewolf_B1 >= 5) && (Icewolf_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Белый волк'");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Основные преимущества: способен быстро бегать, имеет хорошую защиту от оружия ближнего боя и больший запас здоровья по сравнению с обычными волками");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Уязвимые места: имеет слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Icewolf_B2 = TRUE;
			}
			else if((Icewolf_B1 >= 10) && (Icewolf_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Белый волк'");
				Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Тактика боя: снежных волков лучше убивать поодиночке, поскольку в стае они представляют огромную опасность.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Дикий кабан'");
			Log_CreateTopic(TOPIC_BEAST_KEILER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_KEILER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_KEILER,"Диких кабанов можно встретить практически везде - на дорогах, в лесах, в горной местности, в пещерах, у водоемов и в прочих местах. Как в песочной пустыне, так и в снежной не встречаются. Острые, как клинок, клыки увенчивают морду кабанов - у самцов они достигают поистине ужасающих размеров, способных просто-напросто разорвать противника. Дикие кабаны крайне агрессивны и нападают, как только видят цель. Встречаются как стаями, так и поодиночке.");
			AI_Print(concatText);
		}
		else
		{
			if((Keiler_B1 >= 10) && (Keiler_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Дикий кабан'");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Основные преимущества: хорошая защита от оружия ближнего боя, при атаке впадает в безудержную ярость");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Уязвимые места: имеет довольно слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Keiler_B2 = TRUE;
			}
			else if((Keiler_B1 >= 20) && (Keiler_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Дикий кабан'");
				Log_AddEntry(TOPIC_BEAST_KEILER,"Тактика боя: лучше использовать луки или арбалеты в бою с дикими кабанами. В ближнем бою это монстры довольно-таки сильны и могут мгновенно нанести вам смертельный удар.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Зомби'");
			Log_CreateTopic(TOPIC_BEAST_ZOMBIE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ZOMBIE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Зомби – белиаровы псы – незавидное будущее тех, кто при жизни сделал грязных дел больше, чем праведных. Их дух насильно возвращен из Тьмы и помещен в наказание существованием в гниющей плоти. Муки продлятся до тех пор, пока цела поддерживаемая темной магией оболочка. Зомби обладают потрясающим нюхом, легко ориентируются в темных помещениях. Они безразличны к любым повреждениям - их плоть давно уже ничего не чувствует. Остановить их можно, отрубив голову, расчленив тело, уничтожить тушу магией или сжечь в жарком костре. Крик души при уничтожении вместилища подскажет борцу с тьмой, что узы, связывающие плоть и дух зомби – пали.");
			AI_Print(concatText);
		}
		else
		{
			if((Zombie_B1 >= 10) && (Zombie_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Зомби'");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Основные преимущества: абсолютно не чувствует боли, что позволяет им безостановочно атаковать свою жертву");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Уязвимые места: имеет крайне слабую защиту от огня");
				AI_Print(concatText);
				Zombie_B2 = TRUE;
			}
			else if((Zombie_B1 >= 20) && (Zombie_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Зомби'");
				Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Тактика боя: самое главное учитывать то, что зомби не чувствуют боли. Их ужасающий напор может вначале вас поставить в тупик. Поэтому ваша реакция и молниеносные контратаки - основной залог успеха в бою с этими монстрами.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Орочий кусач'");
			Log_CreateTopic(TOPIC_BEAST_ORCBITER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCBITER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCBITER,"Маленькие быстрые охотники, дальние родственники глорхов и остеров, они живут по большей части в небольших горных долинах, поросших зеленой сочной травой, хотя маленькие стайки этих монстров могут встретиться вам где угодно. Поодиночке они не очень опасны, но предпочитают держаться стайками, и тем самым исходящая от них опасность увеличивается многократно. Больше всего на свете они любят падальщиков, и иногда можно увидеть, как кусачи гоняются за ними, правда, чаще всего просто ради забавы, но при случае не откажутся и от человеческого мяса. К тому же в стае они чувствуют себя явно намного более смелыми, чем поодиночке.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcBiter_B1 >= 5) && (OrcBiter_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орочий кусач'");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Основные преимущества: способен довольно быстро бегать");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Уязвимые места: имеет крайне слабую защиту от всех видов оружия и магии");
				AI_Print(concatText);
				OrcBiter_B2 = TRUE;
			}
			else if((OrcBiter_B1 >= 10) && (OrcBiter_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орочий кусач'");
				Log_AddEntry(TOPIC_BEAST_ORCBITER,"Тактика боя: когда кусач бежит вам навстречу, нужно держать оружие наготове. От его удара можно либо уклониться, после чего атаковать самому, либо контратаковать.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Бритвозуб'");
			Log_CreateTopic(TOPIC_BEAST_RAZOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_RAZOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_RAZOR,"Бритвозубы — родственный глорхам вид. И, как и глорхи, эти звери охотятся стаями. Однако они намного страшнее, и не только для новичков, но и для опытных воинов. Превосходя глорхов в скорости, силе и неистовстве, бритвозубы постоянно ослеплены яростью и нападают на все, что движется, будь то зверь, человек или просто дерево. Они охотятся даже когда не голодны, - просто чтобы удовлетворить свою страсть к убийству, а опасность, исходящая от стаи этих тварей, возрастает согласно квадрату числа монстров в стае.");
			AI_Print(concatText);
		}
		else
		{
			if((Razor_B1 >= 5) && (Razor_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Бритвозуб'");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Основные преимущества: превосходно защищены от оружия ближнего боя и огня");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Уязвимые места: имеет слабую защиту от магии");
				AI_Print(concatText);
				Razor_B2 = TRUE;
			}
			else if((Razor_B1 >= 10) && (Razor_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Бритвозуб'");
				Log_AddEntry(TOPIC_BEAST_RAZOR,"Тактика боя: бритвозубы уязвимы для выстрелов из лука и арбалета, чувствительны к магии Воды. Но не рассчитывайте на легкую победу и заранее готовьтесь к трудному и молниеносному бою! Если за четверть минуты вы не уложите всех тварей стаи, они съедят на завтрак пришедшую к ним добычу. И даже не подавятся доспехами и оружием.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Призрак'");
			Log_CreateTopic(TOPIC_BEAST_GHOST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GHOST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GHOST,"В призрака превращаются умершие насильственной смертью. Можно встретить на кладбищах или домах, в которых они жили при жизни. Маги и ученые неустанно спорят о том, действительно ли души отравляются после смерти в мир иной, где их ждут вечная радость или страдание. Обе группы, однако, согласны с тем, что происходит с душами, которые по каким-то причинам остаются в нашем мире: они становятся призраками. Судя по причитаниям этих созданий, завидовать их судьбе не стоит.");
			AI_Print(concatText);
		}
		else
		{
			if((Ghost_B1 >= 3) && (Ghost_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Призрак'");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Основные преимущества: абсолютно невосприимчив к оружию ближнего или дальнего боя, если только оно не сделано из серебра");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Уязвимые места: имеет довольно слабую защиту от магии и огня");
				AI_Print(concatText);
				Ghost_B2 = TRUE;
			}
			else if((Ghost_B1 >= 5) && (Ghost_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Призрак'");
				Log_AddEntry(TOPIC_BEAST_GHOST,"Тактика боя: против призрака лучше всего использовать оружие, сделанное из серебра, или же обычную магию.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Каменный страж'");
			Log_CreateTopic(TOPIC_BEAST_STONEGUARDIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGUARDIAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Каменные статуи, оживленные с помощью магии, чтобы защищать храмы и жилища народа Зодчих от вторжения незваных гостей. Один только их облик отпугивает большую часть взломщиков. Те же, кто не пугается при виде этих грозных чудовищ, обычно умирают вскоре после, разорванные каменными когтями.");
			AI_Print(concatText);
		}
		else
		{
			if((Stoneguardian_B1 >= 10) && (Stoneguardian_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Каменный страж'");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Основные преимущества: практически невосприимчив к оружию дальнего боя, имеет хорошую защиту от магии и огня");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Уязвимые места: имеет очень слабую защиту против любого вида дробящего оружия");
				AI_Print(concatText);
				Stoneguardian_B2 = TRUE;
			}
			else if((Stoneguardian_B1 >= 20) && (Stoneguardian_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Каменный страж'");
				Log_AddEntry(TOPIC_BEAST_STONEGUARDIAN,"Тактика боя: не стоит ждать, пока этот каменный гигант нанесет удар первым, поскольку он может стать для вас и последним. Атакуйте монстра без остановки, либо же используйте магию, чтобы быстро его уничтожить.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Пума'");
			Log_CreateTopic(TOPIC_BEAST_STONEPUMA,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEPUMA,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Как правило, пумы обитают в южных землях Хориниса. У них практически нет врагов в окружающей среде. Острые клыки и когти пумы, вкупе с огромной скоростью передвижения, не оставляют врагам почти ни единого шанса на спасение. Все это надо учитывать, чтобы не стать ее очередной жертвой. Пумы редко живут в стаях и предпочитают охотиться в одиночку.");
			AI_Print(concatText);
		}
		else
		{
			if((StonePuma_B1 >= 3) && (StonePuma_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Пума'");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Основные преимущества: огромная скорость передвижения, хорошая защита от оружия ближнего боя");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Уязвимые места: имеет очень слабую защиту от оружия дальнего боя, огня и магии");
				AI_Print(concatText);
				StonePuma_B2 = TRUE;
			}
			else if((StonePuma_B1 >= 5) && (StonePuma_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Пума'");
				Log_AddEntry(TOPIC_BEAST_STONEPUMA,"Тактика боя: лучше всего воспользоваться луком или арбалетом, чтобы расстрелять пуму издалека, прежде чем она до вас доберется.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Болотная муха'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPDRONE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPDRONE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Болотные мухи - крупные летающие насекомые зеленого цвета с ядовитым жалом. Обычно они обитают на больших болотах. Глаза у болотных мух недоразвитые, зато обоняние очень острое, так что добычу они чуют издалека. Обнаружив подходящую жертву, рой болотных мух окружает ее и безжалостно жалит, чтобы лишить возможности сопротивляться.");
			AI_Print(concatText);
		}
		else
		{
			if((SwampDrone_B1 >= 5) && (SwampDrone_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотная муха'");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Основные преимущества: способна вызвать сильное отравление");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Уязвимые места: имеет очень слабую защиту от любого типа оружия, магии и огня");
				AI_Print(concatText);
				SwampDrone_B2 = TRUE;
			}
			else if((SwampDrone_B1 >= 10) && (SwampDrone_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотная муха'");
				Log_AddEntry(TOPIC_BEAST_SWAMPDRONE,"Тактика боя: уничтожать болотных мух проще всего с помощью лука, арбалета или магии.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Болотный голем'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Эти зловонные порождения болот обладают невероятной силой, и способны использовать магию. Подчас их довольно трудно заметить среди болотных зарослей, что делает этих великанов более опасными противниками по сравнению с другими големами.");
			AI_Print(concatText);
		}
		else
		{
			if((Swampgolem_B1 >= 5) && (Swampgolem_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотный голем'");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Основные преимущества: имеет превосходную защиту от стрел и болтов, хорошую защиту от дробящего оружия, огня и магии");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Уязвимые места: имеет очень слабую защиту от режущего типа оружия");
				AI_Print(concatText);
				Swampgolem_B2 = TRUE;
			}
			else if((Swampgolem_B1 >= 10) && (Swampgolem_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотный голем'");
				Log_AddEntry(TOPIC_BEAST_SWAMPGOLEM,"Тактика боя: ближний бой - почти единственный способ одолеть эту груду земли и корней. Наиболее эффективно использование режущего оружия.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Кровяной шершень'");
			Log_CreateTopic(TOPIC_BEAST_BLOODFLY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODFLY,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Кровяные шершни — злобные летающие дьяволы, во множестве собирающиеся у любого источника воды, какой они только смогут найти. Своими длинными изогнутыми жалами они высасывают кровь у любого, осмелившегося подойти достаточно близко, а характерный стрекот их полупрозрачных крыльев повергает в бегство многих мелких животных. Шершни не очень сильные противники, однако, как правило, нападают на жертву всем роем, предварительно окружив ее со всех сторон.");
			AI_Print(concatText);
		}
		else
		{
			if((BloodFly_B1 >= 15) && (BloodFly_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Кровяной шершень'");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Основные преимущества: способен вызвать отравление");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Уязвимые места: имеет очень слабую защиту от любого типа оружия, магии и огня");
				AI_Print(concatText);
				BloodFly_B2 = TRUE;
			}
			else if((BloodFly_B1 >= 30) && (BloodFly_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Кровяной шершень'");
				Log_AddEntry(TOPIC_BEAST_BLOODFLY,"Тактика боя: лучше всего уничтожать шершней из лука, арбалета или с помощью магии. Вступать с ними в близкий контакт и пытаться насадить на острие меча не рекомендуется, по крайней мере, пока у вас не появятся тяжелые доспехи, надежно защищающие от их смертоносных жал.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Демон'");
			Log_CreateTopic(TOPIC_BEAST_DEMON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DEMON,"Демоны — порождения загробного мира, мира смерти и страха Белиара. Есть много разновидностей демонов, но лишь самые маленькие и слабые позволяют людям призывать себя и верой и правдой служат своим хозяевам. Они серьезные противники и способны доставить немало неприятностей даже сильному и смелому герою. Демоны являются одними из самых опасных и могущественных жителей этого мира. Являясь магическими созданиями, они очень хорошо защищены и наделены мощью, опасной почти для всех видов противников.");
			AI_Print(concatText);
		}
		else
		{
			if((Demon_B1 >= 5) && (Demon_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демон'");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Основные преимущества: невероятная сила, отличная защита от любого вида оружия, магии и огня, огромный запас здоровья, имеет дистанционную атаку магией");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Demon_B2 = TRUE;
			}
			else if((Demon_B1 >= 10) && (Demon_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демон'");
				Log_AddEntry(TOPIC_BEAST_DEMON,"Тактика боя: главное, не дать ему вас ударить или задеть магией, иначе исход боя будет практически предрешен.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Архидемон'");
			Log_CreateTopic(TOPIC_BEAST_DEMON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Архидемоны стоят во главе демонических орд и являются своего рода элитой потустороннего мира. Они слишком сильны, чтобы кто-то из людей осмеливался иметь с ними дело иначе, как в сражении, но из такого боя победителем выходит чаще всего не человек. Они страшные бойцы — сильные, ловкие, живучие и совершенно неуязвимые для обычного оружия. Мечи, топоры, булавы — все это просто ломается, едва коснувшись их, а стрелы и арбалетные болты сгорают еще в полете. Лишь у могущественного воина или мага есть шанс выйти живым из смертельной схватки с архидемоном.");
			AI_Print(concatText);
		}
		else
		{
			if((DemonLord_B1 >= 5) && (DemonLord_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Архидемон'");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Основные преимущества: невероятная сила, отличная защита от любого вида оружия, магии и огня, огромный запас здоровья, имеет дистанционную атаку магией");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Уязвимые места: - нет -");
				AI_Print(concatText);
				DemonLord_B2 = TRUE;
			}
			else if((DemonLord_B1 >= 10) && (DemonLord_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Архидемон'");
				Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Тактика боя: любая ошибка в бою с архидемоном будет стоить вам жизни. Так что постарайтесь не допускать их!");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Звероящер'");
			Log_CreateTopic(TOPIC_BEAST_DRACONIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRACONIAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Звероящеры — это раса двуногих человекоподобных рептилий схожих с ящерицами. Они носят самодельные доспехи красного, как и их чешуя, цвета и вооружены большими клинками, которыми орудуют в бою. Их язык непостижим для людей, так как состоит из шипения и хрипа. Они также чрезвычайно агрессивны в отношении врагов и нападают на них схожим с орками образом. Высокоразумны — способны даже ковать свое собственное оружие и доспехи, а также выполнять сложные обязанности, такие как наблюдение за яйцами дракона или накапливание сокровищ для своих хозяев.");
			AI_Print(concatText);
		}
		else
		{
			if((Draconian_B1 >= 15) && (Draconian_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Звероящер'");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Основные преимущества: огромная сила, отличная защита от любого вида оружия, магии и огня, разумны");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Draconian_B2 = TRUE;
			}
			else if((Draconian_B1 >= 30) && (Draconian_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Звероящер'");
				Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Тактика боя: ваша реакция и высокая степень владения оружием ближнего боя - единственный ключ к победе над этими тварями.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Дракон'");
			Log_CreateTopic(TOPIC_BEAST_DRAGON_FIRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGON_FIRE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Драконы - древние существа, которые являются чуть ли не полубогами. Некогда их были тысячи, но постепенно, по причине веков, природных бедствий или битв, они исчезли до отметки, при которой стали чуть более, чем легендой по мнению народа. Это крайне опасные существа, способные быстро восстанавливать свое здоровье, а также владеющие безмерными магическими способностями, могуществом и таинственной силой вдобавок к умственным способностям.");
			AI_Print(concatText);
		}
		else
		{
			if((Dragon_B1 >= 3) && (Dragon_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Дракон'");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Основные преимущества: колоссальный урон магией и огнем, невероятная защита от любого вида оружия, магии и огня, драконы разумны");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Dragon_B2 = TRUE;
			}
			else if((Dragon_B1 >= 5) && (Dragon_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Дракон'");
				Log_AddEntry(TOPIC_BEAST_DRAGON_FIRE,"Тактика боя: хорошая защита от огня и магии - единственный способ остаться в живых после встречи с драконом.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Драконий снеппер'");
			Log_CreateTopic(TOPIC_BEAST_DRAGONSNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGONSNAPPER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Драконий снеппер - одно из самых ужасных существ и идеальная машина для убийств, способная стремительно бегать, далеко прыгать и сокрушительно атаковать. Они напоминают настоящих драконов, которые, конечно же, больше драконьих снепперов. Они, в общем виде, выглядят так же, как обычные снепперы, но имеют несколько отличительных особенностей. К примеру, острые рога на голове и много длинных когтей на лапах. Как и простые снепперы, драконьи бегают на сильных задних лапах. Цвет кожи драконьих снепперов темно-коричневый, рога - грязно-желтые. Встречаются драконьи снепперы практически повсюду: и в скалистых горах, и на зеленых равнинах; держатся обычно группами по нескольку особей, но одиночки тоже не редкость. Их пищей становится все, что попадется у них на пути, - чаще всего падальщики, волки и овцы. Главным оружием этих рептилий является пасть, полная острых зубов. Эти твари очень быстры: сперва своей стремительностью они застают противника врасплох, а затем наносят единственный смертельный удар.");
			AI_Print(concatText);
		}
		else
		{
			if((DragonSnapper_B1 >= 10) && (DragonSnapper_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Драконий снеппер'");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Основные преимущества: огромная скорость передвижения и сила атаки, отличная защита от любого вида оружия и огня, огромный запас здоровья");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Уязвимые места: имеет слабую защиту от магии");
				AI_Print(concatText);
				DragonSnapper_B2 = TRUE;
			}
			else if((DragonSnapper_B1 >= 20) && (DragonSnapper_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Драконий снеппер'");
				Log_AddEntry(TOPIC_BEAST_DRAGONSNAPPER,"Тактика боя: благодаря невероятным силе и скорости они - одни из самых опасных врагов! Поэтому неопытному воину лучше бежать прежде, чем драконий снеппер увидит его, иначе будет уже поздно спасаться.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Огненный голем'");
			Log_CreateTopic(TOPIC_BEAST_FIREGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Состоящие из расплавленных скал и чистейшего огня, неуязвимые для обычного оружия, не знающие усталости и не умеющие отступать, — эти создания были бы идеальными солдатами, если бы хоть одному магу удалось заставить их выполнять его приказы. Они наполовину состоят из магии, и только магия поддерживает и скрепляет их жидкое тело, а стихия огня, причудливо переплетенная с дымящимся камнем, позволяет им использовать в сражении фрагменты первородного пламени, превращающие противника в дымящиеся останки. Они далеко не так сильны и выносливы, как их каменные собратья, и не очень хороши в ближнем бою. Но еще никто не прожил достаточно долго, чтобы сойтись с ними в рукопашной и победить — пламя, покрывающее их, чересчур горячо, чтобы можно было надеяться на победу.");
			AI_Print(concatText);
		}
		else
		{
			if((FireGolem_B1 >= 3) && (FireGolem_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огненный голем'");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Основные преимущества: огромный урон, большой запас здоровья, невосприимчивы к урону огнем");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Уязвимые места: имеет слабую защиту от магии");
				AI_Print(concatText);
				FireGolem_B2 = TRUE;
			}
			else if((FireGolem_B1 >= 6) && (FireGolem_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огненный голем'");
				Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Тактика боя: быстрые контратаки — основной и почти что единственный способ справиться с големами. Кроме того, когда вам придется столкнуться с огненным големом, не забудьте запастись мощными заклинаниями магии Воды.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Огненная ящерица'");
			Log_CreateTopic(TOPIC_BEAST_FIREWARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREWARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Эти рептилии любят тепло и покой, и наиболее вероятно встретить их на песчаном берегу моря, хотя другие хорошо прогревающиеся днем места не менее приятны для этих удивительных животных. В отличие от своих простых сородичей, огненные ящерицы — весьма серьезные противники. И дело не только в прочной коже и почти абсолютном иммунитете к магии Огня. Дело в том, что огненные ящерицы умеют делать то, что не умеет делать больше ни одно существо на всем Хоринисе — они дышат огнем, за считанные секунды превращая противника в дымящиеся угольки.");
			AI_Print(concatText);
		}
		else
		{
			if((FireWaran_B1 >= 5) && (FireWaran_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огненная ящерица'");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Основные преимущества: почти невосприимчивы к урону огнем, наносят урон огнем");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Уязвимые места: имеет слабую защиту от оружия дальнего боя и магии");
				AI_Print(concatText);
				FireWaran_B2 = TRUE;
			}
			else if((FireWaran_B1 >= 10) && (FireWaran_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огненная ящерица'");
				Log_AddEntry(TOPIC_BEAST_FIREWARAN,"Тактика боя: не подходите к ним близко, по крайней мере, ближе, чем нужно для того, чтобы дыхнуть на вас пламенем — вы попросту сгорите! Отстреливайте их издалека из лука, или воспользуйтесь отсутствием защиты против магии Воды и уничтожьте их соответствующими заклинаниями.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Полевой жук'");
			Log_CreateTopic(TOPIC_BEAST_GIANT_BUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GIANT_BUG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Эти шестиногие насекомые получили свое название от пшеничных полей, которые являются их природным местом обитания. Фермеры находятся в постоянной борьбе с полевыми хищниками, которые уничтожают их урожай. Полевые хищники обычно светло-коричневого цвета, но их панцирь немного более темный. У них овальное тело, высокий и толстый панцирь, а щупальца длинные и тонкие. Количество этих существ зависит, как правило, от размеров поля, на котором они живут. Чем больше территория - тем больше полевых хищников. Питаются в основном злаковыми культурами, но некоторые травы не исключены. Полевые хищники атакуют своими передними лапами. Они пытаются запутать жертву, перемещаясь из стороны в сторону.");
			AI_Print(concatText);
		}
		else
		{
			if((Giant_Bug_B1 >= 10) && (Giant_Bug_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Полевой жук'");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Основные преимущества: - нет -");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Giant_Bug_B2 = TRUE;
			}
			else if((Giant_Bug_B1 >= 20) && (Giant_Bug_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Полевой жук'");
				Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"Тактика боя: полевые хищники не должны быть проблемой для хотя бы немного обученного бойца, который легко может убить его оружием ближнего боя.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Гоблин-шаман'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_MAGE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Гоблины глубоко уважают своих шаманов за их магические способности, хотя вряд ли найдется гоблинский шаман, знающий больше одного заклинания. Однако они умеют извлекать немалую пользу из своих ограниченных знаний, к счастью для соплеменников и к несчастью для искателей приключений.");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Shaman_B1 >= 3) && (Gobbo_Shaman_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гоблин-шаман'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Основные преимущества: использует магические руны");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Gobbo_Shaman_B2 = TRUE;
			}
			else if((Gobbo_Shaman_B1 >= 5) && (Gobbo_Shaman_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гоблин-шаман'");
				Log_AddEntry(TOPIC_BEAST_GOBBO_MAGE,"Тактика боя: лучше всего отстреливать их из лука или арбалета. Кроме того, в ближнем бою они практически не представляют никакой опасности.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Гарпия'");
			Log_CreateTopic(TOPIC_BEAST_HARPY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_HARPY,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_HARPY,"Отвратительные летающие создания, гнездящиеся в старых каменных руинах и на вершинах самых высоких скал. В Мордраге распространены страшные сказки о гарпиях, которые уносят младенцев из колыбелей, чтобы затем съесть или убить во время своих страшных обрядов. Разумеется, это не более чем легенды, но зерно правды в этом все же есть: гарпий привлекает все блестящее, и в их гнездах часто скапливается множество совершенно бесполезных вещей, сверкающих и переливающихся на солнце. Они не очень сильны или живучи, но превосходно летают, и никогда не делают это в одиночестве. И если стая таких кошмарных созданий налетит на вас, отбиться будет совсем не легко.");
			AI_Print(concatText);
		}
		else
		{
			if((Harpie_B1 >= 5) && (Harpie_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гарпия'");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Основные преимущества: могут летать, имеет дистанционную атаку магией");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				Harpie_B2 = TRUE;
			}
			else if((Harpie_B1 >= 10) && (Harpie_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Гарпия'");
				Log_AddEntry(TOPIC_BEAST_HARPY,"Тактика боя: Гарпию нетрудно заколоть мечом, но редкая гарпия позволит ткнуть себя этим варварским оружием, поэтому наилучшие результаты дает отстрел гарпий из лука или арбалета. Магия, но в большей степени огонь, - очень эффективное оружие против гарпий.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Ледяной голем'");
			Log_CreateTopic(TOPIC_BEAST_ICEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Эти создания появляются, когда магия воздуха соединяется с чистейшей водой горных озер и замораживает ее, превращая в уже не жидкую, но еще и не твердую субстанцию, похожую на желе. Как и их огненные собратья, они не очень живучи, но в отличие от них не потеряли присущей всем големам силы, и ближний бой с ними обещает быть тяжелым. К тому же, как и огненные големы, они почти неуязвимы для всего немагического оружия — оно просто вязнет в их структуре, не причиняя ни малейшего вреда. Только магия, сильная огненная магия способна растопить скованную магическими силами воду и уничтожить их. Но будьте осторожны: сплетение магии воздуха и воды дает причудливый результат: они способны метать в противника кусочки льда, причиняя тому серьезный урон.");
			AI_Print(concatText);
		}
		else
		{
			if((IceGolem_B1 >= 5) && (IceGolem_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ледяной голем'");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Основные преимущества: огромный урон, большой запас здоровья, почти невосприимчивы к урону магией");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Уязвимые места: имеет очень слабую защиту против огня");
				AI_Print(concatText);
				IceGolem_B2 = TRUE;
			}
			else if((IceGolem_B1 >= 10) && (IceGolem_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ледяной голем'");
				Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"Тактика боя: по большому счету только сильная огненная магия способна растопить скованную магическими силами воду и уничтожить их.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Шныг'");
			Log_CreateTopic(TOPIC_BEAST_LURKER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_LURKER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_LURKER,"Эти амфибии ведут полуводный образ жизни, и вы никогда не встретите их вдали от водоемов. Вода дает им все, что нужно для жизни, и они готовы целый день бродить по берегу озера, лакомясь сочными корнями водяных растений и изредка ныряя за особенно аппетитно выглядящей рыбкой. Они прекрасно плавают и ныряют, и способны оставаться под водой неограниченно долгое время. Но, несмотря на свою любовь к воде, коротать ночь они предпочитают в сухой и теплой пещере, там же они время от времени откладывают яйца и воспитывают потомство.");
			AI_Print(concatText);
		}
		else
		{
			if((Lurker_B1 >= 10) && (Lurker_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Шныг'");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Основные преимущества: неплохая защита от оружия ближнего боя");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Lurker_B2 = TRUE;
			}
			else if((Lurker_B1 >= 20) && (Lurker_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Шныг'");
				Log_AddEntry(TOPIC_BEAST_LURKER,"Тактика боя: шныги не особенно сильные противники, тем более что никогда не объединяются в стаи, и единственное препятствие, встающее на пути молодого героя — их весьма серьезные показатели защиты от оружия ближнего боя. Впрочем, из лука они убиваются так же легко.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Ползун'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Порождения мрака, магии и черной воли Белиара, ползуны — единственные существа, обитающие так глубоко под землей. Неизвестно, зачем они вгрызаются так глубоко в породу, и что они надеются найти в конце своей работы. Одни считают, что таким образом они надеются со временем докопаться до своего повелителя, Белиара, и выпустить его на свободу из его темного царства, другие — что Белиар приказал своим верным слугам охранять земные недра от людей и нелюдей, чтобы никто не мог его потревожить. Вторая гипотеза не лишена смысла, поскольку наиболее часто и охотно ползуны поселяются в шахтах, выкопанных для добычи драгоценной магической руды, и тем самым причиняют немало неприятностей рудокопам, которые часто идут на корм этим тварям. Впрочем, скорее всего, они просто ищут места, где поглубже, а человек копает самые глубокие шахты в Мордраге. Питаются они, вероятно, грибами и плесенью, растущими на стенах их пещер, поскольку еще никто и никогда не видел ползуна, вышедшего на поверхность земли, где имеется другая еда.");
			AI_Print(concatText);
		}
		else
		{
			if((Minecrawler_B1 >= 15) && (Minecrawler_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ползун'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Основные преимущества: хорошая защита от оружия ближнего и дальнего боя");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				Minecrawler_B2 = TRUE;
			}
			else if((Minecrawler_B1 >= 30) && (Minecrawler_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ползун'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLER,"Тактика боя: ползуны — сильные противники, их жвалы способны перекусить человека пополам, а их броня — самый прочный материал в мире среди живых существ. Но умелому бойцу они не причинят особого вреда. К тому же они совершенно беззащитны перед магией, и этим стоит воспользоваться.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Паук'");
			Log_CreateTopic(TOPIC_BEAST_SPIDER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SPIDER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SPIDER,"Лесной хищник высотой примерно с крупную собаку. Он довольно часто встречается в глухих лесах, где плетет свою тонкую, едва заметную – но удивительно прочную паутину. Запутавшаяся жертва обречена – подождав, пока 'ужин' выбьется из сил, паук впрыскивает ей яд, смешанный с желудочным соком – после чего уходит погулять, пока животное или человек не превратится в безжизненную 'флягу' с вкусным и питательным бульоном.");
			AI_Print(concatText);
		}
		else
		{
			if((Spider_B1 >= 5) && (Spider_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Паук'");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Основные преимущества: хорошая защита практически от любого вида урона, кроме магии, мгновенная и молниеносная атака");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Уязвимые места: имеет очень слабую защиту против магии");
				AI_Print(concatText);
				Spider_B2 = TRUE;
			}
			else if((Spider_B1 >= 10) && (Spider_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Паук'");
				Log_AddEntry(TOPIC_BEAST_SPIDER,"Тактика боя: в противостоянии с пауком лучше использовать оружие подлиннее, чтобы не дать пауку возможности укусить.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Ползун-воин'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Ползуны-воины — это настоящие бойцы! В них сошлись воедино сила и стойкость, присущие этим подземным тварям, сам Белиар мог бы гордиться своими созданиями. Если простой ползун перекусывает человека пополам, то ползун-воин рвёт на кусочки шестидюймовый стальной прут. Толстые хитиновые пластины надежно предохраняют их внутренности от оружия ближнего и дальнего боя. Единственное их слабое место — уязвимость к магии и огню. Но не стоит очень уж полагаться на свои силы: эти твари дьявольски живучи, и редко бродят в одиночку, а в рукопашном бою с ними сходиться особенно опасно.");
			AI_Print(concatText);
		}
		else
		{
			if((MinecrawlerWarrior_B1 >= 5) && (MinecrawlerWarrior_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ползун-воин'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Основные преимущества: отличная защита от оружия ближнего и дальнего боя");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				MinecrawlerWarrior_B2 = TRUE;
			}
			else if((MinecrawlerWarrior_B1 >= 10) && (MinecrawlerWarrior_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Ползун-воин'");
				Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Тактика боя: лучше всего воспользоваться мощными заклинаниями, если же вы таковыми не запаслись, и ближнего боя не избежать - выманивайте их по одному, после чего проводите стремительную атаку. Важно не попасть под удар ползуна-воина: это может стоить вам жизни.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Рудный ползун'");
			Log_CreateTopic(TOPIC_BEAST_OREBUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OREBUG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_OREBUG,"Одна из разновидностей ползунов, которые обычно обитают в местах скопления рудных жил. В отличии от своих сородичей они имеет более крепкий панцирь, который надежно защищает их от любого вида урона, в том числе магии и огня, а также огромные клешни, способные превращать в пыль груды камня.");
			AI_Print(concatText);
		}
		else
		{
			if((OreBug_B1 >= 10) && (OreBug_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Рудный ползун'");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Основные преимущества: отличная защита от любого вида урона");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Уязвимые места: - нет -");
				AI_Print(concatText);
				OreBug_B2 = TRUE;
			}
			else if((OreBug_B1 >= 20) && (OreBug_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Рудный ползун'");
				Log_AddEntry(TOPIC_BEAST_OREBUG,"Тактика боя: вам придется повозиться с этими тварями, чтобы отправить их на тот свет. Вас же они туда отправят без особого труда, если вы будете не слишком осторожны.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Кротокрыс'");
			Log_CreateTopic(TOPIC_BEAST_MOLERAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MOLERAT,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MOLERAT,"Помесь крота и крысы, выросшая до гигантских размеров. Обтянутая голой розовой кожей тварь оснащена двойным набором острейших зубов, свободно размещающихся в огромной, почти круглой пасти. Кротокрысы любят сухие просторные пещерки, в которых растет много съедобных грибов. Но, несмотря на пристрастие к грибам, это отнюдь не травоядное животное, и если вы ненароком забредете на его территорию, оно может вас порядочно покусать. Правда, драться кротокрыс не любит, угрожает до последнего, пока вы не подойдете совсем уж близко, и игнорировать вас будет уже просто нельзя.");
			AI_Print(concatText);
		}
		else
		{
			if((Molerat_B1 >= 10) && (Molerat_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Кротокрыс'");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Основные преимущества: - нет -");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Уязвимые места: имеет очень слабую защиту против оружия ближнего и дальнего боя, а также к магии и огню");
				AI_Print(concatText);
				Molerat_B2 = TRUE;
			}
			else if((Molerat_B1 >= 20) && (Molerat_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Кротокрыс'");
				Log_AddEntry(TOPIC_BEAST_MOLERAT,"Тактика боя: кротокрысы опасны лишь новичку, более опытный боец с легкостью будет шинковать этих неповоротливых животных на капусту.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Скелет-маг'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_MAGE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Если опытные воины после смерти становятся бойцами скелетов, то маги — магами скелетов. Как и при жизни, после смерти маги составляют своеобразную аристократию загробного мира — направляют и контролируют своих бойцов, а порой и помогают им или создают новых. До сих пор не выяснено, откуда подобные существа берут энергию для существования.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Mage_B1 >= 5) && (Skeleton_Mage_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет-маг'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Основные преимущества: отличная защита от оружия ближнего и дальнего боя");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Уязвимые места: имеет очень слабую защиту против огня");
				AI_Print(concatText);
				Skeleton_Mage_B2 = TRUE;
			}
			else if((Skeleton_Mage_B1 >= 10) && (Skeleton_Mage_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет-маг'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_MAGE,"Тактика боя: как и все скелеты, он более уязвим к дробящему оружию, чем к рубящему; и, как и на всех скелетов, на него очень эффективно действует огонь.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Каменный голем'");
			Log_CreateTopic(TOPIC_BEAST_STONEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Каменные големы — создания, порожденные магией. Они появляются очень редко и лишь в немногих местах Мордрага, когда могущественная магия сплавляется с камнями горных вершин и оживляет их, создавая самые причудливые в мире создания. Порождения скал, эти создания не ведают боли и страха, им незнакомо чувство усталости, а обладая немалой силой и ловкостью, они готовы преследовать свою жертву до последнего. Против них не годятся ни мечи, ни стрелы, ни заклинания, только тяжелые камнедробильные молоты, или что-нибудь им подобное способно разрушить скалы, составляющие основу каменных големов.");
			AI_Print(concatText);
		}
		else
		{
			if((StoneGolem_B1 >= 5) && (StoneGolem_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Каменный голем'");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Основные преимущества: отличная защита от оружия ближнего и дальнего боя");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Уязвимые места: имеет очень слабую защиту против дробящего оружия");
				AI_Print(concatText);
				StoneGolem_B2 = TRUE;
			}
			else if((StoneGolem_B1 >= 10) && (StoneGolem_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Каменный голем'");
				Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Тактика боя: только тяжелые камнедробильные молоты или что-нибудь им подобное способно разрушить скалы, составляющие основу каменных големов.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Болотожор'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPSHARK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPSHARK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Сложно отнести этих огромных животных к какому-либо классу живых существ, особенно не имея четкого представления об их внутреннем строении. Скорее всего, это все-таки амфибии, хотя с таким же успехам они могут относиться к змеям или кольчатым червям. Живут болотожоры, как нетрудно догадаться, исключительно на болотах, на хорошо прогреваемом солнцем мелководье. Питаются они тем, что в этом болоте водится, вероятно — процеживают воду и ил в поисках питательных веществ или мелких растений и животных. Но и разнообразить свое меню случайно забредшим на болота человеком они, разумеется, не откажутся.");
			AI_Print(concatText);
		}
		else
		{
			if((Swampshark_B1 >= 5) && (Swampshark_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотожор'");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Основные преимущества: отличная защита от оружия ближнего и дальнего боя");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				Swampshark_B2 = TRUE;
			}
			else if((Swampshark_B1 >= 10) && (Swampshark_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Болотожор'");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Тактика боя: они серьёзные противники, не очень быстрые, но неумолимые, как сама смерть, преследующие свою жертву до последнего. И если вы видите приближающегося к вам болотожора, лучше не рискуйте — уйдите с его дороги как можно дальше. Хитиновые пластины, внахлест покрывающие все их круглое длинное тело, очень прочны, и только человеку редкой силы, вооруженному прочным острым мечом, удается пробить их. От стрел они защищены так же хорошо, как и от оружия, и нет смысла стрелять в них из лука или арбалета. Магией их тоже поразить нелегко, хотя и возможно; у них просто нет слабых мест.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Тролль'");
			Log_CreateTopic(TOPIC_BEAST_TROLL,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_TROLL,"Тролли — самые большие и неповоротливые звери Мордрага, очень большие уже в молодом возрасте, а к старости достигающие просто гигантских размеров. Тролль — очень серьезный противник, опасный не своими размерами или силой, но своей защитой и устойчивостью буквально ко всему. Его нельзя убить из лука или арбалета — стрелы и болты просто застревают в его толстой шкуре и слое жира под ней. У него практически абсолютная защита против магии, лишь самые мощные заклинания срабатывают против него.");
			AI_Print(concatText);
		}
		else
		{
			if((Troll_B1 >= 5) && (Troll_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Тролль'");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Основные преимущества: имеет невероятную силу удара, отличная защита от любого вида оружия ближнего или дальнего боя");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Уязвимые места: слишком медленная скорость атаки");
				AI_Print(concatText);
				Troll_B2 = TRUE;
			}
			else if((Troll_B1 >= 10) && (Troll_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Тролль'");
				Log_AddEntry(TOPIC_BEAST_TROLL,"Тактика боя: тролли очень неповоротливы, и, пока он замахивается, чтобы сделать удар, вы десять раз успеете отскочить и три раза ударить. Лучше всего забежать ему за спину и бить, пока он поворачивается, а когда повернется — повторить маневр. Главное не пропустить его удар, иначе он может стать для вас смертельным.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Огр'");
			Log_CreateTopic(TOPIC_BEAST_OGRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OGRE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_OGRE,"Обычно огров можно встретить, прогуливаясь по лесам, а также спускаясь в пещеры. Огры редко ходят одни, но даже без своих сородичей огр крайне опасен, так как его 'кистень' бьет больно и точно.");
			AI_Print(concatText);
		}
		else
		{
			if((Ogre_B1 >= 5) && (Ogre_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огр'");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Основные преимущества: хорошая защита от любого вида урона, прекрасно владеет оружием ближнего боя и имеет большой запас здоровья");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Ogre_B2 = TRUE;
			}
			else if((Ogre_B1 >= 10) && (Ogre_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Огр'");
				Log_AddEntry(TOPIC_BEAST_OGRE,"Тактика боя: рекомендуется сражаться длинным оружием или атаковать с расстояния");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Черный тролль'");
			Log_CreateTopic(TOPIC_BEAST_TROLL_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL_BLACK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Черный тролль - это сильнейшее из живых существ! Его внешность может вселить страх даже самым храбрым охотникам. В отличие от обычного тролля, его окраска светло черная с оттенками серого. Черные тролли крупнее, сильнее и более пугающие, чем обычные тролли. Их руки - огромные молоты, которые могут расплющить противника одним мощным ударом. Очень примечательна их голова со ртом полным огромных зубов и сияющими белыми глазами. На макушке его головы расположены два больших рога. Черные тролли живут поодиночке в скалистых местностях с парой-тройкой деревьев вокруг. Они находят себе пещеру, в которой они часто охраняют драгоценные сокровища. Находятся на верхушке пищевой цепочки, так как являются абсолютными хищниками, поедающими что угодно, слишком медленное для того, чтобы убежать от их огромных кулаков. У них нет естественных врагов.");
			AI_Print(concatText);
		}
		else
		{
			if((Troll_Black_B1 >= 3) && (Troll_Black_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный тролль'");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Основные преимущества: имеет невероятную силу удара, отличную защиту от любого вида оружия ближнего или дальнего боя, магии и огня");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Уязвимые места: слишком медленная скорость атаки");
				AI_Print(concatText);
				Troll_Black_B2 = TRUE;
			}
			else if((Troll_Black_B1 >= 5) && (Troll_Black_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный тролль'");
				Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"Тактика боя: тролли очень неповоротливы, и, пока он замахивается, чтобы сделать удар, вы десять раз успеете отскочить и три раза ударить. Лучше всего забежать ему за спину и бить, пока он поворачивается, а когда повернется — повторить маневр.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Варг'");
			Log_CreateTopic(TOPIC_BEAST_WARG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARG,"Варг - зверь с темной шерстью, сильный и безжалостный. Его легко узнать по абсолютно черной шерсти и темно-красным глазам. Варги обитают в дремучих лесах, вблизи болот и пещер. В опасные времена в поисках еды они покидают леса и направляются на открытые пространства. Как и большинство хищников, в рационе варгов любое мясо. Волки - их обычная добыча. Варги держатся группами по несколько особей. Среди жителей Миртаны варги пользуются дурной славой, из-за их злого нрава, который особенно проявляется в кровавые времена. Частенько их приручают орки и используют в качестве сторожевых псов.");
			AI_Print(concatText);
		}
		else
		{
			if((Warg_B1 >= 10) && (Warg_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Варг'");
				Log_AddEntry(TOPIC_BEAST_WARG,"Основные преимущества: способен быстро бегать, имеет отличную защиту от оружия ближнего и дальнего боя, кроме этого варги охотятся и нападают стаями");
				Log_AddEntry(TOPIC_BEAST_WARG,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				Warg_B2 = TRUE;
			}
			else if((Warg_B1 >= 20) && (Warg_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Варг'");
				Log_AddEntry(TOPIC_BEAST_WARG,"Тактика боя: для начала следует приманить одного варга из стаи, а затем убить всю группу одного за другим");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Скелет'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON,"Скелеты — останки людей, некогда похороненных в неправильном месте или без соблюдения необходимых обрядов очищения. Их нельзя считать полноценными людьми, поскольку от прежней личности в этих кучках старых костей не осталось ровным счетом ничего. Но, тем не менее, они обладают каким-то разумом, или, по крайней мере, подобием его. Извращенным, разумеется, как и все существа, поднятые из своих могил черной магией Белиара. В их круглой, сверкающей на солнце черепушке крепко-накрепко засела одна-единственная мысль: убить всех, кто не является нежитью, — и они блестяще приводят ей в исполнение.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_B1 >= 15) && (Skeleton_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Основные преимущества: отлично владеют оружием ближнего и дальнего боя, носят доспехи, обладают абсолютным иммунитетом к колющему типу оружия, стрелам и болтам");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Уязвимые места: имеет очень слабую защиту против дробящего оружия ");
				AI_Print(concatText);
				Skeleton_B2 = TRUE;
			}
			else if((Skeleton_B1 >= 30) && (Skeleton_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Тактика боя: есть несколько хитростей борьбы с ними: стрелы почти не причиняют им вреда, да и магия действует не ахти, а вот дробящее оружие вроде молотов и дубин действует вдвое лучше рубящего — мечей и топоров.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Орк'");
			Log_CreateTopic(TOPIC_BEAST_ORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Орки — вторая разумная раса Мордрага, и единственная, способная на равных соперничать с людьми и человеческой культурой. Многие считают, что орки, в отличие от людей, порождения Белиара, но это представление не совсем верно. Конечно, логично предположить, что если люди были сотворены Инносом, то орки появились по воле бога тьмы, но никаких доказательств этому нет, и происхождение орков — загадка, ответ на которую давно был утерян в веках. Орки-воины — основная боевая сила армии орков. Они прекрасно знают свое дело, а их доспехи по прочности способны поспорить с панцирями ползунов. Встреча с ними не сулит ничего хорошего даже подготовленному воину, а новичку грозит мгновенной смертью. Они редко ходят по одному, чаще — группой из трех-пяти орков, и бой с ними никогда не бывает легким.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcWarrior_B1 >= 15) && (OrcWarrior_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орк'");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Основные преимущества: отлично владеют оружием ближнего и дальнего боя, носят доспехи, разумны, атакуют группами");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Уязвимые места: имеет очень слабую защиту против магии и огня");
				AI_Print(concatText);
				OrcWarrior_B2 = TRUE;
			}
			else if((OrcWarrior_B1 >= 30) && (OrcWarrior_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орк'");
				Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Тактика боя: наименьшая сопротивляемость у них к магии и стрелам, но использовать придется довольно мощные заклинания, ибо слабые лишь раззадорят их.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Лорд теней'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Пещеры, окутанные мраком старинного проклятия, безлюдные вересковые пустоши, места давних сражений, глухие заросли непроходимого леса, в которых когда свершились страшные вещи. Есть много мест, где можно встретить лорда теней, бывшего отважного воина, после смерти превратившегося в не знающее пощады чудовище. Хотя можно ли говорить о них 'после смерти'?.. Ведь их душа, давно истаявшая под неподъемным грузом вечности, так и не смогла отделить от бренного тела, прикованная к нему незримыми цепями черного колдовства. И, право, дело чести каждого воина — лишить таких тварей даже тени их призрачной жизни, убив их и развеяв прах по ветру. Хотя это и крайне непростая задача! Ведь это элита загробного мира.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Lord_B1 >= 10) && (Skeleton_Lord_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Лорд теней'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Основные преимущества: превосходно владеют оружием ближнего и дальнего боя, носят доспехи, обладают абсолютным иммунитетом к колющему типу оружия, стрелам и болтам, хорошая защита от магии и огня");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Skeleton_Lord_B2 = TRUE;
			}
			else if((Skeleton_Lord_B1 >= 20) && (Skeleton_Lord_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Лорд теней'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Тактика боя: вам понадобятся все ваши силы и умения, чтобы одолеть этого воистину смертоносного врага.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Проклятый жрец'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_PRIEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_PRIEST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Проклятый жрец - крайне опасные соперники, атакующие магией на расстоянии и умело использующие посох в ближнем бою. Кроме того, любое соприкосновение с ним вызывает жуткую боль, поскольку он окружен защитной аурой проклятия!");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Priest_B1 >= 5) && (Skeleton_Priest_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый жрец'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Основные преимущества: превосходно владеют оружием ближнего боя и магией, носят доспехи, обладают абсолютным иммунитетом к колющему типу оружия, стрелам и болтам, хорошая защита от магии и огня");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Skeleton_Priest_B2 = TRUE;
			}
			else if((Skeleton_Priest_B1 >= 10) && (Skeleton_Priest_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый жрец'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Тактика боя: лучше всего использовать против них могущественную магию или огонь.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Демоникон'");
			Log_CreateTopic(TOPIC_BEAST_DARKGUARD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DARKGUARD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Демоникон — могущественный демон из иного измерения, порождение Белиара, которое никогда не должен был увидеть Мордраг.");
			AI_Print(concatText);
		}
		else
		{
			if((DarkGuard_B1 >= 5) && (DarkGuard_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демоникон'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Основные преимущества: молниеносная и очень мощная атака, отличная защита ото всех видов урона");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Уязвимые места: - нет -");
				AI_Print(concatText);
				DarkGuard_B2 = TRUE;
			}
			else if((DarkGuard_B1 >= 10) && (DarkGuard_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демоникон'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Тактика боя: в бою с этой разновидностью демонов лучше всего использовать длинное оружие, чтобы держаться подальше от его острых, как бритва, когтей.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Варан'");
			Log_CreateTopic(TOPIC_BEAST_WARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARAN,"Ящерицы — огромные рептилии, любящие греться на солнышке на теплом песочке. Обитают они чаще всего на песчаных пляжах у водоемов — как и всяким рептилиям, им нужны тепло, свет и вода, хотя их можно встретить во многих местах, хорошо прогревающихся днем и не слишком холодных ночью. Они плотоядные, и явно считают человека лучшей добычей из всех, какие только существуют, поэтому близко к ним лучше не подходить. Но бойцы они довольно посредственные, и убить их легко, в отличие от их огненных сородичей.");
			AI_Print(concatText);
		}
		else
		{
			if((Waran_B1 >= 10) && (Waran_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Варан'");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Основные преимущества: неплохая защита от оружия ближнего боя");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Waran_B2 = TRUE;
			}
			else if((Waran_B1 >= 20) && (Waran_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Варан'");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Тактика боя: убить их легко, в отличие от их огненных сородичей. Главное — не позволять им себя укусить, а остальное, как говорится, дело техники.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Черный орк'");
			Log_CreateTopic(TOPIC_BEAST_ORCELITE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCELITE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCELITE,"Черные орки - элитная каста воинов. Они намного сильнее и выносливее обычных орков, и кроме этого, прекрасно владеют оружием. Одеты в тяжелые орочьи доспехи, и в основном занимают главенствующие позиции в сообществе орков.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcElite_B1 >= 10) && (OrcElite_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный орк'");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Основные преимущества: огромная сила, отличная защита от любого вида оружия,  разумны, прекрасно владеют оружием ближнего боя");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Уязвимые места: имеет слабую защиту от огня и магии");
				AI_Print(concatText);
				OrcElite_B2 = TRUE;
			}
			else if((OrcElite_B1 >= 20) && (OrcElite_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Черный орк'");
				Log_AddEntry(TOPIC_BEAST_ORCELITE,"Тактика боя: они очень хороши в бою, и победить их действительно нелегко. Только очень сильный человек с надежным клинком может надеяться пробить их доспехи.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Орк-шаман'");
			Log_CreateTopic(TOPIC_BEAST_ORCSHAMAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCSHAMAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Магия едина, и орки в своих храмах используют те же приемы и ритуалы, что и их собратья-люди в монастырях и лабораториях. Но только людей, способные повелевать стихиями, зовут магами, а орков, которым подвластны все четыре составляющие мироздания — шаманами. Шаманы, или сыновья духов, если использовать язык орков, — вот кто на самом деле управляет обществом орков. В этом орки похожи на людей. Но если в человеческом обществе страной правит король, а маги играют роль скорее совещательного органа, то для каждого орка слово любого шамана — закон. И не в последнюю очередь потому, что несогласных с их мнением шаманы тут же превращают в кучку пепла.");
			AI_Print(concatText);
		}
		else
		{
			if((OrcShaman_B1 >= 10) && (OrcShaman_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орк-шаман'");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Основные преимущества: способны использовать магию Огня");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Уязвимые места: имеет слабую защиту против оружия дальнего боя");
				AI_Print(concatText);
				OrcShaman_B2 = TRUE;
			}
			else if((OrcShaman_B1 >= 20) && (OrcShaman_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Орк-шаман'");
				Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Тактика боя: здесь возможны две тактики ведения боя: или вы зигзагами, уворачиваясь от их огненных шаров, как можно быстрее подбираетесь к шаманам и навязываете им ближний бой, или, наоборот, расстреливаете издалека с помощью лука или арбалета, опять же не забывая уворачиваться от встречных заклятий. Магия на шаманов практически не действует — только огненные заклинания способны причинить им некоторый ущерб.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Проклятый орк'");
			Log_CreateTopic(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Если лучшие воины-люди после смерти превращаются в скелетов, то бесстрашные воины орков, заканчивая свой жизненный путь, порой становятся бессмертными воинами в виде нежити. Они всегда начеку, всегда готовы уничтожить незваного гостя, ни на минуту не ослабляют внимания, и при этом не требуют взамен ничего. Совсем ничего...");
			AI_Print(concatText);
		}
		else
		{
			if((UndeadOrcWarrior_B1 >= 5) && (UndeadOrcWarrior_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый орк'");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Основные преимущества: огромная сила, отличная защита от любого вида оружия,  разумны, прекрасно владеют оружием ближнего боя");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Уязвимые места: имеет слабую защиту от огня и магии");
				AI_Print(concatText);
				UndeadOrcWarrior_B2 = TRUE;
			}
			else if((UndeadOrcWarrior_B1 >= 10) && (UndeadOrcWarrior_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый орк'");
				Log_AddEntry(TOPIC_BEAST_UNDEADORCWARRIOR,"Тактика боя: они серьёзные бойцы, и сражение с ними будет особенно сложным.");
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
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Песчаный смерч'");
			Log_CreateTopic(TOPIC_BEAST_SANDGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SANDGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Создание из песка и ветра, порожденное магией этого мира. С виду их порой нельзя отличить от небольшого песчаного шторма, но горе тому, кто допустит такую ошибку. Наказание последует незамедлительно...");
			AI_Print(concatText);
		}
		else
		{
			if((SandGolem_B1 >= 2) && (SandGolem_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Песчаный смерч'");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Основные преимущества: невосприимчивы к любому виду физического урона");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Уязвимые места: имеет слабую защиту от огня и магии");
				AI_Print(concatText);
				SandGolem_B2 = TRUE;
			}
			else if((SandGolem_B1 >= 3) && (SandGolem_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Песчаный смерч'");
				Log_AddEntry(TOPIC_BEAST_SANDGOLEM,"Тактика боя: если вы маг, то считайте вам повезло. В противном случае лучше для начала запастись большим количеством свитков. Без них вы не сможете одолеть это создание.");
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
			B_LogEntry(TOPIC_INNOSWILL,"Кажется, это был последний слуга Белиара, о котором я знал. Значит ли это, что я выполнил волю Инноса?");
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
		//--------счетчики-------------------------

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

		//--------счетчики-------------------------

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

	//------------------------тригерры------------------------------------------------------------------------------------------

	if((self.aivar[93] == FALSE) && (self.vars[6] == FALSE))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sleeper_Old)) && (SleeperOldIsDead == FALSE) && (SleeperStone == TRUE))
		{
			SleeperOldIsDead = TRUE;

			if(MIS_SleeperBack == LOG_Running)
			{
				MIS_SleeperBack = LOG_Success;
				Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Success);
				B_LogEntry(TOPIC_SleeperBack,"Я убил Спящего! Больше он никогда не сможет угрожать этому миру.");
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
						B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
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
						B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
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
						B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
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
				B_LogEntry(TOPIC_ORсGREATWAR,"Мы победили в этой битве - огромная армия орков повержена! Теперь можно подумать об освобождении от орков самого города и прилегающих к нему окрестностей.");
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
				AI_Print("Уважение среди орков - 1");
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


		//----------------------охота за головами---------------------------------------

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1060_Dexter)) && (DexterIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_DexterHead,1);
			DexterIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_WulfgarBandits == LOG_Running)
			{
				CreateInvItems(self,ItWr_DexTrait,1);
			};
			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Декстер мертв. За его голову можно получить приличную награду.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1460_Nestor)) && (NestorIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_NestorHead,1);
			NestorIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Нестор по прозвищу 'Ганибал' мертв. За его голову можно получить приличную награду.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10620_Bandit_L)) && (KriksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_KriksHead,1);
			KriksIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Крикс по прозвищу 'Бритва' мертв. За его голову можно получить приличную награду.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10621_Bandit_L)) && (BartIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_BartHead,1);
			BartIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Барт по прозвищу 'Коротышка' мертв. За его голову можно получить приличную награду.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10622_Bandit_L)) && (SkironIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_SkironHead,1);
			SkironIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Скирон по прозвищу 'Мясник' мертв. За его голову можно получить приличную награду.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10623_Bandit_L)) && (RocksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_RocksHead,1);
			RocksIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive,"Главарь разбойников Рокс по прозвищу 'Шустрый' мертв. За его голову можно получить приличную награду.");
			};
		};

		//----------------------охота за головами---------------------------------------

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
				B_LogEntry(TOPIC_PsicampDemon,"Демон на болотах мертв! Убив его, я очень сильно помог оркам. Уверен, они не оставят это без внимания.");	
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_127_Osair)) && (OsairIsDead == FALSE))
		{
			OsairIsDead = TRUE;

			if(OsairAttackMe == TRUE)
			{
				NoGonsaHereMe = TRUE;
				B_LogEntry(TOPIC_MasiafStory,"Осаир мертв! А значит, братство Масиафа потеряло еще одного приора. Интересно, что по этому поводу скажет сам Гонсалес.");
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
				B_LogEntry(TOPIC_MasiafStory,"Ханиар убил Тиаманта! Причем довольно легко, несмотря на то, что Тиамант считался лучшим бойцом братства. Это все крайне странно!");
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
					B_LogEntry(TOPIC_PW_FollowGoldOre,"Все рабы мертвы! Осаир будет очень недоволен произошедшим.");
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
					B_LogEntry(TOPIC_PW_FollowGoldOre,"Все рабы мертвы! Осаир будет очень недоволен произошедшим.");
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
				B_LogEntry(TOPIC_EvilTroll,"Я убил огромного пещерного тролля, о котором говорил Нетбек.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FIREGOLEM_UNIQ)) && (MagolemusIsDead == FALSE))
		{
			MagolemusIsDead = TRUE;
			AI_Print(PRINT_TEMPLETASK_03_DONE);
			B_LogEntry(TOPIC_AdanosCrone,"Cущество Инноса уничтожено...");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1084_Addon_Senyan))
		{
			if(Senyan_Called == TRUE)
			{
				Senyan_Erpressung = LOG_SUCCESS;
				Log_SetTopicStatus(Topic_Addon_Senyan,LOG_SUCCESS);
				B_LogEntry(Topic_Addon_Senyan,"Полагаю, что теперь Сеньян никому не сможет рассказать мою тайну. Оно и к лучшему!");
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
			Npc_RemoveInvItems(self,itmw_1h_Сrest,Npc_HasItems(self,itmw_1h_Сrest));
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
				B_LogEntry(TOPIC_KILLTHEMALL,"Полагаю, что я убил достаточно орков, чтобы посеять панику в их ряды! Лорд Хаген будет доволен этим известием.");
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
				B_LogEntry(TOPIC_GUARDIANS,"Мне удалось одолеть всех Хранителей! Теперь этому миру с их стороны ничто не угрожает...");

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
				B_LogEntry(TOPIC_GUARDIANS,"Мне удалось одолеть всех Хранителей! Теперь этому миру с их стороны ничто не угрожает...");

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
				B_LogEntry(TOPIC_PrioratStart ,"Мне и стражам удалось отразить атаку Масиафа на лагерь сборщиков! Хотя и не без потерь... Надо срочно сообщить о случившемся Идолу Намибу.");
			};
		};

		//-------------------эпик данж---------------------------------

		if((PaleCrawlerIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler)))
		{
			PaleCrawlerFight = FALSE;
			PaleCrawlerIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother,"Похоже именно этот жуткий монстр тогда убил Иле'Силя. Думаю стоит рассказать ему об этом...");
			};
		};
		if((AraharPlagueIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague)))
		{
			AraharPlagueFight = FALSE;
			AraharPlagueIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother,"Этот необычный зомби доставил мне проблем. У него при себе был какой-то ключ. Возможно этот ключ открывает что-то особенное. Для начала я думаю, мне стоит осмотреться на месте...");
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
					B_LogEntry(TOPIC_Miss_Brother,"Эти призрачные стражи появились тут не спроста. Похоже, они что-то охраняли...");
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
					B_LogEntry(TOPIC_Miss_Brother,"Эти призрачные стражи появились тут не спроста. Похоже, они что-то охраняли...");
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
			B_LogEntry(TOPIC_Miss_Brother,"Я уничтожил древнего лорда, Чел'Драка. Похоже он тут находился не спроста. Он что-то охранял... Интересно что?");
		};
		if((IlesilIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilesil_Evil)))
		{
			Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
			Wld_SendTrigger("EVT_EXITBOSS_TRIGGER");	
			IlesilIsDead = TRUE;
			MIS_Miss_Brother = LOG_Success;
			Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Success);
			B_LogEntry_Quiet(TOPIC_Miss_Brother,"Иле'Силь повержен! Теперь ничто не мешает ему быть рядом со своим братом. Пора выбираться отсюда...");	

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

		//------------------люди лагеря--------------------------------

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

		//------------------люди лагеря--------------------------------

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
				B_LogEntry(TOPIC_MasiafStory,"Ханиар мертв! Полагаю, что теперь Гонсалес частично загладил свою вину перед Инносом, а древнее братство Масиаф прекратило свое существование.");
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
				B_LogEntry(TOPIC_PrioratStart,"За всеми похищениями, как оказалось, стоял наш старый знакомый - Кор-Галом! Тьма наделила его могущественной силой демона и он смог подчинить своей воле Ханиара с его братством. Эти слепые фанатики крали для него послушников, чтобы тот проводил над ними свои ужасающие эксперименты. Один из таких экспериментов Кор-Галома меня чуть не прикончил в храме. Однако теперь все кончено! Надо выбираться отсюда как можно скорее...и сообщить идолу Намибу, что братство отныне в безопасности.");
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
				B_LogEntry(TOPIC_TrueBattle,"Я убил Нрозаса в поединке Истины! Еще один приор отправился на тот свет...");
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
				B_LogEntry(TOPIC_HasimKill,"Хасим мертв. Теперь можно доложить Тиаманту, что его поручение выполнено.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8514_farrok))
		{
			ELITEGENERALORICISDEAD_01 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Я убил орочьего военачальника Нар-Шогана.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Я убил всех орочьих военачальников, о которых мне говорил паладин Орик.");
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
				B_LogEntry(TOPIC_SleeperBack,"Спящий вернулся! При виде его, меня сразу же клонит в сон и я ничего не могу поделать с этим. Думаю, что сейчас мне не одолеть его! Надо поговорить с Нетбеком...");
				NeedSleeperStone = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8515_nurshak))
		{
			ELITEGENERALORICISDEAD_02 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Я убил орочьего военачальника Нур-Шака.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Я убил всех орочьих военачальников, о которых мне говорил паладин Орик.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8516_tumpak))
		{
			ELITEGENERALORICISDEAD_03 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Я убил орочьего военачальника Тум-Пака.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Я убил всех орочьих военачальников, о которых мне говорил паладин Орик.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8517_durkash))
		{
			ELITEGENERALORICISDEAD_04 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Я убил орочьего военачальника Дур-Каша.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Я убил всех орочьих военачальников, о которых мне говорил паладин Орик.");
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
					B_LogEntry(TOPIC_GUARDIANS,"Мне чудом удалось избежать смерти от лап демонов, призваных Хранителем Даготом... Теперь надо решить, что делать дальше. У кого просить совета?!");
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
					B_LogEntry(TOPIC_GUARDIANS,"Мне чудом удалось избежать смерти от лап демонов, призваных Хранителем Даготом... Теперь надо решить, что делать дальше. У кого просить совета?!");
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
					B_LogEntry(TOPIC_GUARDIANS,"Мне чудом удалось избежать смерти от лап демонов, призваных Хранителем Даготом... Теперь надо решить, что делать дальше. У кого просить совета?!");
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
					B_LogEntry(TOPIC_GUARDIANS,"Мне чудом удалось избежать смерти от лап демонов, призваных Хранителем Даготом... Теперь надо решить, что делать дальше. У кого просить совета?!");
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
				B_LogEntry(TOPIC_ORсGREATWAR,"Я уничтожил предводителя орков, который руководил войсками в Хоринисе. Думаю, что теперь орки не окажут достойного сопротивления, лишившись своего лидера...осталось лишь перебить их в самом городе.");
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
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
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
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
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
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
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
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
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
			B_LogEntry(TOPIC_NATANDOLG,"Наша задуманная с Ударом уловка кажется удалась! Теперь посмотрим что на это скажет сам Натан...");
			UDARORCSTRAPISDONE = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(stonegolem_osta))
		{
			OSTAISDEAD = TRUE;

			if(MIS_XARDASTASKSFOUR == LOG_Running)
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Я уничтожил стража темной башни.");
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
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Я успокоил душу могущественного некроманта! Теперь можно подумать и о том, как достать Некрономикон.");
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
				B_LogEntry(TOPIC_PW_PoisonNrozas,"Я убил тролля, на котором мог испытать яд. Боюсь, что теперь будет проблематично найти ему замену...");
				NoTrollPoison = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETONMAGE_STRANGECAVE)) && (StrangeCaveMageIsDead == FALSE))
		{
			StrangeCaveMageIsDead = TRUE;
			B_LogEntry(TOPIC_StrangeCave,"Я разобрался с проблемой в пещере...");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_01)) && (FIRETESTMONSTERONEISDEAD == FALSE))
		{
			FIRETESTMONSTERONEISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращаться к хранителю Келиосу.");
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
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
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
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
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
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
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
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
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
				B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Галлахад мертв! Надо сообщить об этом Ксардасу.");
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
				B_LogEntry(TOPIC_MasiafStory,"Думаю тени будут не очень довольны тем, что я убиваю их рабов. Скорей всего теперь я не смогу выдать себя за одного из них. Надо поговорить об этом с Гонсалесом.");
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
				B_LogEntry(TOPIC_DarkOrden,"Я уничтожил безумного крестоносца - Лорда Гиннока!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Serdah == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_mirat)))
			{
				KillDeadPal_Serdah = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Я уничтожил Лорда Мирата!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Innubis == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord)))
			{
				KillDeadPal_Innubis = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Я уничтожил Лорда Иннубиса!");
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Dexsar == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DARKTOWER_SKELETON_LORD)))
			{
				KillDeadPal_Dexsar = TRUE;
				B_LogEntry(TOPIC_DarkOrden,"Я уничтожил Лорда Ульзара!");
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
				B_LogEntry(TOPIC_HROMANINQUEST,"Тайна Хроманина раскрыта! За всем этим стоял Кадар, его хранитель. Ну что же, тем хуже для него...");
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
			B_LogEntry(TOPIC_ORCSECRET,"Я убил каменного атронаха.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Я убил все древние существа, порожденные Хранителями! Думаю теперь, без защитной магии этих созданий, орки навряд ли останутся такими же неуязвимыми. Надо сообщить об этом Ли!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire)) && (AvatarFireIsDead == FALSE))
		{
			AvatarFireIsDead = TRUE;
			B_LogEntry(TOPIC_ORCSECRET,"Я убил огненного атронаха.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Я убил все древние существа, порожденные Хранителями! Думаю теперь, без защитной магии этих созданий, орки навряд ли останутся такими же неуязвимыми. Надо сообщить об этом Ли!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water)) && (AvatarWaterIsDead == FALSE))
		{
			AvatarWaterIsDead = TRUE;
			B_LogEntry(TOPIC_ORCSECRET,"Я убил ледяного атронаха.");

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				B_LogEntry_Quiet(TOPIC_ORCSECRET,"Я убил все древние существа, порожденные Хранителями! Думаю теперь, без защитной магии этих созданий, орки навряд ли останутся такими же неуязвимыми. Надо сообщить об этом Ли!");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XranFreg)) && (XranFregIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_EGEZARTDOOR");

			if(MIS_XRANFREG == LOG_Running)
			{
				MIS_XRANFREG = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_XRANFREG,LOG_SUCCESS);
				B_LogEntry(TOPIC_XRANFREG,"Я уничтожил Фрегараха! Каменный титан, проржденный духом самого Стонноса, отправился в небытие.");
			};

			XranFregIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORKELITE_ADDON4_CHKFLG_29)) && (FreeMineGeneralIsDead == FALSE))
		{
			FreeMineGeneralIsDead = TRUE;

			if(MIS_ScoutNewMine == LOG_Running)
			{
				B_LogEntry(TOPIC_ScoutNewMine,"Я добрался до военачальника орков в шахте Нового лагеря. Думаю, что теперь орки не сунутся больше сюда! Надо сообщить об этом Гаронду.");
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
			B_LogEntry(Topic_SylvioDebts,"Этот жадный ублюдок, Сильвио, сдох! Туда ему и дорога. Теперь все его золото принадлежит мне. Надо бы расчитаться с Рэтфордом...");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
						B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Как мне и велел Хаг-Тар, я убил всех охотников на драконов.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
				B_LogEntry(TOPIC_XARDAS_DEMON,"Я убил послушника Магов Огня.");
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
						B_LogEntry(TOPIC_KILLURTRALL,"Я убил Хаг-Тара! Теперь надо сообщить об этом Ур-Траллу, чтобы он отпустил паладинов.");
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
				B_LogEntry(TOPIC_CHALLANGEORC,"Я победил Хаг-Тара! Посмотрим, что он теперь скажет.");
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
					B_LogEntry(TOPIC_STURMCASTLE,"Кажется, удача в этот раз была на нашей стороне! Перебив весь командный состав орков в крепости, не думаю что орки смогут ее отстоять до конца.");
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
				B_LogEntry(TOPIC_LowLevel,"Я уничтожил древнее зло в глубокой шахте!");
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_stoneshpere))
		{
			ORCMINEKILL_02 = TRUE;

			if((ORCMINEKILL_01 == TRUE) && (ORCMINEKILL_02 == TRUE))
			{
				B_LogEntry(TOPIC_LowLevel,"Я уничтожил древнее зло в глубокой шахте!");
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
				B_LogEntry(TOPIC_HeroOrcJoin_T2,"Вождь клана Высокого Камня мертв...Похоже, что я провалил поручение Ур-Карраса.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Muritan_South))
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я убил Муритана! Теперь мне остается забрать его ядовитые клыки и отнести их Ур-Каррасу в город орков.");
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS2 = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я убил Муритана! Однако я не смогу забрать его ядовитые клыки и отнести их Ур-Кррасу в город орков, поскольку не знаю - как их снять с тела чудовища. Похоже, что мне придется найти еще одного из них и при этом не забыть выучить навык свежевания клыков!");
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
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я нашел еще одного Муритана и убил его! Теперь мне надо не забыть взять его ядовитые клыки и отнести их Ур-Кррасу.");
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS3 = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я нашел еще одного Муритана и убил его! Но я не обучен вырывать клыки. Похоже я провалил задание Ур-Карраса...Не думаю, что он будет рад услышать это.");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6666_Xash_Gor))
		{
			HashGorIsDead = TRUE;
			Wld_SendTrigger("EVT_ORCGRYRD_HASHGOR");
			
			if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (NagDumgarInsert == FALSE))
			{
				B_LogEntry(TOPIC_NagDumgar,"Я убил верховного шамана Хаш-Гора! Осталось забрать у него ритуальный нож и отнести его Ур-Траллу.");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8568_NagDumgar)) && (NagDumgarInsertDone == TRUE))
		{
			NagDumgarIsDead = TRUE;

			if(MIS_NagDumgar == LOG_Running)
			{
				B_LogEntry(Topic_NagDumgar,"Я убил орка-демона Наг-Думгара! Это было не легко, но я сделал это. Пора возвращаться к Ур-Траллу. Думаю, что его обрадует эта новость...");
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
				B_LogEntry(TOPIC_Qvardemon,"Я уничтожил древнего жреца Кардимона!");
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
				B_LogEntry(Topic_JarCurse,"Я уничтожил древнего полководца, Куарходрона!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrkElite_Addon2_Gonez))
		{
			if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == TRUE))
			{
				DayGonezStop = Wld_GetDay();

				if(DayGonezStop > DayGonezStart)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я нашел гонца орков и убил его! Однако мне кажется, что я слишком затянул с его поисками и он уже успел передать Ур-Каррасу послание о моей измене.");
				}
				else
				{
					UrKarrasGonezIsDead = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я нашел гонца орков и убил его! Думаю, что теперь некому будет рассказать Ур-Каррасу о моей измене.");
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
					B_LogEntry(TOPIC_KILLURTRALL,"Я убил Ур-Тралла. Теперь необходимо сообщить об этом Хаг-Тару!");
				};
			};
			if(MIS_BELIARWILL == LOG_Running)
			{
				B_LogEntry(TOPIC_BELIARWILL,"Я убил вождя орков, Ур-Тралла! Воля Белиара исполнена!");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_01))
		{
			FLAG_ORCSLAVE_01 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_02))
		{
			FLAG_ORCSLAVE_02 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_03))
		{
			FLAG_ORCSLAVE_03 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_04))
		{
			FLAG_ORCSLAVE_04 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_05))
		{
			FLAG_ORCSLAVE_05 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_06))
		{
			FLAG_ORCSLAVE_06 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_07))
		{
			FLAG_ORCSLAVE_07 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_08))
		{
			FLAG_ORCSLAVE_08 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry(TOPIC_ORCORDER,"Все орки-рабы мертвы! Теперь пора возвращаться к Альберту.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_ClansWar,"Вождь клана 'Ледяного Ветра' мертв! Надо сообщить об этом Грум Локу.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
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
				B_LogEntry(TOPIC_PaladinCamp,"Я убил всех паладинов на побережье, как мне и приказал Ур-Каррас.");
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			Wld_SendTrigger("TRG_CORGALOM_MAGICWALL");
			B_LogEntry(TOPIC_PrioratStart,"Могучий демон пал и магический барьер, преграждавший мне путь, исчез - теперь путь свободен!");
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
				B_LogEntry(TOPIC_TraitorPedro,"Я убил Педро! Серпентес будет доволен.");
			}
			else if(!Npc_IsPlayer(other) && (MIS_Gorax_KillPedro == LOG_Running))
			{
				B_GivePlayerXP(250);
				MIS_Gorax_KillPedro = LOG_SUCCESS;
				MIS_TraitorPedro = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
				B_LogEntry(TOPIC_TraitorPedro,"Педро мертв и теперь уже не важно - как это случилось!");
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
					B_LogEntry(TOPIC_HauntedLighthouse,"Я уничтожил призраков на маяке. Теперь людям ничто тут не угрожает... Жаль, что при этом погиб сам Джек.");
				}
				else
				{
					B_LogEntry(TOPIC_HauntedLighthouse,"Я уничтожил призраков на маяке. Теперь людям ничто тут не угрожает...");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
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
				B_LogEntry(TOPIC_JORAHELP,"Я убил Зуриса! Интересно, что мне это даст. Для начала надо обыскать его труп - может что и найду полезное.");
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
				B_LogEntry(TOPIC_BLACKBRENDI,"Я не успел помочь Бенчелу - бандиты убили его. Думаю, Лютеро не особо обрадуется этому известию.");
			}
			else if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE) && (BENCHELFOLLOWME == TRUE))
			{
				B_LogEntry(TOPIC_BLACKBRENDI,"Бенчел мертв! Думаю, Лютеро не особо обрадуется этому известию.");
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
			B_LogEntry(TOPIC_RESCUEGOMEZ,"В склепе я встретил странного рода нежить. Похоже при жизни, этот кусок гнили был некромантом... Естественно, мне не оставалось ничего другого, как убить эту тварь. Теперь пора возвращаться к Корристо!");
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
				B_LogEntry(TOPIC_GUILDKILL,"Я убил Асмала.");
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
					B_LogEntry(TOPIC_KILLTARGETFINAL,"С бандой Ханса покончено - все его люди и он сам мертвы. Но потом возникли проблемы - Асмал посчитал, что я не заслужил большой доли за это дело и согласился дать мне все лишь 500 монет. Меня это не устроило и мне пришлось покончить с Асмалом.");
				};
			};
			if((MIS_KILLWAY == LOG_Running) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				MIS_KILLWAY = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLWAY,LOG_SUCCESS);

				if(CANBEKILLMASTER == TRUE)
				{
					B_LogEntry(TOPIC_KILLWAY,"Я прикончил Асмала. Теперь я - глава гильдии убийц!");
					BEKILLMASTER = TRUE;
				}
				else
				{
					B_LogEntry(TOPIC_KILLWAY,"Я прикончил Асмала! Возможно я поторопился, но теперь уже ничего не поправить.");
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
				B_LogEntry(TOPIC_KILLTARGET1,"Я прикончил этого болтуна, Луиса.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_484_Lehmar))
		{
			KILLTARGET2 = TRUE;
			LehmarIsDead = TRUE;

			if(MIS_KILLTARGET2 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET2,"Я отправил Лемара на тот свет, при этом не забыв передать ему привет от Асмала.");
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
				B_LogEntry(TOPIC_KILLTARGET3,"Кантар мертв! В общем, я не особо сожалею о том, что мне пришлось это сделать, ведь он мне и самому не очень то нравился...");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6110_nigel))
		{
			KILLTARGET4 = TRUE;
			if(MIS_KILLTARGET4 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET4,"Я пришил этого беднягу Найджела.");
				if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == FALSE))
				{
					B_LogEntry(TOPIC_KILLTARGET4,"Интересно, как получается - и Найджел мертв и я знаю, у кого находятся его долговые деньги. Может быть мне стоит сказать Асмалу, что Найджел отказался отдавать долг, а деньги оставить себе... Правда для этого мне надо будет разобраться с бандитами, что ограбили его.");
				}
				else if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE))
				{
					B_LogEntry(TOPIC_KILLTARGET4,"Интересно, как получается - и Найджел мертв и я забрал у бандитов его долговые деньги. Может быть мне стоит сказать Асмалу, что Найджел отказался отдавать долг, а деньги оставить себе...");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_6111_rudar))
		{
			KILLTARGET5 = TRUE;
			if(MIS_KILLTARGET5 == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLTARGET5,"Теперь, когда Рудар мертв - он не опасен для Асмала.");
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
				B_LogEntry(TOPIC_GUILDKILL,"Я разобрался с гильдией убийц.");
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
					pir_1398_addon_inextremo_announcer.name[0] = "Гиллиан";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			}
			else
			{
				if(JOINKILLERS == FALSE)
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Гиллиан";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			};
		
			WAMBOISDEAD = TRUE;

			if(MIS_KILLWAMBO == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLWAMBO,"Вамбо мертв! Пора возвращаться к Асмалу.");
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
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я пленил душу архидемона С'эньяка, а затем уничтожил его телесную оболочку!");
				Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_SUCCESS);
				MIS_GOLDDRAGONPORTAL = LOG_SUCCESS;
			}
			else
			{
				Npc_RemoveInvItems(self,itmi_stonesoul,1);
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Архидемон С'эньяк мертв!");
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
			B_LogEntry(TOPIC_DarkWeb,"Это был не легкий бой! Но в конце концов мне удалось одолеть этого мага. Его голову я возьму в качестве доказательства для Лорда Хагена. Только теперь я понял, что у Лотара не было шансов выжить против такого могущественого противника...");
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
				B_LogEntry(TOPIC_ORCTEMPLE,"Темный маг-некромант, которого я встретил в Храме Спящего, более не опасен, по той простой причине, что он мертв. При нем я нашел своего старого друга - могущественный древний клинок УРИЗЕЛь, которым я когда-то сразил Спящего. Думаю теперь можно наведаться и к драконам.");
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_SUCCESS);
				MIS_ORCTEMPLE = LOG_SUCCESS;
			}
			else
			{
				B_LogEntry(TOPIC_ORCTEMPLE,"Темный маг-некромант, которого я встретил в Храме Спящего, более не опасен, по той простой причине, что он мертв. При нем я нашел своего старого друга - могущественный древний клинок УРИЗЕЛь, которым я когда-то сразил Спящего.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
				concatText = "Убито проклятых призраков: ";
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
				B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от десяти проклятых призраков в Старой Шахте! Теперь необходимо вернуться в замок и провести ритуал вызова убитых Гомезом магов Огня.");
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
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил верховного шамана орды - Варраг-Шатана.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader2))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил верховного шамана орды - Варраг-Казорга.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader3))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил верховного шамана орды - Варраг-Хашора.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader4))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил верховного шамана орды - Варраг-Назула.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader5))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил верховного шамана орды - Варраг-Хаташа.");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_adw_leader))
		{
			B_LogEntry(TOPIC_ADW_ORCINVASION,"Я убил одного из клана предводителей орды - Ур-Катана.");
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
