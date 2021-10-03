package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_674:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_674 = new ByteArray();
         var_674.writeShort(param1);
         var_674.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_674.position = 0;
         if(false)
         {
            _loc1_ = var_674.readShort();
            var_674.position = 0;
         }
         return _loc1_;
      }
   }
}
