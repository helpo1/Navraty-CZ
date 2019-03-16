
instance DIA_DMT_2200_DarkSpeaker_Exit(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 999;
	condition = DIA_DMT_2200_DarkSpeaker_Exit_condition;
	information = DIA_DMT_2200_DarkSpeaker_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2200_DarkSpeaker_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2200_DarkSpeaker_Hello(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_Hello_condition;
	information = DIA_DMT_2200_DarkSpeaker_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2200_DarkSpeaker_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_00");	//Вот мы наконец-то и встретились, герой...
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_01");	//А ты кто такой?
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_02");	//Очередной приспешник Белиара, которого он послал, чтобы остановить меня?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_03");	//Мое имя тебе ничего не скажет. Но у меня есть к тебе одно предложение.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_04");	//Надеюсь ты выслушаешь его прежде, чем попытаешься меня убить.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_05");	//Ну говори! Только быстро и по делу.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_06");	//Я пришел с предложением от моего повелителя.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_07");	//Он видит в тебе огромную силу, способную навсегда изменить облик этого мира.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_08");	//Сейчас ты сражаешься на стороне его брата, но подумай хорошенько - действительно ли оно того стоит?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_09");	//Что сделал для тебя этот твой бог? Какими благами он тебя одарил за столь верную службу?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_10");	//Уверен, что ничего подобного у него и в мыслях не было. В то время, как ты постоянно рискуешь своей жизнью ради него!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_11");	//А мой хозяин мог бы тебе дать куда больше, чем просто пустые обещания этого лживого лицемера.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_12");	//Ты получишь все - власть, могущество, богатство в той мере, какую сам сочтешь для себя нужной.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_13");	//И будь уверен, он тебя не обманет!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_14");	//Ну так как, что скажешь?
	Info_ClearChoices(dia_dmt1298_hello);
	MeetDarkRavenSpeaker = TRUE;

	//if(DarkPathStartEnd == FALSE)
	//{
	//	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,"Звучит заманчиво!",DIA_DMT_2200_DarkSpeaker_Hello_Yes);
	//};

	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,"Скажу, что для тебя пришло время умирать.",DIA_DMT_2200_DarkSpeaker_Hello_No);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Yes()
{
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_01");	//Звучит заманчиво! 
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_02");	//Но где гарантии, что твой повелитель действительно явит мне свою милость, если я соглашусь на твое предложение.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_03");	//Не волнуйся! Он это сделает... Он всегда это делает!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_04");	//Однако всему свое время. Прежде ты должен будешь доказать свою верность, а уже после поговорим о твоей награде.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_05");	//Ну, хорошо. Допустим, я согласен!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_06");	//Это мудрое решение...(довольно) Уверен, ты не пожалеешь об этом. Теперь к делу...
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_07");	//Я знаю, что ты ищещь способ добыть у паладинов могущественный артефакт - Глаз Инноса!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_08");	//Уверен, рано или поздно он окажется у тебя в руках.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_09");	//И в знак того, что ты склоняешь голову перед владыкой Тьмы и нарекаешь себя его слугой, ты должен будешь принести его нам.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_10");	//Как видишь, ничего сложного.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_11");	//Всего то лишь! Хорошо, я это сделаю.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_12");	//Тогда мы будем ждать тебя в круге Солнца! Приходи туда с амулетом, когда он будет у тебя.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_13");	//А теперь прощай...уверен, мы скоро встретимся.
	DarkPathStart = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

func void DIA_DMT_2200_DarkSpeaker_Hello_No()
{
	var int randyspeech;

	randyspeech = Hlp_Random(2);

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_No_01_01");	//Скажу, что для тебя пришло время умирать.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_No_01_02");	//Что же, как знаешь...(с угрозой) Ты сам выбрал свою судьбу!
	Info_ClearChoices(DIA_DMT_2200_DarkSpeaker_Hello);
	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,Dialog_Ende,DIA_DMT_2200_DarkSpeaker_Hello_Quit);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Quit()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,2,500);
	}
	else
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,1,500);
	};

	self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;

	//---------------------------основная----------------------------

	if(Npc_IsDead(Salandril) == FALSE)
	{
		Salandril.aivar[AIV_ToughGuy] = TRUE;
	};

	Cornelius.flags = FALSE;
	NoDarkInsMe = TRUE;

	if(!Npc_IsDead(Hodges))
	{
		B_StartOtherRoutine(Hodges,"BENNETWEG");
	};
	if(Npc_IsDead(Sekob) == FALSE)
	{
		B_StartOtherRoutine(Sekob,"FleeDMT");
		B_StartOtherRoutine(Rosi,"FleeDMT");
		B_StartOtherRoutine(Till,"FleeDMT");
		B_StartOtherRoutine(Balthasar,"FleeDMT");
		B_StartOtherRoutine(BAU_933_Rega,"FleeDMT");
		B_StartOtherRoutine(BAU_934_Babera,"FleeDMT");
		B_StartOtherRoutine(BAU_937_Bauer,"FleeDMT");
		B_StartOtherRoutine(BAU_938_Bauer,"FleeDMT");
		Wld_InsertNpc(DMT_DementorAmbientSekob1,"NW_FARM4_IN_06");
		Wld_InsertNpc(DMT_DementorAmbientSekob2,"NW_FARM4_IN_02");
		Wld_InsertNpc(DMT_DementorAmbientSekob3,"NW_FARM4_IN_03");
		Wld_InsertNpc(DMT_DementorAmbientSekob4,"NW_FARM4_IN_04");
	};

	B_StartOtherRoutine(Lester,"WAITFORPLAYER");
	AI_Teleport(Lester,"NW_GREATPEASENT_TO_PASS");
	B_StartOtherRoutine(Bennet,"PRISON");
	B_RemoveNpc(PAL_203_Lothar);

	if(Bennet.flags == NPC_FLAG_IMMORTAL)
	{
		Bennet.flags = NPC_FLAG_NONE;
	};

	if(Npc_IsDead(Malak) == FALSE)
	{
		B_StartOtherRoutine(Malak,"FleeFromPass");
		Malak_isAlive_Kap3 = TRUE;
		B_StartOtherRoutine(BAU_962_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_964_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_965_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_966_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_967_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_968_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_969_Bauer,"FleeFromPass");

		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(Malak,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CITY_TO_FARM2_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_BIGFARM_FELDREUBER11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_02");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_04");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_05");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_06");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_01");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_07");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_08");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_09");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_10");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_12");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_13");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_14");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_16");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_17");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_18");
	Wld_InsertNpc(DMT_DementorAmbientWalker11,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker9,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker6,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker3,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker1,"CITY1");

	if(Npc_IsDead(skeletonmage_darktower) == TRUE)
	{
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_02");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_03");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_04");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_05");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_ITEM_FARM1_03");
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_NW_ITEM_TROLL_10");
		B_StartOtherRoutine(Hilda,"KRANK");

		if(Npc_IsDead(Vino) == FALSE)
		{
			B_StartOtherRoutine(Vino,"OBESESSIONRITUAL");
			CreateInvItems(Vino,ITWR_DementorObsessionBook_MIS,1);
			Vino_isAlive_Kap3 = TRUE;
			B_StartOtherRoutine(Lobart,"OBESESSIONRITUAL");
			Wld_InsertNpc(DMT_DementorSpeakerVino1,"FP_STAND_DEMENTOR_KDF_31");
			Wld_InsertNpc(DMT_DementorSpeakerVino2,"FP_STAND_DEMENTOR_KDF_32");
			Wld_InsertNpc(DMT_DementorSpeakerVino3,"FP_STAND_DEMENTOR_KDF_33");
			Wld_InsertNpc(DMT_DementorSpeakerVino4,"NW_LITTLESTONEHENDGE_02");
			B_KillNpc(YGiant_Bug_VinoRitual1);
			B_KillNpc(YGiant_Bug_VinoRitual2);
		};
		if(Npc_IsDead(Bromor) == FALSE)
		{
			CreateInvItems(Bromor,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	CreateInvItems(Lester,ItMw_1h_Bau_Axe,1);
	CreateInvItems(Ehnim,ItMi_Moleratlubric_MIS,1);
	ShrineIsObsessed_NW_TROLLAREA_PATH_37 = TRUE;
	ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_66 = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_04 = TRUE;
	ShrineIsObsessed_SAGITTA = TRUE;
	ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = TRUE;
	ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = TRUE;

	if((Npc_IsDead(BDT_1060_Dexter) == TRUE) && (DMTINCASTLEMINEISREADY == FALSE))
	{
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_REP_HUT");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_HUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"CASTLEMINE");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CASTLEMINE_PATH_03");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_HUT_01");
		Wld_InsertNpc(CastlemineDMT,"NW_CASTLEMINE_HUT_10");
		DMTINCASTLEMINEISREADY = TRUE;
	};
};

instance DIA_DMT_2200_DarkSpeaker_InnosEye(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_InnosEye_condition;
	information = DIA_DMT_2200_DarkSpeaker_InnosEye_info;
	permanent = FALSE;
	description = "Я принес тебе артефакт Инноса.";
};

func int DIA_DMT_2200_DarkSpeaker_InnosEye_condition()
{
	if(Npc_HasItems(hero,ItMi_InnosEye_Bad) >= 1)
	{
		return TRUE;
	};
};

func void DIA_DMT_2200_DarkSpeaker_InnosEye_info()
{
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_00");	//Я принес тебе артефакт Инноса.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_01");	//Покажи мне его!
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_02");	//Вот он.
	B_GiveInvItems(other,self,ItMi_InnosEye_Bad,1);
	Npc_RemoveInvItems(self,ItMi_InnosEye_Bad,1);
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_03");	//Отлично! Ты принял мудрое решение, отдав его мне, и тем самым доказал свою готовность служить Белиару.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_04");	//А как насчет обещаной награды?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_05");	//Само собой! Вот, возьми это золото в качестве поощрения за свои труды.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_06");	//Благодарю. Что теперь?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_07");	//Думаю, пришло время тебе встретиться с нашим настоятелем.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_08");	//Он мудр и могущественен! Он лучше меня объяснит тебе все.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_09");	//Кроме того, я уверен, что у него наверняка найдутся для тебя поручения.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_10");	//И могу дать тебе один совет - постарайся его не разочаровывать!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_11");	//А если будешь также ретив, как был с амулетом, то вскоре возможно станешь одним из нас.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_12");	//Но об этом пока еще рано говорить.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_13");	//Ладно. Где я смогу встретиться с этим вашим настоятелем?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_14");	//Он будет ждать тебя в разрушенной башне, что возле старого маяка. Там еще недалеко находится проход в форт паладинов.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_15");	//И лучше ступай к нему прямо сейчас! Не стоит заставлять его ждать...
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_16");	//Хорошо, уже иду.
	TOPIC_END_INNOSEYE = TRUE;
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_SUCCESS);
	B_LogEntry_Quiet(TOPIC_INNOSEYE,"Я отдал артефакт Инноса слуге Белиара! Тот был очень доволен. По всей видимости теперь моя судьба неразрывно связана с багровой тьмой Белиара...и обратной дороги нет!");
	MIS_MeetWithDark = LOG_Running;
	NazgulsAwayMe = TRUE;
	Log_CreateTopic(TOPIC_MeetWithDark,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetWithDark,LOG_Running);
	B_LogEntry(TOPIC_MeetWithDark,"Мне нужно встретиться с настоятелем Темных странников. Он ждет меня в разрушеной башне, рядом с маяком, неподалеку от прохода в форт паладинов. Думаю, не стоит заставлять его ждать...");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ritual");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_01");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_02");
	Wld_InsertNpc(DMT_2201_Krah,"NW_DARKMASTER_02");
};

//---------------------------------------------------------------------------------------------

instance DIA_DMT_2201_Krah_Exit(C_Info)
{
	npc = DMT_2201_Krah;
	nr = 999;
	condition = DIA_DMT_2201_Krah_Exit_condition;
	information = DIA_DMT_2201_Krah_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2201_Krah_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2201_Krah_Exit_info()
{
	AI_StopProcessInfos(self);
};

var int DS_CheckInfo_01;
var int DS_CheckInfo_02;
var int DS_CheckInfo_03;

instance DIA_DMT_2201_Krah_Hello(C_Info)
{
	npc = DMT_2201_Krah;
	nr = 1;
	condition = DIA_DMT_2201_Krah_Hello_condition;
	information = DIA_DMT_2201_Krah_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2201_Krah_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2201_Krah_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_00");	//Ты заставляешь себя ждать...
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_01");	//Я пришел, как только смог.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_02");	//Ладно, это уже не важно.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_03");	//Кто ты?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_04");	//Меня зовут Эк'Рах.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_05");	//Я - один из наставников темных магов Белиара или, как вы их люди зовете - Ищущих.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_06");	//Хотя, по правде говоря, у нас более нет нужды в поисках. Ведь мы уже нашли то, что искали.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_07");	//И что же вы искали?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_08");	//Тебя разумеется! Искали, чтобы сделать тебе предложение присоединиться к нам.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_09");	//И как я вижу, ты принял его... Что же, мудрое решение!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_10");	//Ибо Белиар всегда щедр к тем, кто служит ему верой и правдой. В отличии от своих братьев.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_11");	//Но хватит болтовни! У нас слишком мало времени, чтобы придаваться лишь хвальбам нашего повелителя.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_12");	//В мире грядут перемены, большие перемены, в которых тебе отведена не последняя роль, герой.
	Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Зачем вам понадобился 'Глаз Инноса'?",DIA_DMT_2201_Krah_Hello_Eye);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Кто на самом деле такие Ищущие?",DIA_DMT_2201_Krah_Hello_About);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Что ты имеешь ввиду?",DIA_DMT_2201_Krah_Hello_Plan);
};

func void DIA_DMT_2201_Krah_Hello_Eye()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Eye_01_00");	//Зачем вам понадобился 'Глаз Инноса'?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_01");	//Уверен, ты в курсе, что это очень могущественный артефакт, созданый братом нашего повелителя.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_02");	//Само его присутствие в этом мире с нашей стороны просто недопустимо.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_03");	//Поэтому, он должен быть непременно уничтожен! Ну, а ты нам помог в этом.
	DS_CheckInfo_01 = TRUE;
	
	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Что дальше?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_About()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_00");	//Кто на самом деле такие Ищущие?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_01");	//Они просто могущественные маги, отдавшие себя в услужение Темному богу.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_02");	//Многие из них вступили на этот путь очень давно, но есть и те, которые присоединились к нашему братству совсем недавно.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_03");	//Например, безумные фанатики, поклонявшиеся Спящему еще до его изгнания тобой из этого мира.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_04");	//Откуда ты знаешь, что это я сразил Спящего?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_05");	//Некоторые вещи довольно трудно скрыть от взгляда тех, кто умеет понастоящему видеть.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_06");	//К тому же, всплеск магической энергии был настолько велик, что его нельзя было не почувствовать.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_07");	//Впрочем, думаю это не последнее явление Спящего этому миру.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_08");	//Наверняка найдутся те, кто попытается вернуть его в этот мир.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_09");	//Интересно зачем?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_10");	//Спящий очень древний и могущественный демон, чье появление уходит корнями к самим истокам зарождения этого мира.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_11");	//Так что, его сила вполне бы могла заинтересовать многих. В том числе и нашего повелителя.
	DS_CheckInfo_02 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Что дальше?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_Plan()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Plan_01_00");	//Что ты имеешь ввиду?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_01");	//Пока что тебе рано знать об этом! Придет время и ты сам все поймешь.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_02");	//Но могу сказать лишь одно - этот мир уже не будет таким, как раньше.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_03");	//А то место, которое займем в нем мы, зависит от успеха наших деяний во имя Темного Бога!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_04");	//Так что постарайся думать лишь об этом и не отвлекаться на мирскую суету.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Plan_01_05");	//Ладно, попробую.
	DS_CheckInfo_03 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Что дальше?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_WhatDo()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_WhatDo_01_00");	//Хорошо. Что дальше?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_01");	//Сейчас я открою магический портал. Через него ты попадешь в обитель темных странников, расположенную на острове Ир'Эрат. 
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_02");	//Там ты начнешь свое обучение искусству темной магии. Или же встанешь на путь воина Белиара!
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_WhatDo_01_03");	//Меня что, будут учить?!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_04");	//Глядя на тебя, я понимаю, что это просто неоходимо! Ибо сейчас ты слишком слаб, чтобы быть по настоящему полезным Темному Богу.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_05");	//А когда ты будешь готов, мы еще вернемся к нашему разговору.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_06");	//Когда прибудешь на Ир'Эрат - поговори с настоятелем Киратом. Он тебя введет в дальнейший курс дела.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_07");	//Это все! Теперь не теряй времени...у нас его осталось не так уж и много.
	AI_StopProcessInfos(self);
	WayToIrat = TRUE;
};

//---------------------------------Настоятель Кират------------------------------------------------------------

instance DIA_DMT_2202_Kirat_Exit(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 999;
	condition = DIA_DMT_2202_Kirat_Exit_condition;
	information = DIA_DMT_2202_Kirat_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2202_Kirat_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2202_Kirat_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2202_Kirat_Hello(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_Hello_condition;
	information = DIA_DMT_2202_Kirat_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_Hello_condition()
{
		return TRUE;
};

func void DIA_DMT_2202_Kirat_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_00");	//Я не буду тебя спрашивать - кто ты и зачем ты здесь.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_01");	//Если ты очутился в этом месте, значит скорей всего тебя прислал кто-то из наших настоятелей.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_01_02");	//Меня прислал Эк'Рах!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_03");	//Мастер Эк'Рах?! Интересно... Что же ты сделал, чтобы заслужить его внимание?
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_01_04");	//О чем ты говоришь?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_05");	//Как о чем? Ведь он один из самых могущественных наставников нашего анклава.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_06");	//Только избранные удостаивались подобной чести.
	Info_ClearChoices(DIA_DMT_2202_Kirat_Hello);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello,"Не твоего ума дело!",DIA_DMT_2202_Kirat_Hello_Bad);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello,"Я принес ему Глаз Инноса.",DIA_DMT_2202_Kirat_Hello_Good);
};

func void DIA_DMT_2202_Kirat_Hello_Bad()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Bad_01_00");	//Не твоего ума дело!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_01");	//Хорошо, как скажешь.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_02");	//Ладно, пойдем. Я провожу тебя в храм.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_03");	//Об остальном мы поговорим позже.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

func void DIA_DMT_2202_Kirat_Hello_Good()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Good_01_00");	//Я принес ему Глаз Инноса.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_01");	//Глаз Инноса?! Тот самый могущественный артефакт палладинов?
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Good_01_02");	//Да, именно его.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_03");	//Невероятно! Тогда это объясняет твое присутствие здесь.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_04");	//Ладно, пойдем. Я провожу тебя в храм.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_05");	//Об остальном мы поговорим позже.
	KirratPRP += 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

instance DIA_DMT_2202_Kirat_WelcomeHell(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WelcomeHell_condition;
	information = DIA_DMT_2202_Kirat_WelcomeHell_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_WelcomeHell_condition()
{
	if(Npc_GetDistToWP(self,"DT_KIRATWAIT_02") <= 500)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WelcomeHell_info()
{
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_00");	//Вот мы и на месте.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_01");	//Впечатляет! И чей это храм?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_02");	//Храм Белиара, конечно же! Один из тех двух, которые все еще действуют.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_03");	//А были и другие?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_04");	//Были, до тех пор пока не были разрушены палладинами Инноса.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_05");	//Сейчас их осталось только два - наш и тот, что располагается на острове Ирдорат.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_06");	//Ирдорат?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_07");	//Там находится великое святилище Зверя и покои того, кого сам Белиар выбрал своим избранным в этом мире.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_08");	//Но тебе туда никогда не попасть. Так что, лучше выбрось это из головы.
};

instance DIA_DMT_2202_Kirat_WhoMain(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 2;
	condition = DIA_DMT_2202_Kirat_WhoMain_condition;
	information = DIA_DMT_2202_Kirat_WhoMain_info;
	permanent = FALSE;
	description = "Кто тут главный?";
};

func int DIA_DMT_2202_Kirat_WhoMain_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoMain_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_00");	//Кто тут главный?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_01");	//Наш анклав возглавляет великий мастер Ми'Аргул. Он является и главным настоятелем храма!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_02");	//Кроме этого, в высший совет святилища входят мастера Мулзог и Норрат.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_03");	//Первый является наставником темных адептов и проводит их обучение магическим искусствам.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_04");	//Второй же обучет воинов Белиара - преданных фанатиков, готовых отдать свою жизнь ради нашего господина.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_05");	//Белиару так нужны воины? Разве ему не хватает бесчисленной армии нежити?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_06");	//Все не так просто, друг мой. Не все создания тьмы следуют его зову.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_07");	//В этом мире достаточно сил, которые неподвластны даже ему.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_08");	//Кому же тогда они поклоняются?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_09");	//Тем, кто стоял у истоков зарождения этого мира. Тем, кто сотворил этот мир и самих богов.
};

instance DIA_DMT_2202_Kirat_WhoYou(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoYou_condition;
	information = DIA_DMT_2202_Kirat_WhoYou_info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_DMT_2202_Kirat_WhoYou_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoYou_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_01");	//Мое имя - Кират. Хотя уверен, что тебе это мало о чем говорит.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_02");	//И чем ты занимаешься, Кират?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_03");	//Я забочусь о вновь прибывших послушниках и ввожу их в курс происходящего.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_04");	//А также слежу за порядком.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_05");	//Не очень сложная работа.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_06");	//Хммм...как сказать.
};

instance DIA_DMT_2202_Kirat_WhatRules(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatRules_condition;
	information = DIA_DMT_2202_Kirat_WhatRules_info;
	permanent = FALSE;
	description = "Что я должен знать об этом месте?";
};

func int DIA_DMT_2202_Kirat_WhatRules_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatRules_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatRules_01_00");	//Что я должен знать об этом месте?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_01");	//Прежде всего ты должен помнить, что это священный храм самого Белиара.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_02");	//Никто не должен знать об его существовании. Никто!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_03");	//Особенно это касается магов Инноса и его паладинов.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_04");	//Эти безумные фанатики не остановятся ни перед чем, чтобы добраться сюда.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_05");	//А мы сейчас еще слишком слабы, чтобы противостоять им в открытой битве.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_06");	//Теперь о более насущных вещах. Наш анклав не потерпит воров или смутьянов. 
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_07");	//За любую драку или воровство провинившегося ждет только одно наказание - смерть!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_08");	//Всегда помни об этом.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_09");	//И самое главное - не забывай проводить достаточно времени в молитвах нашему господину.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_10");	//Его милось легко может смениться на гнев, если он увидит, что ты не слишком предан ему.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_11");	//Поэтому ее необходимо доказывать постоянно, если ты рассчитываешь подольше тут задержаться.
};


instance DIA_DMT_2202_Kirat_WhatPray(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatPray_condition;
	information = DIA_DMT_2202_Kirat_WhatPray_info;
	permanent = FALSE;
	description = "Где я смогу это сделать?";
};

func int DIA_DMT_2202_Kirat_WhatPray_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhatRules) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatPray_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatPray_01_00");	//Где я смогу это сделать?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_01");	//Алтари Темного Бога расположены по всему храму. Уверен, ты без труда их отыщешь.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_02");	//В любом из них ты сможешь помолиться нашему повелителю или приподнести ему небольшой дар. Кроме великого алтаря Тьмы!
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatPray_01_03");	//Что еще за великий алтарь Тьмы?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_04");	//Через него наш господин являет нам свою волю и принимает исключительно особенные подношения.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_05");	//Однако использовать его дозволено лишь мастеру Ми'Аргулу! Остальных же ждет суровое наказание в случае ослушания.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_06");	//Так что, мой тебе совет, держись лучше подальше от этого алтаря. 
};

instance DIA_DMT_2202_Kirat_WhoNow(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoNow_condition;
	information = DIA_DMT_2202_Kirat_WhoNow_info;
	permanent = FALSE;
	description = "Что теперь?";
};

func int DIA_DMT_2202_Kirat_WhoNow_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhoMain) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoNow_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_00");	//Что теперь?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_01");	//Для начала тебе следует поговорить с одним из мастеров.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_02");	//Если они сочтут тебя достойным, то вскоре ты начнешь свое обучение у одного из них.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_03");	//И как мне доказать им, что я достоин?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_04");	//Все они будут испытывать тебя. И не один раз...
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_05");	//А дальше все просто! Либо ты выдержишь испытания и завоюешь их уважение, либо тебя ждет мучительная смерть.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_06");	//Остальное уже зависит только от тебя.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_07");	//Понимаю.


	if(KirratPRP > 0)
	{
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_08");	//Но могу дать тебе один совет, как произвести хорошее впечатление на мастеров.
		AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_09");	//Я весь во внимании.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_10");	//Мастер Мулзог бывает слишком красноречив в своих наставлениях и порой выходи из себя, если его вдруг кто-то внезапно прервет.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_11");	//Один раз он убил одного послушника прямо на месте только лишь за то, что тот случайно чихнул во время его проповеди.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_12");	//Поэтому в его случае молчание является не только золотом, но и возможностью сохранить себе жизнь.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_13");	//Мастер Норрат наоборот довольно молчалив! По его лицу никогда нельзя понять, о чем он сейчас думает.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_14");	//Своих учеников он безжалостно гоняет с утра и доночи, обучая их боевому искусству.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_15");	//И жестоко наказывает тех, кто не выдерживает этих нечеловеческих нагрузок.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_16");	//Так что, на твоем месте я был подумал перед тем, как решиться с ним поговорить.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_17");	//Если ты дашь ему свое согласие пройти его испытания, обратного пути уже не будет.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_18");	//Надеюсь, ты понимаешь, о чем я?
		AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_19");	//Да, прекрасно понимаю.
	};

	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_20");	//Хорошо! Тогда не теряй времени и сразу же отправляйся к ним.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_21");	//Правда, если захочешь здесь немного осмотреться, никто думаю против не будет.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_22");	//Ты здесь новенький и у тебя наверняка будут еще вопросы.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_23");	//С ними лучше всего обращаться ко мне, а не к самим мастерам.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_24");	//Иначе, все это может крайне плохо кончиться. Для тебя, естественно.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_25");	//Все, теперь ступай послушник. Да славится имя Белиара!
	AI_StopProcessInfos(self);
};

//--------------------------Мулзог---------------------------------------------------------------

instance DIA_DMT_2204_Mulzog_Exit(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 999;
	condition = DIA_DMT_2204_Mulzog_Exit_condition;
	information = DIA_DMT_2204_Mulzog_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2204_Mulzog_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2204_Mulzog_Hello(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 1;
	condition = DIA_DMT_2204_Mulzog_Hello_condition;
	information = DIA_DMT_2204_Mulzog_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2204_Mulzog_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_00");	//Так, так... Кто это здесь? Ты что, новый послушник?
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_01");	//Да, мастер, он самый.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_02");	//Хммм...(пристально вглядываясь) Признаюсь, выглядишь ты довольно странно. И явно пытаешься что-то от меня скрыть.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_03");	//Ну да ладно! Разберемся с этим позже.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_04");	//Что-то не так?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_05");	//Меня просто удивляет тот факт, что такой человек как ты, решил служить Белиару.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_06");	//Не многие люди готовы посвятить ему всю свою жизнь. И тем более не многие готовы отдадь ее ради величия Темного бога.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_07");	//Если бы я не хотел служить Белиару, меня бы здесь не было.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_08");	//Но ты здесь! Хотя и не осознаешь, к чему тебя может привести выбранный тобой путь.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_09");	//Сейчас ты больше похож на слепого котенка, блуждающего в потьмах.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_10");	//Но я помогу тебе найти то, ради чего ты явился сюда. 
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_11");	//Ты знаешь, что мне нужно?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_12");	//Я все знаю...(ехидно) Власть и могущество - чего же еще могут желать люди? Ты не станешь в этом случае исключением.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_13");	//И я обещаю - ты получишь это все, если будешь верно и предано служить нашему повелителю. 
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_14");	//Не сразу, конечно, но со временем, у тебя будет все, о чем ты только мог мечтать.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_15");	//Если конечно ты окажешься достойным всех этих благ.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_16");	//Разве я это уже не доказал?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_17");	//Ты только доказал, что достоин быть призван сюда, в этот Храм. 
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_18");	//Но нужно еще заслужить право остаться здесь!
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_19");	//Что ты имеешь ввиду?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_20");	//А то, что служение Белиару это не только целование пола перед его статуей.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_21");	//Надо что-то посерьезней и позначимей, чтобы Темный бог, хотя и в моем лице, признал тебя достойным этих наград.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_22");	//А я уж было расслабился.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_23");	//В таком случае придется вновь собраться...(сухо)
};
