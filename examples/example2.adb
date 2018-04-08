procedure randomTabPlus(t : in out tab;
                            i, j : in integer) is
    begin
        for k in j+1..t'length(2)
            for l in i+1..t'length(1)
                t(i, j) := random(gPlus);
                
                if s>=cellNumber(t)/3 then 
                    t(i,j):=(round);
                elsif r>=cellNumber(t)/3 then
                    t(i,j):=(star);
                    
                
                end if;
            end loop;
        end loop;
    end randomTabPlus;
    
    procedure randomTabRound(t : in out tab;
                             i, j : in integer) is
    begin
        for k in j+1..t'length(2)
            for l in i+1..t'length(1)
                t(i, j) := random(gRound);
                
            if s>=cellNumber(t)/3 then 
                t(i,j):=(plus);
            elsif p>=cellNumber(t)/3 then
                t(i,j):=(star);
                    
            end loop;
        end loop;
    end randomTabRound;
    
    procedure randomTabStar(t : in out tab;
                            i, j : in integer) is
    begin
        for k in j+1..t'length(2)
            for l in i+1..t'length(1)
                t(i, j) := random(gStar);
            
            if p>=cellNumber(t)/3 then 
                t(i,j):=(round);
            elsif r>=cellNumber(t)/3 then
                t(i,j):=(plus);
            
            end loop;
        end loop;
    end randomTabStar;