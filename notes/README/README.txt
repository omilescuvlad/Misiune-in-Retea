Acest proiect a fost inițial creat în GameMaker prin secțiunea „Tutorial Projects” și are la bază structura de pornire oferită în tutorialul oficial de tip RPG.

Tutorialul utilizat ca punct de plecare:
„GameMaker RPG Tutorial – Part 1”  
Autor: GameMaker (YoYo Games Official)  
Link: https://youtu.be/1J5EydrnIPs

Elemente precum sistemul de camere, coliziunile de bază și structura proiectului au fost adaptate sau extinse în cadrul acestui joc.

Alte tutoriale utilizate pentru funcționalități specifice:
  - https://www.youtube.com/watch?v=NB6uYFmTzWU
  - https://www.youtube.com/watch?v=HqmQAoPdZ2U
  - https://www.youtube.com/watch?v=wTJgnxJ6M-I
  - https://www.youtube.com/watch?v=CrRLlzHoW1M
  - https://www.youtube.com/watch?v=2JDkTIk2OkI

Sunete
Efect sonor: "Door Unlock"
Autor: angelkunev
Sursa: https://freesound.org/people/angelkunev/sounds/519065/
Licență: Creative Commons Attribution-NonCommercial 4.0
Link licență: https://creativecommons.org/licenses/by-nc/4.0/


Efect sonor: "Beep Short"
Denumire în proiect: snd_beep
Autor: InspectorJ (www.jshaw.co.uk)
Sursa: https://freesound.org/people/InspectorJ/sounds/403008/
Licență: Creative Commons Attribution 4.0
Link licență: https://creativecommons.org/licenses/by/4.0/
Utilizare:
Acest efect sonor este folosit ca feedback audio la fiecare caracter introdus de jucător în interfața de terminal. Este asociat cu funcția de scriere în puzzle-ul bazat pe SHA-256.

🔡 Fonturi
Font utilizat în terminal: Consolas
Font standard de sistem – utilizat cu mărime 10pt, fără anti-aliasing, pentru a simula o interfață tip terminal.

🧩 Extensii GameMaker
SHA-256 GML Implementation
Autor: Anixia (Reddit user)
Sursa: https://www.reddit.com/r/gamemaker/comments/eween1/sha256_hashes_in_native_gml_gms2/
Format: GML native extension (GMS2_AnixiasSHA256.yymp)
Utilizare: Hashing SHA-256 pentru validarea parolelor în puzzle-uri de securitate.

🧪 Alte resurse
GameMaker Asset: fnt_terminal
Font intern creat manual pentru interfața de terminal (Consolas, 10pt, fără anti-aliasing)

🧱 Tileset & Grafică
Tileset: "Pixel Cyberpunk Interior"
Autor: LivingTheIndie
Sursa: https://livingtheindie.itch.io/pixel-cyberpunk-interior
Licență: Gratuit pentru uz non-comercial (Free for personal/academic use – itch.io terms)
Utilizare:
Tileset-ul a fost folosit pentru a construi toate camerele jocului, incluzând decor, elemente interactive și interfețe statice.
În cadrul proiectului GameMaker, tilesetul a fost importat cu denumirea:
spr_pixel_cyberpunk_interior

Sprite-uri derivate din tileset:

spr_gate_closed – poartă blocată

spr_gate_open – poartă deschisă

spr_security_room_hint – indiciu vizual pentru terminal

spr_terminal – interfață de terminal folosită în puzzle-ul cu SHA-256

