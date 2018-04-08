with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure example1 is
    
    --------------
    --TYPE BALLS--
    --------------
    --ce type constitue la base de l'affichage des éléments dans la grille--
    type balls is (star, round, plus);
    
    --------------------------
    --FONCTION CONVERTISSEUR--
    --------------------------
    --cette fonction convertit les characters saisis en type exploitable 'balls' défini ce-dessus--
    function convert_balls(c : character) return balls is
    begin
        case c is
            when '*' => return star;
            when 'o' => return round;
            when '+' => return plus;
            when others => return star;
        end case;
    end convert_balls;
    
    c : character;
    
begin
    get(c);
end example1;