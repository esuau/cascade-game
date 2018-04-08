---------------------------------------------------
--COPYRIGHT (C) 2015 - EVAN SUAU & XAVIER SAUNIER--
---------------------------------------------------
with cascade, ada.integer_text_io, genericPile;
use cascade, ada.integer_text_io;

procedure mainProgram is
    package scorePile is new genericPile(integer);
    use scorePile;
    scoreHistory : scorePile.pile;
begin
    title;
    initial(scoreHistory);
    game;
end mainProgram;