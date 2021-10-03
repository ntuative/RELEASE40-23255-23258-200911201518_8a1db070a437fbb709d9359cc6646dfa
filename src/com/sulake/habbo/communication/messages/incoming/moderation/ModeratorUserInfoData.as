package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1527:int;
      
      private var var_1531:int;
      
      private var var_1530:int;
      
      private var _userName:String;
      
      private var var_1528:int;
      
      private var var_1529:int;
      
      private var var_1526:int;
      
      private var _userId:int;
      
      private var var_678:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1529 = param1.readInteger();
         var_1528 = param1.readInteger();
         var_678 = param1.readBoolean();
         var_1530 = param1.readInteger();
         var_1531 = param1.readInteger();
         var_1527 = param1.readInteger();
         var_1526 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1526;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_678;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1528;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1531;
      }
      
      public function get cautionCount() : int
      {
         return var_1527;
      }
      
      public function get cfhCount() : int
      {
         return var_1530;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1529;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
