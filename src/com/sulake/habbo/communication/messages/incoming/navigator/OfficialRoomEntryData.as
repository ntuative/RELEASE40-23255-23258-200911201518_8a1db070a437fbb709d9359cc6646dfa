package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_785:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_663:int = 2;
      
      public static const const_969:int = 1;
       
      
      private var var_1774:String;
      
      private var _disposed:Boolean;
      
      private var var_1563:int;
      
      private var var_1772:Boolean;
      
      private var var_819:String;
      
      private var var_744:PublicRoomData;
      
      private var _index:int;
      
      private var var_1771:String;
      
      private var _type:int;
      
      private var var_1629:String;
      
      private var var_745:GuestRoomData;
      
      private var var_1773:String;
      
      private var var_1770:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1774 = param2.readString();
         var_1773 = param2.readString();
         var_1772 = param2.readInteger() == 1;
         var_1771 = param2.readString();
         var_819 = param2.readString();
         var_1563 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_969)
         {
            var_1629 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_744 = new PublicRoomData(param2);
         }
         else if(_type == const_663)
         {
            var_745 = new GuestRoomData(param2);
         }
         else if(_type == const_785)
         {
            var_1770 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1629;
      }
      
      public function get userCount() : int
      {
         return var_1563;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1772;
      }
      
      public function get picText() : String
      {
         return var_1771;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_969)
         {
            return 0;
         }
         if(this.type == const_663)
         {
            return this.var_745.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_744.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1773;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_745 != null)
         {
            this.var_745.dispose();
            this.var_745 = null;
         }
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1774;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_745;
      }
      
      public function get picRef() : String
      {
         return var_819;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1770;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_744;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
