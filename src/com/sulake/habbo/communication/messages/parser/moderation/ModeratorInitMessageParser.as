package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2090:Boolean;
      
      private var var_1487:Array;
      
      private var var_2089:Boolean;
      
      private var var_2086:Boolean;
      
      private var var_2083:Boolean;
      
      private var var_155:Array;
      
      private var var_2088:Boolean;
      
      private var var_2087:Boolean;
      
      private var var_1488:Array;
      
      private var var_2085:Boolean;
      
      private var var_2084:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2084;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2090;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2089;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2088;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2087;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1487;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_155 = [];
         var_1487 = [];
         _roomMessageTemplates = [];
         var_1488 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_155.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1487.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1488.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2088 = param1.readBoolean();
         var_2083 = param1.readBoolean();
         var_2089 = param1.readBoolean();
         var_2086 = param1.readBoolean();
         var_2084 = param1.readBoolean();
         var_2087 = param1.readBoolean();
         var_2090 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2085 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2086;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1488;
      }
      
      public function get issues() : Array
      {
         return var_155;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2085;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2083;
      }
   }
}
