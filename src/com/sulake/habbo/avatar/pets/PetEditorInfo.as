package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1850:Boolean;
      
      private var var_1849:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1850 = Boolean(parseInt(param1.@club));
         var_1849 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1850;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1849;
      }
   }
}
