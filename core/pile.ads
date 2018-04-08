package Pile is
   type Contenant is array(Natural range <>) of Integer;
   type Pile is record
      TabPile : Contenant(0..255);
      Top : Integer;
   end record;

   procedure Init(P : out Pile);
   procedure Ajouter(P : in out Pile;
		               E : in Integer);
   procedure Supprimer(P : in out Pile);
   function Sommet(P : Pile) return Integer;
   function Vide(P : Pile) return Boolean;
end Pile;
