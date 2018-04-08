generic type Item is private;
package genericPile is
   type Contenant is array(Natural range <>) of Item;
   type Pile is record
      Tabpile : Contenant(0..255);
      Top : Integer := -1;
   end record;

   procedure Initial(P : out Pile);
   procedure Ajouter(P : in out Pile;
		               E : in Item);
   procedure Supprimer(P : in out Pile);
   function Sommet(P : Pile) return Item;
   function Vide(P : Pile) return Boolean;
end genericPile;
