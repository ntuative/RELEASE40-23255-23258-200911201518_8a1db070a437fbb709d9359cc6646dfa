package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1600:Number = 0;
      
      private var var_1598:Number = 0;
      
      private var var_1599:Number = 0;
      
      private var var_1597:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1598 = param1;
         var_1599 = param2;
         var_1600 = param3;
         var_1597 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1598;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1600;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1599;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1597;
      }
   }
}
