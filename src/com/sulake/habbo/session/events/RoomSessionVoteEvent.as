package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_119:String = "RSPE_VOTE_RESULT";
      
      public static const const_121:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1152:int = 0;
      
      private var var_873:String = "";
      
      private var var_602:Array;
      
      private var var_950:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_950 = [];
         var_602 = [];
         super(param1,param2,param7,param8);
         var_873 = param3;
         var_950 = param4;
         var_602 = param5;
         if(var_602 == null)
         {
            var_602 = [];
         }
         var_1152 = param6;
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
