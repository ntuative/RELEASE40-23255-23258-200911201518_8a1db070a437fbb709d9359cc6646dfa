package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1000:int = 0;
      
      private var var_1097:int = 0;
      
      private var var_1743:String = "";
      
      private var var_1001:int = 0;
      
      private var var_1738:String = "";
      
      private var var_1740:int = 0;
      
      private var var_1470:String = "";
      
      private var var_1741:int = 0;
      
      private var var_1739:int = 0;
      
      private var var_1744:String = "";
      
      private var var_1742:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1741 = param1;
         var_1744 = param2;
         var_1470 = param3;
         var_1743 = param4;
         var_1738 = param5;
         if(param6)
         {
            var_1097 = 1;
         }
         else
         {
            var_1097 = 0;
         }
         var_1740 = param7;
         var_1739 = param8;
         var_1001 = param9;
         var_1742 = param10;
         var_1000 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1741,var_1744,var_1470,var_1743,var_1738,var_1097,var_1740,var_1739,var_1001,var_1742,var_1000];
      }
      
      public function dispose() : void
      {
      }
   }
}
