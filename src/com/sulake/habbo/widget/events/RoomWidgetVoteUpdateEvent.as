package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_119:String = "RWPUE_VOTE_RESULT";
      
      public static const const_121:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1152:int;
      
      private var var_873:String;
      
      private var var_602:Array;
      
      private var var_950:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_873 = param2;
         var_950 = param3;
         var_602 = param4;
         if(var_602 == null)
         {
            var_602 = [];
         }
         var_1152 = param5;
      }
      
      public function get votes() : Array
      {
         return var_602.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1152;
      }
      
      public function get question() : String
      {
         return var_873;
      }
      
      public function get choices() : Array
      {
         return var_950.slice();
      }
   }
}
