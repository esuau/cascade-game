---------------------------------------------------
--COPYRIGHT (C) 2015 - EVAN SUAU & XAVIER SAUNIER--
---------------------------------------------------

package cascade is
    height, length : positive := 1;
    numGame : positive := 1;
    type tab is array(integer range <>, integer range <>) of integer;
    score : natural := 0;
    type gameHistory is record
        t : tab(0..height-1, 0..length-1);
        scoreHistory : natural := 0;
        hits : natural := 0;
    end record;
    gmHstr : gameHistory;
    procedure title;
    procedure game;
    procedure getHeightLength(height, length : out integer);
    procedure init(t : out tab);
    procedure display(t : tab);
    procedure play(height, length : in positive);
    function emptyColumn(t : tab;
                         iColumn : integer) return boolean;
    procedure fillInColumn(t : in out tab);
    procedure fillInLine(t : in out tab);
    procedure remove(t : in out tab);
    procedure cleanTab(t : in out tab;
                       a, b : in out integer;
                       selectedBallType : in integer;
                       scannedBalls : in out integer);
    function newScore(removedBalls : in natural) return natural;
    function empty(t : tab) return boolean;
    function endGame(t : tab) return boolean;
    procedure gameOver;
end cascade;