#define PDA(SIDE,NAME) \
    class SIDE##_EasyTrack_PDA : itemGPS { \
        author = MAINAUTHOR; \
        displayName = QUOTE(NAME EasyTrack PDA); \
        picture = QDATAPATH(icon_pda.paa); \
    }

#define TABLET(SIDE,NAME) \
    class SIDE##_EasyTrack_Tablet : itemGPS { \
        author = MAINAUTHOR; \
        displayName = QUOTE(NAME EasyTrack Tablet); \
        picture = QDATAPATH(icon_tablet.paa); \
 \
        class iteminfo { \
            mass = 10; \
        }; \
    }

class CfgWeapons {
    class itemGPS;

    PDA(b,BLUFOR);
    PDA(o,OPFOR);
    PDA(i,GUER);

    TABLET(b,BLUFOR);
    TABLET(o,OPFOR);
    TABLET(i,GUER);

    class EasyTrack_PDA_Destructed: itemGPS {
        _generalMacro = "EasyTrack_PDA";
        author = MAINAUTHOR;
        displayName = CSTRING(PDA_DESTRCUTED);
        picture = QDATAPATH(icon_pda_destructed.paa);
    };

    class EasyTrack_Tablet_Destructed: itemGPS {
        _generalMacro = "EasyTrack_Tablet";
        author = MAINAUTHOR;
        displayName = CSTRING(TABLET_DESTRCUTED);
        picture = QDATAPATH(icon_tablet_destructed.paa);

        class iteminfo {
            mass = 10;
        };
    };
};
