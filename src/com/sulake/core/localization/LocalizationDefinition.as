package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1319:String;
      
      private var var_856:String;
      
      private var var_1318:String;
      
      private var var_1320:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1320 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1319 = _loc5_[0];
         var_1318 = _loc5_[1];
         _name = param2;
         var_856 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1319;
      }
      
      public function get languageCode() : String
      {
         return var_1320;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_856;
      }
      
      public function get encoding() : String
      {
         return var_1318;
      }
      
      public function get id() : String
      {
         return var_1320 + "_" + var_1319 + "." + var_1318;
      }
   }
}
