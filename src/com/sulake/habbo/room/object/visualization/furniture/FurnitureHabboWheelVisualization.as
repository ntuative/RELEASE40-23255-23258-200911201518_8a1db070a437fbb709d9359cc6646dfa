package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1033:int = 31;
      
      private static const const_1032:int = 32;
      
      private static const const_742:int = 10;
      
      private static const const_479:int = 20;
       
      
      private var var_549:Boolean = false;
      
      private var var_217:Array;
      
      public function FurnitureHabboWheelVisualization()
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
            var_217.push(const_1033);
            var_217.push(const_1032);
            return;
         }
         if(param1 > 0 && param1 <= const_742)
         {
            if(var_549)
            {
               var_549 = false;
               var_217 = new Array();
               var_217.push(const_742 + param1);
               var_217.push(const_479 + param1);
               var_217.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
