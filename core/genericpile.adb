package body genericPile is
   procedure Initial(P: out Pile) is
   begin
      P.Top := -1;
   end Initial;

   procedure Ajouter(P : in out Pile;
		               E : in Item) is
   begin
      P.Tabpile(P.Top + 1) := E;
      P.Top := P.Top + 1;
   end Ajouter;

   procedure Supprimer(P : in out Pile) is
   begin
      P.Top := P.Top - 1;
   end Supprimer;

   function Sommet(P : Pile) return Item is
   begin
      return(P.Tabpile(P.Top));
   end Sommet;

   function Vide(P : Pile) return Boolean is
   begin
      return(P.Top = -1);
   end Vide;
end genericPile;
