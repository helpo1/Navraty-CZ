instance DIA_Stoneguardian_Boss_Exit(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 999;
	condition = DIA_Stoneguardian_Boss_Exit_Condition;
	information = DIA_Stoneguardian_Boss_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Stoneguardian_Boss_Exit_Condition()
{
	return TRUE;
};

func void DIA_Stoneguardian_Boss_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Stoneguardian_Boss_Hello(C_Info)
{
	npc = Stoneguardian_Boss;
	nr = 1;
	condition = DIA_Stoneguardian_Boss_Hello_Condition;
	information = DIA_Stoneguardian_Boss_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Stoneguardian_Boss_Hello_Condition()
{
	if(StoneTitanAwake == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Stoneguardian_Boss_Hello_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_01");	//КТО ПОСМЕЛ ПОТРЕВОЖИТЬ МОЙ СВЯЩЕННЫЙ ПОКОЙ?!
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_02");	//Собственно, это был я.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_03");	//Как интересно. И что же тебе нужно от меня, человек?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_04");	//Я хочу узнать об одном артефакте, который вы когда-то охраняли.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_05");	//ЧТО?! Откуда тебе это известно?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_06");	//Из записей в магическом свитке древних, с помощью которого я и пробудил тебя.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_07");	//Даже если ты смог прочитать надписи, это еще не делает тебя достойным обладать священными знаниями.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_08");	//Ибо только избранный Аданоса сможет познать его мудрость!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_09");	//Но я не думаю, что ты таковым являешься.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_10");	//Так ты все-таки расскажешь мне про этот артефакт?
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_11");	//И почему я должен это делать?
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_12");	//Может, я действительно являюсь избранником Аданоса!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_13");	//Ха ха ха... Не смеши меня, жалкий человечишка! Не может такого быть.
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_14");	//Но если ты на самом деле считаешь себя им - докажи это.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_15");	//Каким образом?
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_16");	//Сразись со мной!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_17");	//Только если ты сможешь меня одолеть, тебе откроется тайна этого священного артефакта!
	AI_Output(self,other,"DIA_Stoneguardian_Boss_Hello_01_18");	//В противном случае ты просто умрешь.
	AI_Output(other,self,"DIA_Stoneguardian_Boss_Hello_01_19");	//Ну, на другое я и не рассчитывал.
	B_LogEntry(TOPIC_AdanosCrone,"Я смог оживить древнего Стража, но это мне ничего не дало. Страж отказался рассказать мне об этом загадочном артефакте. Только победив его самого, я смогу продвинуться дальше в своих поисках.");
	KnowAboutAdVal = TRUE;
};

//=============================Спящий=================================================

instance DIA_Sleeper_Old_Exit(C_Info)
{
	npc = Sleeper_Old;
	nr = 999;
	condition = DIA_Sleeper_Old_Exit_Condition;
	information = DIA_Sleeper_Old_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Sleeper_Old_Exit_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Sleeper_Old_Hello(C_Info)
{
	npc = Sleeper_Old;
	nr = 1;
	condition = DIA_Sleeper_Old_Hello_Condition;
	information = DIA_Sleeper_Old_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sleeper_Old_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sleeper_Old_Hello_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_01");	//Аргххх...(зловеще) НАКОНЕЦ-ТО МЫ ПОВСТРЕЧАЛИСЬ, ЧЕЛОВЕК!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_02");	//Как долго я ждал этой встречи!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_01_03");	//Спящий! Никогда бы не подумал, что увижу тебя здесь вновь.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_04");	//Все мои чувства подсказывают мне, что маг, призвавший меня сюда, уже давно мертв.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_05");	//Готов поспорить, что это ты приложил к этому руку.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_06");	//Хотя, впрочем, это уже не имеет значения.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_01_07");	//Главное, что сейчас ты стоишь передо мной!
	SleeperHello = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Спящий вернулся в мир людей! Похоже, этот демон мой злой рок. Теперь мне надо разобраться с ним раз и навсегда, коли представилась такая возможность.");
	Info_ClearChoices(DIA_Sleeper_Old_Hello);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"Очень хочется мне отомстить?",DIA_Sleeper_Old_Hello_Battle);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"Зачем ты пробудил драконов?",DIA_Sleeper_Old_Hello_Dragons);
	Info_AddChoice(DIA_Sleeper_Old_Hello,"А кто ты вообще такой?",DIA_Sleeper_Old_Hello_WhoYou);
};

func void DIA_Sleeper_Old_Hello_WhoYou()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_01");	//А кто ты вообще такой?
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_02");	//На вид ты не очень похож на существо, созданное Белиаром.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_03");	//Это так...(зловеще) Однако его могущество помогло мне вернутся в этот мир!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_04");	//Я - древнейший демон, порожденный магией этого мира в эпоху его создания.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_05");	//Когда-то люди поклонялись мне так же, как и вы поклоняетесь сейчас своим богам.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_06");	//Но мое время давно прошло. И лишь благодаря оркам я вновь смог возродится из небытия.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_07");	//Но ты, жалкий червь, тогда все испортил! 
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_08");	//А я был слишком слаб, чтобы сопротивляться силе твоего оружия.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_09");	//Но теперь, благодаря Белиару и его слуге, я вновь готов явиться этому миру!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_10");	//И на этот раз ты уже не застанешь меня врасплох.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_11");	//Я полностью обрел былую мощь, и теперь готов обрушить свой гнев на любого, кто осмелится восстать против моего повелителя.
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_WhoYou_01_12");	//Выходит, что из могучего демона ты превратился в очередную марионетку Белиара.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_WhoYou_01_13");	//Говори что хочешь, человек! Все равно жить тебе осталось совсем недолго...
};

func void DIA_Sleeper_Old_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Dragons_01_01");	//Зачем ты пробудил драконов?
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_02");	//Те, кого ты называешь драконами, такие же древнейшие создания, как и я.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_03");	//Они просто не могли не услышать мой зов о помощи!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_04");	//Но их пробудил не я...(зловеще) Они повинуются лишь воле тех, кто на самом деле сотворил их!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Dragons_01_05");	//Ты говоришь о Хранителях?
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_06");	//Именно о них! 
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Dragons_01_07");	//Древние стражи мироздания, сокрывшиеся в тенях, дабы не затмить славу ваших богов...
};

func void DIA_Sleeper_Old_Hello_Battle()
{
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_01");	//По всей видимости, ты хочешь отомстить мне за тот случай в храме.
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_02");	//Глупо скрывать это! Я жажду этого больше всего на свете!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_03");	//А то, что произошло в прошлый раз, было лишь нелепой случайностью.
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_04");	//Что ж, тогда не стоит тратить время на любезности.
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_05");	//Как и в прошлый раз, я вновь отправлю тебя туда, откуда ты выполз на этот свет!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_06");	//(зловещий смех) Этому больше не бывать, человек!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_07");	//Сначала я сокрушу тебя, а потом и весь твой жалкий мирок!
	AI_Output(other,self,"DIA_Sleeper_Old_Hello_Battle_01_08");	//Тогда покажи, на что ты способен, слизняк!
	AI_Output(self,other,"DIA_Sleeper_Old_Hello_Battle_01_09");	//Не волнуйся! Тебе не придется долго ждать...
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");
};

instance DIA_XranFreg_Exit(C_Info)
{
	npc = XranFreg;
	nr = 999;
	condition = DIA_XranFreg_Exit_Condition;
	information = DIA_XranFreg_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_XranFreg_Exit_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Exit_Info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_XranFreg_Hello(C_Info)
{
	npc = XranFreg;
	nr = 1;
	condition = DIA_XranFreg_Hello_Condition;
	information = DIA_XranFreg_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_XranFreg_Hello_Condition()
{
	return TRUE;
};

func void DIA_XranFreg_Hello_Info()
{
	AI_Output(self,other,"DIA_XranFreg_Hello_01_01");	//Человек, ты пришел...
	AI_Output(other,self,"DIA_XranFreg_Hello_01_02");	//Ты еще и разговариваешь? А я уж думал, что повстречаю очередного каменного болвана.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_03");	//Так ты и есть этот живой каменный утес? Что-то по размерам не похож.
	AI_Output(self,other,"DIA_XranFreg_Hello_01_04");	//Мои размеры не имеют значения, смертный!
	AI_Output(self,other,"DIA_XranFreg_Hello_01_05");	//Если я захочу, я могу стать и каменной скалой и маленьким камушком у тебя под ногами.
	AI_Output(self,other,"DIA_XranFreg_Hello_01_06");	//Но моя сила и могущество от этого нисколько не уменьшатся.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_07");	//Кто ты и зачем ты здесь?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_08");	//Хранители дали мне имя Фрегарах, и я страж врат Эгезарта.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_09");	//А кто такой Эгезарт?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_10");	//Тот, кто находится за этими вратами. Большего тебе знать необязательно.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_11");	//И как мне пройти дальше?
	AI_Output(self,other,"DIA_XranFreg_Hello_01_12");	//Твоя дорога заканчивается здесь, смертный. Поворачивай назад или умрешь.
	AI_Output(other,self,"DIA_XranFreg_Hello_01_13");	//Ты не оставляешь мне выбора, страж. Я все равно пройду дальше!
	AI_Output(self,other,"DIA_XranFreg_Hello_01_15");	//Выбора не оставляешь мне ты. Дальше тебе не пройти.

	if(MIS_XRANFREG == LOG_Running)
	{
		B_GivePlayerXP(1000);
		B_LogEntry(TOPIC_XRANFREG,"Я встретил того каменного гиганта, о котором упоминалось в записях. По правде говоря, он не произвел на меня особого впечатления. Однако внешность порой обманчива...");
	};
};