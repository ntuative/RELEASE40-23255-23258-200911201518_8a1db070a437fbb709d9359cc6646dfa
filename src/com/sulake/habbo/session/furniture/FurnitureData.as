package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1392:String = "e";
      
      public static const const_1382:String = "i";
      
      public static const const_1444:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1943:int;
      
      private var var_1126:Array;
      
      private var var_1941:int;
      
      private var var_1944:int;
      
      private var var_1942:int;
      
      private var _name:String;
      
      private var var_1945:int;
      
      private var var_1110:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1943 = param4;
         var_1945 = param5;
         var_1941 = param6;
         var_1944 = param7;
         var_1942 = param8;
         var_1126 = param9;
         _title = param10;
         var_1110 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1944;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1942;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1945;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1943;
      }
      
      public function get tileSizeX() : int
      {
         return var_1941;
      }
      
      public function get colours() : Array
      {
         return var_1126;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}
