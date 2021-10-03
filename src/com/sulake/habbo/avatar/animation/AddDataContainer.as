package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1348:String;
      
      private var var_1443:String;
      
      private var var_932:String;
      
      private var var_392:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1348 = String(param1.@align);
         var_932 = String(param1.@base);
         var_1443 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_392 = Number(_loc2_);
            if(var_392 > 1)
            {
               var_392 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1348;
      }
      
      public function get ink() : String
      {
         return var_1443;
      }
      
      public function get base() : String
      {
         return var_932;
      }
      
      public function get isBlended() : Boolean
      {
         return var_392 != 1;
      }
      
      public function get blend() : Number
      {
         return var_392;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
