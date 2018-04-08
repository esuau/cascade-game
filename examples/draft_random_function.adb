---------------------------------------------------
--COPYRIGHT (C) 2015 - EVAN SUAU & XAVIER SAUNIER--
---------------------------------------------------
with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io;

procedure draft_random_function is
    
    ------------------------------    
    --DECLARATION DES CARACTERES--
    ------------------------------
    star : string(1..4) := "*   ";
    round : string(1..4) := "o   ";
    plus : string(1..4) := "+   ";
    none : string(1..4) := "    ";
    
    ----------------------
    --FONCTION RANDOMTAB--
    ----------------------
    --remplissage du tableau T au hasard avec des 0, 1, 2 correspondant aux chaînes star, round, plus--
    --NB: la proportion 1/3 n'est pas respectée. Voir "draft_repartition.adb"--
    subtype randomValue is Integer range 0..2;
    package randomConfigGenerator is new ada.numerics.discrete_random(randomValue);
    use randomConfigGenerator;
    g : generator;
    
    type tab is array (0..9, 0..4) of randomValue;
    t : tab;
    
    --REMPLLISSAGE--
    function randomTab return tab is
        t : tab;
    begin
        reset(g);
        for j in t'range(2) loop
            for i in t'range(1) loop
                t(i, j) := random(g);
            end loop;
        end loop;
        return t;
    end randomTab;
    
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
                    when others => put(none);
                end case;
            end loop;
            new_line;
        end loop;
    end displayTab;
    
-----------------------
--PROGRAMME PRINCIPAL--
-----------------------
begin
    t := randomTab;
    displayTab(t);
end draft_random_function;