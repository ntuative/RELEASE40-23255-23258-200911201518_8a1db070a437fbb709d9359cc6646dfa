package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1453:BigInteger;
      
      private var var_908:BigInteger;
      
      private var var_2002:BigInteger;
      
      private var var_1452:BigInteger;
      
      private var var_2001:BigInteger;
      
      private var var_1890:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1453 = param1;
         var_2002 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2001.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1452 = new BigInteger();
         var_1452.fromRadix(param1,param2);
         var_2001 = var_1452.modPow(var_908,var_1453);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1890.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_908 = new BigInteger();
         var_908.fromRadix(param1,param2);
         var_1890 = var_2002.modPow(var_908,var_1453);
         return true;
      }
   }
}
