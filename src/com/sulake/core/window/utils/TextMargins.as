package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_701:int;
      
      private var _right:int;
      
      private var var_699:int;
      
      private var var_700:int;
      
      private var var_181:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_699 = param1;
         var_700 = param2;
         _right = param3;
         var_701 = param4;
         var_181 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_701 = param1;
         var_181(this);
      }
      
      public function get left() : int
      {
         return var_699;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_699 == 0 && _right == 0 && var_700 == 0 && var_701 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_700 = param1;
         var_181(this);
      }
      
      public function get top() : int
      {
         return var_700;
      }
      
      public function set left(param1:int) : void
      {
         var_699 = param1;
         var_181(this);
      }
      
      public function get bottom() : int
      {
         return var_701;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_699,var_700,_right,var_701,param1);
      }
      
      public function dispose() : void
      {
         var_181 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_181(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
