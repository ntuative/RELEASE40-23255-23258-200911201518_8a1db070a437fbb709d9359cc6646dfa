package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_333:Number = 0.5;
      
      private static const const_743:int = 3;
      
      private static const const_1034:Number = 1;
       
      
      private var var_1842:Boolean = false;
      
      private var _targetCategory:int = -2;
      
      private var var_1841:Boolean = false;
      
      private var var_1840:Boolean = false;
      
      private var var_1839:Boolean = false;
      
      private var var_1843:int = -1;
      
      private var var_931:int = 0;
      
      private var var_250:Vector3d = null;
      
      private var var_373:Vector3d = null;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1841;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1840;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_373 != null && var_250 != null)
         {
            ++var_931;
            _loc2_ = Vector3d.dif(var_373,var_250);
            if(_loc2_.length <= const_333)
            {
               var_250 = var_373;
               var_373 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_333 * (const_743 + 1))
               {
                  _loc2_.mul(const_333);
               }
               else if(var_931 <= const_743)
               {
                  _loc2_.mul(const_333);
               }
               else
               {
                  _loc2_.mul(const_1034);
               }
               var_250 = Vector3d.sum(var_250,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1841 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1839 = param1;
      }
      
      public function get targetId() : int
      {
         return var_1843;
      }
      
      public function set targetCategory(param1:int) : void
      {
         _targetCategory = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_373 == null)
         {
            var_373 = new Vector3d();
         }
         var_373.assign(param1);
         var_931 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1840 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_250 != null)
         {
            return;
         }
         var_250 = new Vector3d();
         var_250.assign(param1);
      }
      
      public function set targetId(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function dispose() : void
      {
         var_373 = null;
         var_250 = null;
      }
      
      public function get targetCategory() : int
      {
         return _targetCategory;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1842;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1839;
      }
      
      public function get location() : IVector3d
      {
         return var_250;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1842 = param1;
      }
   }
}
