const int GOTHIC_BASE_VERSION = 2;

//--------------------------------------
// Пользовательские переменные:
//--------------------------------------

const string MEM_FARFARAWAY = "TOT";		//здесь спаунится Mem-Helper
const string MEM_HELPER_NAME = "MEMHLP";    //его имя

const int zERR_TYPE_OK    = 0; /* [не используется]  */
const int zERR_TYPE_INFO  = 1; /* MEM_Info           */
const int zERR_TYPE_WARN  = 2; /* MEM_Warn           */
const int zERR_TYPE_FAULT = 3; /* MEM_Error          */
const int zERR_TYPE_FATAL = 4; /* [не используется]  */

const int zERR_ReportToZSpy     = zERR_TYPE_INFO;  //все от zERR_TYPE_INFO
const int zERR_ShowErrorBox     = zERR_TYPE_FAULT; //вывод сообщений об ошибках в окно MessageBox
const int zERR_PrintStackTrace  = zERR_TYPE_WARN; //трассировка содержимого стека при предупреждениях

const int zERR_ErrorBoxOnlyForFirst   = 1; /* никогда не показывать больше одного сообщения об ошибке */
const int zERR_StackTraceOnlyForFirst = 0; /* трассировка стека только для первой ошибки */

/* Отладочные сообщения:
 * MEM_Debug не используется в Ikarus и представляет собой
 * свободно конфигурируемый информационный канал. */
 
const string zERR_DEBUG_PREFIX   = "Debug: ";      //Этот префикс всегда ставится перед сообщением
const int    zERR_DEBUG_TOSPY    = 1;              //Отправлять сообщения MEM_Debug в ZSpy?
const int    zERR_DEBUG_TYPE     = zERR_TYPE_INFO; //Если да, то как отправлять в ZSpy?
const int    zERR_DEBUG_TOSCREEN = 0;              //Вывод сообщений MEM_Debug на экран через "Print".
const int    zERR_DEBUG_ERRORBOX = 0;              //Показывать окно Error-Box (с кнопкой OK).

//--------------------------------------
// Адреса
//--------------------------------------

//Парсер
const int ContentParserAddress      = 11223232; //0xAB40C0;
const int vfxParserPointerAddress   =  9234156; //0x8CE6EC
const int menuParserPointerAddress  =  9248360; //0x8D1E68
const int pfxParserPointerAddress   =  9278004; //0x8D9234

//ShowDebug
const int showDebugAddress	= 11232372; //0xAB6474

//Массив, содержащий все созданные (и не разрушенные) меню
const int MEMINT_MenuArrayOffset		= 9248324; //0x8D1E44
const int MEMINT_MenuItemArrayAddres	= 9248508; //0x8D1EFC

//Несколько полезных статических объектов
const int MEMINT_oGame_Pointer_Address			= 11208836; //0xAB0884
const int MEMINT_zTimer_Address					= 10073044; //0x99B3D4
const int MEMINT_oCInformationManager_Address	= 11191384; //0xAAC458
const int MEMINT_gameMan_Pointer_address		= 9185624; //0x8C2958

//Массив случайных чисел движка (для хэша):
const int crc_table_address	= 8598048; //0x833220

//Массив с информацией о нажатых клавишах
const int MEMINT_KeyEvent_Offset  = 9246328; //0x8D1678
const int MEMINT_KeyToggle_Offset = 9246904;
const int MEMINT_KeyBuffer_offset = 9248080; //0x8D1D50

//Статические объекты для управления спауном (из Spawnmanager)
const int SPAWN_INSERTTIME_MAX_Address = 9153740;/*8BACCC*/ //zREAL*
const int SPAWN_INSERTRANGE_Address    = 9153744;/*8BACD0*/ //zREAL*
const int SPAWN_REMOVERANGE_Address    = 9153748;/*8BACD4*/ //zREAL*

//Игровое время не меняется, если установлен:
const int game_holdTime_Address = 11208840; //0xAB0888 //zBOOL*

//Статические свойства, касающиеся отображения субтитров:
const int oCNpc_isEnabledTalkBox_Address        =  9142548; //0x8B8114 //zBOOL* //перекрывает следующие три настройки
const int oCNpc_isEnabledTalkBoxPlayer_Address  =  9142552; //0x8B8118 //zBOOL*
const int oCNpc_isEnabledTalkBoxAmbient_Address = 11216504; //0xAB2678 //zBOOL*
const int oCNpc_isEnabledTalkBoxNoise_Address   = 11216508; //0xAB267C //zBOOL*

//глобальный экран (тип zCView) на нем, напр., отображается полоска жизни
const int screen_offset = 11232360;	//0xAB6468

//Инкапсуляция Gothic.ini (готовая для доступа через функции)
const int zoptions_Pointer_Address		= 9230728; //0x8CD988
//[modname].ini (готов для доступа через функции)
const int zgameoptions_Pointer_Address	= 9230732; //0x8CD98C

//bspFrameCtr:
const int bspFrameCtr_Address = 9259332; //0x8D4944;

//Счетчик производительности, в тактах (тиках) в миллисекунду
const int PC_TicksPerMS_Address = 9255828; //0x8D3B94

//--------------------------------------
// Другие константы
//--------------------------------------

//Адрес таблицы методов для распознавания объектов
const int oCMobFire_vtbl        = 8638876;
const int zCMover_vtbl          = 8627324;
const int oCMob_vtbl            = 8639700;
const int oCMobInter_vtbl       = 8639884;
const int oCMobLockable_vtbl    = 8637628;
const int oCMobContainer_vtbl   = 8637284;
const int oCMobDoor_vtbl        = 8638548;
const int oCItem_vtbl           = 8636420;
const int oCNpc_vtbl            = 8640292;
const int zCVobLight_vtbl		= 8624756;

