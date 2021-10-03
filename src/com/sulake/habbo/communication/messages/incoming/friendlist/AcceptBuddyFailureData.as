package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_1060:int;
      
      private var var_713:String;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_713 = param1.readString();
         this.var_1060 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_713;
      }
      
      public function get errorCode() : int
      {
         return this.var_1060;
      }
   }
}
