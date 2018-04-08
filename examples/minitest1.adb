with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure minitest1 is
    type tab is array(integer range <>, integer range <>) of integer;
    t : tab(0..2, 0..2);
    
    function emptyColumn(t : tab) return integer is
        b : integer := -1;
    begin
        for i in t'first(1)..t'last(1)-1 loop
            for j in t'range(2) loop
                if t(i, j) /= 3 then
                    b := -1;
                end if;
            end loop;
            return i;
        end loop;
        return b;
    end emptyColumn;
    
    temp : integer;
    
begin
    for i in t'range(1) loop
        for j in t'range(2) loop
            get(t(i, j));
        end loop;
    end loop;
    
    for i in t'range(1) loop
        for j in 0..2 loop
            put(t(i, j), 4);
        end loop;
        new_line;
    end loop;
    
    put("emptyColumn(t) = ");
    put(emptyColumn(t), 0);
    new_line;
    
    if emptyColumn(t) >= 0 then
        for j in emptyColumn(t)+1..t'last(2)-1 loop
            for i in t'range(1) loop
                temp := t(i, j);
                t(i, j) := t(i, j+1);
                t(i, j+1) := temp;
            end loop;
        end loop;
    end if;
    
    for i in t'range(1) loop
        for j in 0..2 loop
            put(t(i, j), 4);
        end loop;
        new_line;
    end loop;
end minitest1;