package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class RemoveBuddyMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_731:Array;
      
      public function RemoveBuddyMessageComposer()
      {
         var_731 = new Array();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_731.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_731.length)
         {
            _loc1_.push(this.var_731[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addRemovedFriend(param1:int) : void
      {
         this.var_731.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_731 = null;
      }
   }
}
