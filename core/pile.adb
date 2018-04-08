package body Pile is
  procedure Init(P : out Pile) is
   begin
      P.Top := -1;
   end Init;

   procedure Ajouter(P : in out Pile;
                     E : in Integer) is
   begin
      P.TabPile(P.Top + 1) := E;
      P.Top := P.Top + 1;
   end Ajouter;

   procedure Supprimer(P : in out Pile) is
   begin
      P.Top := P.Top - 1;
   end Supprimer;

   function Sommet(P : Pile) return Integer is
   begin
      return(P.TabPile(P.Top));
   end Sommet;

   function Vide(P : Pile) return Boolean is
   begin
      return(P.Top = -1);
   end Vide;
end Pile;
