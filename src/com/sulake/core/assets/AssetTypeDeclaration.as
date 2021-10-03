package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1636:Class;
      
      private var var_1634:Class;
      
      private var var_1635:String;
      
      private var var_1074:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1635 = param1;
         var_1634 = param2;
         var_1636 = param3;
         if(rest == null)
         {
            var_1074 = new Array();
         }
         else
         {
            var_1074 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1636;
      }
      
      public function get assetClass() : Class
      {
         return var_1634;
      }
      
      public function get mimeType() : String
      {
         return var_1635;
      }
      
      public function get fileTypes() : Array
      {
         return var_1074;
      }
   }
}
