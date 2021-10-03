package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_2031:Number = 1;
      
      private var var_199:Number = 1;
      
      private var var_2057:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2057 = param1;
         var_199 = param2;
         var_2031 = param3;
      }
      
      public function get scale() : Number
      {
         return var_199;
      }
      
      public function get heightScale() : Number
      {
         return var_2031;
      }
   }
}
