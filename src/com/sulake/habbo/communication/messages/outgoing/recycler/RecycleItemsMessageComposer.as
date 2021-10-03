package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_719:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_719 = new Array();
         var_719.push(param1.length);
         var_719 = var_719.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_719;
      }
   }
}
