package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2171:Boolean;
      
      private var var_2173:int;
      
      private var var_2170:Boolean;
      
      private var var_1482:String;
      
      private var var_1131:String;
      
      private var var_1758:int;
      
      private var var_2078:String;
      
      private var var_2172:String;
      
      private var var_2079:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1758 = param1.readInteger();
         this.var_1482 = param1.readString();
         this.var_2078 = param1.readString();
         this.var_2171 = param1.readBoolean();
         this.var_2170 = param1.readBoolean();
         param1.readString();
         this.var_2173 = param1.readInteger();
         this.var_2079 = param1.readString();
         this.var_2172 = param1.readString();
         this.var_1131 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1131;
      }
      
      public function get avatarName() : String
      {
         return this.var_1482;
      }
      
      public function get avatarId() : int
      {
         return this.var_1758;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2171;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2172;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2079;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2170;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2078;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2173;
      }
   }
}
