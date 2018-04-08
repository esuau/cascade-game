--╭─────────────────────────────────────────────────╮
--|       ╔═╗╔═╗╔═╗╔═╗╔═╗╔╦╗╔═╗  ╔═╗╔═╗╔╦╗╔═╗       |
--|       ║  ╠═╣╚═╗║  ╠═╣ ║║║╣   ║ ╦╠═╣║║║║╣        |
--|       ╚═╝╩ ╩╚═╝╚═╝╩ ╩═╩╝╚═╝  ╚═╝╩ ╩╩ ╩╚═╝       |
--╞═════════════════════════════════════════════════╡
--| COPYRIGHT (C) 2015 - EVAN SUAU & XAVIER SAUNIER |
--╰─────────────────────────────────────────────────╯

--    ╭──────────────────────────────────────────╮
--    │ ≡ Design & Front-end                     │
--    ╞══════════════════════════════════════════╡
--    │ EVAN SUAU                                │
--    ├──────────┬───────────────────────────────┤
--    │ Email    │ evan.suau@etu.u-pec.fr        │
--    ├──────────┼───────────────────────────────┤
--    │ Twitter  │ @evan_suau                    │
--    ├──────────┼───────────────────────────────┤
--    │ Location │ Sucy-en-Brie, FR              │
--    ╰──────────┴───────────────────────────────╯

--    ╭──────────────────────────────────────────╮
--    │ ≡ Front-end & Back-end                   │
--    ╞══════════════════════════════════════════╡
--    │ XAVIER SAUNIER                           │
--    ├──────────┬───────────────────────────────┤
--    │ Email    │ xavier.saunier@etu.u-pec.fr   │
--    ├──────────┼───────────────────────────────┤
--    │ Skype    │ ragen_vlad                    │
--    ├──────────┼───────────────────────────────┤
--    │ Location │ Saint-Maur-des-Fosses, FR     │
--    ╰──────────┴───────────────────────────────╯


with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random, genericPile;
use ada.text_io, ada.integer_text_io;

package body cascade is

    
    
    -------------------
    --PROCEDURE TITLE--
    -------------------
    --affichage esthétique du titre--
    procedure title is
    begin
        put_line(" ██████╗ █████╗ ███████╗ ██████╗ █████╗ ██████╗ ███████╗     ██████╗  █████╗ ███╗   ███╗███████╗");
        put_line("██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝");
        put_line("██║     ███████║███████╗██║     ███████║██║  ██║█████╗      ██║  ███╗███████║██╔████╔██║█████╗");
        put_line("██║     ██╔══██║╚════██║██║     ██╔══██║██║  ██║██╔══╝      ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝");
        put_line("╚██████╗██║  ██║███████║╚██████╗██║  ██║██████╔╝███████╗    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗");
        put_line(" ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝");
        put_line("Credits : Evan SUAU & #Xavier SAUNIER#");
    end title;
    
    
    
    package scorePile is new genericPile(gameHistory);
    use scorePile;
    history : scorePile.pile;
    ------------------
    --PROCEDURE GAME--
    ------------------
    --gère le déroulement du jeu dans sa globalité--
    procedure game is
        
        procedure displayScoreHistory(h : scorePile.pile) is
        begin
            new_line;
            put_line("╔═╗┌┬┐┌─┐┌┬┐┌─┐");
            put_line("╚═╗ │ ├─┤ │ └─┐");
            put_line("╚═╝ ┴ ┴ ┴ ┴ └─┘");
            put_line("╭────────────────────────╮");
            put_line("|  #  |  score  |  hits  |");
            put_line("╞═════╡═════════╞════════╡");
            for i in 1..numGame loop
                put("|  #");
                put(i, 0);
                put(" | ");
                put(h.tabPile(i-1).scoreHistory, 4);
                put("    | ");
                put(h.tabPile(i-1).hits, 3);
                put("    | ");
                new_line;
            end loop;
            put_line("╰─────┴─────────┴────────╯");
        end displayScoreHistory;
            
    begin
        score := 0;
        new_line;
        put_line("╔╗╔┌─┐┬ ┬  ╔═╗┌─┐┌┬┐┌─┐");
        put_line("║║║├┤ │││  ║ ╦├─┤│││├┤");
        put_line("╝╚╝└─┘└┴┘  ╚═╝┴ ┴┴ ┴└─┘");
        put("Game #");
        put(numGame, 0);
        new_line;
        getHeightLength(height, length);
        new_line;
        play(height, length);
        gmHstr.scoreHistory := score;
        ajouter(history, gmHstr);
        displayScoreHistory(history);
        numGame := numGame + 1;
        gameOver;
    end game;


    
    -----------------------------
    --PROCEDURE GETLENGTHHEIGHT--
    -----------------------------
    --sert à entrer la valeur de height et de length--
    procedure getHeightLength(height, length : out integer) is
    begin
        <<choseGridDimension>>
        new_line;
        put_line("CHOOSE GRID DIMENSIONS");
        put("HEIGHT = ");
        get(height);
        if height not in positive'range then
            put_line("ERROR: Enter value over zero.");
            goto choseGridDimension;
        end if;
        put("LENGTH = ");
        get(length);
        if length not in positive'range then
            put_line("ERROR: Enter value over zero.");
            goto choseGridDimension;
        end if;
        
        exception
            when constraint_error => put_line("ERROR: Enter value over zero.");
            when storage_error => put_line("ERROR: Too large value.");
            when others => put_line("ERROR: Enter a positive integer.");
    end getHeightLength;
    
    
    
    ------------------
    --PROCEDURE INIT--
    ------------------
    --initialise un tableau de dimention length x height--
    --nous implémentons plusieurs procédures pour la répartition 1/3--
    procedure init(t : out tab) is
    
        --DECLARATIONS POUR RANDOMINIT--
        subtype randomValue is integer range 0..2;
        package randomColor is new ada.numerics.discrete_random(randomValue);
        use randomColor;
        gInit : randomColor.generator;
        
        subtype randomCoor1 is natural range t'range(1);
        package randomConfig1 is new ada.numerics.discrete_random(randomCoor1);
        use randomConfig1;
        gConfig1 : randomConfig1.generator;
        
        subtype randomCoor2 is natural range t'range(2);
        package randomConfig2 is new ada.numerics.discrete_random(randomCoor2);
        use randomConfig2;
        gConfig2 : randomConfig2.generator;
        
        --variables de comptage des occurences de  caractères dans le tableau--
        --incrémentées pendant le remplissage--
        s, r, p : natural := 0;
        
        function full(t : in tab) return boolean is
        begin
            for i in t'range(1) loop
                for j in t'range(2) loop
                    if (t(i, j) /= 0) or (t(i, j) /= 1) or (t(i, j) /= 2) then
                        return false;
                    end if;
                end loop;
            end loop;
            return true;
        end full;
        
        
    begin
        reset(gInit);
        for i in 0..((t'length(1)-1 * t'length(2)-1) / 3)+1 loop
            reset(gConfig1);
            reset(gConfig2);
            t(random(gConfig1), random(gConfig2)) := 0;
            reset(gConfig1);
            reset(gConfig2);
            t(random(gConfig1), random(gConfig2)) := 1;
        end loop;
        for i in t'range(1) loop
            for j in t'range(2) loop
                if t(i, j) /= 0 or else t(i, j) /= 1 or else t(i, j) /= 2 then
                    t(i, j) := random(gInit);
                end if;
            end loop;
        end loop;
        display(t);
    end init;
    
    
    
    ---------------------
    --PROCEDURE DISPLAY--
    ---------------------
    --affiche la grille--
    procedure display(t : in tab) is
        star : string(1..4) := "*   ";
        round : string(1..4) := "o   ";
        plus : string(1..4) := "+   ";
        none : string(1..4) := "    ";
        x, y : positive := 1;
    begin
    
--    ╭──────────────────────────────────────────╮
--    │ ≡ Front-end & Back-end                   │
--    ╞══════════════════════════════════════════╡
--    │ XAVIER SAUNIER                           │
--    ├──────────┬───────────────────────────────┤
--    │ Email    │ xavier.saunier@etu.u-pec.fr   │
--    ├──────────┼───────────────────────────────┤
--    │ Skype    │ ragen_vlad                    │
--    ├──────────┼───────────────────────────────┤
--    │ Location │ Saint-Maur-des-Fosses, FR     │
--    ╰──────────┴───────────────────────────────╯
        put("      ╭───");
        for i in t'range(1) loop
            if x < 10 then
                put("────");
            elsif x < 100 then 
                put("──");
            else
                put("─");
            end if;
        end loop;
        put("╮");
        new_line;
        put("      |");
        for j in t'range(1) loop
            if x < 10 then
                put("   ");
            elsif x < 100 then 
                put("  ");
            else
                put(" ");
            end if;
            put(x, 0);
            x := x + 1;
        end loop;
        put("   |");
        new_line;
        x := 1;
        put("╭─────┼───");
        for l in t'range(1) loop
            if x < 10 then
                put("────");
            elsif x < 100 then
                put("────");
            else
                put("──");
            end if;
            x := x + 1;
        end loop;
        put("┤");
        put("   SCORE = ");
        put(score, 0);
        new_line;
        for j in t'range(2) loop
            put("| ");
            put(y, 0);
            if y < 10 then
                put("   |   ");
            else
                put("  |   "); 
            end if;
            y := y+1;
            for i in t'range(1) loop
                case t(i, j) is
                    --when 0 => put("0   ");
                    when 0 => put(star);
                    --when 1 => put("1   ");
                    when 1 => put(round);
                    --when 2 => put("2   ");
                    when 2 => put(plus);
                    --when 3 => put("3   ");
                    when 3 => put(none);
                    --when -1 => put("-1  ");
                    when -1 => put(plus);
                    --when -3 => put("-3  ");
                    when -3 => put(none);
                    when others => null;
                end case;
            end loop;
            put("|");
            new_line;
        end loop;
        x := 1;
        put("╰─────┴───");
        for l in t'range(1) loop
            if x < 10 then
                put("────");
            elsif x < 100 then
                put("────");
            else
                put("──");
            end if;
            x := x + 1;
        end loop;
        put("╯");
    end display;



    ------------------
    --PROCEDURE PLAY--
    ------------------
    --programme principal--
    --gère la partie proprement dit du jeu--
    procedure play(height, length : in positive) is
        t : tab(0..length-1, 0..height-1);
    begin
        --initialisation de la grille--
        init(t);
        --déroulement de la partie--
        while (not endGame(t)) and then (not empty(t)) loop
            new_line;
            remove(t);
            fillInColumn(t);
            fillInLine(t);
            display(t);
        end loop;
        if empty(t) then
            score := score + 500;
        end if;
        exception
            when constraint_error => put_line("ERROR: Enter value between grid's bounds");
            when storage_error => put_line("STORAGE ERROR (again): Evan, you're a looser... :(");
            when others => put_line("ERROR: Enter positive integer.");
    end play;
    
    
    
    ------------------------
    --FONCTION EMPTYCOLUMN--
    ------------------------
    --détecte la présence d'une colonne vide--
    --donne les coordonnées (xColumn) de la colonne vide--
    function emptyColumn(t : tab;
                         iColumn : integer) return boolean is
    begin
        for j in t'range(2) loop
            if t(iColumn, j) /= 3 then
                return false;
            end if;
        end loop;
        return true;
    end emptyColumn;
    
    
    
    --------------------------
    --PROCEDURE FILLINCOLUMN--
    --------------------------
    --comble les colonnes vides de la grille--
    procedure fillInColumn(t : in out tab) is
        temp : natural := 0;
    begin
        for i in t'first(1)..t'last(1)-1 loop
            if emptyColumn(t, i) then
                for j in t'range(2) loop
                    temp := t(i, j);
                    t(i, j) := t(i+1, j);
                    t(i+1, j) := temp;
                end loop;
                fillInColumn(t);
            end if;
        end loop;
    end fillInColumn;
    
    
    
    ------------------------
    --PROCEDURE FILLINLINE--
    ------------------------
    --comble les espaces vides sous les billes--
    procedure fillInLine(t : in out tab) is
    begin
        for i in t'range(1) loop
            for j in t'first(2)..t'last(2)-1 loop
                if t(i, j) /= 3 and then t(i, j+1) = 3 then
                    t(i, j+1) := t(i, j);
                    t(i, j) := 3;
                    fillInLine(t);
                end if;
            end loop;
        end loop;
    end fillInLine;
    
    
    
    --------------------
    --PROCEDURE REMOVE--
    --------------------
    --vide les cases à partir d'une case sélectionnée--
    procedure remove(t : in out tab) is
        x, y : natural;
        a : integer;
        b : integer;
        removedBalls : integer := 0;
        scannedBalls : integer := 1;
        selectedBallType : integer;
    begin
        put("ENTER BALL'S COORDINATES TO REMOVE");
        new_line;
        put("x = ");
        get(x);
        x := x-1;
        put("y = ");
        get(y);
        y := y-1;
        if t(x, y) /= 3 then
            a := x;
            b := y;
            selectedBallType := t(x, y);
            cleanTab(t, a, b, selectedBallType, scannedBalls);
            for i in t'range(1) loop
                for j in t'range(2) loop
                    if t(i, j) = -3 or else t(i, j) = -4 or else t(i, j) = -5 or else t(i, j) = -6 then
                        t(i, j) := 3;
                        removedBalls := removedBalls + 1;
                    end if;
                end loop;
            end loop;
            if scannedBalls > 1 then
                t(x, y) := 3;
                score := newScore(removedBalls);
                gmHstr.hits := gmHstr.hits + 1;
            else    
                new_line;
                put_line("ERROR: Hit at least 2 balls.");
            end if;
        else
            new_line;
            put_line("ERROR: Empty space.");
        end if;
        new_line;
    end remove;
    
    
    
    ----------------------
    --PROCEDURE CLEANTAB--
    ----------------------
    --vide les cases autour de la case sélectionnée--
    procedure cleanTab(t : in out tab;
                       a, b : in out integer;
                       selectedBallType : in integer;
                       scannedBalls : in out integer) is
        
        procedure xRight(t : in out tab;
                         a, b : in out integer;
                         scnBlls : in out integer);
        procedure xLeft(t : in out tab;
                        a, b : in out integer;
                        scnBlls : in out integer);
        procedure yTop(t : in out tab;
                       a, b : in out integer;
                       scnBlls : in out integer);                        
        procedure yDown(t : in out tab;
                        a, b : in out integer;
                        scnBlls : in out integer);

        
        --PROOCEDURE XRIGHT--
        --déplace le scanner vers la droite--
        procedure xRight(t : in out tab;
                         a, b : in out integer;
                         scnBlls : in out integer) is
        begin
            if a <= t'last(1)-1 then
                if (t(a+1, b) = selectedBallType or else t(a+1, b) = -4 or else t(a+1, b) = -5 or else t(a+1, b) = -6) then
                    scnBlls := scnBlls + 1;
                    t(a+1, b) := -3;
                    a := a + 1;
--                    put("xRight = ");
--                    put(a+1, 0);
--                    put(", ");
--                    put(b+1, 0);
--                    new_line;
                    xRight(t, a, b, scnBlls);
                    yTop(t, a, b, scnBlls);
                    yDown(t, a, b, scnBlls);
                    xLeft(t, a, b, scnBlls);
                end if;
            end if;
        end xRight;
        
        --PROOCEDURE XLEFT--
        --déplace le scanner vers la gauche--
        procedure xLeft(t : in out tab;
                        a, b : in out integer;
                        scnBlls : in out integer) is
        begin
            if a >= t'first(1)+1 then
                if (t(a-1, b) = selectedBallType or else t(a-1, b) = -3 or else t(a-1, b) = -5 or else t(a-1, b) = -6) then
                    scnBlls := scnBlls + 1;
                    t(a-1, b) := -4;
                    a := a - 1;
--                    put("xLeft = ");
--                    put(a+1, 0);
--                    put(", ");
--                    put(b+1, 0);
--                    new_line;
                    xLeft(t, a, b, scnBlls);
                    yTop(t, a, b, scnBlls);
                    yDown(t, a, b, scnBlls);
                    xRight(t, a, b, scnBlls);
                end if;
            end if;
        end xLeft;
        
        --PROOCEDURE YDOWN--
        --déplace le scanner vers le bas--
        procedure yDown(t : in out tab;
                        a, b : in out integer;
                        scnBlls : in out integer) is
        begin
            if b <= t'last(2)-1 then 
                if (t(a, b+1) = selectedBallType or else t(a, b+1) = -3 or else t(a, b+1) = -4 or else t(a, b+1) = -6) then
                    scnBlls := scnBlls + 1;
                    t(a, b+1) := -5;
                    b := b + 1;
--                    put("yTop = ");
--                    put(a+1, 0);
--                    put(", ");
--                    put(b+1, 0);
--                    new_line;
                    yDown(t, a, b, scnBlls);
                    xRight(t, a, b, scnBlls);
                    xLeft(t, a, b, scnBlls);
                    yTop(t, a, b, scnBlls);
                end if;
            end if;
        end yDown;
        
        --PROOCEDURE YTOP--
        --déplace le scanner vers le haut--
        procedure yTop(t : in out tab;
                       a, b : in out integer;
                       scnBlls : in out integer) is
        begin
            if b >= t'first(2)+1 then 
                if (t(a, b-1) = selectedBallType or else t(a, b-1) = -3 or else t(a, b-1) = -4 or else t(a, b-1) = -5) then
                    scnBlls := scnBlls + 1;
                    t(a, b-1) := -6;
                    b := b - 1;
--                    put("yDown = ");
--                    put(a+1, 0);
--                    put(", ");
--                    put(b+1, 0);
--                    new_line;
                    yTop(t, a, b, scnBlls);
                    xRight(t, a, b, scnBlls);
                    xLeft(t, a, b, scnBlls);
                    yDown(t, a, b, scnBlls);
                end if;
            end if;
        end yTop;
        
    begin
        --teste les coordonnées à proximité directe des coordonnées sélectionnées--
        yTop(t, a, b, scannedBalls);
        yDown(t, a, b, scannedBalls);
        xLeft(t, a, b, scannedBalls);
        xRight(t, a, b, scannedBalls);
    end cleanTab;
    
    
    
    ----------------------
    --PROCEDURE NEWSCORE--
    ----------------------
    --calcule et retourne le nouveau score en fonction des billes supprimées--
    function newScore(removedBalls : in natural) return natural is
    begin
        return score + (removedBalls*(removedBalls+1)/2);
    end newScore;
    
    
    
    ------------------
    --FONCTION EMPTY--
    ------------------
    --vérifie si le tableau est vide--
    function empty(t : tab) return boolean is
    begin
        for i in t'range(1) loop
            for j in t'range(2) loop
                if t(i, j) /= 3 then
                    return false;
                end if;
            end loop;
        end loop;
        return true;
    end empty;
    
    
    
    --------------------
    --FUNCTION ENDGAME--
    --------------------
    --détecte lorsqu'il est impossible de poursuivre le jeu--
    --retourne 'True' si plus aucun coup n'est possible--
    --retourne 'False' dans le cas contraire--
    function endGame(t : tab) return boolean is
    begin  
        for i in t'first(1)..t'last(1)-1 loop
            for j in t'first(2)..t'last(2)-1 loop
                if t(i, j) /= 3 and then (t(i+1, j) = t(i, j) or else t(i, j+1) = t(i, j)) then
                    return false;
                end if;
            end loop;
        end loop;
        for i in reverse t'first(1)+1..t'last(1) loop
            for j in reverse t'first(2)+1..t'last(2) loop
                if t(i, j) /= 3 and then (t(i-1, j) = t(i, j) or else t(i, j-1) = t(i, j)) then
                    return false;
                end if;
            end loop;
        end loop;
        return true;
    end endGame;
    
    
    
    ----------------------
    --PROCEDURE GAMEOVER--
    ----------------------
    --gère la fin de partie en cas de game over--
    procedure gameOver is
        choice : integer;
    begin
        new_line;
        put_line("╔═╗┌─┐┌┬┐┌─┐  ╔═╗┬  ┬┌─┐┬─┐");
        put_line("║ ╦├─┤│││├┤   ║ ║└┐┌┘├┤ ├┬┘");
        put_line("╚═╝┴ ┴┴ ┴└─┘  ╚═╝ └┘ └─┘┴└─");
        
        <<gameOverOptions>>
        new_line;
        put_line("OPTIONS");
        put_line("1. End game");
        put_line("2. New game");
        put_line("3. Credits");
        
        --entree du choix utilisateur--
        --terminer le jeu ou nouvelle partie--
        put("=> ");
        get(choice);
        
        case choice is
            when 1 => 
            begin
                new_line;
                put_line("╔═╗┌─┐┌─┐┌┬┐┌┐ ┬ ┬┌─┐┬");
                put_line("║ ╦│ ││ │ ││├┴┐└┬┘├┤ │");
                put_line("╚═╝└─┘└─┘─┴┘└─┘ ┴ └─┘o");
                new_line;
            end;
            when 2 => game;
            when 3 => 
            begin
                put_line("╭──────────────────────────────────────────╮");
                put_line("│ ≡ Design & Front-end                     │");
                put_line("╞══════════════════════════════════════════╡");
                put_line("│ EVAN SUAU                                │");
                put_line("├──────────┬───────────────────────────────┤");
                put_line("│ Email    │ evan.suau@etu.u-pec.fr        │");
                put_line("├──────────┼───────────────────────────────┤");
                put_line("│ Twitter  │ @evan_suau                    │");
                put_line("├──────────┼───────────────────────────────┤");
                put_line("│ Location │ Sucy-en-Brie, FR              │");
                put_line("╰──────────┴───────────────────────────────╯");
                new_line;
                put_line("╭──────────────────────────────────────────╮");
                put_line("│ ≡ Front-end & Back-end                   │");
                put_line("╞══════════════════════════════════════════╡");
                put_line("│ XAVIER SAUNIER                           │");
                put_line("├──────────┬───────────────────────────────┤");
                put_line("│ Email    │ xavier.saunier@etu.u-pec.fr   │");
                put_line("├──────────┼───────────────────────────────┤");
                put_line("│ Skype    │ ragen_vlad                    │");
                put_line("├──────────┼───────────────────────────────┤");
                put_line("│ Location │ Saint-Maur-des-Fosses, FR     │");
                put_line("╰──────────┴───────────────────────────────╯");
                goto gameOverOptions;
            end;
            when others => 
                begin
                    put_line("ERROR: Try again.");
                    goto gameOverOptions;
                end;
        end case;
    end gameOver;
    
    
end cascade;