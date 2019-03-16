//#################################################################
//
//  Интерфейс Ini-файлов: zCOption
//
//#################################################################

/*
    Все эти "врЕменные значения" создают ощущение, что разработчики
    задумывали кнопку "применить". Если нажать на эту кнопку,
    временные значения станут постоянными.
    
    Кажется, эта возможность нигде не используется.
*/

//************************************
//  zCOptions - это интерфейс
//  доступа к ini-файлам.
//************************************

const int NUM_ENTRIES = 26;

class zCOption {
    var int _vbtl;
    var int m_bReadTemp;            //zBOOL //считывать "временное" значение вместо обычного

    //zCArray<zCOptionSection*> sectionList; //разделы, из которых состоит ini-файл
        var int sectionList_array;
        var int sectionList_numAlloc;
        var int sectionList_numInArray;
    
    var int directory[NUM_ENTRIES];      //zFILE*   //без понятия, для чего это.
    var string dir_string[NUM_ENTRIES];  //zSTRING //без понятия, для чего это.
    var string commandline;              //zSTRING //zCOptions также отвечает за командную строку.
};

class zCOptionSection { 
    var string secName;                 //zSTRING //имя раздела. Напр., "GAME"

    //zCArray<zCOptionEntry*> entryList; //вхождения в этой секции.
        var int entryList_array;
        var int entryList_numAlloc;
        var int entryList_numInArray;
};

const int sizeof_zCOptionSection = /* sizeof_zString */ 20 + 12;

class zCOptionEntry {   
    var int changed;            //zBOOL     //не используется?
    
    //zCArray <EntryChangeHandler> ccbList; //функции движка, которые следует информировать, если параметр изменился. Совершенно бесполезно для модостроителей.
        var int ccbList_array;
        var int ccbList_numAlloc;
        var int ccbList_numInArray;

    // Variable-Data    
    var string varName;        //zSTRING    //имя переменной
    var string varValue;       //zSTRING    //значение переменной (все представляется в виде строк)
    var string varValueTemp;   //zSTRING    //врЕменное значение переменной. См. выше. Бесполезно, насколько я могу судить.
    var int varFlag;           //int        //флаги переменной. Не заметил, чтобы они сколько-нибудь волновали движок.
};

const int sizeof_zCOptionEntry = 5*4 + 3 * 20;