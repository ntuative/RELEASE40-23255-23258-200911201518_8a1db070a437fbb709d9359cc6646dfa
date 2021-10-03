package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_885:IID;
      
      private var var_365:uint;
      
      private var var_1072:IUnknown;
      
      private var var_1071:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_885 = param1;
         var_1071 = getQualifiedClassName(var_885);
         var_1072 = param2;
         var_365 = 0;
      }
      
      public function get iid() : IID
      {
         return var_885;
      }
      
      public function get references() : uint
      {
         return var_365;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_365) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1072;
      }
      
      public function get iis() : String
      {
         return var_1071;
      }
      
      public function reserve() : uint
      {
         return ++var_365;
      }
      
      public function dispose() : void
      {
         var_885 = null;
         var_1071 = null;
         var_1072 = null;
         var_365 = 0;
      }
   }
}
