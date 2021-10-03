package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1032:int = -1;
      
      private static const const_742:int = 20;
      
      private static const const_479:int = 9;
       
      
      private var var_549:Boolean = false;
      
      private var var_217:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_217 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_549 = true;
            var_217 = new Array();
            var_217.push(const_1032);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_549)
            {
               var_549 = false;
               var_217 = new Array();
               var_217.push(const_742);
               var_217.push(const_479 + param1);
               var_217.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
         {
            if(false)
            {
               super.setAnimation(var_217.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
