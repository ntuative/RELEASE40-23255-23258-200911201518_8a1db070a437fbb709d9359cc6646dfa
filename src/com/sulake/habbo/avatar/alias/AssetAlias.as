package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_912:Boolean;
      
      private var _name:String;
      
      private var var_1819:String;
      
      private var var_911:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1819 = String(param1.@link);
         var_911 = Boolean(parseInt(param1.@fliph));
         var_912 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_911;
      }
      
      public function get flipV() : Boolean
      {
         return var_912;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1819;
      }
   }
}
