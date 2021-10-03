package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_647:int = -1;
      
      public static const const_764:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2102:int = -1;
      
      private var var_87:int = 0;
      
      private var var_1262:int = 1;
      
      private var var_840:int = 1;
      
      private var var_2101:Boolean = false;
      
      private var var_2100:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_2101 = param5;
         if(param4 < 0)
         {
            param4 = const_647;
         }
         var_840 = param4;
         var_1262 = param4;
         if(param6 >= 0)
         {
            var_2102 = param6;
            var_2100 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_840 > 0 && param1 > var_840)
         {
            param1 = var_840;
         }
         var_1262 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_840;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2100;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_840 < 0)
         {
            return const_647;
         }
         return var_1262;
      }
      
      public function get activeSequence() : int
      {
         return var_2102;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2101;
      }
      
      public function get x() : int
      {
         return var_87;
      }
   }
}
