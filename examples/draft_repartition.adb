---------------------------------------------------
--COPYRIGHT (C) 2015 - EVAN SUAU & XAVIER SAUNIER--
---------------------------------------------------
with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io;

procedure draft_repartition is
    
    ------------------------------------
    --DECLARATION NOMBRE DE CARACTERES--
    ------------------------------------
    --s = nombre de caractères star ('*') dans la grille--
    --r = nombre de caractères round ('o') dans la grille--
    --p = nombre de caractères plus ('+') dans la grille--
    s : integer := 0;
    r : integer := 0;
    p : integer := 0;
    
    
    -----------------------------------
    --DECLARATION POUR RANDOM INITIAL--
    -----------------------------------
    subtype randomValue is Integer range 0..2;
    package randomConfigGenerator is new ada.numerics.discrete_random(randomValue);
    use randomConfigGenerator;
    g : randomConfigGenerator.generator;
    
    type tab is array (0..2, 0..2) of randomValue;
    
    ----------------------------------
    --DECLARATION POUR RANDOMTABSTAR--
    ----------------------------------
    subtype randomValueStar is Integer range 1..2;
    package randomConfigGeneratorStar is new ada.numerics.discrete_random(randomValueStar);
    use randomConfigGeneratorStar;
    gStar : randomConfigGeneratorStar.generator;
    
    ---------------------------
    --PROCEDURE RANDOMTABSTAR--
    ---------------------------
    --remplit un tableau sans '*'--
    procedure randomTabStar(t : in out tab;
                            i, j : in integer) is
    begin
        reset(gStar);
        for k in j+1..t'length(2) loop
            for l in i+1..t'length(1) loop
                t(i, j) := random(gStar);
            end loop;
        end loop;
    end randomTabStar;
    
    -----------------------------------
    --DECLARATION POUR RANDOMTABROUND--
    -----------------------------------
    subtype randomValueRound is Integer range 0..0;
    package randomConfigGeneratorRound is new ada.numerics.discrete_random(randomValueRound);
    use randomConfigGeneratorRound;
    gRound : randomConfigGeneratorRound.generator;
    
    ----------------------------
    --PROCEDURE RANDOMTABROUND--
    ----------------------------
    --remplit le tableau sans 'o'--
    procedure randomTabRound(t : in out tab;
                             i, j : in integer) is
    begin
        reset(gRound);
        for k in j+1..t'length(2) loop
            for l in i+1..t'length(1) loop
                t(i, j) := random(gRound);
            end loop;
        end loop;
    end randomTabRound;

    ----------------------------------
    --DECLARATION POUR RANDOMTABPLUS--
    ----------------------------------
    subtype randomValuePlus is Integer range 0..1;
    package randomConfigGeneratorPlus is new ada.numerics.discrete_random(randomValuePlus);
    use randomConfigGeneratorPlus;
    gPlus : randomConfigGeneratorPlus.generator;
    
    ---------------------------
    --PROCEDURE RANDOMTABPLUS--
    ---------------------------
    --remplit le tableau sans '+'--
    procedure randomTabPlus(t : in out tab;
                            i, j : in integer) is
    begin
        reset(gPlus);
        for k in j+1..t'length(2) loop
            for l in i+1..t'length(1) loop
                t(i, j) := random(gPlus);
            end loop;
        end loop;
    end randomTabPlus;
    
    -----------------------
    --FONCTION CELLNUMBER--
    -----------------------
    --Compte le nombre de cellules du tableau--
    function cellNumber(t : tab) return integer is
    begin
        return t'length(1)*t'length(2);
    end cellNumber;
    
    ---------------------------
    --FONCTION DIVISIBLETHREE--
    ---------------------------
    function divisibleThree(t : tab) return boolean is
    begin
        if (t'length(1)*t'length(2)) = 0 then
            return true;
        end if;
        return false;
    end divisibleThree;
    

    -------------------
    --FONCTION RANDOM--
    -------------------
    --fonction de marquage des cases du tableau avec 1, 2 ou 3 au hasard--
    -- 0 -> '*' --
    -- 1 -> 'o' --
    -- 2 -> '+' --
    function randomTab return tab is
        t : tab;
        --variables servant à compter le nombre de '*', '+' et 'o'--
        --elles serviront à respecter la proportion--
    begin
        reset(g);
        for j in t'range(2) loop
            for i in t'range(1) loop
                t(i, j) := random(g);
                
                --COMPTEUR--
                --compte le nombre '*', de 'o' et de '+'--
                case t(i, j) is
                    when 0 => s := S+1;
                    when 1 => r := r+1;
                    when 2 => p := p+1;
                    when others => p := p+1;
                end case;
                
                --CONDITIONS--
                --déclenche les procédures auxiliaires en cas de dépassement de la proportion 1/3--
                if s >= cellNumber(t)/3 then 
                    --appel d'une fonction de remplissage random avec '*' exclu--
                    randomTabStar(t, i, j);
                    return t;
                elsif p >= cellNumber(t)/3 then
                    --appel d'une fonction random avec '+' exclu--
                    randomTabPlus(t, i, j);
                    return t;
                elsif r >= cellNumber(t)/3 then
                    --appel d'une fonction random avec 'o' exclu--
                    randomTabRound(t, i, j);
                    return t;
                end if;
            end loop;
        end loop;
        return t;
    end randomTab;
    
    star : string(1..4) := "*   ";
    round : string(1..4) := "o   ";
    plus : string(1..4) := "+   ";
    
    -----------------------
    --PROCEDURE AFFICHAGE--
    -----------------------
    --C'est ici que les nombres sont convertis en caractères et affichés--
    procedure displayTab(t : tab) is
    begin
        for j in t'range(2) loop
            for i in t'range(1) loop
                case t(i, j) is
                    when 0 => put(star);
                    when 1 => put(round);
                    when 2 => put(plus);
                    when others => put(plus);
                end case;
            end loop;
            new_line;
        end loop;
    end displayTab;
    
    --aucun test n'a été réalisé pour l'instant avec le programme principal--
begin
    displayTab(randomTab);
end draft_repartition;