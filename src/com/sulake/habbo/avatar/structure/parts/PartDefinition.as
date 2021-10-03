package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1492:int = -1;
      
      private var var_1266:Boolean;
      
      private var var_1265:String;
      
      private var var_2107:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2107 = String(param1["set-type"]);
         var_1265 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1266 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1492 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1265;
      }
      
      public function get staticId() : int
      {
         return var_1492;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1492 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1266;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1266 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1265 = param1;
      }
      
      public function get setType() : String
      {
         return var_2107;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
