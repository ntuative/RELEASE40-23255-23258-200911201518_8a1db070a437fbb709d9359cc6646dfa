package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1660:int;
      
      private var var_1979:String;
      
      private var var_1666:int;
      
      private var _disposed:Boolean;
      
      private var var_1980:int;
      
      private var var_1914:String;
      
      private var var_1190:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1914 = param1.readString();
         var_1660 = param1.readInteger();
         var_1666 = param1.readInteger();
         var_1979 = param1.readString();
         var_1980 = param1.readInteger();
         var_1190 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1980;
      }
      
      public function get worldId() : int
      {
         return var_1666;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1914;
      }
      
      public function get unitPort() : int
      {
         return var_1660;
      }
      
      public function get castLibs() : String
      {
         return var_1979;
      }
      
      public function get nodeId() : int
      {
         return var_1190;
      }
   }
}
